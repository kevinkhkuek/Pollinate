source(output(
		year as integer,
		movie as string,
		genre as string,
		mpaa_rating as string,
		distributor as string,
		tot_for_year as long,
		tot_in_2019 as long,
		tickets_sold as long
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	format: 'table') ~> landingmoviedetails
source(output(
		movie_sk as long,
		movie_bk as string,
		name as string,
		genre as string,
		mpaa_rating as string,
		distributor as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	format: 'table') ~> dimovie
landingmoviedetails, dimovie lookup(movie == movie_bk,
	multiple: false,
	pickup: 'any',
	broadcast: 'auto')~> lkpdimmovie
lkpdimmovie sink(allowSchemaDrift: true,
	validateSchema: false,
	input(
		movie_sk as long,
		year as integer,
		total_for_year as long,
		tickets_sold as long
	),
	deletable:false,
	insertable:true,
	updateable:false,
	upsertable:false,
	truncate:true,
	format: 'table',
	skipDuplicateMapOutputs: true,
	errorHandlingOption: 'stopOnFirstError',
	mapColumn(
		movie_sk,
		year,
		total_for_year = tot_for_year,
		tickets_sold
	)) ~> factmoviestats
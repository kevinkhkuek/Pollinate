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
landingmoviedetails sink(allowSchemaDrift: true,
	validateSchema: false,
	input(
		movie_sk as long,
		movie_bk as string,
		name as string,
		genre as string,
		mpaa_rating as string,
		distributor as string
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
		movie_bk = movie,
		name = movie,
		genre,
		mpaa_rating,
		distributor
	)) ~> dimovie
** STEP 1 **
Built an ADF pipeline (ingest_temp_stage) which does a 'Copy data' from the csv to the landing table temp_stage.landing_MovieDetails

** STEP 2 **

Simple modelling below .....

DI_movie	SCD type 2	
*************************
movie_sk		bigint	
movie_bk		varchar	*name for the moment
name			varchar	
genre			varchar	
mpaa_rating		varchar	
distributor		varchar	
effective_from	date/time	
effective_to	date/time	
adt_current		int	
		
		
FACT_moviestatistics
************************		
movie_sk		bigint	*surrogate foreign key to dimension DI_movie
year			int		*degenerate dimension
total_for_year	bigint	
tickets_sold	bigint	


Built an ADF pipeline(load_datamart) to load the dimensions (DI_movie) first then the facts (FACT_moviestatistics).

Load of dimension DI_movie is via a dataflow.  Simple mapping.  which can be refined later to include eg. SCD t2.

Load of fact FACT_moviestatistics is via another dataflow.  This has a lookup to the dimension to populate the surrogateforeign key movie_sk in the fact.  Simple mapping from source to sink datasets


** STEP 3 **
Section3 output required in 'section3_output.rpt'.
Section3 stored procedures in DDLs provided (SQL_Scripts).




Note: all the DDLs for the stage and dw tables , and stored procs provided (folder SQL_Scripts).  also the section3 output required in 'section3_output.rpt'.


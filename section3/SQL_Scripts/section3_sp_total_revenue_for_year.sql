
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Kevin Kuek
-- Create Date: 2/2/2022
-- Description: get total revenue from each year/movie,
--				highest total to lowest revenue
--
-- Changes:
-- 2/2/2022	KK	Initial version
-- =============================================
create procedure [dw].[total_revenue_for_year]
as
BEGIN
  SELECT 
      d.[name],
	  d.[genre],
	  f.[year],
	  f.[total_for_year]
    
  FROM [dw].[FACT_moviestatistics] f
    inner join [dw].[DI_movie] d ON d.[movie_sk] = f.[movie_sk]

  ORDER BY f.[total_for_year] desc
  ;

END
GO


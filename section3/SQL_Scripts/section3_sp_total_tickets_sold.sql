SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Kevin Kuek
-- Create Date: 2/2/2022
-- Description: get total tickets sold by genre,
--				highest total to lowest
--
-- Changes:
-- 2/2/2022	KK	Initial version
-- =============================================
create procedure dw.total_tickets_by_genre
as
BEGIN
  SELECT d.genre
      ,sum([tickets_sold]) as total_tickets_sold
  FROM [dw].[FACT_moviestatistics] f
    inner join [dw].[DI_movie] d ON d.[movie_sk] = f.[movie_sk]
  
  GROUP BY d.genre
  ORDER BY sum([tickets_sold]) desc
  ;

END
GO
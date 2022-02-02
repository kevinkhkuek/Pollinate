/****** Object:  Table [dw].[FACT_moviestatistics]    Script Date: 2/02/2022 4:45:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[FACT_moviestatistics](
	[movie_sk] [bigint] NOT NULL,
	[year] [int] NULL,
	[total_for_year] [bigint] NULL,
	[tickets_sold] [bigint] NULL
) ON [PRIMARY]
GO



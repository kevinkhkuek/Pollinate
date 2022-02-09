/****** Object:  Table [temp_stage].[landing_MovieDetails]    Script Date: 2/02/2022 4:46:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [temp_stage].[landing_MovieDetails](
	[year] [int] NULL,
	[movie] [nvarchar](50) NULL,
	[genre] [nvarchar](50) NULL,
	[mpaa_rating] [nvarchar](50) NULL,
	[distributor] [nvarchar](50) NULL,
	[tot_for_year] [bigint] NULL,
	[tot_in_2019] [bigint] NULL,
	[tickets_sold] [bigint] NULL
) ON [PRIMARY]
GO



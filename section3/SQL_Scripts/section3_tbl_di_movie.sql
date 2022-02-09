/****** Object:  Table [dw].[DI_movie]    Script Date: 2/02/2022 4:44:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[DI_movie](
	[movie_sk] [bigint] IDENTITY(1,1) NOT NULL,
	[movie_bk] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[genre] [nvarchar](50) NULL,
	[mpaa_rating] [nvarchar](50) NULL,
	[distributor] [nvarchar](50) NULL
) ON [PRIMARY]
GO



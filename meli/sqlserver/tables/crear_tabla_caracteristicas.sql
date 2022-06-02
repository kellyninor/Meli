USE [Meli]
GO

/****** Object:  Table [dbo].[Caracteristica]    Script Date: 28/05/2022 11:20:47 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Caracteristica](
	[idCaracteristica] [int] IDENTITY(1,1) NOT NULL,
	[Caracteristica] [varchar](300) NULL,
 CONSTRAINT [PK_Caracteristica] PRIMARY KEY CLUSTERED 
(
	[idCaracteristica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



USE [Meli]
GO

/****** Object:  Table [dbo].[Detalle]    Script Date: 29/05/2022 11:21:04 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Detalle](
	[idCaracteristica] [int] NOT NULL,
	[idDetalle] [int] IDENTITY(1,1) NOT NULL,
	[Detalle] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Detalle_1] PRIMARY KEY CLUSTERED 
(
	[idCaracteristica] ASC,
	[idDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Detalle]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Caracteristica] FOREIGN KEY([idCaracteristica])
REFERENCES [dbo].[Caracteristica] ([idCaracteristica])
GO

ALTER TABLE [dbo].[Detalle] CHECK CONSTRAINT [FK_Detalle_Caracteristica]
GO



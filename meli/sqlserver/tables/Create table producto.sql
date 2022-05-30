USE [Meli]
GO

/****** Object:  Table [dbo].[Producto]    Script Date: 29/05/2022 11:21:23 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Producto](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](300) NULL,
	[Precio] [varchar](50) NULL,
	[TipoEnvioFULL] [varchar](2) NULL,
	[Tienda] [varchar](200) NULL,
	[FechaProceso] [datetime] NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Producto] ADD  CONSTRAINT [DF_Smartphone_FechaProceso]  DEFAULT (getdate()) FOR [TipoEnvioFULL]
GO

ALTER TABLE [dbo].[Producto] ADD  CONSTRAINT [DF_Smartphone_FechaProceso_1]  DEFAULT (getdate()) FOR [FechaProceso]
GO



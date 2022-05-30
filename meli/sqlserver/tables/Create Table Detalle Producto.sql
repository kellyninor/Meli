USE [Meli]
GO

/****** Object:  Table [dbo].[ProductoDetalle]    Script Date: 29/05/2022 11:21:45 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProductoDetalle](
	[idproducto] [int] NOT NULL,
	[idcaracteristica] [int] NOT NULL,
	[iddetalle] [int] NOT NULL,
	[valor] [varchar](200) NULL,
 CONSTRAINT [PK_ProductoDetalle] PRIMARY KEY CLUSTERED 
(
	[idproducto] ASC,
	[idcaracteristica] ASC,
	[iddetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProductoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ProductoDetalle_Detalle] FOREIGN KEY([idcaracteristica], [iddetalle])
REFERENCES [dbo].[Detalle] ([idCaracteristica], [idDetalle])
GO

ALTER TABLE [dbo].[ProductoDetalle] CHECK CONSTRAINT [FK_ProductoDetalle_Detalle]
GO

ALTER TABLE [dbo].[ProductoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ProductoDetalle_Producto] FOREIGN KEY([idproducto])
REFERENCES [dbo].[Producto] ([idProducto])
GO

ALTER TABLE [dbo].[ProductoDetalle] CHECK CONSTRAINT [FK_ProductoDetalle_Producto]
GO



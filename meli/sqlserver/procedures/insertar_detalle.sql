USE [Meli]
GO
/****** Object:  StoredProcedure [dbo].[Insertar_Detalle]    Script Date: 28/05/2022 11:23:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kelly Niño, @kellyninor
-- Create date: 2022-05-28
-- Description:	Procedimiento para insertar los detalles de un producto en la BD Meli
-- =============================================
CREATE PROCEDURE [dbo].[Insertar_Detalle]
	-- Add the parameters for the stored procedure here
	@Nombre			VARCHAR(300),
	@Caracteristica	VARCHAR(300),
	@Detalle		VARCHAR(300),
	@Valor			VARCHAR(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE 	
	@idCaracteristica INT,
	@idDetalle INT,
	@idproducto INT

	BEGIN TRY   
		-- Si no existe la Caracteristica la crea
			IF NOT EXISTS (SELECT * FROM [dbo].[Caracteristica] WHERE Caracteristica = @Caracteristica)
				INSERT INTO [dbo].[Caracteristica] (Caracteristica) VALUES (@Caracteristica)

			SELECT @idCaracteristica = idcaracteristica FROM [dbo].[Caracteristica] WHERE Caracteristica = @Caracteristica

		-- Si no existe la propiedad de detalle la crea
			IF NOT EXISTS (SELECT * FROM [dbo].[Detalle] WHERE Detalle = @Detalle AND idCaracteristica = @idCaracteristica)
				INSERT INTO [dbo].[Detalle] (idCaracteristica, Detalle) VALUES (@idCaracteristica, @detalle)

			SELECT @idDetalle = iddetalle FROM [dbo].[Detalle] WHERE idCaracteristica = @idCaracteristica AND Detalle = @detalle

		-- Si el producto no tiene la propiedad la inserta
			SELECT @idproducto = idproducto FROM [dbo].[Producto] WHERE Nombre = @Nombre

			IF NOT EXISTS (SELECT * FROM [dbo].[ProductoDetalle] WHERE idproducto = @idproducto AND idcaracteristica = @idcaracteristica AND iddetalle = @iddetalle)
				INSERT INTO [dbo].[ProductoDetalle] (idproducto, idcaracteristica, iddetalle, valor) VALUES (@idproducto, @idcaracteristica, @iddetalle, @valor)

	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH
   
END

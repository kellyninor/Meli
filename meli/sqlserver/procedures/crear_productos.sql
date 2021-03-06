USE [Meli]
GO
/****** Object:  StoredProcedure [dbo].[Crear_Producto]    Script Date: 28/05/2022 11:22:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kelly Niño, @kellyninor
-- Create date: 2022-05-28
-- Description:	Procedimiento para crear productos en la BD Meli
-- =============================================
CREATE PROCEDURE [dbo].[Crear_Producto]
	-- Add the parameters for the stored procedure here
	@Nombre			VARCHAR(300),
	@Precio			VARCHAR(50),
	@TipoEnvioFULL	VARCHAR(2),
	@Tienda			VARCHAR(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY   
		IF NOT EXISTS (SELECT * FROM [dbo].[Producto] WHERE Nombre=@Nombre)
			INSERT INTO [dbo].[Producto] (Nombre, Precio, TipoEnvioFULL, Tienda) VALUES (@Nombre, @Precio, @TipoEnvioFULL, @Tienda)
	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH
   
END

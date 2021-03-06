USE [Meli]
GO
/****** Object:  StoredProcedure [dbo].[ConsultarItemsxMarca]    Script Date: 28/05/2022 11:22:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kelly Niño, @Kellyninor	
-- Create date: 2022-05-28
-- Description:	Consultar celulares de una marca que tenga Fulfillment (FULL)
-- =============================================
CREATE PROCEDURE [dbo].[ConsultarItemsxMarca]
	@marca VARCHAR(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE
	@cantidad INT

    BEGIN TRY   
		
		SELECT @cantidad= COUNT(prod.idproducto)
		FROM Producto prod
		INNER JOIN ProductoDetalle pdet
		ON prod.idproducto = pdet.idproducto
		INNER JOIN Detalle det
		ON pdet.iddetalle = det.iddetalle
		WHERE 
			det.detalle ='Marca'			
			AND prod.TipoEnvioFULL ='si'
			AND pdet.Valor = @marca	

		IF @cantidad >0
			SELECT CONCAT('Hay ',@cantidad,' productos de la marca ',@marca,' estan en el Fulfillment (FULL)')
		ELSE 
			SELECT CONCAT('No hay productos de la marca ',@marca,' que estan en el Fulfillment (FULL)')

	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH


END

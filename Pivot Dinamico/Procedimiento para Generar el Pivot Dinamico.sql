SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		MIGUEL LARIOS
-- Create date: 04/03/2021
-- Description:	GENERA CONSOLIDADO DE EQUIPOS EN UNA BAJA POR ESTADO
-- =============================================
CREATE PROCEDURE [dbo].[SP_BajaBienConsolidado]   
AS
BEGIN TRY
BEGIN TRANSACTION
	SET NOCOUNT ON
	DECLARE @MensajeError NVARCHAR(MAX)=''    

    DECLARE 
    @columns NVARCHAR(MAX) = '', 
    @sql     NVARCHAR(MAX) = ''
   

-- SELECCIONAR LOS ESTADOS DISPONIBLES PARA LAS COLUMNAS
SELECT @columns+= QUOTENAME(Estado) + ','
FROM (
  SELECT DISTINCT Estado
    from EquiposBaja   
   ) as Baja


-- REMUEVO LA ULTIMA COMA DE LA CADENA
SET @columns = LEFT(@columns, LEN(@columns) - 1);

-- CONSULTA PIVOT PARA GENERAR LA TABLA
SET @sql='
select *
FROM 
(SELECT TipoEquipo,Estado,IdEquipoBaja from EquiposBaja) B
PIVOT
(
COUNT (IdEquipoBaja)
FOR Estado in ('+ @columns+')
) AS PVT
'
EXECUTE sp_executesql @sql;


COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK
	--SI EL PROCEDIMIENTO HACE ROLLBACK ENTONCES GUARDAMOS EL ERROR O MENSAJE PERSONALIZADO.
		IF @MensajeError <>''
			BEGIN
   PRINT @MensajeError
END
		ELSE
			BEGIN
   
        DECLARE @ErrSql as NVARCHAR(300) =ERROR_MESSAGE()
      
        PRINT @ErrSql + ' (Linea: ' + convert( nvarchar,ERROR_LINE()) + ' )'
   
END
END CATCH



GO

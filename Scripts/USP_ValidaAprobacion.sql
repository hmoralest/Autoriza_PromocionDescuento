If Exists(Select * from sysobjects Where name = 'USP_ValidaAprobacion' And type = 'P')
	Drop Procedure USP_ValidaAprobacion
GO

-- ==========================================================================================
-- Author		: Henry Morales
-- Create date	: 22/02/2018
-- Description	: Valida si ya ha realizado una aprobación / rechazo
-- @estado		: 0 = error (ya existe registro)
--				  1 = oK (Listo para registrar)
-- ==========================================================================================
-- tablas		: aprobaciones
-- ==========================================================================================
/*
	Exec USP_ValidaAprobacion
*/

CREATE Procedure USP_ValidaAprobacion(
	@id_promo		Varchar(8),
	@cod_user		Varchar(3)
)
AS 
BEGIN

	Declare @estado Int;

	IF Exists (	Select 1	From promociones_aprob	Where iduser = @cod_user And idpromo = @id_promo)
		Set @estado = 0;
	ELSE
		Set @estado = 1;

	Select @estado as estado;

END
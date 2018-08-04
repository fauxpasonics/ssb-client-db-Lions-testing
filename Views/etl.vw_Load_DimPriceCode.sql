SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [etl].[vw_Load_DimPriceCode]
AS

SELECT 
	'Veritix' AS ETL__SourceSystem
	, pc.tixsyspricecodecode AS ETL__SSID
	, pc.tixsyspricecodecode AS ETL__SSID_tixsyspricecodecode

	, pc.tixsyspricecodecode AS PriceCode
	, pc.tixsyspricecodealtprintdesc AS PriceCodeName
	, pc.tixsyspricecodedesc AS PriceCodeDesc
	, pc.tixsyspricecodetype AS PriceCodeClass
 FROM ods.VTX_tixsyspricecodes pc


GO

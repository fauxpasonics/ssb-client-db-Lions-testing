SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [etl].[vw_Load_DimPriceType]
AS
SELECT
	'Veritix' AS ETL__SourceSystem
	, x.tixsyspricecodetype AS ETL__SSID
	, x.tixsyspricecodetype AS ETL__SSID_tixsyspricecodetype
	, x.tixsyspricecodetype AS PriceTypeCode
	, x.tixsyspricecodetypedesc AS PriceTypeName
	, x.tixsyspricecodetypedesc AS PriceTypeDesc
	, NULL AS PriceTypeClass
	, NULL AS Season
	, NULL AS Kind

FROM ods.VTX_tixsyspricecodetypes x

GO

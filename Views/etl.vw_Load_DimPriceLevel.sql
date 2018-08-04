SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [etl].[vw_Load_DimPriceLevel]
AS

SELECT 
	'Veritix' AS ETL__SourceSystem
	, CONCAT(x.tixeventid,':', x.tixeventzoneid,':', x.tixevtznpricelevelcode) AS ETL__SSID
	, x.tixeventid AS ETL__SSID_tixeventid
	, x.tixeventzoneid AS ETL__SSID_tixeventzoneid
	, x.tixevtznpricelevelcode ETL__SSID_tixevtznpricelevelcode
	, x.tixevtznpricelevelcode AS PriceLevelCode
	, x.tixevtznpricelevelprintdesc AS PriceLevelName
	, CONCAT(x.tixevtznpricelevelprintdesc, '(',x.tixeventid,':', x.tixeventzoneid,')') AS PriceLevelDesc
	, NULL AS Season

FROM ods.VTX_tixeventzonepricelevels x

GO

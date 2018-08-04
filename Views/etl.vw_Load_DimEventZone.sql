SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [etl].[vw_Load_DimEventZone]
AS

SELECT 
	'Veritix' AS ETL__SourceSystem
	, CONCAT(tez.tixeventid, ':', tez.tixeventzoneid ) AS ETL__SSID	
	, tez.tixeventid AS ETL__SSID_tixeventid
	, tez.tixeventzoneid AS ETL__SSID_tixeventzoneid
	
	, tez.tixeventzoneid EventZoneCode
	, tez.tixeventzonedesc EventZoneName
	, tez.tixeventzonedesc EventZoneDesc
	, tez.tixeventzonetype EventZoneClass
	, tez.tixeventid 

FROM ods.VTX_tixeventzones tez


GO

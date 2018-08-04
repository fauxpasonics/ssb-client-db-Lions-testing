SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [etl].[vw_Load_DimEvent] AS 

SELECT
	'Veritix' AS ETL__SourceSystem
	, e.tixeventid AS ETL__SSID
	, e.tixeventid AS ETL__SSID_tixeventid
	, e.tixeventlookupid AS EventCode
	, e.tixeventtitleshort AS EventName
	, e.tixeventtitleshort AS EventDesc
	, NULL AS EventClass
	, e.venueestablishmentkey AS Arena
	, NULL AS Season
	, TRY_CAST(e.tixeventstartdate AS DATE) AS EventDate
	, TRY_CAST(e.tixeventstartdate AS TIME) AS EventTime
	, e.tixeventstartdate AS EventDateTime
	, NULL AS Etype
	, NULL AS Basis
	, NULL AS EGroup
	, NULL AS Keywords
	, NULL AS Tag
	, NULL AS ManifestID
FROM ods.VTX_tixevents (NOLOCK) e

GO

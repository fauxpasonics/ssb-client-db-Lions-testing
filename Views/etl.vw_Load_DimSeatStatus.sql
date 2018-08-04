SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [etl].[vw_Load_DimSeatStatus]
AS
SELECT 
'Veritix' AS ETL__SourceSystem
	, x.tixsysseatstatuscode AS ETL__SSID	
	, x.tixsysseatstatuscode AS ETL__SSID_tixsysseatstatuscode
	, x.tixsysseatstatustextdesc AS [SeatStatusCode]
	, x.tixsysseatstatusdesc AS [SeatStatusName]
	, x.tixsysseatstatusdesc AS [SeatStatusDesc]
	, x.tixsysseatstatustype AS [SeatStatusClass]
	, CAST(0 AS BIT) [IsKill]
FROM ods.VTX_tixsysseatstatuscodes (NOLOCK) x


GO

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [etl].[vw_Load_DimSeat]
AS

SELECT
	'Veritix' AS ETL__SourceSystem
	, CONCAT(x.venueestablishmentkey,':', x.SectionName,':',x.RowName,':',x.Seat) AS ETL__SSID
	, x.venueestablishmentkey AS ETL__SSID_venueestablishmentkey
	, x.SectionName AS ETL__SSID_SECTION
	, x.RowName AS ETL__SSID_ROW
	, x.Seat AS ETL__SSID_VtxSeat
	--, x.venueestablishmentkey
	, x.SectionName
	, x.RowName
	, x.Seat
	--, x.SeatDesc
	
FROM (  SELECT DISTINCT
			e.venueestablishmentkey
			, Sec.tixseatgroupdesc SectionName
			, rw.tixseatgroupdesc RowName
			, seat.tixseatid Seat
			--, seat.tixseatdesc SeatDesc
		FROM ods.VTX_tixeventzoneseats seat
			JOIN ods.VTX_tixeventzoneseatgroups rw ON rw.tixseatgroupid = seat.tixseatgroupid
			       									   AND rw.tixeventid = seat.tixeventid
			       									   AND rw.tixeventzoneid = seat.tixeventzoneid
			JOIN ods.VTX_tixeventzoneseatgroups sec ON rw.tixseatgroupparentgroup = sec.tixseatgroupid 
														  AND seat.tixeventid = sec.tixeventid 
														  AND seat.tixeventzoneid = sec.tixeventzoneid
			JOIN ods.VTX_tixevents e ON e.tixeventid = seat.tixeventid
		--WHERE e.venueestablishmentkey = 12 --ford field
) x
WHERE seat IS NOT NULL





GO

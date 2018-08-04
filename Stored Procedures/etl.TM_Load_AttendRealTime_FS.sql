SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [etl].[TM_Load_AttendRealTime_FS]  
( 
	@BatchId NVARCHAR(50) = '00000000-0000-0000-0000-000000000000',
	@Options NVARCHAR(MAX) = NULL
) 
AS  
BEGIN 


	INSERT INTO etl.TM_Load_AttendRealTime_Log VALUES (getdate(), @BatchId)

	--WAITFOR DELAY '00:00:10'

	SELECT DISTINCT CAST(EventID AS DECIMAL(10,0)) EventID, CAST(Section AS NVARCHAR(255)) Section, CAST([Row] AS NVARCHAR(255)) [Row], CAST(SeatID AS DECIMAL(10,0)) SeatID, CAST(ScannedDate AS DATETIME) ScannedDate
	INTO #att
	FROM stg.Veritix_fsattendance_0 (NOLOCK)
	WHERE RedemptionActionType = 'Redeemed'
	AND ETL__session_id = @BatchId
	 

	CREATE NONCLUSTERED INDEX IX_Event ON #att (EventID)
	CREATE NONCLUSTERED INDEX IX_Seat ON #att (Section, [Row], SeatID)

	SELECT dEvent.DimEventId, dSeat.DimSeatId, a.ScannedDate
	INTO #stgFact
	FROM #att a
	INNER JOIN dbo.DimEvent (NOLOCK) dEvent ON a.EventID = dEvent.ETL__SSID_tixeventid AND dEvent.ETL__EndDate IS NULL
	INNER JOIN dbo.DimSeat dSeat ON dEvent.Arena = dSeat.ETL__SSID_venueestablishmentkey AND a.Section = dSeat.ETL__SSID_SECTION AND a.[Row] = dSeat.ETL__SSID_ROW AND a.SeatID = dSeat.ETL__SSID_VtxSeat AND dSeat.ETL__EndDate IS NULL


	CREATE NONCLUSTERED INDEX IX_Key ON #stgFact (DimEventId, DimSeatId)


	INSERT INTO dbo.FactAttendance 
	(
		ETL__SourceSystem, ETL__CreatedDate, ETL__UpdatedDate, DimEventId, DimSeatId, ScanDateTime
	)

	SELECT 'Veritix' ETL__SourceSystem, GETDATE() ETL__CreatedDate, GETDATE() ETL__UpdatedDate
	, sf.DimEventId, sf.DimSeatId, sf.ScannedDate
	FROM #stgFact sf
	LEFT OUTER JOIN dbo.FactAttendance fa ON sf.DimEventId = fa.DimEventId AND sf.DimSeatId = fa.DimSeatId
	WHERE fa.FactAttendanceId IS NULL

	DROP TABLE #att
	DROP TABLE #stgFact
 
 
END 
 
 
 
 






GO

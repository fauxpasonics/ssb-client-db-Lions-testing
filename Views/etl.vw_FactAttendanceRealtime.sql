SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [etl].[vw_FactAttendanceRealtime] AS (
	SELECT *
	FROM dbo.FactAttendance f (NOLOCK)
	WHERE 1=1
	AND f.ETL__UpdatedDate > DATEADD(MINUTE, -15, GETDATE())
	--ORDER BY f.ETL__UpdatedDate
)



GO

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [etl].[vw_Load_tc_VTX_aecustomerrelation] AS (
	SELECT CAST('etl.vw_Load_tc_VTX_aecustomerrelation' AS NVARCHAR(255)) ETL__Source,
		userid, customerid, aeroleid
		
	FROM ods.VTX_aecustomerrelation (NOLOCK)
	WHERE ETL_Sync_UpdatedDate > GETDATE() - 3
	
)
GO

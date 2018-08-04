SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [etl].[vw_Load_DimRep]
AS

SELECT 
	'Veritix' AS ETL__SourceSystem
	, rep.userid AS ETL__SSID
	, rep.userid AS ETL__SSID_userid

	--, rep.userid	
	--, rep.userid AS username
	--, MIN(reptype.description) AS RepType
	, NULL FirstName
	, NULL MiddleName
	, NULL LastName
	--, NULL FullName
	, MIN(reptype.description) AS RepClass
	, NULL Status
	, CAST(1 AS BIT) IsActive
FROM [ods].[VTX_aes] rep 
	INNER JOIN [ods].[VTX_aeroles] repType ON reptype.id = rep.aeroleid
GROUP BY rep.userid



GO

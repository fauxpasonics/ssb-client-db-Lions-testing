SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [etl].[vw_Load_DimArena]
AS
SELECT 
'Veritix' AS ETL__SourceSystem
	, x.establishmentkey AS ETL__SSID	
	, x.establishmentkey AS ETL__SSID_establishmentkey
	, x.establishmentkey AS ArenaCode
	, x.establishmentfullname AS ArenaName
	, x.establishmentdescription AS ArenaDesc
	, x.establishmenttype AS ArenaClass
FROM ods.VTX_establishments x

GO

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [etl].[vw_Load_DimSaleOutlet]
AS

SELECT 
	'Veritix' AS ETL__SourceSystem
	, tez.tixoutletid AS ETL__SSID	
	, tez.tixoutletid AS ETL__SSID_tixoutletid
	, tez.tixoutletid AS OutletId
	, tez.tixoutletdesc AS OutletDesc
	, tez.tixoutletinitdate AS OutletInitDate
	, tez.tixoutletlastupdwhen AS OutletUpdateDate

FROM ods.VTX_tixsysoutlets tez


GO

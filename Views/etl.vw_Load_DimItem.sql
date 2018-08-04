SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [etl].[vw_Load_DimItem] AS 

SELECT  
		'Veritix' AS  ETL__SourceSystem
		, i.id AS ETL__SSID 
		, i.id AS ETL__SSID_id

		, i.id ItemCode
		, i.productdescription ItemName
		, i.productdescription ItemDesc
		, prodType.producttypedescription ItemClass
		, NULL AS Season
		, NULL AS Basis
		, NULL AS Keywords
		, NULL AS Tag

	--SELECT *
	FROM ods.VTX_products (NOLOCK) i
	INNER JOIN ods.VTX_producttypes prodType ON prodType.producttype = i.producttype

GO

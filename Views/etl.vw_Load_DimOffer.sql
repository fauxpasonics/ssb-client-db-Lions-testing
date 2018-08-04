SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [etl].[vw_Load_DimOffer]
AS

SELECT 
	'Veritix' AS ETL__SourceSystem
	, o.id AS ETL__SSID	
	, o.id AS ETL__SSID_id
	, id [OfferCode]
	, [lookup] [OfferName]
	, [name] AS [OfferDesc]
	, [type] AS [OfferClass]
	, on_sale_date OnSaleDate
	, off_sale_date OffSaleDate
	, tags Tags
	, CASE WHEN name LIKE '%season%' AND name NOT LIKE'%preseason%' THEN 'Season' ELSE 'Individual' END AS InferredType 
FROM ods.VTX_offers o

GO

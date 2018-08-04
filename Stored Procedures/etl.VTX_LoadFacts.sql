SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [etl].[VTX_LoadFacts]
(
	@BatchId UNIQUEIDENTIFIER = '00000000-0000-0000-0000-000000000000',
	@Options NVARCHAR(MAX) = NULL
)

AS
BEGIN


	TRUNCATE TABLE stg.FactTicketSales



	INSERT INTO stg.FactTicketSales
	( 
		ETL__SourceSystem, ETL__CreatedBy, ETL__CreatedDate, ETL__UpdatedDate, ETL__SSID, ETL__SSID_id, ETL__SSID_order_id, ETL__SSID_tixeventid, ETL__SSID_tixeventzoneid,
		ETL__SSID_seatgroupid, ETL__SSID_seatid, DimDateId, DimTimeId, DimTicketCustomerId, DimArenaId, DimSeasonId, DimItemId, DimEventId, DimPlanId,
		DimPriceLevelId, DimPriceTypeId, DimPriceCodeId, DimSeatId_Start, DimRepId, DimSalesCodeId, DimPromoId, DimPlanTypeId, DimTicketTypeId, DimSeatTypeId,
		DimTicketClassId, DimTicketClassId2, DimTicketClassId3, DimTicketClassId4, DimTicketClassId5, QtySeat, OrderRevenue, OrderConvenienceFee, OrderFee,
		TotalRevenue, MinPaymentDate, PaidAmount, OwedAmount, PaidStatus, IsSold, IsPremium, IsDiscount, IsComp, IsHost, IsPlan, IsPartial,
		IsSingleEvent, IsGroup, IsBroker, IsRenewal, IsExpanded, OrderNum
		, OrderDateTime
	)


	SELECT --TOP 100

		'Veritix' AS ETL__SourceSystem
		, SUSER_NAME() AS ETL__CreatedBy
		, GETDATE() AS ETL__CreatedDate
		, GETDATE() AS ETL_UpdatedDate

		, CONCAT(oi.order_id, ':', oi.number1, ':', oi.number2, ':', oi.number3, ':', oi.number4) ETL__SSID
		, oi.id ETL__SSID_id
		, oi.order_id ETL__SSID_order_id
		, oi.number1 ETL__SSID_tixeventid
		, oi.number2 ETL__SSID_tixeventzoneid
		, oi.number3 ETL__SSID_seatgroupid
		, oi.number4 ETL__SSID_seatid

	, CONVERT(NVARCHAR(8), oi.sale_date, 112) DimDateId
	, datediff(second, cast(oi.sale_date as date), oi.sale_date) DimTimeId

	, ISNULL(dtCust.DimTicketCustomerId, -1) DimTicketCustomerId
	, ISNULL(dEvent.DimArenaID, -1) DimArenaId
	, ISNULL(dEvent.DimSeasonId, -1) DimSeasonId
	, ISNULL(dItem.DimItemId, -1) DimItemId
	, ISNULL(dEvent.DimEventId, -1) DimEventId
	, ISNULL(dPlan.DimPlanId, 0) DimPlanId --Need more logic to determine missing plan vs not a plan sale
	, ISNULL(dPriceLevel.DimPriceLevelId, -1) DimPriceLevelId
	, ISNULL(dPriceType.DimPriceTypeId, -1) DimPriceTypeId
	, -1 DimPriceCodeId
	, ISNULL(dSeat.DimSeatId, -1) DimSeatId_Start
	, -1 DimRepId
	, -1 DimSalesCodeId
	, -1 DimPromoId
	, -1 DimPlanTypeId
	, -1 DimTicketTypeId
	, -1 DimSeatTypeId
	, -1 DimTicketClassId
	, -1 DimTicketClassId2
	, -1 DimTicketClassId3
	, -1 DimTicketClassId4
	, -1 DimTicketClassId5
	, 1 QtySeat
	, oi.value OrderRevenue
	, 0 OrderConvenienceFee
	, 0 OrderFee
	, oi.value TotalRevenue
	, NULL MinPaymentDate
	, oi.paid_amount PaidAmount --need to figure out allocation
	, (oi.value - oi.value) OwedAmount --need to figure out allocation
	, CASE 
		WHEN og.ordergrouppaymentstatus = 0 THEN 'N'
		WHEN og.ordergrouppaymentstatus = 1 THEN 'P'
		WHEN og.ordergrouppaymentstatus IN (2,3) THEN 'Y'
		ELSE 'N'
	END PaidStatus
	, CAST(1 AS BIT) IsSold
	, 0 IsPremium
	, 0 IsDiscount
	, 0 IsComp
	, 0 IsHost
	, 0 IsPlan
	, 0 IsPartial
	, 0 IsSingleEvent
	, 0 IsGroup
	, 0 IsBroker
	, 0 IsRenewal
	, 0 IsExpanded
	, oi.order_id OrderNum
	, oi.sale_date

	--SELECT COUNT(*) --62864
	FROM ods.VTX_order_items (NOLOCK) oi

	LEFT OUTER JOIN ods.VTX_ordergroups og ON oi.order_id = og.ordergroup

	LEFT OUTER JOIN ods.VTX_tixsyspricecodes pc ON oi.number7 = pc.tixsyspricecodecode

	LEFT OUTER JOIN ods.VTX_tixeventzoneseatgroups rw ON oi.number1 = rw.tixeventid AND oi.number2 = rw.tixeventzoneid AND oi.number3 = rw.tixseatgroupid
		       							
	LEFT OUTER JOIN ods.VTX_tixeventzoneseatgroups sec ON oi.number1 = sec.tixeventid AND oi.number2 = sec.tixeventzoneid AND rw.tixseatgroupparentgroup = sec.tixseatgroupid

	LEFT OUTER JOIN dbo.DimEvent dEvent ON oi.number1 = dEvent.ETL__SSID_tixeventid AND dEvent.ETL__EndDate IS NULL

	LEFT OUTER JOIN dbo.DimTicketCustomer dtCust ON og.customerid = dtCust.ETL__SSID_id AND dtCust.ETL__EndDate IS NULL

	LEFT OUTER JOIN dbo.DimItem dItem ON oi.product_id = dItem.ETL__SSID_id AND dItem.ETL__EndDate IS NULL

	LEFT OUTER JOIN dbo.DimPlan dPlan ON oi.number7 = dPlan.ETL__SSID_tixsyspricecodecode AND dPlan.ETL__EndDate IS NULL

	LEFT OUTER JOIN dbo.DimPriceLevel dPriceLevel ON oi.number1 = dPriceLevel.ETL__SSID_tixeventid AND oi.number2 = dPriceLevel.ETL__SSID_tixeventzoneid AND oi.number8 = dPriceLevel.ETL__SSID_tixevtznpricelevelcode AND dPriceLevel.ETL__EndDate IS NULL

	LEFT OUTER JOIN dbo.DimPriceType dPriceType ON pc.tixsyspricecodetype = dPriceType.ETL__SSID_tixsyspricecodetype AND dPriceType.ETL__EndDate IS NULL

	LEFT OUTER JOIN dbo.DimSeat dSeat ON TRY_CAST(dEvent.Arena AS DECIMAL(10,0)) = dSeat.ETL__SSID_venueestablishmentkey AND sec.tixseatgroupdesc = dSeat.ETL__SSID_SECTION AND rw.tixseatgroupdesc = dSeat.ETL__SSID_ROW AND oi.number4 = dSeat.ETL__SSID_VtxSeat AND dSeat.ETL__EndDate IS NULL

	WHERE 1=1
	AND oi.inventory_type = 2
	AND oi.canceled = 0
	--AND oi.number1 = 645




	

	UPDATE fts
	SET fts.DimRepId = dRep.DimRepId
	, fts.ETL__UpdatedDate = GETDATE()
	FROM stg.FactTicketSales fts
	INNER JOIN dbo.DimTicketCustomer dTicketCustomer ON fts.DimTicketCustomerId = dTicketCustomer.DimTicketCustomerId
	INNER JOIN ods.VTX_aecustomerrelation aecr ON dTicketCustomer.ETL__SSID_id = aecr.customerid AND aecr.aeroleid = 3672
	INNER JOIN dbo.DimRep dRep ON aecr.userid = dRep.ETL__SSID_userid
	WHERE fts.DimRepId <> dRep.DimRepId

	IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID('stg.FactTicketSales') AND name = 'IX_Update') DROP INDEX IX_Update ON stg.FactTicketSales

	CREATE INDEX IX_Update on stg.FactTicketSales (OrderDateTime) include (DimDateId, DimTimeId)

	UPDATE fts
	SET fts.OrderDateTime = CAST(dDate.CalDate AS DATETIME) + CAST(dTime.Time24 AS DATETIME)
	, fts.ETL__UpdatedDate = GETDATE()

	FROM stg.FactTicketSales fts
	INNER JOIN dbo.DimDate dDate ON fts.DimDateId = dDate.DimDateId
	INNER JOIN dbo.DimTime dTime ON fts.DimTimeId = dTime.DimTimeId
	--WHERE fts.DimEventId = 250

	DROP INDEX IX_Update on stg.FactTicketSales 

	IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID('stg.FactTicketSales') AND name = 'IX_DimPriceCodeId') DROP INDEX IX_DimPriceCodeId ON stg.FactTicketSales

	CREATE INDEX IX_DimPriceCodeId on stg.FactTicketSales (DimPriceCodeId) include (ETL__SSID_id)

	UPDATE f
	SET f.DimPriceCodeId = dpc.DimPriceCodeId
	FROM stg.FactTicketSales f
	INNER JOIN ods.VTX_order_items oi ON f.ETL__SSID_id = oi.id
	INNER JOIN dbo.DimPriceCode dpc ON oi.number7 = dpc.ETL__SSID_tixsyspricecodecode

	DROP INDEX IX_DimPriceCodeId on stg.FactTicketSales 

	IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID('stg.FactTicketSales') AND name = 'IX_DimOfferId') DROP INDEX DimOfferId ON stg.FactTicketSales

	CREATE INDEX IX_DimOfferId on stg.FactTicketSales (DimOfferId) include (ETL__SSID_id)

	UPDATE f
	SET f.DimOfferId = dOffer.DimOfferId
	FROM stg.FactTicketSales f
	INNER JOIN ods.VTX_order_items oi ON f.ETL__SSID_id = oi.id
	INNER JOIN dbo.DimOffer dOffer ON oi.number5 = dOffer.ETL__SSID_id

	DROP INDEX IX_DimOfferId ON stg.FactTicketSales 

	IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID('stg.FactTicketSales') AND name = 'IX_DimEventZoneId') DROP INDEX IX_DimEventZoneId ON stg.FactTicketSales

	CREATE INDEX IX_DimEventZoneId ON stg.FactTicketSales (DimEventZoneId) INCLUDE (ETL__SSID_tixeventid, ETL__SSID_tixeventzoneid)

	UPDATE f
	SET f.DimEventZoneId = dez.DimEventZoneId
	FROM stg.FactTicketSales f
	INNER JOIN dbo.DimEventZone dez ON f.ETL__SSID_tixeventid = dez.ETL__SSID_tixeventid AND f.ETL__SSID_tixeventzoneid = dez.ETL__SSID_tixeventzoneid
	--WHERE f.DimEventId = 250

	DROP INDEX IX_DimEventZoneId ON stg.FactTicketSales 

	--CREATE CLUSTERED COLUMNSTORE INDEX [CCI_dbo__FactTicketSales] ON [stg].[FactTicketSales]


	ALTER SCHEMA etl TRANSFER dbo.FactTicketSales;	 
	ALTER SCHEMA dbo TRANSFER stg.FactTicketSales;	 
	ALTER SCHEMA stg TRANSFER etl.FactTicketSales;


	UPDATE fi
	SET fi.FactTicketSalesId = NULL
	, fi.ETL__UpdatedDate = GETDATE()
	--SELECT COUNT(*)
	FROM dbo.FactInventory fi
	LEFT OUTER JOIN dbo.FactTicketSales fts ON fi.DimEventId = fts.DimEventId AND fi.DimSeatId = fts.DimSeatId_Start
	WHERE fts.FactTicketSalesId IS NULL
	AND fi.FactTicketSalesId IS NOT NULL


	UPDATE fi
	SET fi.FactTicketSalesId = fts.FactTicketSalesId
	, fi.ETL__UpdatedDate = GETDATE()
	FROM dbo.FactInventory fi
	INNER JOIN stg.FactTicketSales fts ON fi.DimEventId = fts.DimEventId AND fi.DimSeatId = fts.DimSeatId_Start
	WHERE ISNULL(fi.FactTicketSalesId,-987) <> ISNULL(fts.FactTicketSalesId,-987)


	EXEC etl.Cust_FactTicketSalesProcessing


END






GO

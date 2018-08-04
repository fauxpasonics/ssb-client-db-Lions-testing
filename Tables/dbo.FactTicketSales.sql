CREATE TABLE [dbo].[FactTicketSales]
(
[FactTicketSalesId] [bigint] NOT NULL IDENTITY(1, 1),
[ETL__SourceSystem] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL__CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL__CreatedDate] [datetime] NOT NULL,
[ETL__UpdatedDate] [datetime] NOT NULL,
[ETL__SSID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL__SSID_id] [decimal] (18, 0) NULL,
[ETL__SSID_order_id] [decimal] (10, 0) NULL,
[ETL__SSID_tixeventid] [decimal] (10, 0) NULL,
[ETL__SSID_tixeventzoneid] [decimal] (10, 0) NULL,
[ETL__SSID_seatgroupid] [decimal] (10, 0) NULL,
[ETL__SSID_seatid] [decimal] (10, 0) NULL,
[DimDateId] [int] NULL,
[DimTimeId] [int] NULL,
[DimTicketCustomerId] [bigint] NULL,
[DimArenaId] [int] NULL,
[DimSeasonId] [int] NULL,
[DimItemId] [int] NULL,
[DimEventId] [int] NULL,
[DimPlanId] [int] NULL,
[DimPriceLevelId] [int] NULL,
[DimPriceTypeId] [int] NULL,
[DimPriceCodeId] [int] NULL,
[DimSeatId_Start] [int] NULL,
[DimRepId] [int] NULL,
[DimSalesCodeId] [int] NULL,
[DimPromoId] [int] NULL,
[DimPlanTypeId] [int] NULL,
[DimTicketTypeId] [int] NULL,
[DimSeatTypeId] [int] NULL,
[DimTicketClassId] [int] NULL,
[DimTicketClassId2] [int] NULL,
[DimTicketClassId3] [int] NULL,
[DimTicketClassId4] [int] NULL,
[DimTicketClassId5] [int] NULL,
[QtySeat] [int] NULL,
[OrderRevenue] [decimal] (18, 6) NULL,
[OrderConvenienceFee] [decimal] (18, 6) NULL,
[OrderFee] [decimal] (18, 6) NULL,
[TotalRevenue] [decimal] (18, 6) NULL,
[MinPaymentDate] [datetime] NULL,
[PaidAmount] [decimal] (18, 6) NULL,
[OwedAmount] [decimal] (18, 6) NULL,
[PaidStatus] [nchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsSold] [bit] NULL,
[IsPremium] [bit] NULL,
[IsDiscount] [bit] NULL,
[IsComp] [bit] NULL,
[IsHost] [bit] NULL,
[IsPlan] [bit] NULL,
[IsPartial] [bit] NULL,
[IsSingleEvent] [bit] NULL,
[IsGroup] [bit] NULL,
[IsBroker] [bit] NULL,
[IsRenewal] [bit] NULL,
[IsExpanded] [bit] NULL,
[OrderNum] [bigint] NULL,
[OrderDateTime] [datetime] NULL,
[DimEventZoneId] [int] NULL,
[DimOfferId] [int] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_dbo__FactTicketSales] ON [dbo].[FactTicketSales]
GO

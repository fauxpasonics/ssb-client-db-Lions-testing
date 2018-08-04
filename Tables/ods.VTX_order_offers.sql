CREATE TABLE [ods].[VTX_order_offers]
(
[order_id] [decimal] (20, 0) NULL,
[offer_id] [decimal] (20, 0) NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_order_offers] ON [ods].[VTX_order_offers]
GO

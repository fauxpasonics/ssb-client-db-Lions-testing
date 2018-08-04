CREATE TABLE [ods].[VTX_order_products]
(
[order_id] [decimal] (20, 0) NOT NULL,
[product_id] [decimal] (20, 0) NOT NULL,
[status] [int] NULL,
[quantity] [decimal] (20, 0) NULL,
[value] [decimal] (20, 4) NULL,
[payments_cleared] [decimal] (20, 4) NULL,
[payments_scheduled] [decimal] (20, 4) NULL,
[payment_balance] [decimal] (20, 4) NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_order_products] ON [ods].[VTX_order_products]
GO

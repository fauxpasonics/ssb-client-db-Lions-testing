CREATE TABLE [ods].[VTX_offer_group_products]
(
[group_id] [decimal] (20, 0) NOT NULL,
[product_id] [decimal] (20, 0) NOT NULL,
[disp_order] [decimal] (20, 0) NOT NULL,
[optional] [int] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_offer_group_products] ON [ods].[VTX_offer_group_products]
GO

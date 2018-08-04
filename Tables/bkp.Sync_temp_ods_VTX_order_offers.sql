CREATE TABLE [bkp].[Sync_temp_ods_VTX_order_offers]
(
[order_id] [decimal] (20, 0) NULL,
[offer_id] [decimal] (20, 0) NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_order_offers] ADD CONSTRAINT [PK__Sync_tem__19364FD29272B386] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

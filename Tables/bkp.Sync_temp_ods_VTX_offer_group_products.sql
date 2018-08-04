CREATE TABLE [bkp].[Sync_temp_ods_VTX_offer_group_products]
(
[group_id] [decimal] (20, 0) NOT NULL,
[product_id] [decimal] (20, 0) NOT NULL,
[disp_order] [decimal] (20, 0) NOT NULL,
[optional] [int] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_offer_group_products] ADD CONSTRAINT [PK__Sync_tem__19364FD2573FE761] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

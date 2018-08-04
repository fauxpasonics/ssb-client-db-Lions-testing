CREATE TABLE [bkp].[Sync_temp_ods_FS_resold_orders]
(
[event_id] [bigint] NULL,
[event_owner_id] [bigint] NULL,
[offer_listing_id] [bigint] NULL,
[bid_id] [bigint] NULL,
[transaction_date] [datetime2] NULL,
[buyer_invoice] [bigint] NULL,
[buyer_account] [bigint] NULL,
[seller_invoice] [bigint] NULL,
[seller_account] [bigint] NULL,
[quantity] [int] NULL,
[seller_settlement_method] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[buyer_settlement_method] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[buyer_amount] [decimal] (8, 1) NULL,
[seller_amount] [decimal] (8, 1) NULL,
[bid_invoice_id] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[update_datetime] [datetime2] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_FS_resold_orders] ADD CONSTRAINT [PK__Sync_tem__19364FD2D69667F3] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

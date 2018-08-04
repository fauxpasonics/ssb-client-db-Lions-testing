CREATE TABLE [bkp].[Sync_temp_ods_FS_resold_order_breakdown]
(
[invoice_lineitem_id] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[event_id] [bigint] NULL,
[event_owner_id] [bigint] NULL,
[account_id] [bigint] NULL,
[listing_id] [bigint] NULL,
[ticket_id] [bigint] NULL,
[transactor] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[invoice_id] [bigint] NULL,
[lineitem_id] [bigint] NULL,
[lineitem_desc] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lineitem_detail] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[invert_amount] [int] NULL,
[amount] [decimal] (19, 4) NULL,
[update_datetime] [datetime2] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_FS_resold_order_breakdown] ADD CONSTRAINT [PK__Sync_tem__19364FD29B62BF2C] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

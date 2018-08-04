CREATE TABLE [ods].[FS_resold_order_breakdown]
(
[invoice_lineitem_id] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[event_id] [bigint] NULL,
[event_owner_id] [bigint] NULL,
[account_id] [bigint] NULL,
[listing_id] [bigint] NULL,
[ticket_id] [bigint] NULL,
[transactor] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[invoice_id] [bigint] NULL,
[lineitem_id] [bigint] NULL,
[lineitem_desc] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lineitem_detail] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[invert_amount] [int] NULL,
[amount] [decimal] (19, 4) NULL,
[update_datetime] [datetime2] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__FS_resold_order_breakdown] ON [ods].[FS_resold_order_breakdown]
GO

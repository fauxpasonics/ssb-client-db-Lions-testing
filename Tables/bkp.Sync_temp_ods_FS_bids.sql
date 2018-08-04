CREATE TABLE [bkp].[Sync_temp_ods_FS_bids]
(
[ticket_id] [bigint] NULL,
[event_owner_id] [bigint] NULL,
[event_id] [bigint] NULL,
[account_id] [bigint] NULL,
[bid_id] [bigint] NOT NULL,
[bid_status] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[bid_action] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[bid_ticket_quantity] [int] NULL,
[bid_price_per_ticket] [decimal] (19, 4) NULL,
[bid_placed_datetime] [datetime2] NULL,
[bid_expire_datetime] [datetime2] NULL,
[bid_went_inactive_datetime] [datetime2] NULL,
[update_datetime] [datetime2] NULL,
[listing_id] [bigint] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_FS_bids] ADD CONSTRAINT [PK__Sync_tem__19364FD28EBD09B0] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

CREATE TABLE [ods].[FS_listings]
(
[listing_ticket_id] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ticket_id] [bigint] NULL,
[event_owner_id] [bigint] NULL,
[event_id] [bigint] NULL,
[account_id] [bigint] NULL,
[bid_notification_type] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[listed_datetime] [datetime2] NULL,
[asking_price] [decimal] (19, 4) NULL,
[auto_accept_bid_amount] [decimal] (19, 4) NULL,
[quantity_listed] [int] NULL,
[quantity_sold] [int] NULL,
[unlisted_datetime] [datetime2] NULL,
[minimum_bid_price] [decimal] (19, 4) NULL,
[minimum_split] [int] NULL,
[listing_id] [bigint] NULL,
[update_datetime] [datetime2] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__FS_listings] ON [ods].[FS_listings]
GO

CREATE TABLE [ods].[FS_tickets]
(
[ticket_id] [bigint] NULL,
[section_name] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[row_name] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seat_name] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pricecode_description] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pricelevel_description] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[flash_original_account_id] [bigint] NULL,
[event_id] [bigint] NULL,
[vt_order_id] [bigint] NULL,
[vt_offer_id] [bigint] NULL,
[vt_customer_id] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[external_event_config_primary] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vt_system] [bigint] NULL,
[vt_event] [bigint] NULL,
[vt_zone] [bigint] NULL,
[vt_seat_group] [bigint] NULL,
[vt_seat_id] [bigint] NULL,
[event_owner_id] [bigint] NULL,
[insert_datetime] [datetime2] NULL,
[test_flag] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[state] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[update_datetime] [datetime2] NULL,
[account_id] [bigint] NULL,
[context_id] [bigint] NULL,
[tix_event_id] [bigint] NULL,
[tix_eventzone_id] [bigint] NULL,
[face_value] [decimal] (19, 4) NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__FS_tickets] ON [ods].[FS_tickets]
GO
CREATE NONCLUSTERED INDEX [IDX_ETL_Sync_DeltaHashKey] ON [ods].[FS_tickets] ([ETL_Sync_DeltaHashKey])
GO
CREATE NONCLUSTERED INDEX [IDX_ticket_id] ON [ods].[FS_tickets] ([ticket_id])
GO

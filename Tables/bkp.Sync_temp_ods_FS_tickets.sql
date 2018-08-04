CREATE TABLE [bkp].[Sync_temp_ods_FS_tickets]
(
[ticket_id] [bigint] NULL,
[section_name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[row_name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seat_name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pricecode_description] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pricelevel_description] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[flash_original_account_id] [bigint] NULL,
[event_id] [bigint] NULL,
[vt_order_id] [bigint] NULL,
[vt_offer_id] [bigint] NULL,
[vt_customer_id] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[external_event_config_primary] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vt_system] [bigint] NULL,
[vt_event] [bigint] NULL,
[vt_zone] [bigint] NULL,
[vt_seat_group] [bigint] NULL,
[vt_seat_id] [bigint] NULL,
[event_owner_id] [bigint] NULL,
[insert_datetime] [datetime2] NULL,
[test_flag] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[state] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[update_datetime] [datetime2] NULL,
[account_id] [bigint] NULL,
[context_id] [bigint] NULL,
[tix_event_id] [bigint] NULL,
[tix_eventzone_id] [bigint] NULL,
[face_value] [decimal] (19, 4) NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_FS_tickets] ADD CONSTRAINT [PK__Sync_tem__19364FD2123F191A] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

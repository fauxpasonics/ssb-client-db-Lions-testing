CREATE TABLE [ods].[FS_accounts_owner]
(
[account_id] [bigint] NULL,
[event_owner_id] [bigint] NULL,
[update_datetime] [datetime2] NULL,
[account_owner_id] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__FS_accounts_owner] ON [ods].[FS_accounts_owner]
GO

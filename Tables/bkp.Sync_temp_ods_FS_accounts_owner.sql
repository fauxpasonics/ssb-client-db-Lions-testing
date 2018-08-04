CREATE TABLE [bkp].[Sync_temp_ods_FS_accounts_owner]
(
[account_id] [bigint] NULL,
[event_owner_id] [bigint] NULL,
[update_datetime] [datetime2] NULL,
[account_owner_id] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_FS_accounts_owner] ADD CONSTRAINT [PK__Sync_tem__19364FD2A6A479DE] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

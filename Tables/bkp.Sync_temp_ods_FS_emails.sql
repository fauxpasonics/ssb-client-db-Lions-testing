CREATE TABLE [bkp].[Sync_temp_ods_FS_emails]
(
[account_id] [bigint] NULL,
[email] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email_state] [int] NULL,
[update_datetime] [datetime2] NULL,
[account_email_id] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_FS_emails] ADD CONSTRAINT [PK__Sync_tem__19364FD20294F398] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

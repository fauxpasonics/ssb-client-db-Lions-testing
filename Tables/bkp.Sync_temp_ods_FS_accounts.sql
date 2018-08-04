CREATE TABLE [bkp].[Sync_temp_ods_FS_accounts]
(
[account_id] [bigint] NOT NULL,
[first_name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[last_name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[work_phone_number] [nvarchar] (90) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[home_phone_number] [nvarchar] (90) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mobile_phone_number] [nvarchar] (90) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[birthdate] [datetime2] NULL,
[account_created_datetime] [datetime2] NULL,
[update_datetime] [datetime2] NULL,
[load_datetime] [datetime2] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_FS_accounts] ADD CONSTRAINT [PK__Sync_tem__19364FD245E4E116] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

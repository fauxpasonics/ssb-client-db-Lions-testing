CREATE TABLE [bkp].[Sync_temp_ods_FS_address]
(
[account_id] [bigint] NULL,
[address_line_1] [nvarchar] (600) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[address_line_2] [nvarchar] (600) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[city] [nvarchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[state] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[zip] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[country] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[update_datetime] [datetime2] NULL,
[account_address_id] [bigint] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_FS_address] ADD CONSTRAINT [PK__Sync_tem__19364FD20AD7E7F6] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

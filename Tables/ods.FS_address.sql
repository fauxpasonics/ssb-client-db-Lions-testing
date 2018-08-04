CREATE TABLE [ods].[FS_address]
(
[account_id] [bigint] NULL,
[address_line_1] [varchar] (600) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[address_line_2] [varchar] (600) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[city] [varchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[state] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[zip] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[country] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[update_datetime] [datetime2] NULL,
[account_address_id] [bigint] NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__FS_address] ON [ods].[FS_address]
GO

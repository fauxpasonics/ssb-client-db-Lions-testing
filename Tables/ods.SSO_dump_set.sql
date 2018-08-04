CREATE TABLE [ods].[SSO_dump_set]
(
[dump_key] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[start_time] [datetime2] NULL,
[end_time] [datetime2] NULL,
[created] [datetime2] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO

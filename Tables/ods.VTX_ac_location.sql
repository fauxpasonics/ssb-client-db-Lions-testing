CREATE TABLE [ods].[VTX_ac_location]
(
[locationid] [int] NOT NULL,
[description] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[location] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[server] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[email] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[active] [int] NULL,
[lastupdated] [datetime2] NULL,
[current_status] [int] NULL,
[suite_lock_enabled] [int] NULL,
[remotepollenabled] [decimal] (10, 0) NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO

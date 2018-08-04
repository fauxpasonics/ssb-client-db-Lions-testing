CREATE TABLE [ods].[SSO_facebook_object]
(
[id] [bigint] NULL,
[object_id] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[category] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[created] [datetime2] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO

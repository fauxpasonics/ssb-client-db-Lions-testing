CREATE TABLE [ods].[SSO_visitor]
(
[id] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[name] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[first_name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[last_name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[phone] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[gender] [nvarchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[created] [datetime2] NULL,
[email] [nvarchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[user_type] [nvarchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO

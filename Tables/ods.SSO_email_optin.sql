CREATE TABLE [ods].[SSO_email_optin]
(
[email] [nvarchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[visitor_id] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[first_name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[last_name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[location_group_id] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[location_id] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[created] [datetime2] NULL,
[email_flagged] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO

CREATE TABLE [ods].[SSO_visit]
(
[visitor_id] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[location_id] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[station] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[visit_date] [date] NULL,
[created] [datetime2] NULL,
[device_address] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ip] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[device_type] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[visit_type] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO

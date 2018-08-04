CREATE TABLE [ods].[SSO_event]
(
[visitor_id] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[location_group_id] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[event_type_id] [int] NULL,
[location_id] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[card_id] [int] NULL,
[payload] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[created] [datetime2] NULL,
[visit_type_id] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO

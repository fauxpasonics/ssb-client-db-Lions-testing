CREATE TABLE [ods].[SSO_card]
(
[id] [int] NOT NULL,
[name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[card_type] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[created] [datetime2] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO

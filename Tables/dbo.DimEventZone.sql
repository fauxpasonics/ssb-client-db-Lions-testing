CREATE TABLE [dbo].[DimEventZone]
(
[DimEventZoneId] [int] NOT NULL IDENTITY(1, 1),
[ETL__SourceSystem] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL__CreatedDate] [datetime] NOT NULL,
[ETL__StartDate] [datetime] NOT NULL,
[ETL__EndDate] [datetime] NULL,
[ETL__DeltaHashKey] [binary] (32) NULL,
[ETL__SSID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__SSID_tixeventid] [decimal] (10, 0) NULL,
[ETL__SSID_tixeventzoneid] [int] NULL,
[EventZoneCode] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EventZoneName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EventZoneDesc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EventZoneClass] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [dbo].[DimEventZone] ADD CONSTRAINT [PK__DimEvent__7B78C4AAF3CA0539] PRIMARY KEY CLUSTERED  ([DimEventZoneId])
GO

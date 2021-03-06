CREATE TABLE [dbo].[DimPriceLevel]
(
[DimPriceLevelId] [int] NOT NULL IDENTITY(1, 1),
[ETL__SourceSystem] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__DimPriceL__ETL____5C387804] DEFAULT (suser_name()),
[ETL__CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__DimPriceL__ETL____5D2C9C3D] DEFAULT (getdate()),
[ETL__StartDate] [datetime] NOT NULL CONSTRAINT [DF__DimPriceL__ETL____5E20C076] DEFAULT (getdate()),
[ETL__EndDate] [datetime] NULL,
[ETL__DeltaHashKey] [binary] (32) NULL,
[ETL__SSID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriceLevelCode] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriceLevelName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriceLevelDesc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriceLevelClass] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Season] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PTable] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__SSID_tixeventid] [decimal] (10, 0) NULL,
[ETL__SSID_tixeventzoneid] [int] NULL,
[ETL__SSID_tixevtznpricelevelcode] [decimal] (10, 0) NULL
)
GO
ALTER TABLE [dbo].[DimPriceLevel] ADD CONSTRAINT [PK_DimPriceLevel] PRIMARY KEY CLUSTERED  ([DimPriceLevelId])
GO

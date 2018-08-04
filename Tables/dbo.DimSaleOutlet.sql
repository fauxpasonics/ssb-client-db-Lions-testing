CREATE TABLE [dbo].[DimSaleOutlet]
(
[DimSaleOutletId] [int] NOT NULL IDENTITY(1, 1),
[ETL__SourceSystem] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL__CreatedDate] [datetime] NOT NULL,
[ETL__StartDate] [datetime] NOT NULL,
[ETL__EndDate] [datetime] NULL,
[ETL__DeltaHashKey] [binary] (32) NULL,
[ETL__SSID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__SSID_tixoutletid] [int] NULL,
[OutletID] [int] NULL,
[OutletDesc] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OutletInitDate] [datetime] NULL,
[OutletUpdateDate] [datetime] NULL
)
GO

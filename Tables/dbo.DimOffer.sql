CREATE TABLE [dbo].[DimOffer]
(
[DimOfferId] [int] NOT NULL IDENTITY(1, 1),
[ETL__SourceSystem] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL__CreatedDate] [datetime] NOT NULL,
[ETL__StartDate] [datetime] NOT NULL,
[ETL__EndDate] [datetime] NULL,
[ETL__DeltaHashKey] [binary] (32) NULL,
[ETL__SSID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__SSID_id] [decimal] (20, 0) NULL,
[OfferCode] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OfferName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OfferDesc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OfferClass] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OnSaleDate] [datetime] NULL,
[OffSaleDate] [datetime] NULL,
[Tags] [nvarchar] (1500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InferredType] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [dbo].[DimOffer] ADD CONSTRAINT [PK__DimOffer__398C508D8365314F] PRIMARY KEY CLUSTERED  ([DimOfferId])
GO

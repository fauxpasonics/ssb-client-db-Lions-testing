CREATE TABLE [ods].[VTX_customerfielddata]
(
[customerid] [decimal] (38, 10) NOT NULL,
[customerfieldid] [decimal] (38, 10) NOT NULL,
[stringvalue] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[datevalue] [datetime2] NULL,
[numericvalue] [decimal] (10, 0) NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO

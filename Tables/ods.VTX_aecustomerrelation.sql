CREATE TABLE [ods].[VTX_aecustomerrelation]
(
[userid] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[customerid] [decimal] (38, 10) NOT NULL,
[aeroleid] [decimal] (38, 10) NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_aecustomerrelation] ON [ods].[VTX_aecustomerrelation]
GO

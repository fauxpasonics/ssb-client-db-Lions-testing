CREATE TABLE [ods].[VTX_aes]
(
[userid] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[aeroleid] [decimal] (38, 10) NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_aes] ON [ods].[VTX_aes]
GO

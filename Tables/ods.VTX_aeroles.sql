CREATE TABLE [ods].[VTX_aeroles]
(
[id] [decimal] (38, 10) NOT NULL,
[description] [varchar] (600) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[old_id] [decimal] (38, 10) NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_aeroles] ON [ods].[VTX_aeroles]
GO

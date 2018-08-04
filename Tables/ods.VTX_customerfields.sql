CREATE TABLE [ods].[VTX_customerfields]
(
[id] [decimal] (10, 0) NOT NULL,
[name] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[logchanges] [int] NULL,
[customerfieldlistid] [decimal] (10, 0) NULL,
[required] [int] NULL,
[active] [int] NULL,
[fieldtype] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[storagetype] [decimal] (38, 10) NULL,
[readonly] [int] NULL,
[visible] [int] NULL,
[maxlength] [decimal] (20, 0) NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_customerfields] ON [ods].[VTX_customerfields]
GO

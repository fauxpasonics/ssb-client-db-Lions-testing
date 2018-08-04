CREATE TABLE [ods].[VTX_tixeventzoneseatbarcodes]
(
[tixseatbarcodeid] [decimal] (10, 0) NOT NULL,
[tixeventid] [decimal] (10, 0) NULL,
[tixeventzoneid] [int] NULL,
[tixseatgroupid] [int] NULL,
[tixseatid] [decimal] (10, 0) NULL,
[barcode] [varchar] (96) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[scandatetime] [datetime2] NULL,
[scanlocation] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[clustercode] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[gatenumber] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[validationresponse] [int] NULL,
[initdate] [datetime2] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_tixeventzoneseatbarcodes] ON [ods].[VTX_tixeventzoneseatbarcodes]
GO

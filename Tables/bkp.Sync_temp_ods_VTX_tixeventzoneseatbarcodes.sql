CREATE TABLE [bkp].[Sync_temp_ods_VTX_tixeventzoneseatbarcodes]
(
[tixseatbarcodeid] [decimal] (10, 0) NOT NULL,
[tixeventid] [decimal] (10, 0) NULL,
[tixeventzoneid] [int] NULL,
[tixseatgroupid] [int] NULL,
[tixseatid] [decimal] (10, 0) NULL,
[barcode] [nvarchar] (96) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[scandatetime] [datetime2] NULL,
[scanlocation] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[clustercode] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[gatenumber] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[validationresponse] [int] NULL,
[initdate] [datetime2] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_tixeventzoneseatbarcodes] ADD CONSTRAINT [PK__Sync_tem__19364FD22B9B52C0] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

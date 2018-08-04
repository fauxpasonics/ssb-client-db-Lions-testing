CREATE TABLE [ods].[VTX_category]
(
[categoryid] [decimal] (20, 0) NULL,
[categorytypeid] [decimal] (10, 0) NULL,
[categoryname] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[categorydescription] [varchar] (765) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[categorystatus] [int] NULL,
[establishmenttype] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentkey] [decimal] (10, 0) NULL,
[parentid] [decimal] (10, 0) NULL,
[grandparentid] [decimal] (10, 0) NULL,
[greatgrandparentid] [decimal] (10, 0) NULL,
[imagepath] [varchar] (3072) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lastupdated] [datetime2] NULL,
[lastupdatedby] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[createdate] [datetime2] NULL,
[displayorder] [decimal] (10, 0) NULL,
[client_id] [decimal] (10, 0) NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_category] ON [ods].[VTX_category]
GO

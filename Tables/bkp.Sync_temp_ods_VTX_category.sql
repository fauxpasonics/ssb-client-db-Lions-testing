CREATE TABLE [bkp].[Sync_temp_ods_VTX_category]
(
[categoryid] [decimal] (20, 0) NULL,
[categorytypeid] [decimal] (10, 0) NULL,
[categoryname] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[categorydescription] [nvarchar] (765) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[categorystatus] [int] NULL,
[establishmenttype] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentkey] [decimal] (10, 0) NULL,
[parentid] [decimal] (10, 0) NULL,
[grandparentid] [decimal] (10, 0) NULL,
[greatgrandparentid] [decimal] (10, 0) NULL,
[imagepath] [nvarchar] (3072) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lastupdated] [datetime2] NULL,
[lastupdatedby] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[createdate] [datetime2] NULL,
[displayorder] [decimal] (10, 0) NULL,
[client_id] [decimal] (10, 0) NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_category] ADD CONSTRAINT [PK__Sync_tem__19364FD224A52192] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

CREATE TABLE [bkp].[Sync_temp_ods_VTX_customerfields]
(
[id] [decimal] (10, 0) NOT NULL,
[name] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[logchanges] [int] NULL,
[customerfieldlistid] [decimal] (10, 0) NULL,
[required] [int] NULL,
[active] [int] NULL,
[fieldtype] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[storagetype] [decimal] (38, 10) NULL,
[readonly] [int] NULL,
[visible] [int] NULL,
[maxlength] [decimal] (20, 0) NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_customerfields] ADD CONSTRAINT [PK__Sync_tem__19364FD2E501CC29] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

CREATE TABLE [bkp].[Sync_temp_ods_VTX_tixsyspricecodetypes]
(
[tixsyspricecodetype] [decimal] (10, 0) NOT NULL,
[tixsyspricecodetypedesc] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[tixsyspricecodetypeinitdate] [datetime2] NULL,
[tixsyspricecodetypelastupdwhen] [datetime2] NULL,
[tixsyspricecodetypelastupdwho] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsyspricecodetypedispord] [int] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_tixsyspricecodetypes] ADD CONSTRAINT [PK__Sync_tem__19364FD221A2C273] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

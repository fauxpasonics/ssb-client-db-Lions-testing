CREATE TABLE [bkp].[Sync_temp_ods_VTX_tixsyspricelevels]
(
[tixsyspricelevelcode] [decimal] (10, 0) NOT NULL,
[tixsyspriceleveldesc] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[tixsyspricelevelinitdate] [datetime2] NOT NULL,
[tixsyspricelevellastupdwhen] [datetime2] NULL,
[tixsyspricelevellastupdatewho] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsyspricelevelcolors] [nvarchar] (192) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsyspriceleveltype] [int] NULL,
[tixsyspricelevelmodatnextlevel] [int] NOT NULL,
[tissyspriceleveldispord] [int] NULL,
[tixsyshiddenstatus] [int] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_tixsyspricelevels] ADD CONSTRAINT [PK__Sync_tem__19364FD2328133CD] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

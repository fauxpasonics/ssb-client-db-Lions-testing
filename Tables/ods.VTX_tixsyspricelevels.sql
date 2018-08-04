CREATE TABLE [ods].[VTX_tixsyspricelevels]
(
[tixsyspricelevelcode] [decimal] (10, 0) NOT NULL,
[tixsyspriceleveldesc] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[tixsyspricelevelinitdate] [datetime2] NULL,
[tixsyspricelevellastupdwhen] [datetime2] NULL,
[tixsyspricelevellastupdatewho] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsyspricelevelcolors] [varchar] (192) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsyspriceleveltype] [int] NULL,
[tixsyspricelevelmodatnextlevel] [int] NOT NULL,
[tissyspriceleveldispord] [int] NULL,
[tixsyshiddenstatus] [int] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_tixsyspricelevels] ON [ods].[VTX_tixsyspricelevels]
GO

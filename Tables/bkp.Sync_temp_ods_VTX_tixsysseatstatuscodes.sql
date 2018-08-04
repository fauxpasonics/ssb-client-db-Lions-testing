CREATE TABLE [bkp].[Sync_temp_ods_VTX_tixsysseatstatuscodes]
(
[tixsysseatstatuscode] [decimal] (10, 0) NOT NULL,
[tixsysseatstatusdesc] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[tixsysseatstatusdisplayorder] [int] NULL,
[tixsysseatstatusinitdate] [datetime2] NULL,
[tixsysseatstatuslastupdwhen] [datetime2] NULL,
[tixsysseatstatuslastupdwho] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsysseatstatustype] [int] NULL,
[tixsysseatstatuscontrol] [nvarchar] (96) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsysseatstatuscolors] [nvarchar] (192) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsysseatstatustextdesc] [nvarchar] (192) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsysseatstatushistoryreconly] [int] NOT NULL,
[tixsysseatstatussystemonlyflag] [int] NOT NULL,
[tixsysseatstatusmodatnextlevel] [int] NOT NULL,
[tixsysseatstatussubtype] [int] NULL,
[tixsysseatstatuspkgonlyflag] [int] NULL,
[tixsyshiddenstatus] [int] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_tixsysseatstatuscodes] ADD CONSTRAINT [PK__Sync_tem__19364FD24AF697D3] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

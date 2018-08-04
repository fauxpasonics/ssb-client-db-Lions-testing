CREATE TABLE [ods].[VTX_tixsysseatstatuscodes]
(
[tixsysseatstatuscode] [decimal] (10, 0) NOT NULL,
[tixsysseatstatusdesc] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[tixsysseatstatusdisplayorder] [int] NULL,
[tixsysseatstatusinitdate] [datetime2] NULL,
[tixsysseatstatuslastupdwhen] [datetime2] NULL,
[tixsysseatstatuslastupdwho] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsysseatstatustype] [int] NULL,
[tixsysseatstatuscontrol] [varchar] (96) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsysseatstatuscolors] [varchar] (192) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsysseatstatustextdesc] [varchar] (192) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsysseatstatushistoryreconly] [int] NOT NULL,
[tixsysseatstatussystemonlyflag] [int] NOT NULL,
[tixsysseatstatusmodatnextlevel] [int] NOT NULL,
[tixsysseatstatussubtype] [int] NULL,
[tixsysseatstatuspkgonlyflag] [int] NULL,
[tixsyshiddenstatus] [int] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_tixsysseatstatuscodes] ON [ods].[VTX_tixsysseatstatuscodes]
GO

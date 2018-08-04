CREATE TABLE [bkp].[Sync_temp_ods_VTX_tixsysseatgrouptypes]
(
[tixsysseatgrouptypecode] [int] NOT NULL,
[tixsysseatgrouptypedesc] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[tixsysseatgrouptypedisplayordr] [int] NULL,
[tixsysseatgrptypenextleveldown] [nvarchar] (48) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsysseatgrouptypeshortdesc] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsysseatgrouptypeprocessctrl] [nvarchar] (192) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsysseatgrouptypeinvntryctrl] [int] NULL,
[tixsysseatgrouptypefieldscode] [int] NOT NULL,
[tixsysvalidtopseatgrouptype] [int] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_tixsysseatgrouptypes] ADD CONSTRAINT [PK__Sync_tem__19364FD2482DE7AA] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

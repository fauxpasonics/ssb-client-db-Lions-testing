CREATE TABLE [ods].[VTX_tixsysseatgrouptypes]
(
[tixsysseatgrouptypecode] [int] NOT NULL,
[tixsysseatgrouptypedesc] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[tixsysseatgrouptypedisplayordr] [int] NULL,
[tixsysseatgrptypenextleveldown] [varchar] (48) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsysseatgrouptypeshortdesc] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsysseatgrouptypeprocessctrl] [varchar] (192) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsysseatgrouptypeinvntryctrl] [int] NULL,
[tixsysseatgrouptypefieldscode] [int] NOT NULL,
[tixsysvalidtopseatgrouptype] [int] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_tixsysseatgrouptypes] ON [ods].[VTX_tixsysseatgrouptypes]
GO

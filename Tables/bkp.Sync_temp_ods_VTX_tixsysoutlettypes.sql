CREATE TABLE [bkp].[Sync_temp_ods_VTX_tixsysoutlettypes]
(
[tixsysoutlettypedesc] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[tixsysoutlettypeinitdate] [datetime2] NOT NULL,
[tixsysoutlettypelastupdwhen] [datetime2] NULL,
[tixsysoutlettypelastupdwho] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsysoutlettype] [int] NOT NULL,
[outlettyperegionrprtspecifier] [int] NULL,
[tixsysoutlettypedisporder] [int] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_tixsysoutlettypes] ADD CONSTRAINT [PK__Sync_tem__19364FD21840334F] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

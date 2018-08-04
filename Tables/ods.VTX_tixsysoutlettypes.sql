CREATE TABLE [ods].[VTX_tixsysoutlettypes]
(
[tixsysoutlettypedesc] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[tixsysoutlettypeinitdate] [datetime2] NULL,
[tixsysoutlettypelastupdwhen] [datetime2] NULL,
[tixsysoutlettypelastupdwho] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsysoutlettype] [int] NOT NULL,
[outlettyperegionrprtspecifier] [int] NULL,
[tixsysoutlettypedisporder] [int] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_tixsysoutlettypes] ON [ods].[VTX_tixsysoutlettypes]
GO

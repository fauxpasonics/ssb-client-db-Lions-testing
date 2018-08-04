CREATE TABLE [ods].[VTX_tixsysoutlets]
(
[tixoutletid] [int] NOT NULL,
[tixoutletdesc] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[tixoutletinitdate] [datetime2] NULL,
[tixoutletlastupdwho] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixoutletlastupdwhen] [datetime2] NULL,
[tixoutletdisplayorder] [int] NULL,
[tixoutletcontrol] [varchar] (192) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixoutletestablishmenttype] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixoutletestablishmentkey] [decimal] (10, 0) NULL,
[tixoutlettype] [int] NOT NULL,
[tixoutletmerchid] [int] NULL,
[tixoutletmaxticket] [decimal] (10, 0) NULL,
[tixoutletonsaledate] [datetime2] NULL,
[tixoutletoffsaledate] [datetime2] NULL,
[tixoutletsubnetrootip] [decimal] (10, 0) NULL,
[tixoutletsubnetrootmask] [decimal] (10, 0) NULL,
[tixoutletzipcode] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixoutletautocloseouttime] [datetime2] NULL,
[client_id] [decimal] (10, 0) NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_tixsysoutlets] ON [ods].[VTX_tixsysoutlets]
GO

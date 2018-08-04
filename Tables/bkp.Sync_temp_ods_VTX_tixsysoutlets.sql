CREATE TABLE [bkp].[Sync_temp_ods_VTX_tixsysoutlets]
(
[tixoutletid] [int] NOT NULL,
[tixoutletdesc] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[tixoutletinitdate] [datetime2] NULL,
[tixoutletlastupdwho] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixoutletlastupdwhen] [datetime2] NULL,
[tixoutletdisplayorder] [int] NULL,
[tixoutletcontrol] [nvarchar] (192) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixoutletestablishmenttype] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixoutletestablishmentkey] [decimal] (10, 0) NULL,
[tixoutlettype] [int] NOT NULL,
[tixoutletmerchid] [int] NULL,
[tixoutletmaxticket] [decimal] (10, 0) NULL,
[tixoutletonsaledate] [datetime2] NULL,
[tixoutletoffsaledate] [datetime2] NULL,
[tixoutletsubnetrootip] [decimal] (10, 0) NULL,
[tixoutletsubnetrootmask] [decimal] (10, 0) NULL,
[tixoutletzipcode] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixoutletautocloseouttime] [datetime2] NULL,
[client_id] [decimal] (10, 0) NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_tixsysoutlets] ADD CONSTRAINT [PK__Sync_tem__19364FD2E23D48A8] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

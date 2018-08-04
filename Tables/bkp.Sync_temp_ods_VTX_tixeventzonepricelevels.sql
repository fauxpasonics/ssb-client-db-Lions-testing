CREATE TABLE [bkp].[Sync_temp_ods_VTX_tixeventzonepricelevels]
(
[tixeventid] [decimal] (10, 0) NOT NULL,
[tixeventzoneid] [int] NOT NULL,
[tixevtznpricelevelcode] [decimal] (10, 0) NOT NULL,
[tixevtznpriceleveldesc] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[tixevtznpricelevelinitdate] [datetime2] NOT NULL,
[tixevtznpricelevellastupdwhen] [datetime2] NULL,
[tixevtznpricelevellastupdwho] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixevtznpricelevelcolors] [nvarchar] (192) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixevtznpriceleveltype] [int] NULL,
[tixevtznpricelevelmodatnextlvl] [int] NOT NULL,
[tixevtznpriceleveldispord] [int] NULL,
[tixevtznpricelevelprintdesc] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_tixeventzonepricelevels] ADD CONSTRAINT [PK__Sync_tem__19364FD2EDDEA15B] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

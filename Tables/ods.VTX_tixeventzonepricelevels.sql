CREATE TABLE [ods].[VTX_tixeventzonepricelevels]
(
[tixeventid] [decimal] (10, 0) NOT NULL,
[tixeventzoneid] [int] NOT NULL,
[tixevtznpricelevelcode] [decimal] (10, 0) NOT NULL,
[tixevtznpriceleveldesc] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[tixevtznpricelevelinitdate] [datetime2] NULL,
[tixevtznpricelevellastupdwhen] [datetime2] NULL,
[tixevtznpricelevellastupdwho] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixevtznpricelevelcolors] [varchar] (192) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixevtznpriceleveltype] [int] NULL,
[tixevtznpricelevelmodatnextlvl] [int] NOT NULL,
[tixevtznpriceleveldispord] [int] NULL,
[tixevtznpricelevelprintdesc] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_tixeventzonepricelevels] ON [ods].[VTX_tixeventzonepricelevels]
GO

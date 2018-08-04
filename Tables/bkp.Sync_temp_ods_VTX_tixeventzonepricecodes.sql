CREATE TABLE [bkp].[Sync_temp_ods_VTX_tixeventzonepricecodes]
(
[tixeventid] [decimal] (10, 0) NOT NULL,
[tixeventzoneid] [int] NOT NULL,
[tixevtznpricecodecode] [decimal] (10, 0) NOT NULL,
[tixevtznpricecodedesc] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[tixevtznpricecodeinitdate] [datetime2] NOT NULL,
[tixevtznpricecodelastupdwhen] [datetime2] NULL,
[tixevtznpricecodelastupdatewho] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixevtznpricecodecolors] [nvarchar] (192) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixevtznpricecodetype] [decimal] (10, 0) NULL,
[tixevtznpricecodemodatnextlevl] [int] NOT NULL,
[tixevtznpricecodedispord] [int] NULL,
[tixeventzonepricecodetextdesc] [nvarchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixevtznpricecodeavailbegins] [datetime2] NULL,
[tixevtznpricecodeavailends] [datetime2] NULL,
[tixevtznpricecodeonsaledate] [datetime2] NULL,
[tixevtznpricecodeoffsaledate] [datetime2] NULL,
[tixevtznpricecodecoupon] [nvarchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixevtznpricecodesalesmodes] [int] NOT NULL,
[tixevtzncompseatstatuscode] [int] NULL,
[tixevtznpricecodealtprintdesc] [nvarchar] (90) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixevtznpricecodecouponid] [int] NULL,
[tixpricecodeavailableforonsale] [int] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_tixeventzonepricecodes] ADD CONSTRAINT [PK__Sync_tem__19364FD26DCF6EE4] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

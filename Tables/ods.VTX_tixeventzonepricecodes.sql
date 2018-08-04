CREATE TABLE [ods].[VTX_tixeventzonepricecodes]
(
[tixeventid] [decimal] (10, 0) NOT NULL,
[tixeventzoneid] [int] NOT NULL,
[tixevtznpricecodecode] [decimal] (10, 0) NOT NULL,
[tixevtznpricecodedesc] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[tixevtznpricecodeinitdate] [datetime2] NULL,
[tixevtznpricecodelastupdwhen] [datetime2] NULL,
[tixevtznpricecodelastupdatewho] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixevtznpricecodecolors] [varchar] (192) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixevtznpricecodetype] [decimal] (10, 0) NULL,
[tixevtznpricecodemodatnextlevl] [int] NOT NULL,
[tixevtznpricecodedispord] [int] NULL,
[tixeventzonepricecodetextdesc] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixevtznpricecodeavailbegins] [datetime2] NULL,
[tixevtznpricecodeavailends] [datetime2] NULL,
[tixevtznpricecodeonsaledate] [datetime2] NULL,
[tixevtznpricecodeoffsaledate] [datetime2] NULL,
[tixevtznpricecodecoupon] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixevtznpricecodesalesmodes] [int] NOT NULL,
[tixevtzncompseatstatuscode] [int] NULL,
[tixevtznpricecodealtprintdesc] [varchar] (90) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixevtznpricecodecouponid] [int] NULL,
[tixpricecodeavailableforonsale] [int] NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_tixeventzonepricecodes] ON [ods].[VTX_tixeventzonepricecodes]
GO

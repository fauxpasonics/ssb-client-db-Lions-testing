CREATE TABLE [ods].[VTX_producttypes]
(
[producttype] [int] NOT NULL,
[producttypedescription] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[producttypefullfillmentprocess] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[producttypeprocessoffline] [int] NOT NULL,
[producttypeinitdate] [datetime2] NULL,
[producttypelastupdatewhen] [datetime2] NULL,
[producttypelastupdatewho] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[producttypedisplayorder] [int] NULL,
[producttyperecordextensions] [varchar] (48) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[producttypeinventorymethod] [int] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_producttypes] ON [ods].[VTX_producttypes]
GO

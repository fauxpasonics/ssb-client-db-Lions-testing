CREATE TABLE [bkp].[Sync_temp_ods_VTX_producttypes]
(
[producttype] [int] NOT NULL,
[producttypedescription] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[producttypefullfillmentprocess] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[producttypeprocessoffline] [int] NOT NULL,
[producttypeinitdate] [datetime2] NULL,
[producttypelastupdatewhen] [datetime2] NULL,
[producttypelastupdatewho] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[producttypedisplayorder] [int] NULL,
[producttyperecordextensions] [nvarchar] (48) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[producttypeinventorymethod] [int] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_producttypes] ADD CONSTRAINT [PK__Sync_tem__19364FD2CF408C52] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

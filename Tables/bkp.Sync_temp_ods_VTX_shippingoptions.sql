CREATE TABLE [bkp].[Sync_temp_ods_VTX_shippingoptions]
(
[shippingoptionid] [int] NOT NULL,
[shippingoptiondescription] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[shippingoptiondisplayorder] [int] NULL,
[shippingoptioninitdate] [datetime2] NULL,
[shippingoptionlastupdwhen] [datetime2] NULL,
[shippingoptionlastupdwho] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[shippingoptionclass] [decimal] (10, 0) NOT NULL,
[shippingoptioncanshipmerch] [int] NOT NULL,
[shippingoptionvendorcode] [nvarchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[shippingoptionvendorsodesc] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[shippingoptionsprocess] [int] NULL,
[shippingoptionactive] [int] NULL,
[shippingoptioncutoffdays] [decimal] (10, 0) NULL,
[shippingoptioncutoffminutes] [decimal] (10, 0) NULL,
[shippingoptiondailycutofftime] [decimal] (10, 0) NULL,
[special_instructions] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[confirmation_text] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_shippingoptions] ADD CONSTRAINT [PK__Sync_tem__19364FD232222525] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

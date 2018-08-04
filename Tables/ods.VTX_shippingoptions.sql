CREATE TABLE [ods].[VTX_shippingoptions]
(
[shippingoptionid] [int] NOT NULL,
[shippingoptiondescription] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[shippingoptiondisplayorder] [int] NULL,
[shippingoptioninitdate] [datetime2] NULL,
[shippingoptionlastupdwhen] [datetime2] NULL,
[shippingoptionlastupdwho] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[shippingoptionclass] [decimal] (10, 0) NOT NULL,
[shippingoptioncanshipmerch] [int] NOT NULL,
[shippingoptionvendorcode] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[shippingoptionvendorsodesc] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[shippingoptionsprocess] [int] NULL,
[shippingoptionactive] [int] NULL,
[shippingoptioncutoffdays] [decimal] (10, 0) NULL,
[shippingoptioncutoffminutes] [decimal] (10, 0) NULL,
[shippingoptiondailycutofftime] [decimal] (10, 0) NULL,
[special_instructions] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[confirmation_text] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO

CREATE TABLE [ods].[VTX_tixsyspricecodes]
(
[tixsyspricecodecode] [decimal] (10, 0) NOT NULL,
[tixsyspricecodedesc] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[tixsyspricecodeinitdate] [datetime2] NULL,
[tixsyspricecodelastupdwhen] [datetime2] NULL,
[tixsyspricecodelastupdatewho] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsyspricecodecolors] [varchar] (192) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsyspricecodetype] [decimal] (10, 0) NULL,
[tixsyspricecodemodatnextlevel] [int] NOT NULL,
[tixsyspricecodetextdesc] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsyspricecodedispord] [int] NULL,
[tixsyspricecodesalesmodes] [int] NOT NULL,
[tixsyscompseatstatuscode] [int] NULL,
[tixsyspricecodealtprintdesc] [varchar] (90) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[printable] [int] NULL,
[is_comp] [int] NULL,
[tixsyspricecodepaypri] [int] NULL,
[tixsyspricecodepricingmode] [int] NULL,
[restrict_transfer] [int] NULL,
[restrict_resale] [int] NULL,
[waive_first_seller_fee] [int] NULL,
[stadis_active] [int] NULL,
[hidden_status] [int] NULL,
[restrict_transfer_to_fs] [int] NULL,
[restrictforwarding] [int] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_tixsyspricecodes] ON [ods].[VTX_tixsyspricecodes]
GO

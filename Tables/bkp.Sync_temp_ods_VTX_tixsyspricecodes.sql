CREATE TABLE [bkp].[Sync_temp_ods_VTX_tixsyspricecodes]
(
[tixsyspricecodecode] [decimal] (10, 0) NOT NULL,
[tixsyspricecodedesc] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[tixsyspricecodeinitdate] [datetime2] NOT NULL,
[tixsyspricecodelastupdwhen] [datetime2] NULL,
[tixsyspricecodelastupdatewho] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsyspricecodecolors] [nvarchar] (192) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsyspricecodetype] [decimal] (10, 0) NULL,
[tixsyspricecodemodatnextlevel] [int] NOT NULL,
[tixsyspricecodetextdesc] [nvarchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsyspricecodedispord] [int] NULL,
[tixsyspricecodesalesmodes] [int] NOT NULL,
[tixsyscompseatstatuscode] [int] NULL,
[tixsyspricecodealtprintdesc] [nvarchar] (90) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_tixsyspricecodes] ADD CONSTRAINT [PK__Sync_tem__19364FD221F111CF] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

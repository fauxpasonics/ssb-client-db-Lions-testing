CREATE TABLE [bkp].[Sync_temp_ods_VTX_paymenttranstypes]
(
[paymenttranstype] [decimal] (10, 0) NULL,
[paymenttranstypedesc] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paymenttypeprocessingmethod] [int] NULL,
[paymenttypewarnonexchange] [int] NULL,
[paymenttypefixedsystemvalue] [int] NULL,
[paymenttypeactive] [int] NULL,
[displayorder] [decimal] (10, 0) NULL,
[paymenttypevalidationpattern] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paymenttypecheckpattern] [int] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_paymenttranstypes] ADD CONSTRAINT [PK__Sync_tem__19364FD27405AC22] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

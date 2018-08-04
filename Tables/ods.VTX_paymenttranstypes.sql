CREATE TABLE [ods].[VTX_paymenttranstypes]
(
[paymenttranstype] [decimal] (10, 0) NULL,
[paymenttranstypedesc] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paymenttypeprocessingmethod] [int] NULL,
[paymenttypewarnonexchange] [int] NULL,
[paymenttypefixedsystemvalue] [int] NULL,
[paymenttypeactive] [int] NULL,
[displayorder] [decimal] (10, 0) NULL,
[paymenttypevalidationpattern] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paymenttypecheckpattern] [int] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_paymenttranstypes] ON [ods].[VTX_paymenttranstypes]
GO

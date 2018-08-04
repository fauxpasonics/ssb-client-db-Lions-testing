CREATE TABLE [ods].[VTX_tixsyspricecodetypes]
(
[tixsyspricecodetype] [decimal] (10, 0) NOT NULL,
[tixsyspricecodetypedesc] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[tixsyspricecodetypeinitdate] [datetime2] NULL,
[tixsyspricecodetypelastupdwhen] [datetime2] NULL,
[tixsyspricecodetypelastupdwho] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixsyspricecodetypedispord] [int] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_tixsyspricecodetypes] ON [ods].[VTX_tixsyspricecodetypes]
GO

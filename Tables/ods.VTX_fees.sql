CREATE TABLE [ods].[VTX_fees]
(
[id] [decimal] (20, 0) NOT NULL,
[name] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[product_id] [decimal] (20, 0) NOT NULL,
[rollup_desc] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[is_taxable] [int] NOT NULL,
[application_method] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[print_on_ticket] [int] NOT NULL,
[exp_date] [datetime2] NULL,
[client_id] [decimal] (10, 0) NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_fees] ON [ods].[VTX_fees]
GO

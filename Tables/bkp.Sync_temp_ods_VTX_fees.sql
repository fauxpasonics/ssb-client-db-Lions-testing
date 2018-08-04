CREATE TABLE [bkp].[Sync_temp_ods_VTX_fees]
(
[id] [decimal] (20, 0) NOT NULL,
[name] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[product_id] [decimal] (20, 0) NOT NULL,
[rollup_desc] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[is_taxable] [int] NOT NULL,
[application_method] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[print_on_ticket] [int] NOT NULL,
[exp_date] [datetime2] NULL,
[client_id] [decimal] (10, 0) NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_fees] ADD CONSTRAINT [PK__Sync_tem__19364FD2156CDA55] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

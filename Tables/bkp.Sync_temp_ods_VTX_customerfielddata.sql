CREATE TABLE [bkp].[Sync_temp_ods_VTX_customerfielddata]
(
[customerid] [decimal] (38, 10) NOT NULL,
[customerfieldid] [decimal] (38, 10) NOT NULL,
[stringvalue] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[datevalue] [datetime2] NULL,
[numericvalue] [decimal] (10, 0) NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_customerfielddata] ADD CONSTRAINT [PK__Sync_tem__19364FD25D752836] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

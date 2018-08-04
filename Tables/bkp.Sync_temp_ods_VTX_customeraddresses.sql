CREATE TABLE [bkp].[Sync_temp_ods_VTX_customeraddresses]
(
[addressid] [decimal] (38, 10) NOT NULL,
[shipto] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[description] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[address1] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[address2] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[city] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[state] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[zip] [nvarchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[country] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[customerid] [decimal] (38, 10) NULL,
[active] [decimal] (38, 10) NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_customeraddresses] ADD CONSTRAINT [PK__Sync_tem__19364FD2AE64D9A7] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

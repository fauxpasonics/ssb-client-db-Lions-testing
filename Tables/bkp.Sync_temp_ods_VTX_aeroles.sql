CREATE TABLE [bkp].[Sync_temp_ods_VTX_aeroles]
(
[id] [decimal] (38, 10) NOT NULL,
[description] [nvarchar] (600) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[old_id] [decimal] (38, 10) NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_aeroles] ADD CONSTRAINT [PK__Sync_tem__19364FD2D515CE41] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

CREATE TABLE [bkp].[Sync_temp_ods_VTX_offertype]
(
[offertypeid] [decimal] (20, 0) NOT NULL,
[description] [nvarchar] (765) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[typeclass] [decimal] (10, 0) NOT NULL,
[eventoutletid] [decimal] (10, 0) NULL,
[packageoutletid] [decimal] (10, 0) NULL,
[nofeesoutletid] [decimal] (10, 0) NULL,
[aetypeids] [nvarchar] (600) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_offertype] ADD CONSTRAINT [PK__Sync_tem__19364FD2702B46FA] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

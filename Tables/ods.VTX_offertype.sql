CREATE TABLE [ods].[VTX_offertype]
(
[offertypeid] [decimal] (20, 0) NOT NULL,
[description] [varchar] (765) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[typeclass] [decimal] (10, 0) NOT NULL,
[eventoutletid] [decimal] (10, 0) NULL,
[packageoutletid] [decimal] (10, 0) NULL,
[nofeesoutletid] [decimal] (10, 0) NULL,
[aetypeids] [varchar] (600) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_offertype] ON [ods].[VTX_offertype]
GO

CREATE TABLE [ods].[VTX_customeraddresses]
(
[addressid] [decimal] (38, 10) NOT NULL,
[shipto] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[description] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[address1] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[address2] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[city] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[state] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[zip] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[country] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[customerid] [decimal] (38, 10) NULL,
[active] [decimal] (38, 10) NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_customeraddresses] ON [ods].[VTX_customeraddresses]
GO

CREATE TABLE [ods].[VTX_clients]
(
[id] [decimal] (10, 0) NOT NULL,
[name] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[theme] [varchar] (90) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[auction_agency_percentage] [decimal] (10, 4) NULL,
[default_restrict_transfer] [int] NULL,
[default_restrict_resale] [int] NULL,
[default_waive_first_seller_fee] [int] NULL,
[flashseats_enabled] [int] NULL,
[default_event_owner_id] [decimal] (10, 0) NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_clients] ON [ods].[VTX_clients]
GO

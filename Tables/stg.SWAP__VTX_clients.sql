CREATE TABLE [stg].[SWAP__VTX_clients]
(
[id] [decimal] (10, 0) NOT NULL,
[name] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[theme] [nvarchar] (90) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[auction_agency_percentage] [decimal] (10, 4) NULL,
[default_restrict_transfer] [int] NULL,
[default_restrict_resale] [int] NULL,
[default_waive_first_seller_fee] [int] NULL,
[flashseats_enabled] [int] NULL,
[default_event_owner_id] [decimal] (10, 0) NULL,
[ETL_Sync_Id] [int] NOT NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_clients] ON [stg].[SWAP__VTX_clients]
GO

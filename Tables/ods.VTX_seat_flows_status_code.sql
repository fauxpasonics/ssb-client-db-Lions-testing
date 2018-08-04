CREATE TABLE [ods].[VTX_seat_flows_status_code]
(
[tixeventtitleshort] [varchar] (384) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixeventzonedesc] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[neighborhood] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[section] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[row] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seat] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[history_status] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[history_date] [datetime2] NULL,
[history_operator] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[history_order] [decimal] (20, 0) NULL,
[history_barcode] [varchar] (96) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[history_price_code] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[history_method_of_delivery] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[history_outlet] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[history_channel] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixeventid] [decimal] (10, 0) NULL,
[tixeventzoneid] [int] NULL,
[tixseatgroupid] [int] NULL,
[tixseatid] [decimal] (10, 0) NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO

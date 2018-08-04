CREATE TABLE [bkp].[Sync_temp_ods_VTX_seat_flows_status_code]
(
[tixeventtitleshort] [nvarchar] (384) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixeventzonedesc] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[neighborhood] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[section] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[row] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seat] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[history_status] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[history_date] [datetime2] NULL,
[history_operator] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[history_order] [decimal] (20, 0) NULL,
[history_barcode] [nvarchar] (96) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[history_price_code] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[history_method_of_delivery] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[history_outlet] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[history_channel] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixeventid] [decimal] (10, 0) NULL,
[tixeventzoneid] [int] NULL,
[tixseatgroupid] [int] NULL,
[tixseatid] [decimal] (10, 0) NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_seat_flows_status_code] ADD CONSTRAINT [PK__Sync_tem__19364FD244ECE8DB] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

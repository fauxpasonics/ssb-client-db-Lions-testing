CREATE TABLE [bkp].[ods__VTX_payment_distribution]
(
[id] [decimal] (18, 0) NOT NULL,
[payment_id] [decimal] (18, 0) NOT NULL,
[order_item_id] [decimal] (18, 0) NOT NULL,
[product_id] [decimal] (18, 0) NOT NULL,
[settlement_code_id] [decimal] (18, 0) NULL,
[dist_date] [datetime2] NOT NULL,
[user_id] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[outlet_id] [decimal] (10, 0) NOT NULL,
[channel_id] [decimal] (10, 0) NOT NULL,
[amount] [decimal] (19, 4) NOT NULL,
[fully_paid_qty] [decimal] (10, 0) NOT NULL,
[fully_paid_amount] [decimal] (19, 4) NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO

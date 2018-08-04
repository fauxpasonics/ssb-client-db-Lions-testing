CREATE TABLE [bkp].[Sync_temp_ods_VTX_order_items]
(
[id] [decimal] (18, 0) NOT NULL,
[order_id] [decimal] (10, 0) NOT NULL,
[sale_date] [datetime2] NOT NULL,
[sale_user] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sale_outlet] [decimal] (10, 0) NOT NULL,
[sale_channel] [decimal] (10, 0) NOT NULL,
[value] [decimal] (19, 4) NOT NULL,
[paid_amount] [decimal] (19, 4) NOT NULL,
[product_id] [decimal] (10, 0) NOT NULL,
[inventory_type] [int] NOT NULL,
[primary_product_id] [decimal] (18, 0) NULL,
[number1] [decimal] (10, 0) NULL,
[number2] [decimal] (10, 0) NULL,
[number3] [decimal] (10, 0) NULL,
[number4] [decimal] (10, 0) NULL,
[number5] [decimal] (10, 0) NULL,
[number6] [decimal] (10, 0) NULL,
[number7] [decimal] (10, 0) NULL,
[number8] [decimal] (10, 0) NULL,
[number9] [decimal] (10, 0) NULL,
[number10] [decimal] (10, 0) NULL,
[number11] [decimal] (10, 0) NULL,
[number12] [decimal] (10, 0) NULL,
[number13] [decimal] (10, 0) NULL,
[number14] [decimal] (10, 0) NULL,
[number15] [decimal] (10, 0) NULL,
[string1] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[string2] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[string3] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[string4] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[string5] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[canceled] [int] NOT NULL,
[cancel_date] [datetime2] NULL,
[cancel_user] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cancel_outlet] [decimal] (10, 0) NULL,
[cancel_channel] [decimal] (10, 0) NULL,
[offer_restriction_id] [decimal] (18, 0) NULL,
[customer_restriction_id] [decimal] (18, 0) NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_order_items] ADD CONSTRAINT [PK__Sync_tem__19364FD230F7A1FA] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
CREATE TABLE [ods].[VTX_offer_groups]
(
[id] [decimal] (20, 0) NOT NULL,
[offer_id] [decimal] (20, 0) NOT NULL,
[disp_order] [decimal] (10, 0) NOT NULL,
[name] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[description] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[same_seat_setting] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[min_qty] [decimal] (10, 0) NULL,
[max_qty] [decimal] (10, 0) NULL,
[qty_increment] [decimal] (10, 0) NULL,
[parent_group_id] [decimal] (20, 0) NULL,
[parent_qty_factor] [decimal] (10, 0) NULL,
[min_optional] [decimal] (10, 0) NULL,
[map_id] [decimal] (20, 0) NULL,
[max_optional] [decimal] (10, 0) NULL,
[seatmap_image_id] [decimal] (18, 0) NULL,
[seatmap_image_mode] [int] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE NONCLUSTERED INDEX [IDX_offer_id] ON [ods].[VTX_offer_groups] ([offer_id])
GO

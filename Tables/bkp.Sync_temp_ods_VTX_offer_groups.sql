CREATE TABLE [bkp].[Sync_temp_ods_VTX_offer_groups]
(
[id] [decimal] (20, 0) NOT NULL,
[offer_id] [decimal] (20, 0) NOT NULL,
[disp_order] [decimal] (10, 0) NOT NULL,
[name] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[same_seat_setting] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_offer_groups] ADD CONSTRAINT [PK__Sync_tem__19364FD2F73D38C9] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

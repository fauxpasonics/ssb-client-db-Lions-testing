CREATE TABLE [bkp].[Sync_temp_ods_VTX_offers]
(
[id] [decimal] (20, 0) NOT NULL,
[lookup] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[name] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[type] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[display_date] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sort_date] [datetime2] NULL,
[promotion_code] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[on_sale_date] [datetime2] NOT NULL,
[off_sale_date] [datetime2] NOT NULL,
[ae_user_id] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ae_role_id] [decimal] (20, 0) NULL,
[use_user_ssc] [int] NOT NULL,
[min_qty] [decimal] (10, 0) NULL,
[max_qty] [decimal] (10, 0) NULL,
[customer_list_id] [decimal] (20, 0) NULL,
[pref_fee_target] [decimal] (20, 0) NULL,
[published] [int] NULL,
[list_online] [int] NOT NULL,
[is_draft] [int] NOT NULL,
[image] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[client_id] [decimal] (10, 0) NULL,
[allow_public_seat_change] [int] NOT NULL,
[require_contiguous_seats] [int] NOT NULL,
[allow_empty_single_seats] [int] NOT NULL,
[additional_info1] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[additional_info2] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[customer_restriction_count] [decimal] (10, 0) NULL,
[has_account_restriction] [int] NULL,
[has_pass_code_restriction] [int] NULL,
[has_sign_in_restriction] [int] NULL,
[system_type] [int] NULL,
[timer_profile_id] [int] NULL,
[default_restrict_transfer] [int] NULL,
[default_restrict_resale] [int] NULL,
[default_waive_first_seller_fee] [int] NULL,
[osearch] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fs_redirect] [int] NULL,
[offerlabel] [int] NULL,
[version] [decimal] (18, 0) NULL,
[tags] [nvarchar] (1500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[offer_image_id] [decimal] (18, 0) NULL,
[mobile_image_id] [decimal] (18, 0) NULL,
[allow_additional_donation_ots] [int] NULL,
[mmc_enabled] [int] NULL,
[queueit_enabled] [int] NULL,
[purchase_flow_type] [decimal] (20, 0) NULL,
[mmc_map_id] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_offers] ADD CONSTRAINT [PK__Sync_tem__19364FD2318E79A9] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

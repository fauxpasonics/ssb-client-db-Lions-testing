CREATE TABLE [zzz].[TM_journal_payments_20180131]
(
[acct_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[stamp] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[type_desc_short] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[amount] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cc_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[payment_type_desc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cc_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cc_exp] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[approval_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cc_reference] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cc_addr] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cc_zip] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cc_avs_resp] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cc_avs_resp_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[batch_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[item_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[item_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[item_type_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[item_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[info] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[order_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[order_line_item] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[order_line_item_seq] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[price_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_color] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[section_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[row_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[section_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[row_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seat_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[num_seats] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[last_seat] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seat_increment] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name_last_first_mi] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dept_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[encrypt_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[owner_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[owner_name_full] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceFileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LoadDate] [datetime] NULL
)
GO
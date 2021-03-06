CREATE TABLE [zzz].[TM_ticket_secondary_20180131]
(
[ticket_status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[inet_status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[how_rcvd] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[resold_ind] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[event_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[section_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[row_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seat_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[num_seats] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[last_seat] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seat_increment] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[season_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[event_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[section_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[row_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[event_sort] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[section_sort] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[row_sort] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[total_events] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[team] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[event_date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[event_time] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[print_row_and_seat] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[print_section_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[plan_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[orig_price_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[price_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[price_code_desc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_color] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[price_code_group] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pricing_method] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[full_price] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[purchase_price] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[printed_price] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[block_full_price] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[block_purchase_price] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paid_amount] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[printed] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[comp_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[comp_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[consignment] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[group_flag] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[aisle] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sales_source_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sales_source_date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sales_source_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paid] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[plan_event_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[plan_event_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[row_barcode_index] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tm_section_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tm_row_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tm_event_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[delivery_method] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[barcode_event_slot_min] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seat_code_low] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seat_code_high] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[access_control_system_ip] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[access_control_system_port] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[barcode_season_key] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[returnable] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dsps_allowed] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[barcode_status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[assoc_acct_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ticket_type_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ticket_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ticket_type_category] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[expanded] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[inet_fraud_score_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[im_mode] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[digit_server_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[entitlements] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[card_printing_enabled] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[card_template_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_name_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name_last] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_name_full] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[attn_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[full_name_1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[full_name_2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[city] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[state] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[country] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[zip] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pid_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pid_number] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pid_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ticket_acct_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[inet_cc_seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[inet_delivery_method] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ticket_seq_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[secondary_seq_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[prev_secondary_seq_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[add_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[add_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[status_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[how_rcvd_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[delivery_method_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[inet_delivery_method_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ledger_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ledger_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[merchant_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[merchant_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[merchant_color] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[forced_wc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_type_desc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_rep_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_rep_full_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_rep_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[print_ticket_ind] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[row_name_right] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[section_name_right] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[owner_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[owner_name_full] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[attn_name_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[attn_owner_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[attn_owner_name_full] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[attn_company_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceFileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LoadDate] [datetime] NULL
)
GO

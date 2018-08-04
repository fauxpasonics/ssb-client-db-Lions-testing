SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [etl].[vw_Load_tc_VTX_order_items] AS (
	SELECT CAST('etl.vw_TM_Ticket_SCD' AS NVARCHAR(255)) ETL__Source,
		id, order_id, sale_date, sale_user, sale_outlet, sale_channel, value, paid_amount, product_id, inventory_type, primary_product_id, number1, number2,
		number3, number4, number5, number6, number7, number8, number9, number10, number11, number12, number13, number14, number15, string1, string2, string3,
		string4, string5, canceled, cancel_date, cancel_user, cancel_outlet, cancel_channel, offer_restriction_id, customer_restriction_id
		
	FROM ods.VTX_order_items (NOLOCK)
	WHERE ETL_Sync_UpdatedDate > GETDATE() - 3
	
)



GO

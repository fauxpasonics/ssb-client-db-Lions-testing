SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [etl].[Load_TC_Veritix]

AS
BEGIN

	EXEC [etl].[SSB_StandardMerge_TC] @BatchId = '00000000-0000-0000-0000-000000000000', @Target = 'tc.VTX_order_items', @Source = 'etl.vw_Load_tc_VTX_order_items', @BusinessKey = 'id'
	, @Options = '<options><Debug>false</Debug></options>'


	EXEC [etl].[SSB_StandardMerge_TC] @BatchId = '00000000-0000-0000-0000-000000000000', @Target = 'tc.VTX_aecustomerrelation', @Source = 'etl.vw_Load_tc_VTX_aecustomerrelation', @BusinessKey = 'customerid, aeroleid, userid'
	, @Options = '<options><Debug>false</Debug></options>'


	EXEC [etl].[SSB_StandardMerge_TC] @BatchId = '00000000-0000-0000-0000-000000000000', @Target = 'tc.VTX_ordergroups', @Source = 'etl.vw_Load_tc_VTX_ordergroups', @BusinessKey = 'ordergroup'
	, @Options = '<options><Debug>false</Debug></options>'


END

GO

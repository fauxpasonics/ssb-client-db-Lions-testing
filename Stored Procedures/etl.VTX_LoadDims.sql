SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [etl].[VTX_LoadDims]
(
	@BatchId UNIQUEIDENTIFIER = '00000000-0000-0000-0000-000000000000',
	@Options NVARCHAR(MAX) = NULL
)

AS
BEGIN


/*
DimArena
*/
EXEC [etl].[SSB_ProcessStandardMerge_SCD] @BatchId, 'dbo.DimArena', 'etl.vw_Load_DimArena', 'ETL__SSID_establishmentkey', @Options


/*
DimEvent
*/
EXEC [etl].[SSB_ProcessStandardMerge_SCD] @BatchId, 'dbo.DimEvent', 'etl.vw_Load_DimEvent', 'ETL__SSID_tixeventid', @Options

/*
DimPlan
*/
EXEC [etl].[SSB_ProcessStandardMerge_SCD] @BatchId, 'dbo.DimPlan', 'etl.vw_Load_DimPlan', 'ETL__SSID_tixsyspricecodecode', @Options

/*
DimItem
*/
EXEC [etl].[SSB_ProcessStandardMerge_SCD] @BatchId, 'dbo.DimItem', 'etl.vw_Load_DimItem', 'ETL__SSID_id', @Options

/*
DimPriceCode
*/
EXEC [etl].[SSB_ProcessStandardMerge_SCD] @BatchId, 'dbo.DimPriceCode', 'etl.vw_Load_DimPriceCode', 'ETL__SSID_tixsyspricecodecode', @Options

/*
DimPriceLevel
*/
EXEC [etl].[SSB_ProcessStandardMerge_SCD] @BatchId, 'dbo.DimPriceLevel', 'etl.vw_Load_DimPriceLevel', 'ETL__SSID_tixeventid, ETL__SSID_tixeventzoneid, ETL__SSID_tixevtznpricelevelcode', @Options

/*
DimPriceType
*/
EXEC [etl].[SSB_ProcessStandardMerge_SCD] @BatchId, 'dbo.DimPriceType', 'etl.vw_Load_DimPriceType', 'ETL__SSID_tixsyspricecodetype', @Options

/*
DimPromo
*/
--EXEC [etl].[SSB_ProcessStandardMerge_SCD] @BatchId, 'dbo.DimPromo', 'etl.vw_Load_DimPromo', '', @Options

/*
DimRep
*/
EXEC [etl].[SSB_ProcessStandardMerge_SCD] @BatchId, 'dbo.DimRep', 'etl.vw_Load_DimRep', 'ETL__SSID_userid', @Options

/*
DimSalesCode
*/
--EXEC [etl].[SSB_ProcessStandardMerge_SCD] @BatchId, 'dbo.DimSalesCode', 'etl.vw_Load_DimSalesCode', 'ETL__SSID_SALECODE', @Options

/*
DimSeat
*/
EXEC [etl].[SSB_ProcessStandardMerge_SCD] @BatchId, 'dbo.DimSeat', 'etl.vw_Load_DimSeat', 'ETL__SSID_venueestablishmentkey, ETL__SSID_SECTION, ETL__SSID_ROW, ETL__SSID_VtxSeat', NULL

/*
DimSeatStatus
*/
EXEC [etl].[SSB_ProcessStandardMerge_SCD] @BatchId, 'dbo.DimSeatStatus', 'etl.vw_Load_DimSeatStatus', 'ETL__SSID_tixsysseatstatuscode', @Options


/*
DimTicketCustomer
*/
EXEC [etl].[SSB_ProcessStandardMerge_SCD] @BatchId, 'dbo.DimTicketCustomer', 'etl.vw_Load_DimTicketCustomer', 'ETL__SSID_id', @Options

/*
DimEventZone
*/
EXEC [etl].[SSB_ProcessStandardMerge_SCD] @BatchId, 'dbo.DimEventZone', 'etl.vw_Load_DimEventZone', 'ETL__SSID_tixeventid, ETL__SSID_tixeventzoneid', @Options

/*
DimEventZone
*/
EXEC [etl].[SSB_ProcessStandardMerge_SCD] @BatchId, 'dbo.DimOffer', 'etl.vw_Load_DimOffer', 'ETL__SSID_id', @Options


/*
DimSaleOutlet
*/
--EXEC [etl].[SSB_ProcessStandardMerge_SCD] @BatchId, 'dbo.DimSaleOutlet', 'etl.vw_Load_DimSaleOutlet', 'ETL__SSID_id', @Options


END






GO

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO













CREATE PROCEDURE [api].[CRM_Primary_Ticketing_Transactions]
    (
      @SSB_CRMSYSTEM_ACCT_ID VARCHAR(50) = 'Test'
	, @SSB_CRMSYSTEM_CONTACT_ID VARCHAR(50) = 'Test'
    , @RowsPerPage INT = 500
    , @PageNumber INT = 0 
    )
AS
    BEGIN

--DECLARE   @SSB_CRMSYSTEM_ACCT_ID VARCHAR(50)	= 'Test'
		--, @SSB_CRMSYSTEM_CONTACT_ID VARCHAR(50) = '95D38840-214B-4672-84BA-D30D9BB5FD1C'
		--, @RowsPerPage INT = 500
		--, @PageNumber INT = 0 

-- =========================================
-- Initial Variables for API
-- =========================================

DECLARE @totalCount INT
  , @xmlDataNode XML
  , @recordsInResponse INT
  , @remainingCount INT
  , @rootNodeName NVARCHAR(100)
  , @responseInfoNode NVARCHAR(MAX)
  , @finalXml XML;

-- ==========================
-- DimCustomerIDs
-- ==========================

DECLARE @DimCustomerIds TABLE ( Dimcustomerid INT, AccountID INT );

IF ( @SSB_CRMSYSTEM_ACCT_ID NOT IN ( 'None', 'Test' ) )
    BEGIN
        INSERT  INTO @DimCustomerIds
		SELECT dtc.DimTicketCustomerId, dc.AccountId
		FROM dbo.dimcustomerssbid ssbid
			JOIN dbo.DimCustomer dc ON dc.DimCustomerId = ssbid.DimCustomerId
			JOIN dbo.DimTicketCustomer dtc ON dc.SSID=REPLACE(dtc.ETL__SSID,'.0000000000','')
		WHERE SSB_CRMSYSTEM_ACCT_ID = @SSB_CRMSYSTEM_ACCT_ID
			  AND ssbid.SourceSystem = 'veritix'
    END;

IF ( @SSB_CRMSYSTEM_CONTACT_ID NOT IN ( 'None', 'Test' ) )
    BEGIN
        INSERT  INTO @DimCustomerIds
		SELECT dtc.DimTicketCustomerId, dc.AccountId
		FROM dbo.dimcustomerssbid ssbid
			JOIN dbo.DimCustomer dc ON dc.DimCustomerId = ssbid.DimCustomerId
			JOIN dbo.DimTicketCustomer dtc ON dc.SSID=REPLACE(dtc.ETL__SSID,'.0000000000','')
		WHERE SSB_CRMSYSTEM_CONTACT_ID = @SSB_CRMSYSTEM_CONTACT_ID
			  AND ssbid.SourceSystem = 'veritix'
    END;

-- =========================================
-- Base Table Set
-- =========================================

DECLARE @baseData TABLE
    (
      Team NVARCHAR(255)
	, Account NVARCHAR(255)
    , SeasonName NVARCHAR(255)
    , OrderNumber NVARCHAR(255)
    , OrderLine NVARCHAR(255)
    , OrderDate DATE
    , Item NVARCHAR(255)
    , ItemName NVARCHAR(255)
	, EventDate NVARCHAR(255)
    , PriceCode NVARCHAR(255)
    , IsComp BIT
    , PromoCode NVARCHAR(255)
    , Qty INT
	, SectionName NVARCHAR(255)
    , RowName NVARCHAR(255)
	, SeatBlock	 NVARCHAR(255)
    , Total DECIMAL(18, 6)
	, SeatPrice DECIMAL(18, 6)
    , AmountOwed DECIMAL(18, 6)
    , AmountPaid DECIMAL(18, 6)
	, SalesRep NVARCHAR(255)
    );

-- =========================================
-- Procedure
-- =========================================

INSERT INTO @baseData 

SELECT 'Lions' AS Team
		, dc.AccountID
		, ds.SeasonName
		, fts.OrderNum AS OrderNumber
		, fts.ETL__SSID_id AS OrderLine
		, dd.CalDate AS OrderDate
		, di.ItemCode AS Item
		, di.ItemName
		, de.EventDate
		, dpc.PriceCodeDesc PriceCode
		, fts.IsComp
		, Dimoffer.OfferName AS PromoCode				--DOESN'T CURRENTLY EXIST
		, fts.QtySeat Qty
		, seat.SectionName
		, seat.RowName
		, seat AS SeatBlock
		, fts.TotalRevenue AS Total
		, fts.TotalRevenue AS SeatPrice
		, fts.TotalRevenue - fts.PaidAmount AS AmountOwed
		, fts.PaidAmount AmountPaid
		, dr.FullName AS SalesRep			--DOES THIS EXIST?
FROM    dbo.FactTicketSales AS fts
		JOIN dbo.DimSeason AS ds ON ds.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimItem AS di ON di.DimItemId = fts.DimItemId
		JOIN dbo.DimPriceCode AS dpc ON dpc.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimTicketClass AS dtc ON dtc.DimTicketClassId = fts.DimTicketTypeId
		JOIN dbo.DimTicketType AS dtt ON fts.DimTicketTypeId = dtt.DimTicketTypeId
		JOIN dbo.DimPlan AS dp ON dp.DimPlanId = fts.DimPlanId
		JOIN dbo.DimDate AS dd ON dd.DimDateId = fts.DimDateId
		JOIN dbo.DimEvent AS de ON de.DimEventId = fts.DimEventId
		LEFT JOIN dbo.DimOffer AS Dimoffer ON Dimoffer.DimOfferId = fts.DimOfferId	--NOT CURRENTLY POPULATED
		JOIN dbo.DimSeat AS seat ON seat.DimSeatId = fts.DimSeatId_Start
		JOIN @DimCustomerIds dc ON dc.Dimcustomerid = fts.DimTicketCustomerId
		JOIN dbo.DimRep dr ON dr.DimRepId = fts.DimRepId
ORDER BY OrderDate DESC
      , OrderNumber
      OFFSET ( @PageNumber ) * @RowsPerPage ROWS

FETCH NEXT @RowsPerPage ROWS ONLY;

-- =========================================
-- API Pagination
-- =========================================
-- Cap returned results at 1000

IF @RowsPerPage > 1000
    BEGIN

        SET @RowsPerPage = 1000;

    END;

-- Pull total count

SELECT  @totalCount = COUNT(*)
FROM    @baseData AS c;

-- =========================================
-- API Loading
-- =========================================


        SELECT  @recordsInResponse = COUNT(*)
        FROM    @baseData;
-- Create XML response data node

        SET @xmlDataNode = (
                             SELECT ISNULL(Team, '') AS Team                               
                                  , ISNULL(SeasonName,'') AS SeasonName
                                  , ISNULL(OrderNumber,'') AS OrderNumber
                                  , ISNULL(OrderLine,'') AS OrderLine
                                  , ISNULL(Account,'') AS Account
                                  , ISNULL(OrderDate,'') AS OrderDate
                                  , ISNULL(Item,'') AS Item
                                  , ISNULL(ItemName,'') AS ItemName
								  , ISNULL(EventDate,'') AS EventDate                                 
                                  , ISNULL(IsComp,0) AS IsComp                                
                                  , ISNULL(PromoCode,'') AS PromoCode
                                  , ISNULL(Qty,0) AS Qty
                                  , ISNULL(SeatPrice,0) AS SeatPrice
                                  , ISNULL(Total,0) AS Total
								  , ISNULL(SectionName,0) AS SectionName
								  , ISNULL(RowName,0) AS RowName
                                  , ISNULL(SeatBlock,'') AS SeatBlock
								  , ISNULL(SalesRep,'') AS SalesRep
                             FROM   @baseData
                           FOR
                             XML PATH('Parent')
                               , ROOT('Parents')
                           );

        SET @rootNodeName = 'Parents';

		-- Calculate remaining count

        SET @remainingCount = @totalCount - ( @RowsPerPage * ( @PageNumber + 1 ) );

        IF @remainingCount < 0
            BEGIN

                SET @remainingCount = 0;

            END;

			-- Create response info node

        SET @responseInfoNode = ( '<ResponseInfo>' + '<TotalCount>'
                                  + CAST(@totalCount AS NVARCHAR(20))
                                  + '</TotalCount>' + '<RemainingCount>'
                                  + CAST(@remainingCount AS NVARCHAR(20))
                                  + '</RemainingCount>'
                                  + '<RecordsInResponse>'
                                  + CAST(@recordsInResponse AS NVARCHAR(20))
                                  + '</RecordsInResponse>'
                                  + '<PagedResponse>true</PagedResponse>'
                                  + '<RowsPerPage>'
                                  + CAST(@RowsPerPage AS NVARCHAR(20))
                                  + '</RowsPerPage>' + '<PageNumber>'
                                  + CAST(@PageNumber AS NVARCHAR(20))
                                  + '</PageNumber>' + '<RootNodeName>'
                                  + @rootNodeName + '</RootNodeName>'
                                  + '</ResponseInfo>' );
    END;

-- Wrap response info and data, then return    

    IF @xmlDataNode IS NULL
        BEGIN

            SET @xmlDataNode = '<' + @rootNodeName + ' />';

        END;

    SET @finalXml = '<Root>' + @responseInfoNode
        + CAST(@xmlDataNode AS NVARCHAR(MAX)) + '</Root>';

    SELECT  CAST(@finalXml AS XML);









GO

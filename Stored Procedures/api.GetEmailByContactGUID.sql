SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


--exec api.getemailbycontactguid @ssb_crmsystem_acct_id = '4CCC01DC-9736-4E38-87A7-2F9148A3FD65'

CREATE PROCEDURE [api].[GetEmailByContactGUID]
    (
      @SSB_CRMSYSTEM_CONTACT_ID VARCHAR(50) = 'Test'
	, @SSB_CRMSYSTEM_ACCT_ID VARCHAR(50) = 'Test'
    , @RowsPerPage INT = 500
    , --APIification
      @PageNumber INT = 0 --APIification
    )
AS
    BEGIN

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

-- =========================================
-- GUID Table for GUIDS
-- =========================================
DECLARE @GUIDTable TABLE ( GUID VARCHAR(50) );

IF ( @SSB_CRMSYSTEM_ACCT_ID NOT IN ( 'None', 'Test' ) )
    BEGIN
        INSERT  INTO @GUIDTable
                ( GUID
                )
                SELECT DISTINCT
                        z.SSB_CRMSYSTEM_CONTACT_ID
                FROM    dbo.vwDimCustomer_ModAcctId z
                WHERE   z.SSB_CRMSYSTEM_ACCT_ID = @SSB_CRMSYSTEM_ACCT_ID;
    END;

IF ( @SSB_CRMSYSTEM_CONTACT_ID NOT IN ( 'None', 'Test' ) )
    BEGIN
        INSERT  INTO @GUIDTable
                ( GUID
                )
                SELECT  @SSB_CRMSYSTEM_CONTACT_ID;
    END;

-- =========================================
-- Base Table Set
-- =========================================


        DECLARE @baseData TABLE
            (
				[MemberID] [NVARCHAR](100),
				[EmailAddress] [NVARCHAR](255),
				[MailingID] [NVARCHAR](100),
				[MailingName] [NVARCHAR](255),
				[PublicWebviewURL] [NVARCHAR](500),
				[DeliveryResult] [NVARCHAR](100),
				[DeliveryCount] [INT],
				[MinDeliveryTime] [DATETIME],
				[OpenCount] [INT],
				[MinOpenTime] [DATETIME],
				[ClickCount] [INT],
				[MinClickTime] [DATETIME],
				[Bounces] [INT],
				[Spam] [INT] ,
				[Unsubscribes] [INT],
				[UnsubscribeDate] [DATETIME]
            );

-- =========================================
-- Procedure
-- =========================================


SELECT DISTINCT
        MemberID
      , EmailAddress
	  , MailingID
	  , MailingName
	  , PublicWebviewURL
	  , DeliveryResult
	  , DeliveryCount
	  , MinDeliveryTime
	  , OpenCount
	  , MinOpenTime
	  , ClickCount
	  , MinClickTime
	  , Bounces
	  , Spam
	  , Unsubscribes
	  , UnsubscribeDate
INTO #Emails
--SELECT *
FROM    etl.CDI_EmailSummary_MSCRM
WHERE   SSB_CRMSYSTEM_CONTACT_ID IN (SELECT GUID FROM @GUIDTable);



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
        FROM    #Emails AS c;

-- =========================================
-- API Loading
-- =========================================

-- Load base data

        INSERT  INTO @baseData
                SELECT  *
                FROM    #Emails AS c
                ORDER BY c.MinDeliveryTime DESC
                      , c.MailingID
                      OFFSET ( @PageNumber ) * @RowsPerPage ROWS

FETCH NEXT @RowsPerPage ROWS ONLY;

-- Set records in response

        SELECT  @recordsInResponse = COUNT(*)
        FROM    @baseData;
-- Create XML response data node

        SET @xmlDataNode = (
                             SELECT ISNULL(MemberID, '') AS MemberID
                                  , ISNULL(EmailAddress,'') AS EmailAddress
                                  , ISNULL(MailingID,'') AS MailingID
                                  , ISNULL(MailingName,'') AS MailingName
                                  , ISNULL(PublicWebviewURL,'') AS PublicWebviewURL
                                  , ISNULL(DeliveryResult,'') AS DeliveryResult
                                  , ISNULL(DeliveryCount,'') AS DeliveryCount
                                  , ISNULL(MinDeliveryTime,'') AS MinDeliveryTime
								  , ISNULL(OpenCount,'') AS OpenCount                                 
                                  , ISNULL(MinOpenTime,0) AS MinOpenTime                               
                                  , ISNULL(ClickCount,'') AS ClickCount
                                  , ISNULL(MinClickTime,0) AS MinClickTime
								  , ISNULL(Bounces,0) AS Bounces
								  , ISNULL(Spam,0) AS Spam
								  , ISNULL(Unsubscribes,0) AS Unsubscribes
								  , ISNULL(UnsubscribeDate,'') AS UnsubscribeDate
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

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO











--EXEC [api].[CRM_Attendance] @SSB_CRMSYSTEM_ACCT_ID = 'BA6CE8C5-56A7-4306-AB8E-0087FDF7C14F'
--EXEC [api].[CRM_Attendance] @SSB_CRMSYSTEM_CONTACT_ID = 'F7FC148D-3EC3-49EF-8BA8-96AA05F0760F'

CREATE PROCEDURE [api].[CRM_Attendance]
    @SSB_CRMSYSTEM_ACCT_ID VARCHAR(50) = 'Test' ,
    @SSB_CRMSYSTEM_CONTACT_ID VARCHAR(50) = 'Test' ,
    @DisplayTable INT = 0 ,
    @RowsPerPage INT = 500 ,
    @PageNumber INT = 0
AS
    BEGIN


-- =========================
-- Init vars needed for API
-- =========================

        DECLARE @totalCount INT ,
            @xmlDataNode XML ,
            @recordsInResponse INT ,
            @remainingCount INT ,
            @rootNodeName NVARCHAR(100) ,
            @responseInfoNode NVARCHAR(MAX) ,
            @finalXml XML;

        PRINT 'Acct-' + @SSB_CRMSYSTEM_ACCT_ID;
        PRINT 'Contact-' + @SSB_CRMSYSTEM_CONTACT_ID;

-- ==========================
-- DimCustomerIDs
-- ==========================

        DECLARE @DimCustomerIds TABLE ( Dimcustomerid INT );

        IF ( @SSB_CRMSYSTEM_ACCT_ID NOT IN ( 'None', 'Test' ) )
            BEGIN
                INSERT  INTO @DimCustomerIds
				SELECT dtc.DimTicketCustomerId
				FROM dbo.dimcustomerssbid dc
				JOIN dbo.DimTicketCustomer dtc ON dc.SSID=REPLACE(dtc.ETL__SSID,'.0000000000','')
												AND dc.SourceSystem='Veritix'
				WHERE SSB_CRMSYSTEM_ACCT_ID = @SSB_CRMSYSTEM_ACCT_ID
            END;

        IF ( @SSB_CRMSYSTEM_CONTACT_ID NOT IN ( 'None', 'Test' ) )
            BEGIN
                INSERT  INTO @DimCustomerIds
				SELECT dtc.DimTicketCustomerId
				FROM dbo.dimcustomerssbid dc
				JOIN dbo.DimTicketCustomer dtc ON dc.SSID=REPLACE(dtc.ETL__SSID,'.0000000000','')
												AND dc.SourceSystem='Veritix'
				WHERE SSB_CRMSYSTEM_CONTACT_ID = @SSB_CRMSYSTEM_CONTACT_ID
            END;

-- =========================================
-- API Pagination
-- =========================================
-- Cap returned results at 1000

        IF @RowsPerPage > 1000
            BEGIN

                SET @RowsPerPage = 1000;

            END;

-- ============================
-- Base Table Set
-- ============================

        DECLARE @baseData TABLE
            (
              Season_Name NVARCHAR(255) ,
              Event_Code NVARCHAR(255) ,
              Event_Name NVARCHAR(255) ,
              Event_Date DATE ,
              Event_Time TIME ,
              Section_Name NVARCHAR(50) ,
              Row_Name NVARCHAR(50) ,
              Seat NVARCHAR(50) ,
              Scan_Time TIME ,
              Game_Scan_Time_Difference NVARCHAR(255) ,
              Scan_Gate NVARCHAR(255) ,
              IsAttended BIT
            );

-- =========================================
-- API Loading
-- =========================================

-- Load base data

INSERT  INTO @baseData
        ( Season_Name 
         ,Event_Code 
         ,Event_Name 
         ,Event_Date 
         ,Event_Time 
         ,Section_Name 
         ,Row_Name 
         ,Seat 
         ,Scan_Time 
         ,Game_Scan_Time_Difference 
         ,Scan_Gate 
         ,IsAttended
        )


SELECT Season_Name
	  ,Event_Code  
	  ,Event_Name  
	  ,Event_Date  
	  ,Event_Time  
	  ,Section_Name
	  ,Row_Name    
	  ,Seat
	  ,Scan_Time   
	  ,CASE WHEN x.IsAttended = 0 THEN NULL
			ELSE CASE WHEN x.Game_Scan_Time_Difference = 0 THEN 'On Time'
					  ELSE CONCAT(ABS(x.Game_Scan_Time_Difference)
								 ,CASE WHEN ABS(x.Game_Scan_Time_Difference) = 1 THEN ' Minute'
									   ELSE ' Minutes'
								  END 
								 ,CASE WHEN x.Game_Scan_Time_Difference < 0 THEN ' Early'
									   ELSE ' Late'
								  END
								  )
					  END
	  END Game_Scan_Time_Difference
	  ,x.Scan_Gate
	  ,x.IsAttended
FROM (
		SELECT ds.SeasonName												AS Season_Name
			  ,de.EventCode													AS Event_Code         
			  ,de.EventName													AS Event_Name         
			  ,de.EventDate													AS Event_Date         
			  ,de.EventTime													AS Event_Time         
			  ,seat.SectionName												AS Section_Name         
			  ,seat.RowName													AS Row_Name         
			  ,seat															AS Seat
			  ,CAST(fa.ScanDateTime AS TIME)								AS Scan_Time         
			  ,DATEDIFF(MINUTE,de.EventTime,CAST(fa.ScanDateTime AS TIME))	AS Game_Scan_Time_Difference
			  ,NULL															AS Scan_Gate --**THIS WILL NEED ADDED IF MODEL LATER ACCOMODATES IT!!**
			  ,CASE WHEN fa.FactAttendanceId IS NULL THEN 0 ELSE 1 END AS IsAttended
		FROM dbo.FactTicketSales fts
			JOIN @DimCustomerIds dc ON dc.dimcustomerid = fts.DimTicketCustomerId
			JOIN dbo.DimEvent de ON de.DimEventId = fts.DimEventId
			JOIN dbo.DimSeason ds ON ds.DimSeasonId = fts.DimSeasonId
			JOIN dbo.DimSeat seat ON seat.DimSeatId = fts.DimSeatId_Start
			JOIN dbo.FactInventory fi ON fts.FactTicketSalesId = fi.FactTicketSalesId
			LEFT JOIN dbo.FactAttendance fa ON fa.FactAttendanceId = fi.FactAttendanceId
	  )x
ORDER BY Event_Date 
        ,Row_Name ASC
        ,Seat ASC

        OFFSET ( @PageNumber ) * @RowsPerPage ROWS

FETCH NEXT @RowsPerPage ROWS ONLY;

-- DROP TABLE #tmpParent

-- Pull counts
        SELECT  @recordsInResponse = COUNT(*)
        FROM    @baseData;


        SET @xmlDataNode = ( SELECT p.Season_Name ,
                                    p.Event_Code ,
                                    p.Event_Name ,
                                    p.Event_Date ,
                                    p.Event_Time ,
                                    p.Section_Name ,
                                    p.Row_Name ,
                                    p.Seat ,
                                    p.Scan_Time ,
                                    p.Game_Scan_Time_Difference ,
                                    p.Scan_Gate ,
                                    p.IsAttended
                             FROM   @baseData p
                             ORDER BY p.Season_Name DESC
                           FOR
                             XML PATH('Parent') ,
                                 ROOT('Parents')
                           );

        SET @rootNodeName = 'Parents';

-- Pull total count

        SELECT  @totalCount = COUNT(*)
        FROM    @baseData AS c;

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

        PRINT @responseInfoNode;
	
-- Wrap response info and data, then return	
        IF @xmlDataNode IS NULL
            BEGIN
                SET @xmlDataNode = '<' + @rootNodeName + ' />'; 
            END;
		
        SET @finalXml = '<Root>' + @responseInfoNode
            + CAST(@xmlDataNode AS NVARCHAR(MAX)) + '</Root>';

        --IF @DisplayTable = 1
        --    SELECT  *
        --    FROM    #tmpbase;

        --IF @DisplayTable = 0
            SELECT  CAST(@finalXml AS XML);

       
    END;
























GO

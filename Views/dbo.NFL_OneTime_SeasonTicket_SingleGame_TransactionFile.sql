SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[NFL_OneTime_SeasonTicket_SingleGame_TransactionFile]
AS 
SELECT CASE
           WHEN DB_NAME() = 'Bears' THEN
               'BE'
           WHEN DB_NAME() = 'Broncos' THEN
               'BO'
           WHEN DB_NAME() = 'Buccaneers' THEN
               'BC'
           WHEN DB_NAME() = 'Chargers' THEN
               'CH'
           WHEN DB_NAME() = 'Chiefs' THEN
               'CF'
           WHEN DB_NAME() = 'Colts' THEN
               'CT'
           WHEN DB_NAME() = 'Cowboys' THEN
               'CB'
           WHEN DB_NAME() = 'Dolphins' THEN
               'DO'
           WHEN DB_NAME() = 'Falcons' THEN
               'FA'
           WHEN DB_NAME() = 'Jaguars' THEN
               'JA'
           WHEN DB_NAME() = 'Jets' THEN
               'JE'
           WHEN DB_NAME() = 'Lions' THEN
               'LI'
           WHEN DB_NAME() = 'Panthers' THEN
               'CP'
           WHEN DB_NAME() = 'Raiders' THEN
               'RA'
           WHEN DB_NAME() = 'Rams' THEN
               'RM'
           WHEN DB_NAME() = 'Redskins' THEN
               'RS'
           WHEN DB_NAME() = 'Saints' THEN
               'SA'
           WHEN DB_NAME() = 'Seahawks' THEN
               'SE'
           WHEN DB_NAME() = 'Steelers' THEN
               'ST'
           WHEN DB_NAME() = 'Titans' THEN
               'TT'
           WHEN DB_NAME() = 'Vikings' THEN
               'VI'
           ELSE
               '??'
       END AS nfl_team_code,
       CAST(dc.AccountId AS NVARCHAR(25)) + ':' + CAST(fts.ETL__SSID_tixeventid AS NVARCHAR(25)) + ':' + CAST(fts.ETL__SSID_tixeventzoneid AS NVARCHAR(25)) + ':'
       + CAST(fts.ETL__SSID_seatgroupid AS NVARCHAR(25)) + ':' + CAST(fts.ETL__SSID_seatid AS NVARCHAR(25)) + ':' + CAST(fts.QtySeat AS NVARCHAR(25)) AS ticket_orders_id,
       dc.AccountId AS ticket_customers_id,
	   DB_NAME() AS Club,
	   de.EventName AS Opponent,
	   dd.CalDate AS DateStamp,
	   ds.SeasonYear AS Season,
	CASE WHEN fts.DimTicketTypeId IN (1,5,12)  THEN 1
        ELSE
            0
    END AS SeasonTicketFlag, -- Update Season Ticket Holder Logic for your team here
    CASE
       WHEN fts.DimTicketTypeId NOT IN (1,5,12) THEN 
            1
        ELSE
            0
    END  AS SingleGameFlag, -- Update Single Game Buyer Logic for your team here
	   fts.QtySeat,
	   fts.TotalRevenue
FROM dbo.FactTicketSales fts (NOLOCK)
JOIN dbo.DimTicketCustomer dtc ON dtc.DimTicketCustomerId= fts.DimTicketCustomerId
JOIN dbo.DimCustomer dc ON dc.SSID = LEFT(dtc.ETL__SSID,CHARINDEX('.', dtc.ETL__SSID)-1)
JOIN dbo.DimDate dd ON dd.DimDateId = fts.DimDateId
JOIN dbo.DimSeason ds ON fts.DimSeasonId = ds.DimSeasonId
JOIN dbo.DimPlan dp ON dp.DimPlanId = fts.DimPlanId
JOIN  dbo.DimEvent de ON de.DimEventId = fts.DimEventId
JOIN dbo.DimPriceCode dpc ON dpc.DimPriceCodeId = fts.DimPriceCodeId
WHERE ds.SeasonName LIKE 'Lions%'
AND fts.DimTicketTypeId NOT in (13,14,15) -- Update Season Logic here
UNION 
SELECT CASE
           WHEN DB_NAME() = 'Bears' THEN
               'BE'
           WHEN DB_NAME() = 'Broncos' THEN
               'BO'
           WHEN DB_NAME() = 'Buccaneers' THEN
               'BC'
           WHEN DB_NAME() = 'Chargers' THEN
               'CH'
           WHEN DB_NAME() = 'Chiefs' THEN
               'CF'
           WHEN DB_NAME() = 'Colts' THEN
               'CT'
           WHEN DB_NAME() = 'Cowboys' THEN
               'CB'
           WHEN DB_NAME() = 'Dolphins' THEN
               'DO'
           WHEN DB_NAME() = 'Falcons' THEN
               'FA'
           WHEN DB_NAME() = 'Jaguars' THEN
               'JA'
           WHEN DB_NAME() = 'Jets' THEN
               'JE'
           WHEN DB_NAME() = 'Lions' THEN
               'LI'
           WHEN DB_NAME() = 'Panthers' THEN
               'CP'
           WHEN DB_NAME() = 'Raiders' THEN
               'RA'
           WHEN DB_NAME() = 'Rams' THEN
               'RM'
           WHEN DB_NAME() = 'Redskins' THEN
               'RS'
           WHEN DB_NAME() = 'Saints' THEN
               'SA'
           WHEN DB_NAME() = 'Seahawks' THEN
               'SE'
           WHEN DB_NAME() = 'Steelers' THEN
               'ST'
           WHEN DB_NAME() = 'Titans' THEN
               'TT'
           WHEN DB_NAME() = 'Vikings' THEN
               'VI'
           ELSE
               '??'
       END AS nfl_team_code,
         CAST(fts.ETL__SSID_TM_acct_id AS NVARCHAR(25)) + ':' + CAST(fts.ETL__SSID_TM_event_id AS NVARCHAR(25)) + ':'
       + CAST(fts.ETL__SSID_TM_section_id AS NVARCHAR(25)) + ':' + CAST(fts.ETL__SSID_TM_row_id AS NVARCHAR(25)) + ':'
       + CAST(fts.ETL__SSID_TM_seat_num AS NVARCHAR(25)) + ':' + CAST(fts.QtySeat AS NVARCHAR(25)) AS ticket_orders_id,
       dc.AccountId AS ticket_customers_id,
	   DB_NAME() AS Club,
	   de.EventName AS Opponent,
	   dd.CalDate AS DateStamp,
	   2018 AS Season,
	 1 AS SeasonTicketFlag, -- Update Season Ticket Holder Logic for your team here
	 0 AS SingleGameFlag, -- Update Single Game Buyer Logic for your team here
	   fts.QtySeat,
	   fts.RevenueTotal AS TotalRevenue
FROM dbo.FactTicketSales_V2 fts (NOLOCK)
JOIN dbo.DimTicketCustomer_V2 dtc ON dtc.DimTicketCustomerId= fts.DimTicketCustomerId
JOIN dbo.DimCustomer dc ON dc.AccountId = dtc.ETL__SSID_TM_acct_id AND dc.CustomerType='Primary' AND dc.SourceSystem = 'TM'
JOIN dbo.DimDate dd ON dd.DimDateId = fts.DimDateId
JOIN dbo.DimSeason_V2 ds ON fts.DimSeasonId = ds.DimSeasonId
JOIN dbo.DimPlan_V2 dp ON dp.DimPlanId = fts.DimPlanId
JOIN  dbo.DimEvent_V2 de ON de.DimEventId = fts.DimEventId
JOIN dbo.DimPriceCode_V2 dpc ON dpc.DimPriceCodeId = fts.DimPriceCodeId
WHERE dp.PlanCode ='DL18SP10'
GO

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*************************************************
Created By: Caeleon Work
Created On: 
Updated By: Stephanie Gerber
Update Date: 2018-06-21
Update Notes: Manipulation of previous sp_Export_LiveA_Data SPROC with specific business rules for Lions. 
Reviewed By: 
Review Date: 
Review Notes: 
**************************************************/

CREATE PROCEDURE [etl].[sp_Export_LiveA_Data]
AS

WITH Active (DimCustomerID, ssb_crmsystem_contact_id)
AS (SELECT dc.DimCustomerId,
           ssbid.SSB_CRMSYSTEM_CONTACT_ID
    --INTO Active
    FROM dbo.DimCustomer dc (NOLOCK)
        JOIN dbo.dimcustomerssbid ssbid (NOLOCK)
            ON ssbid.DimCustomerId = dc.DimCustomerId
    WHERE dc.SSCreatedDate >= DATEADD (YEAR, -3, GETDATE())
          OR dc.SSUpdatedDate >= DATEADD (YEAR, -3, GETDATE())),
		  
    TicketBuyers1 (dimcustomerid, ssb_crmsystem_contact_id)
AS (SELECT DISTINCT
        dc.DimCustomerId,
        ssbid.SSB_CRMSYSTEM_CONTACT_ID
    --INTO #TicketBuyers1
    FROM dbo.FactTicketSales_V2 fts2 (NOLOCK)
		JOIN dbo.DimCustomer dc (NOLOCK)
            ON dc.AccountId = fts2.ETL__SSID_TM_acct_id
			AND dc.SourceSystem = 'TM'
			AND dc.CustomerType = 'Primary'
		JOIN dbo.dimcustomerssbid ssbid 
			ON ssbid.SSID = dc.SSID
        JOIN dbo.DimDate dd
            ON dd.DimDateId = fts2.DimDateId
    WHERE dd.CalDate >= dateadd(year, -3, getdate())),
	TicketBuyers2 (dimcustomerid, ssb_crmsystem_contact_id)
AS (SELECT DISTINCT
        dc.DimCustomerId,
        ssbid.SSB_CRMSYSTEM_CONTACT_ID
    --INTO TicketBuyers2
    FROM dbo.FactTicketSales fts (NOLOCK)
        JOIN dbo.DimTicketCustomer dtc 
            ON fts.DimTicketCustomerId = dtc.DimTicketCustomerId
        JOIN dbo.DimCustomer dc (NOLOCK)
            ON dc.SSID = LEFT(dtc.ETL__SSID, CHARINDEX('.',dtc.ETL__SSID)-1)
            AND dc.SourceSystem = 'Veritix'
        JOIN dbo.dimcustomerssbid ssbid 
            ON ssbid.DimCustomerId = dc.DimCustomerId
        JOIN dbo.DimDate dd
            ON dd.DimDateId = fts.DimDateId
    WHERE dd.CalDate >= dateadd(year, -3, getdate()))
SELECT DISTINCT
    compr.SSB_CRMSYSTEM_CONTACT_ID,
    NULL AS Blank1,
    NULLIF(compr.SourceSystem, '') SourceSystem,
    NULL AS Blank2,
    NULLIF(compr.CompanyName, '') CompanyName,
    NULLIF(compr.FirstName, '') FirstName,
    NULLIF(compr.MiddleName, '') MiddleName,
    NULLIF(compr.LastName, '') LastName,
    NULLIF(compr.Suffix, '') Suffix,
    NULLIF(compr.AddressPrimaryStreet, '') Address_Line1,
    NULLIF(compr.AddressPrimarySuite, '') Address_Line2,
    NULLIF(compr.AddressPrimaryCity, '') City,
    NULLIF(compr.AddressPrimaryState, '') State,
    NULLIF(compr.AddressPrimaryZip, '') ZIP,
    NULLIF(compr.AddressPrimaryCountry, '') Country,
    NULLIF(compr.PhonePrimary, '') PhoneDay,
    NULLIF(compr.PhoneHome, '') PhoneEve,
    NULLIF(compr.EmailPrimary, '') Email
--INTO #qa
FROM dbo.vwCompositeRecord_ModAcctID compr
    LEFT JOIN Active a
        ON a.ssb_crmsystem_contact_id = compr.SSB_CRMSYSTEM_CONTACT_ID
    LEFT JOIN TicketBuyers1 tb1
        ON tb1.ssb_crmsystem_contact_id = compr.SSB_CRMSYSTEM_CONTACT_ID
	LEFT JOIN TicketBuyers2 tb2
		ON tb2.ssb_crmsystem_contact_id = compr.SSB_CRMSYSTEM_CONTACT_ID
	LEFT JOIN ods.LiveAnalytics_Customer la
		ON la.cust_first_nm= compr.FirstName
		AND la.cust_last_nm = compr.LastName
		AND la.cust_addr_line_1 = compr.AddressPrimaryStreet
		AND la.cust_email_addr = compr.EmailPrimary
WHERE compr.AddressPrimaryStreet IS NOT NULL
      AND ISNULL(compr.FirstName, '') <> ''
      AND ISNULL(compr.LastName, '') <> ''
      AND ISNULL(compr.EmailPrimary, '') <> ''
      AND compr.AddressPrimaryIsCleanStatus = 'Valid'
	  AND compr.SSB_CRMSYSTEM_CONTACT_ID IN (
			SELECT DISTINCT compr.SSB_CRMSYSTEM_CONTACT_ID
			FROM dbo.vwCompositeRecord_ModAcctID compr 
			JOIN dbo.vwDimCustomer_ModAcctId dc 
				ON dc.SSB_CRMSYSTEM_CONTACT_ID = compr.SSB_CRMSYSTEM_CONTACT_ID
			JOIN dbo.FactTicketSales_V2 fts2 
				ON fts2.ETL__SSID_TM_Acct_ID = dc.AccountId 
				AND dc.CustomerType = 'Primary'
				AND dc.SourceSystem = 'TM'
			WHERE DATEDIFF(YEAR, fts2.OrderDate, GETDATE()) <= 5
			GROUP BY compr.SSB_CRMSYSTEM_CONTACT_ID)
	AND compr.SSB_CRMSYSTEM_CONTACT_ID IN (
			SELECT DISTINCT compr.SSB_CRMSYSTEM_CONTACT_ID
			FROM dbo.vwCompositeRecord_ModAcctID compr 
			JOIN dbo.vwDimCustomer_ModAcctId dc 
				ON dc.SSB_CRMSYSTEM_CONTACT_ID = compr.SSB_CRMSYSTEM_CONTACT_ID
				AND dc.SourceSystem = 'Veritix'
			JOIN dbo.DimTicketCustomer dtc
				ON LEFT(dtc.ETL__SSID,CHARINDEX('.', dtc.ETL__SSID)-1) = dc.SSID 
				AND dtc.ETL__EndDate IS NULL 
			JOIN dbo.FactTicketSales fts
				ON fts.DimTicketCustomerId = dtc.DimTicketCustomerId
			WHERE DATEDIFF(YEAR, fts.OrderDateTime, GETDATE()) <= 5
			GROUP BY compr.SSB_CRMSYSTEM_CONTACT_ID)
		AND compr.SSB_CRMSYSTEM_CONTACT_ID NOT IN (
        SELECT DISTINCT
            ssbid.SSB_CRMSYSTEM_CONTACT_ID
        FROM dbo.dimcustomerssbid ssbid
            JOIN
            (
                SELECT DISTINCT
                    SSID
                FROM mdm.SSB_ID_History
                WHERE ssb_crmsystem_contact_id IN (
                                                      SELECT acct_id FROM ods.LiveAnalytics_Customer
                                                  )
            ) x
                ON x.SSID = ssbid.SSID
    )
	AND NULLIF(compr.SourceSystem, '')!='Infogroup'
	AND la.acct_id IS NULL
	AND NULLIF(compr.EmailPrimary, '') NOT LIKE '%@lions.nfl.net';
	

GO

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE  [etl].[sp_CRMInteg_RecentCustData]
AS

TRUNCATE TABLE etl.CRMProcess_RecentCustData

DECLARE @Client VARCHAR(50)
SET @Client = 'Lions' --updateme

SELECT x.dimcustomerid, MAX(x.maxtransdate) maxtransdate, x.team
INTO #tmpTicketSales
	FROM (

	--Buyers last 3 seasons
		SELECT dc.dimcustomerid, MAX(fts.orderdatetime) maxtransdate, @Client AS team
        FROM dbo.FactTicketSales fts
			INNER JOIN dbo.DimTicketCustomer dtc (NOLOCK) ON dtc.DimTicketCustomerId=fts.DimTicketCustomerId
            INNER JOIN dbo.DimCustomer dc (NOLOCK)
                ON dc.SSID = CAST(CAST(dtc.ETL__SSID_id AS INT) AS VARCHAR(250)) AND dc.SourceSystem = 'Veritix'
        WHERE  DATEDIFF(YEAR,fts.orderdatetime,GETDATE()) <= 3 
		--AND dc.DimCustomerId IN (1095901,1428835)
        GROUP BY dc.dimcustomerid


			UNION

				--Buyers last 3 seasons TM
		SELECT dc.dimcustomerid, MAX(fts.orderdate) maxtransdate, @Client AS team
        FROM dbo.FactTicketSales_V2 fts
			INNER JOIN dbo.DimTicketCustomer_V2 dtc (NOLOCK) ON dtc.DimTicketCustomerId=fts.DimTicketCustomerId
            INNER JOIN dbo.DimCustomer dc (NOLOCK)
                ON dc.AccountId = CAST(CAST(dtc.etl__ssid_tm_acct_id AS INT) AS VARCHAR(250)) AND dc.SourceSystem = 'TM' AND dc.CustomerType = 'Primary'
        WHERE  DATEDIFF(YEAR,fts.orderdate,GETDATE()) <= 3 
		--AND dc.DimCustomerId IN (1095901,1428835)
        GROUP BY dc.dimcustomerid



		UNION

		--Secondary Buyers

									--SELECT * FROM stg.TE_Sales WHERE invoicedate > GETDATE()

				SELECT dc.dimcustomerid, MAX(TE.invoicedate) maxtransdate, @Client AS team
		FROM dbo.DimCustomer dc (NOLOCK)
			INNER JOIN stg.TE_Sales TE
				ON dc.ssid = TE.inettransid AND dc.SourceSystem = 'Ticket Exchange'
		WHERE DATEDIFF(YEAR,TE.invoicedate,GETDATE()) <= 3
		GROUP BY dc.dimcustomerid

			UNION

		--Flash Transfer Resales

									--SELECT buyer_account FROM ods.FS_resold_orders WHERE transaction_date > GETDATE()

				SELECT dc.dimcustomerid, MAX(fs.transaction_date) maxtransdate, @Client AS team
		FROM dbo.DimCustomer dc (NOLOCK)
			INNER JOIN ods.FS_resold_orders FS
				ON CAST(dc.ssid AS NVARCHAR(100)) = CAST(fs.buyer_account AS NVARCHAR(100)) AND dc.SourceSystem = 'FlashSeats'
		WHERE  DATEDIFF(YEAR,fs.transaction_date,GETDATE()) <= 3
		GROUP BY dc.dimcustomerid


					
			UNION
			
		--Flash Transfer Forwards

									--SELECT to_account_id FROM ods.FS_forwards WHERE to_account_id IS NOT NULL AND forward_date > GETDATE()

				SELECT dc.dimcustomerid, MAX(fs.forward_date) maxtransdate, @Client AS team
		FROM dbo.DimCustomer dc (NOLOCK)
			INNER JOIN ods.FS_forwards FS
				ON CAST(dc.ssid AS NVARCHAR(100)) = CAST(fs.to_account_id AS NVARCHAR(100)) AND dc.SourceSystem = 'FlashSeats'
		WHERE  DATEDIFF(YEAR,fs.forward_date,GETDATE()) <= 3 AND FS.to_account_id IS NOT NULL
		GROUP BY dc.dimcustomerid

			--UNION
		--Fanatics within 75 miles
			--UNION
		--Yinzcam within 75 miles
			--UNION
		--In Stadium Wifi?

		--UNION

		----Legacy CRM Records that are singles
		--SELECT dimcustomerid, sscreateddate AS maxtransdate, @Client AS Team
		--FROM Lions.ods.LegacyCRMContacts_LoadCriteria

		--UNION

		----Legacy CRM records with activity
		--SELECT dimcustomerid, sscreateddate AS maxtransdate, @Client AS team
		--FROM lions.dbo.LegacyContactswithActivity lca
		--INNER JOIN dbo.DimCustomer dc 
		--ON dc.ssid = CAST(lca.contactid AS NVARCHAR(100)) AND dc.SourceSystem = 'Legacy_Dynamics_Contact'

		--		UNION

		----Click Dimensions Carryover
		--SELECT dimcustomerid, sscreateddate AS maxtransdate, @Client AS team
		--FROM  dbo.DimCustomer dc
		--INNER JOIN Lions_Reporting.prodcopy.Contact_Legacy cl ON dc.ssid = CAST(cl.contactid AS NVARCHAR(100)) 
		--where  dc.SourceSystem = 'Legacy_Dynamics_Contact' AND cl.copyloaddate > GETDATE() - 25

		--		UNION

		----Legacy CRM records with activity
		--SELECT dimcustomerid, sscreateddate AS maxtransdate, @Client AS team
		--FROM lions.dbo.legacycrmcompanyrecords lca
		--INNER JOIN dbo.DimCustomer dc 
		--ON dc.ssid = CAST(lca.contactid AS NVARCHAR(100)) AND dc.SourceSystem = 'Legacy_Dynamics_Contact'


		

		) x
		GROUP BY x.dimcustomerid, x.team


INSERT INTO etl.CRMProcess_RecentCustData (SSID, MaxTransDate, Team)
SELECT SSID, [MaxTransDate], Team FROM [#tmpTicketSales] a 
INNER JOIN dbo.[vwDimCustomer_ModAcctId] b ON [b].[DimCustomerId] = [a].[DimCustomerId]

GO

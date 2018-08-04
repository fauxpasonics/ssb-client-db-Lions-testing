SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [etl].[Load_CDI_EmailSummary_MSCRM]
AS

/*========================================================================================================
	Create distinct list of SSB_CRMSYSTEM_CONTACT_IDs and Email Addresses
========================================================================================================*/
IF OBJECT_ID('tempdb..#EmailMatches') IS NOT NULL
    DROP TABLE #EmailMatches
SELECT DISTINCT dc.SSB_CRMSYSTEM_CONTACT_ID, dc.EmailPrimary
INTO #EmailMatches
FROM dbo.vwDimCustomer_ModAcctId dc
WHERE dc.SSB_CRMSYSTEM_CONTACT_ID IS NOT NULL
	AND dc.EmailPrimary IS NOT NULL
	AND dc.EmailPrimary <> ''
	AND dc.EmailPrimaryIsCleanStatus = 'Valid'


/*========================================================================================================
	Map SSBID to mailing summary on email address
========================================================================================================*/

IF OBJECT_ID('tempdb..#Base') IS NOT NULL
	DROP TABLE #Base
SELECT cdi_contactid, cdi_toemail, cdi_emailsendid, cdi_emailsendidname, cdi_deliveriescount, cdi_senton, cdi_openscount, cdi_clickscount, cdi_bouncescount, cdi_spamcount, cdi_unsubscribescount
INTO #Base
FROM Lions_Reporting.prodcopy.cdi_SentEmail

IF OBJECT_ID('tempdb..#click') IS NOT NULL
	DROP TABLE #click
SELECT cdi_contactid, cdi_emailsendid, cdi_url, cdi_time 
INTO #click
FROM Lions_Reporting.prodcopy.cdi_EmailEvent
WHERE cdi_typename='Click'

IF OBJECT_ID('tempdb..#unsub') IS NOT NULL
	DROP TABLE #unsub
SELECT cdi_contactid, cdi_emailsendid, cdi_time 
INTO #unsub
FROM Lions_Reporting.prodcopy.cdi_EmailEvent
WHERE cdi_typename = 'Unsubscribe'

IF OBJECT_ID('tempdb..#mappedguids') IS NOT NULL
	DROP TABLE #mappedguids
SELECT DISTINCT e.SSB_CRMSYSTEM_CONTACT_ID,
	   b.cdi_contactid MemberId,
       b.cdi_toemail EmailAddress,
       b.cdi_emailsendid MailingID,
       b.cdi_emailsendidname MailingName,
	   c.cdi_url PublicWebviewURL,
	   CASE WHEN b.cdi_deliveriescount >0 THEN 'Delivered'
		WHEN b.cdi_bouncescount>0 THEN 'Bounce'
		WHEN b.cdi_spamcount>0 THEN 'Spam'
		ELSE NULL END AS DeliveryResult,
       b.cdi_deliveriescount DeliveryCount,
       b.cdi_senton MinDeliveryTime,
	   b.cdi_openscount OpenCount,
	   NULL MinOpenTime,
       b.cdi_clickscount ClickCount,
	   c.cdi_time  MinClickTime,
       b.cdi_bouncescount Bounces,
       b.cdi_spamcount Spam,
       b.cdi_unsubscribescount Unsubscribes,
	   u.cdi_time UnsubscribeDate
INTO #MappedGuids
FROM #Base b
JOIN #EmailMatches e ON e.EmailPrimary = b.cdi_toemail
LEFT JOIN #click c ON c.cdi_contactid = b.cdi_contactid AND c.cdi_emailsendid = b.cdi_emailsendid
LEFT JOIN #unsub u ON u.cdi_contactid = b.cdi_contactid AND u.cdi_emailsendid = b.cdi_emailsendid



/*========================================================================================================
	Merge into 
========================================================================================================*/

BEGIN

	MERGE etl.CDI_EmailSummary_MSCRM AS TARGET
	USING
		(
			SELECT SSB_CRMSYSTEM_CONTACT_ID
				, MemberID
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
			FROM #MappedGUIDs
		) AS SOURCE
	ON (TARGET.SSB_CRMSYSTEM_CONTACT_ID = SOURCE.SSB_CRMSYSTEM_CONTACT_ID
		AND TARGET.MemberID = SOURCE.MemberID
		AND TARGET.EmailAddress = SOURCE.EmailAddress
		AND TARGET.MailingID = SOURCE.MailingID
		AND TARGET.MailingName = SOURCE.MailingName
		AND TARGET.PublicWebviewURL = SOURCE.PublicWebViewURL
		)
	WHEN MATCHED AND (TARGET.PublicWebviewURL <> SOURCE.PublicWebviewURL OR TARGET.DeliveryResult <> SOURCE.DeliveryResult
						OR TARGET.DeliveryCount <> SOURCE.DeliveryCount OR TARGET.MinDeliveryTime <> source.MinDeliveryTime
						OR TARGET.OpenCount <> SOURCE.OpenCount	OR TARGET.MinOpenTime <> SOURCE.MinOpenTime
						OR TARGET.ClickCount <> SOURCE.ClickCount OR TARGET.MinClickTime <> SOURCE.MinClickTime
						)
	THEN
		UPDATE SET
			  TARGET.MailingName = SOURCE.MailingName
			, TARGET.PublicWebviewURL = SOURCE.PublicWebviewURL
			, TARGET.DeliveryResult = SOURCE.DeliveryResult
			, TARGET.DeliveryCount = SOURCE.DeliveryCount
			, TARGET.MinDeliveryTime = SOURCE.MinDeliveryTime
			, TARGET.OpenCount = SOURCE.OpenCount
			, TARGET.MinOpenTime = SOURCE.MinOpenTime
			, TARGET.ClickCount = SOURCE.ClickCount
			, TARGET.MinClickTime = SOURCE.MinClickTime
			, TARGET.Bounces = SOURCE.Bounces
			, TARGET.Spam = SOURCE.Spam
			, TARGET.Unsubscribes = SOURCE.Unsubscribes
			, TARGET.UnsubscribeDate = SOURCE.UnsubscribeDate
			, TARGET.ETL_UpdatedDate = GETDATE()
	
	WHEN NOT MATCHED THEN
	INSERT (SSB_CRMSYSTEM_CONTACT_ID, MemberID, EmailAddress, MailingID, MailingName, PublicWebviewURL
			, DeliveryResult, DeliveryCount, MinDeliveryTime, OpenCount, MinOpenTime, ClickCount
			, MinClickTime,Bounces, Spam, Unsubscribes, UnsubscribeDate, ETL_CreatedDate, ETL_UpdatedDate)
	
	VALUES (
		SOURCE.SSB_CRMSYSTEM_CONTACT_ID
		, SOURCE.MemberID
		, SOURCE.EmailAddress
		, SOURCE.MailingID
		, SOURCE.MailingName
		, SOURCE.PublicWebviewURL
		, SOURCE.DeliveryResult
		, SOURCE.DeliveryCount
		, SOURCE.MinDeliveryTime
		, SOURCE.OpenCount
		, SOURCE.MinOpenTime
		, SOURCE.ClickCount
		, SOURCE.MinClickTime
		, SOURCE.Bounces
		, SOURCE.Spam
		, SOURCE.Unsubscribes
		, SOURCE.UnsubscribeDate
		, GETDATE()
		, GETDATE()
		);

END

GO

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [segmentation].[vw__Email_OptOuts]
AS
SELECT con.new_ssbcrmsystemcontactid AS SSB_CRMSYSTEM_CONTACT_ID
, con.accountid AS AccountID
, pcsp.cdi_accountidname AS AccountIDName
, pcsp.cdi_contactid AS CDI_ContactID
, con.fullname AS ContactName
, pcsp.cdi_email AS Email
, pcsp.cdi_postedsubscriptionid AS PostedSubscriptionID
, pcsp.cdi_preference AS Preference
, pcsp.cdi_preferencename AS PrefernceName
, pcsp.cdi_subscriptionlistid AS SubscriptinListID
, pcsp.cdi_subscriptionlistidname AS SubscriptionListName
, pcsp.cdi_subscriptionpreferenceid AS SubscriptionPreferenceID
, pcsp.createdon AS CreatedDate
, pcsp.modifiedon AS ModifiedDate
, pcsp.statuscodename AS StatusName



    FROM    [Lions_Reporting].[prodcopy].[cdi_SubscriptionPreference] AS pcsp
    LEFT JOIN    Lions_Reporting.prodcopy.contact con ON con.contactid = pcsp.cdi_contactid
	WHERE pcsp.cdi_preferencename = 'Out' AND con.new_ssbcrmsystemcontactid IS NOT NULL

GO

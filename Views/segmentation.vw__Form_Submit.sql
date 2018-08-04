SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [segmentation].[vw__Form_Submit]
AS
-- WITH   SSB_ID
--          AS (
--               SELECT   ec.ID
--                      , ec.ContactIDExt
--                      , dc.DimCustomerId
--                      , d.SSB_CRMSYSTEM_CONTACT_ID
--               FROM     ods.Eloqua_Contact AS ec
--               JOIN     dbo.DimCustomer AS dc WITH ( NOLOCK ) ON  dc.SourceSystem = 'Eloqua' AND dc.SSID = ec.ContactIDExt
--               JOIN     dbo.dimcustomerssbid AS d WITH ( NOLOCK ) ON d.DimCustomerId = dc.DimCustomerId
--             )
    SELECT  con.new_ssbcrmsystemcontactid AS SSB_CRMSYSTEM_CONTACT_ID     
          , pcpf.cdi_contactid AS ContactId
          , pcpf.cdi_contactidname AS Name
          , MAX(pcpf.createdon) AS Created
          , pcpf.cdi_webcontentidname AS WebContentIDName
          , pcpf.cdi_webcontentid AS WebContentID
          , pcpf.cdi_campaignidname AS CampaignIDName
          , pcpf.cdi_name AS FormName
          , pcpf.cdi_postedformid AS PostedFormID
          , pcpf.cdi_CampaignId AS CampaignID
    FROM    Lions_Reporting.prodcopy.cdi_PostedForm AS pcpf
    JOIN    Lions_Reporting.prodcopy.contact con ON con.contactid = pcpf.cdi_contactid
	GROUP BY con.new_ssbcrmsystemcontactid,
             pcpf.cdi_contactid,
             pcpf.cdi_contactidname,
             pcpf.cdi_webcontentidname,
             pcpf.cdi_webcontentid,
             pcpf.cdi_campaignidname,
             pcpf.cdi_name,
             pcpf.cdi_postedformid,
             pcpf.cdi_campaignid
GO

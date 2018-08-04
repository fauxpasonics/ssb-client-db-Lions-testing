SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE VIEW [dbo].[vw_KeyAccounts]
AS 

SELECT dimcustomerid, ssb_crmsystem_contact_id SSBID, SSID
FROM dbo.vwDimCustomer_ModAcctId ma
INNER JOIN Lions_Reporting.prodcopy.contact pcc
ON ma.ssid = CAST(pcc.contactid AS NVARCHAR(100))
AND ma.SourceSystem='CRM_Contact'
WHERE pcc.lions_flag_lionsalumni = 1
UNION
SELECT dimcustomerid, ssb_crmsystem_contact_id SSBID, SSID
FROM dbo.vwDimCustomer_ModAcctId ma
INNER JOIN Lions_Reporting.prodcopy.Contact pcc
ON ma.ssid = CAST(pcc.contactid AS NVARCHAR(100))
AND ma.SourceSystem='CRM_contact'
WHERE pcc.lions_flag_DLWA=1


GO

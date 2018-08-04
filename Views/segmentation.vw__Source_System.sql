SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO








CREATE VIEW  [segmentation].[vw__Source_System] AS (


SELECT  dc.SSB_CRMSYSTEM_CONTACT_ID
		, dc.SourceSystem CustomerSourceSystem

FROM    [dbo].[vwDimCustomer_ModAcctId] dc

WHERE dc.SourceSystem NOT IN ('CRM_Account', 'CRM_Contact', 'Veritix', 'TM', 'TM_Historical', 
							'Legacy_Dynamics_Contact', 'Legacy_Dynamics_Account', 'Ticket Exchange'	)


) 


































GO

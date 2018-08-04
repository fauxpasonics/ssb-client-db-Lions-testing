SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [etl].[vwCRMProcess_SeasonTicketHolders]
AS

SELECT DISTINCT dc.SSID
, NULL SeasonYear
, NULL SeasonYr
FROM dbo.FactTicketSales ts
INNER JOIN dbo.DimCustomer dc ON dc.ssid=ts.etl__ssid
WHERE 0=1

GO

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [etl].[QA_UnknownDimCountsInFactTicketSales] AS (

SELECT 'DimTicketCustomer' Dim, COUNT(*) UnknownFactCount
FROM dbo.FactTicketSales (NOLOCK)
WHERE DimTicketCustomerId = -1

	UNION ALL

SELECT 'DimItem' Dim, COUNT(*) UnknownFactCount
FROM dbo.FactTicketSales (NOLOCK)
WHERE DimItemId = -1

	UNION ALL

SELECT 'DimEvent' Dim, COUNT(*) UnknownFactCount
FROM dbo.FactTicketSales (NOLOCK)
WHERE DimEventId = -1

	UNION ALL

SELECT 'DimPlan' Dim, COUNT(*) UnknownFactCount
FROM dbo.FactTicketSales (NOLOCK)
WHERE DimPlanId = -1

	UNION ALL

SELECT 'DimPriceLevel' Dim, COUNT(*) UnknownFactCount
FROM dbo.FactTicketSales (NOLOCK)
WHERE DimPriceLevelId = -1

	UNION ALL

SELECT 'DimPriceType' Dim, COUNT(*) UnknownFactCount
FROM dbo.FactTicketSales (NOLOCK)
WHERE DimPriceTypeId = -1

	UNION ALL

SELECT 'DimPriceCode' Dim, COUNT(*) UnknownFactCount
FROM dbo.FactTicketSales (NOLOCK)
WHERE DimPriceCodeId = -1
	
	UNION ALL

SELECT 'DimSeatId_Start' Dim, COUNT(*) UnknownFactCount
FROM dbo.FactTicketSales (NOLOCK)
WHERE DimSeatId_Start = -1

	UNION ALL

SELECT 'DimRep' Dim, COUNT(*) UnknownFactCount
FROM dbo.FactTicketSales (NOLOCK)
WHERE DimRepId = -1

	UNION ALL
SELECT 'DimOffer' Dim, COUNT(*) UnknownFactCount
FROM dbo.FactTicketSales (NOLOCK)
WHERE DimOfferId = -1

)
GO

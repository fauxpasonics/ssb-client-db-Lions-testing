SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [etl].[vw_Load_DimPlan]
AS

SELECT
	'Veritix' AS ETL__SourceSystem
	, x.tixsyspricecodecode AS ETL__SSID
	, x.tixsyspricecodecode AS ETL__SSID_tixsyspricecodecode
	, UPPER(x.tixsyspricecodetextdesc) PlanCode
	, x.tixsyspricecodedesc PlanName
	, CONCAT(x.tixsyspricecodetextdesc,' (',x.tixsyspricecodedesc,')') PlanDesc
	, pct.tixsyspricecodetypedesc AS PlanClass

FROM ods.VTX_tixsyspricecodes x
JOIN ods.VTX_tixsyspricecodetypes pct ON x.tixsyspricecodetype = pct.tixsyspricecodetype
WHERE x.tixsyspricecodetype IN (1, 2, 5, 3955, 3956)

/*
? Should comp be included

tixsyspricecodetype	tixsyspricecodetypedesc
1					Season
14					Inventory
2					Package
13					Deposit
5					Comp
4					Group
3955				Season - New
3956				Season - Renew
10					Series
0					Individual
9					Donation
7					Parking
8					Non-Event
12					Student
11					Discount
*/


GO

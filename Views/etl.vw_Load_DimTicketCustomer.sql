SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [etl].[vw_Load_DimTicketCustomer] AS 

SELECT  
		'Veritix' AS  ETL__SourceSystem
		, c.id AS ETL__SSID 
		, c.id AS ETL__SSID_id

		, CAST(1 AS BIT) IsCompany
		, CAST(1 AS BIT) IsVIP
		, c.firstname FirstName
		, c.LastName LastName

	--SELECT top 100 *
	FROM ods.VTX_customers (NOLOCK) c



GO

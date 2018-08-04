SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO














/*****Hash Rules for Reference******
WHEN 'int' THEN 'ISNULL(RTRIM(CONVERT(varchar(10),' + COLUMN_NAME + ')),''DBNULL_INT'')'
WHEN 'bigint' THEN 'ISNULL(RTRIM(CONVERT(varchar(10),' + COLUMN_NAME + ')),''DBNULL_BIGINT'')'
WHEN 'datetime' THEN 'ISNULL(RTRIM(CONVERT(varchar(25),' + COLUMN_NAME + ')),''DBNULL_DATETIME'')'  
WHEN 'datetime2' THEN 'ISNULL(RTRIM(CONVERT(varchar(25),' + COLUMN_NAME + ')),''DBNULL_DATETIME'')'
WHEN 'date' THEN 'ISNULL(RTRIM(CONVERT(varchar(10),' + COLUMN_NAME + ',112)),''DBNULL_DATE'')' 
WHEN 'bit' THEN 'ISNULL(RTRIM(CONVERT(varchar(10),' + COLUMN_NAME + ')),''DBNULL_BIT'')'  
WHEN 'decimal' THEN 'ISNULL(RTRIM(CONVERT(varchar(25),'+ COLUMN_NAME + ')),''DBNULL_NUMBER'')' 
WHEN 'numeric' THEN 'ISNULL(RTRIM(CONVERT(varchar(25),'+ COLUMN_NAME + ')),''DBNULL_NUMBER'')' 
ELSE 'ISNULL(RTRIM(' + COLUMN_NAME + '),''DBNULL_TEXT'')'
*****/

CREATE VIEW [etl].[vw_Load_DimCustomer_Vertix] AS 

(

	SELECT *
	/*Name*/
	, HASHBYTES('sha2_256',
							ISNULL(RTRIM(FullName),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(Prefix),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(FirstName),'DBNULL_TEXT')
							+ ISNULL(RTRIM(MiddleName),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(LastName),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(Suffix),'DBNULL_TEXT')
							+ ISNULL(RTRIM(CompanyName),'DBNULL_TEXT')
							) AS [NameDirtyHash]
	, 'Dirty' AS [NameIsCleanStatus]
	, NULL AS [NameMasterId]

	/*Address*/
	/*Address*/
	, HASHBYTES('sha2_256', ISNULL(RTRIM(AddressPrimaryStreet),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(AddressPrimarySuite),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressPrimaryCity),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressPrimaryState),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(AddressPrimaryZip),'DBNULL_TEXT') 
							---+ ISNULL(RTRIM(AddressPrimaryCounty),'DBNULL_TEXT')
							---+ ISNULL(RTRIM(AddressPrimaryCountry),'DBNULL_TEXT')
							) AS [AddressPrimaryDirtyHash]
	, 'Dirty' AS [AddressPrimaryIsCleanStatus]
	, NULL AS [AddressPrimaryMasterId]
	, HASHBYTES('sha2_256', ISNULL(RTRIM(AddressOneStreet),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(AddressOneSuite),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressOneCity),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressOneState),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(AddressOneZip),'DBNULL_TEXT') 
							---+ ISNULL(RTRIM(AddressOneCounty),'DBNULL_TEXT')
							---+ ISNULL(RTRIM(AddressOneCountry),'DBNULL_TEXT')
							) AS [AddressOneDirtyHash]
	, 'Dirty' AS [AddressOneIsCleanStatus]
	, NULL AS [AddressOneMasterId]
	, HASHBYTES('sha2_256', ISNULL(RTRIM(AddressTwoStreet),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(AddressTwoSuite),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressTwoCity),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressTwoState),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(AddressTwoZip),'DBNULL_TEXT')
							---+ ISNULL(RTRIM(AddressTwoCounty),'DBNULL_TEXT') 
							---+ ISNULL(RTRIM(AddressTwoCountry),'DBNULL_TEXT')
							) AS [AddressTwoDirtyHash]
	, 'Dirty' AS [AddressTwoIsCleanStatus]
	, NULL AS [AddressTwoMasterId]
	, HASHBYTES('sha2_256', ISNULL(RTRIM(AddressThreeStreet),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(AddressThreeSuite),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressThreeCity),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressThreeState),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(AddressThreeZip),'DBNULL_TEXT') 
							---+ ISNULL(RTRIM(AddressThreeCounty),'DBNULL_TEXT')
							---+ ISNULL(RTRIM(AddressThreeCountry),'DBNULL_TEXT')
							) AS [AddressThreeDirtyHash]
	, 'Dirty' AS [AddressThreeIsCleanStatus]
	, NULL AS [AddressThreeMasterId]
	, HASHBYTES('sha2_256', ISNULL(RTRIM(AddressFourStreet),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(AddressFourSuite),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressFourCity),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressFourState),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(AddressFourZip),'DBNULL_TEXT')
							---+ ISNULL(RTRIM(AddressFourCounty),'DBNULL_TEXT') 
							---+ ISNULL(RTRIM(AddressFourCountry),'DBNULL_TEXT')
							) AS [AddressFourDirtyHash]
	, 'Dirty' AS [AddressFourIsCleanStatus]
	, NULL AS [AddressFourMasterId]

	/*Contact*/
	, HASHBYTES('sha2_256', ISNULL(RTRIM(Prefix),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(FirstName),'DBNULL_TEXT')
							+ ISNULL(RTRIM(MiddleName),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(LastName),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(Suffix),'DBNULL_TEXT')+ ISNULL(RTRIM(AddressPrimaryStreet),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressPrimarySuite),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressPrimaryCity),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressPrimaryState),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(AddressPrimaryZip),'DBNULL_TEXT') 
							--+ ISNULL(RTRIM(AddressPrimaryCounty),'DBNULL_TEXT')
							--+ ISNULL(RTRIM(AddressPrimaryCountry),'DBNULL_TEXT')
							) AS [ContactDirtyHash]

	/*Phone*/
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(PhonePrimary),'DBNULL_TEXT')) AS [PhonePrimaryDirtyHash]
	, 'Dirty' AS [PhonePrimaryIsCleanStatus]
	, NULL AS [PhonePrimaryMasterId]
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(PhoneHome),'DBNULL_TEXT')) AS [PhoneHomeDirtyHash]
	, 'Dirty' AS [PhoneHomeIsCleanStatus]
	, NULL AS [PhoneHomeMasterId]
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(PhoneCell),'DBNULL_TEXT')) AS [PhoneCellDirtyHash]
	, 'Dirty' AS [PhoneCellIsCleanStatus]
	, NULL AS [PhoneCellMasterId]
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(PhoneBusiness),'DBNULL_TEXT')) AS [PhoneBusinessDirtyHash]
	, 'Dirty' AS [PhoneBusinessIsCleanStatus]
	, NULL AS [PhoneBusinessMasterId]
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(PhoneFax),'DBNULL_TEXT')) AS [PhoneFaxDirtyHash]
	, 'Dirty' AS [PhoneFaxIsCleanStatus]
	, NULL AS [PhoneFaxMasterId]
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(PhoneOther),'DBNULL_TEXT')) AS [PhoneOtherDirtyHash]
	, 'Dirty' AS [PhoneOtherIsCleanStatus]
	, NULL AS [PhoneOtherMasterId]

	/*Email*/
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(EmailPrimary),'DBNULL_TEXT')) AS [EmailPrimaryDirtyHash]
	, 'Dirty' AS [EmailPrimaryIsCleanStatus]
	, NULL AS [EmailPrimaryMasterId]
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(EmailOne),'DBNULL_TEXT')) AS [EmailOneDirtyHash]
	, 'Dirty' AS [EmailOneIsCleanStatus]
	, NULL AS [EmailOneMasterId]
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(EmailTwo),'DBNULL_TEXT')) AS [EmailTwoDirtyHash]
	, 'Dirty' AS [EmailTwoIsCleanStatus]
	, NULL AS [EmailTwoMasterId]

	
	/*Attributes*/
, HASHBYTES('sha2_256', ISNULL(RTRIM(customerType),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(CustomerStatus),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AccountType),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(AccountRep),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(CompanyName),'DBNULL_TEXT')
							+ ISNULL(RTRIM(SalutationName),'DBNULL_TEXT')
							+ ISNULL(RTRIM(DonorMailName),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(DonorFormalName),'DBNULL_TEXT')
							+ ISNULL(RTRIM(Birthday),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(Gender),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(AccountId),'DBNULL_TEXT')
							+ ISNULL(RTRIM(MergedRecordFlag),'DBNULL_TEXT')
							+ ISNULL(RTRIM(MergedIntoSSID),'DBNULL_TEXT')
							+ ISNULL(RTRIM(IsBusiness),'DBNULL_TEXT')) AS [contactattrDirtyHash]

, HASHBYTES('sha2_256', ISNULL(RTRIM(ExtAttribute1),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute2),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute3),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(ExtAttribute4),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute5),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute6),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute7),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute8),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute9),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(ExtAttribute10),'DBNULL_TEXT') 
							) AS [extattr1_10DirtyHash]

							, HASHBYTES('sha2_256', ISNULL(RTRIM(ExtAttribute11),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute12),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute13),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(ExtAttribute14),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute15),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute16),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute17),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute18),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute19),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(ExtAttribute20),'DBNULL_TEXT') 
							) AS [extattr11_20DirtyHash]

							
, HASHBYTES('sha2_256', ISNULL(RTRIM(ExtAttribute21),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute22),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute23),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(ExtAttribute24),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute25),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute26),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute27),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute28),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute29),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(ExtAttribute30),'DBNULL_TEXT') 
							) AS [extattr21_30DirtyHash]

							
, HASHBYTES('sha2_256', ISNULL(RTRIM(ExtAttribute31),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute32),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute33),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(ExtAttribute34),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute35),'DBNULL_TEXT')
							) AS [extattr31_35DirtyHash]




	FROM (


--base set
		SELECT
			'Lions' AS [SourceDB] --Client Source Database such as Raiders or Raiders_Reporting
			, 'Veritix' AS [SourceSystem] --Put source name such as TM or CRM_Contact
			, NULL AS [SourceSystemPriority] --Depends on if client uses sourcesystem/sourcesystempriority tables for MDM Rules

			/*Standard Attributes*/
			, CAST(CAST(cust.id AS INT) AS NVARCHAR(100)) [SSID] -- Required
			, CAST(NULL AS NVARCHAR (50)) AS [CustomerType]
			, CAST('Active' AS NVARCHAR (50)) AS [CustomerStatus]
			, CAST(NULL AS NVARCHAR (50)) AS [AccountType] 
			, CAST(acr.userid AS NVARCHAR (50)) AS [AccountRep] 
			, CAST(cust.companyname AS NVARCHAR (50)) AS [CompanyName] 
			, cust.salutation AS [SalutationName]
			, NULL AS [DonorMailName]
			, NULL AS [DonorFormalName]
			, TRY_CAST(cust.birthday AS DATE) AS [Birthday] -- field is sensitive see writup in sharepoint for an example of how complicated it can get
			, NULL AS [Gender] 
			, 0 [MergedRecordFlag]
			, NULL [MergedIntoSSID]

			/**ENTITIES**/
			/*Name*/
			, ISNULL(cust.prefix,'') AS [Prefix]
			, ISNULL(cust.firstname,'') AS [FirstName]
			, ISNULL(cust.middle,'') AS [MiddleName]
			, ISNULL(cust.lastname,'') AS [LastName]
			, ISNULL(cust.suffix,'') AS [Suffix]
			, NULL AS [Fullname]
			--, c.name_title as [Title]

			/*AddressPrimary*/
            , CAST(ISNULL(ad.address1,'') AS VARCHAR(100)) + ' ' + CAST(ISNULL(ad.address2,'') AS VARCHAR(100)) AS [AddressPrimaryStreet] -- dont load suites combine addresses with multiple lines and load to street
			, ad.city AS [AddressPrimaryCity] 
			, ad.state AS [AddressPrimaryState] 
			, ad.zip AS [AddressPrimaryZip] 
			, NULL AS [AddressPrimaryCounty]
			, ad.country AS [AddressPrimaryCountry] 

            , CAST(ISNULL(ad1.address1,'') AS VARCHAR(100)) + ' ' + CAST(ISNULL(ad1.address2,'') AS VARCHAR(100)) AS [AddressOneStreet]
            , ad1.City AS [AddressOneCity] 
            , ad1.State AS [AddressOneState] 
            , ad1.zip AS [AddressOneZip] 
            , NULL AS [AddressOneCounty] 
            , ad1.Country  AS [AddressOneCountry] 

            , CAST(ISNULL(ad2.address1,'') AS VARCHAR(100)) + ' ' + CAST(ISNULL(ad2.address2,'') AS VARCHAR(100)) AS [AddressTwoStreet]
            , ad2.City AS [AddressTwoCity] 
            , ad2.State AS [AddressTwoState] 
            , ad2.zip AS [AddressTwoZip] 
            , NULL AS [AddressTwoCounty] 
            , ad2.Country AS [AddressTwoCountry] 

            , CAST(ISNULL(ad3.address1,'') AS VARCHAR(100)) + ' ' + CAST(ISNULL(ad3.address2,'') AS VARCHAR(100)) AS [AddressThreeStreet]
            , ad3.City AS [AddressThreeCity] 
            , ad3.State AS [AddressThreeState] 
            , ad3.zip AS [AddressThreeZip] 
            , NULL AS [AddressThreeCounty] 
            , ad3.Country AS [AddressThreeCountry] 
            
            , CAST(ISNULL(ad4.address1,'') AS VARCHAR(100)) + ' ' + CAST(ISNULL(ad4.address2,'') AS VARCHAR(100)) AS [AddressFourStreet]
            , ad4.City AS [AddressFourCity] 
            , ad4.State AS [AddressFourState] 
            , ad4.zip AS [AddressFourZip] 
            , NULL AS [AddressFourCounty]
            , ad4.Country AS [AddressFourCountry]

			, NULL AS [AddressPrimarySuite]
			, NULL AS [AddressOneSuite]
			, NULL AS [AddressTwoSuite]
			, NULL AS [AddressThreeSuite]
			, NULL AS [AddressFourSuite]

			/*Phone*/
			, CAST(cust.phone1 AS NVARCHAR(25)) AS [PhonePrimary] 
            , CAST(CASE WHEN cust.phone1type = 1 THEN phone1 WHEN cust.phone2type = 1 THEN phone2 WHEN cust.phone3type = 1 THEN phone3 END AS NVARCHAR(25)) AS [PhoneHome]
            , CAST(CASE WHEN cust.phone1type = 2 THEN phone1 WHEN cust.phone2type = 2 THEN phone2 WHEN cust.phone3type = 2 THEN phone3 END AS NVARCHAR(25)) AS [PhoneCell]
            , CAST(CASE WHEN cust.phone1type = 0 THEN phone1 WHEN cust.phone2type = 0 THEN phone2 WHEN cust.phone3type = 0 THEN phone3 END AS NVARCHAR(25)) AS [PhoneBusiness]
            , CAST(cust.fax AS NVARCHAR(25)) AS [PhoneFax]
            , CAST(CASE WHEN cust.phone1type IS NULL THEN phone1 WHEN cust.phone2type IS NULL THEN phone2 WHEN cust.phone3type IS NULL THEN phone3 END AS NVARCHAR(25)) AS [PhoneOther]

			/*Email*/
			, CAST(cust.email AS NVARCHAR(256)) AS [EmailPrimary]
			, CAST(NULL AS NVARCHAR(256)) AS [EmailOne]
			, CAST(NULL AS NVARCHAR(256)) AS [EmailTwo]

			/*Extended Attributes*/
			, NULL AS[ExtAttribute1] --nvarchar(100)
			, NULL AS[ExtAttribute2] --nvarchar(100)
			, NULL AS[ExtAttribute3] --nvarchar(100)
			, NULL AS[ExtAttribute4] --nvarchar(100)
			, NULL AS[ExtAttribute5] --nvarchar(100)
			, NULL AS[ExtAttribute6] --nvarchar(100)
			, NULL AS[ExtAttribute7] --nvarchar(100)
			, NULL AS[ExtAttribute8] --nvarchar(100)
			, NULL AS[ExtAttribute9] --nvarchar(100)
			, NULL AS[ExtAttribute10] --nvarchar(1000)

			, NULL AS [ExtAttribute11] --decimal(18,6)
			, NULL AS [ExtAttribute12] --decimal(18,6)
			, NULL AS [ExtAttribute13] --decimal(18,6)
			, NULL AS [ExtAttribute14] --decimal(18,6)
			, NULL AS [ExtAttribute15] --decimal(18,6)
			, NULL AS [ExtAttribute16] --decimal(18,6)
			, NULL AS [ExtAttribute17] --decimal(18,6)
			, NULL AS [ExtAttribute18] --decimal(18,6)
			, NULL AS [ExtAttribute19] --decimal(18,6)
			, NULL AS [ExtAttribute20] --decimal(18,6) 

			, NULL AS [ExtAttribute21] --datetime
			, NULL AS [ExtAttribute22] --datetime
			, NULL AS [ExtAttribute23] --datetime
			, NULL AS [ExtAttribute24] --datetime
			, NULL AS [ExtAttribute25] --datetime
			, NULL AS [ExtAttribute26] --datetime
			, NULL AS [ExtAttribute27] --datetime
			, NULL AS [ExtAttribute28] --datetime
			, NULL AS [ExtAttribute29] --datetime
			, NULL AS [ExtAttribute30] --datetime 
			, NULL AS [ExtAttribute31] --nvarchar(max)
			, NULL AS [ExtAttribute32] --nvarchar(max)
			, NULL AS [ExtAttribute33] --nvarchar(max)
			, NULL AS [ExtAttribute34] --nvarchar(max)
			, NULL AS [ExtAttribute35] --nvarchar(max)

			/*Source Created and Updated*/
			, NULL [SSCreatedBy] --createdby
			, NULL [SSUpdatedBy] --lastmodifiedbyid
			, cust.initdate [SSCreatedDate] --createddate
			, cust.lastupdate [SSUpdatedDate] --lastmodifiedbyid
			, GETDATE () AS createddate 
			, GETDATE () AS updateddate
			, cust.accountnumber [AccountId]
			, CASE WHEN cust.companyname=cust.fullname THEN 1 ELSE 0 END AS IsBusiness  --Maybe add a cast when cust.companyname = cust.fullname then 1 else 0 --TCF 07242017
			, 0 AS IsDeleted
			, 'VTX-' + CAST(CAST(cust.accountnumber AS DECIMAL(10,0)) AS NVARCHAR(100)) AS [Customer_Matchkey] /*Standard for macthkeys are ‘TM-xxxx’, ‘Pac-xxxx’ depending on source, 
											Customer Matchkey needs to have fairly complicated logic. 
											See Writup for details.*/

--		select top 100 *		
		FROM [ods].VTX_customers cust WITH (NOLOCK) --Change To Source Table
		LEFT JOIN ods.VTX_customeraddresses ad WITH (NOLOCK) ON ad.addressid=cust.addressid
		LEFT JOIN ods.VTX_aecustomerrelation acr WITH (NOLOCK) ON acr.customerid = ad.customerid
		LEFT JOIN (SELECT * FROM (SELECT ca.customerid,ca.address1,ca.address2,ca.city,ca.state, ca.zip, ca.country
		,RANK() OVER (PARTITION BY ca.customerid ORDER BY ca.addressid) AS rownum
		 FROM ods.VTX_customeraddresses ca (NOLOCK)
		 WHERE 1=1
		 AND ca.addressid NOT IN (SELECT ca.addressid FROM ods.VTX_customers cust (NOLOCK) WHERE ca.customerid=cust.id)
		 AND ca.active=1) a
		 WHERE a.rownum=1
		 ) ad1
		ON ad1.customerid=cust.id
		LEFT JOIN (SELECT * FROM (SELECT ca.customerid,ca.address1,ca.address2,ca.city,ca.state, ca.zip, ca.country
		,RANK() OVER (PARTITION BY ca.customerid ORDER BY ca.addressid) AS rownum
		 FROM ods.VTX_customeraddresses ca (NOLOCK)
		 WHERE 1=1
		 AND ca.addressid NOT IN (SELECT ca.addressid FROM ods.VTX_customers cust (NOLOCK) WHERE ca.customerid=cust.id)
		 AND ca.active=1) a
		 WHERE a.rownum=2
		 )ad2
		 ON cust.id=ad2.customerid
		 LEFT JOIN (SELECT * FROM (SELECT ca.customerid,ca.address1,ca.address2,ca.city,ca.STATE,ca.zip,ca.country
									,RANK() OVER (PARTITION BY customerid ORDER BY addressid) AS rownum
								FROM ods.vtx_CustomerAddresses ca (NOLOCK)
								WHERE 1=1
								AND addressid NOT IN (SELECT addressid FROM ods.vtx_customers cust (NOLOCK) WHERE ca.customerid = cust.id)
								AND ACTIVE = 1
							) a
							WHERE rownum = 3
						)ad3
				ON cust.id = ad3.customerid
				LEFT JOIN 
					(SELECT * FROM
							(
								SELECT 
									ca.customerid,ca.address1,ca.address2,ca.city,ca.STATE,ca.zip,ca.country
									,RANK() OVER (PARTITION BY customerid ORDER BY addressid) AS rownum
								FROM ods.vtx_CustomerAddresses ca (NOLOCK)
								WHERE 1=1
								AND addressid NOT IN (SELECT addressid FROM ods.vtx_customers cust (NOLOCK) WHERE ca.customerid = cust.id)
								AND ACTIVE = 1
							) a
							WHERE rownum = 4
						)ad4
				ON cust.id = ad4.customerid
		WHERE 1=1
		AND (cust.initdate > DATEADD(DAY,-5,GETDATE()) OR cust.lastupdate > DATEADD(DAY,-5,GETDATE()))		--This needs to be uncommented out after the first load, update the date fields
	) a

)























GO

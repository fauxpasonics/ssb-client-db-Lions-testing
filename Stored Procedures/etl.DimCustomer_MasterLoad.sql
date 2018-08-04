SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






/* Note: DO NOT INCLUDE TM or Ticketing data in this proc currently */

CREATE PROCEDURE [etl].[DimCustomer_MasterLoad]

AS
BEGIN

SELECT 1
-- Veritix
EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Lions', @LoadView = '[etl].[vw_Load_DimCustomer_Vertix]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'

-- Ticket Exchange 
EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Lions', @LoadView = '[etl].[vw_Load_DimCustomer_TEX]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'

--FlashSeats
EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Lions', @LoadView = '[etl].[vw_Load_DimCustomer_FlashSeats]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'

--Fanatics
EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Lions', @LoadView = '[etl].[vw_Load_DimCustomer_Fanatics]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'

--CRM Contact
EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Lions', @LoadView = '[etl].[vw_Load_DimCustomer_DynamicsContact]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'

--CRM Account
EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Lions', @LoadView = '[etl].[vw_Load_DimCustomer_DnamicsAccount]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'

--Social SignIn
EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Lions', @LoadView = '[etl].[vw_Load_DimCustomer_SocialSignIn]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'

--CRM Contact Legacy
EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Lions', @LoadView = '[etl].[vw_Load_DimCustomer_DynamicsContact_Legacy]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'

--TM
EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Lions', @LoadView = '[etl].[vw_Load_DimCustomer_TM]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'

--CRM Account Legacy
--EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Lions', @LoadView = '[etl].[vw_DynamicsAccount_LoadDimCustomer_Legacy]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'

-- Appends <-- currently just a one-time load. Left commented in the event more records come later
--EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Lions', @LoadView = '[ods].[vw_Appends_LoadDimCustomer]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'



--MOVED TO KEY ACCOUNTS
/*======================
Forcing Firstnames for Alumni to stick
=======================*/
--SELECT o.*, dc.SourceSystem FROM mdm.overrides o
--INNER JOIN dbo.DimCustomer dc ON dc.DimCustomerId = o.DimCustomerID
--ORDER BY dc.SourceSystem
----Prep the data
--SELECT dimcustomerid, 18 AS ElementID, 'Firstname' AS Field, pcc.firstname AS 'Value', 'MasterLoadScript' AS CreatedBy, 'MasterLoadScript' AS updatedby, GETDATE() AS datecreated, GETDATE() AS dateupdated
--INTO #NewOverrides
--FROM lions_reporting.prodcopy.contact pcc INNER JOIN dimcustomer dc ON CAST(pcc.contactid AS NVARCHAR(100))  = dc.ssid WHERE pcc.lions_flag_lionsalumni = 1

----Delete overrides originally created by the 'MasterLoadScript' where the & or AND is no longer in the first name
--DELETE o  FROM mdm.overrides o 
--			LEFT JOIN #NewOverrides n 
--			ON n.DimCustomerId = o.DimCustomerID 
--			WHERE n.DimCustomerId IS NULL AND o.CreatedBy = 'MasterLoadScript'

----Merge into mdm.overrides what is left
--MERGE INTO mdm.overrides AS target
--USING  #NewOverrides AS SOURCE 
--ON target.DimCustomerID = source.DimCustomerId
--WHEN MATCHED AND target.value != source.Value AND target.CreatedBy = source.CreatedBy THEN UPDATE SET
--target.value = source.Value,
--target.UpdatedBy = source.updatedby,
--target.DateUpdated = source.dateupdated
--WHEN NOT MATCHED THEN 
--INSERT 
--(
--		  DimCustomerID ,
--          ElementID ,
--          Field ,
--          Value ,
--          CreatedBy ,
--          UpdatedBy ,
--          DateCreated ,
--          DateUpdated
--)
--VALUES
--(
--		  SOURCE.DimCustomerID
--		, SOURCE.ElementID
--		, SOURCE.Field
--		, SOURCE.Value
--		, SOURCE.CreatedBy
--		, NULL
--		, Source.DateCreated
--		, NULL
--);




END















GO

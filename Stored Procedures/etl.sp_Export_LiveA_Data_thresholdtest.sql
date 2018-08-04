SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*************************************************
Created By: Caeleon Work
Created On: 
Updated By: Stephanie Gerber
Update Date: 2018-06-21
Update Notes: Manipulation of previous sp_Export_LiveA_Data SPROC with specific business rules for Lions. 
Reviewed By: 
Review Date: 
Review Notes: 
**************************************************/

CREATE PROCEDURE [etl].[sp_Export_LiveA_Data_thresholdtest]
AS
 

SELECT TOP 1001
    compr.SSB_CRMSYSTEM_CONTACT_ID,
    NULL AS Blank1,
    NULLIF(compr.SourceSystem, '') SourceSystem,
    NULL AS Blank2,
    NULLIF(compr.CompanyName, '') CompanyName,
    NULLIF(compr.FirstName, '') FirstName,
    NULLIF(compr.MiddleName, '') MiddleName,
    NULLIF(compr.LastName, '') LastName,
    NULLIF(compr.Suffix, '') Suffix,
    NULLIF(compr.AddressPrimaryStreet, '') Address_Line1,
    NULLIF(compr.AddressPrimarySuite, '') Address_Line2,
    NULLIF(compr.AddressPrimaryCity, '') City,
    NULLIF(compr.AddressPrimaryState, '') State,
    NULLIF(compr.AddressPrimaryZip, '') ZIP,
    NULLIF(compr.AddressPrimaryCountry, '') Country,
    NULLIF(compr.PhonePrimary, '') PhoneDay,
    NULLIF(compr.PhoneHome, '') PhoneEve,
    NULLIF(compr.EmailPrimary, '') Email
--INTO #qa
FROM dbo.vwCompositeRecord_ModAcctID compr


GO

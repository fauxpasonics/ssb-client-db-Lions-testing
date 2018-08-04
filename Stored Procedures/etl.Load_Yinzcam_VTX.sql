SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*============================================================================================================
CREATED BY:		Stephanie Gerber
CREATED DATE:	6/05/2018
PY VERSION:		N/A
USED BY:		YinzCam Inbound Integration
UPDATES:		
NOTES:			This PROC loads the data into ods.Yincam_VTX, one of four yinzcam segment tables
=============================================================================================================*/


CREATE PROC [etl].[Load_Yinzcam_VTX]

WITH EXEC AS OWNER	--Allow the calling user to perform all operations inside the PROC as long as they have permission to execute the PROC (eg insert/deletes to tables)

AS

DECLARE @RunDate DATE = GETDATE()
DECLARE @RunTime DATETIME = GETDATE()
DECLARE @ProcName VARCHAR(200) = OBJECT_SCHEMA_NAME(@@PROCID) + '.' + OBJECT_NAME(@@PROCID)
DECLARE @LoadCount INT
DECLARE @ErrorMessage NVARCHAR(4000) 
DECLARE @ErrorSeverity INT			 
DECLARE @ErrorState INT				 

/*========================================================================================================================
													START TRY
========================================================================================================================*/

BEGIN TRY


	/*====================================================================================================
													LOAD STAGING
	====================================================================================================*/

	IF NOT EXISTS (SELECT * FROM sys.indexes  WHERE name='IX_VERITIX2_id' AND object_id = OBJECT_ID('stg.yinzcam_VERITIX2_0') )
	BEGIN CREATE NONCLUSTERED INDEX IX_VERITIX2_id on stg.YinzCam_VERITIX2_0				(ETL__YinzCam_VERITIX2_id)		   END

	IF NOT EXISTS (SELECT * FROM sys.indexes  WHERE name='IX_VERITIX2_id' AND object_id = OBJECT_ID('stg.yinzcam_VERITIX2_Entry_1') )
	BEGIN CREATE NONCLUSTERED INDEX IX_VERITIX2_id on stg.yinzcam_VERITIX2_Entry_1			(ETL__yinzcam_VERITIX2_id)	   END
	
	IF NOT EXISTS (SELECT * FROM sys.indexes  WHERE name='IX_Entry_id' AND object_id = OBJECT_ID('stg.yinzcam_VERITIX2_Entry_1') )
	BEGIN CREATE NONCLUSTERED INDEX IX_Entry_id on stg.yinzcam_VERITIX2_Entry_1		(ETL__yinzcam_VERITIX2_Entry_id)   END
	
	IF NOT EXISTS (SELECT * FROM sys.indexes  WHERE name='IX_Entry_id' AND object_id = OBJECT_ID('stg.yinzcam_VERITIX2_Entry_Values_2') )
	BEGIN CREATE NONCLUSTERED INDEX IX_Entry_id on stg.yinzcam_VERITIX2_Entry_Values_2 (ETL__yinzcam_VERITIX2_Entry_id) END

	IF OBJECT_ID('tempdb..#stg') IS NOT NULL
    DROP TABLE #stg

	SELECT ETL__insert_datetime
		  ,CAST(NULLIF(timestamp_create ,'null') AS DATETIME)	  AS timestamp_create
		  ,CAST(NULLIF(timestamp_update ,'null') AS DATETIME)	  AS timestamp_update  
		  ,yinzid                                           
		  ,NULLIF(id_global             ,'null')				  AS id_global                                          
		  ,NULLIF(first_name            ,'null')				  AS first_name                                         
		  ,NULLIF(middle_initial        ,'null')				  AS middle_initial
		  ,NULLIF(middle_name	        ,'null')				  AS middle_name                                   		                                       
		  ,NULLIF(last_name             ,'null')				  AS last_name                                          
		  ,NULLIF(name                  ,'null')				  AS name                                               
		  ,NULLIF(email                 ,'null')				  AS email
		  ,NULLIF(company_name			,'null')				  AS company_name                                              
		  ,NULLIF(address_street_1      ,'null')				  AS address_street_1
		  ,NULLIF(address_street_2      ,'null')				  AS address_street_2                                   		                                     
		  ,NULLIF(address_city          ,'null')				  AS address_city                                       
		  ,NULLIF(address_division_1    ,'null')				  AS address_division_1                                 
		  ,NULLIF(address_postal        ,'null')				  AS address_postal                                     
		  ,NULLIF(address_country       ,'null')				  AS address_country                                    
		  ,NULLIF(phone                 ,'null')				  AS phone                                              
		  ,NULLIF(phone_daytime         ,'null')				  AS phone_daytime                                      
		  ,NULLIF(phone_evening	        ,'null')				  AS phone_evening 
		  ,NULLIF(phone_mobile	        ,'null')				  AS phone_mobile 
		  ,NULLIF(segment		        ,'null')				  AS segment                                   
                                
	INTO #stg
	FROM
		(  SELECT a.ETL__insert_datetime
				  ,CONVERT(VARCHAR(50),a.YinzID) YinzID
				  ,b.[Key] AS field
				  ,c.Value
			FROM stg.yinzcam_VERITIX2_0 a
				JOIN stg.yinzcam_VERITIX2_Entry_1 b ON b.ETL__YinzCam_VERITIX2_id = a.ETL__YinzCam_VERITIX2_id
				JOIN stg.yinzcam_VERITIX2_Entry_Values_2 c ON c.ETL__YinzCam_VERITIX2_Entry_id = b.ETL__YinzCam_VERITIX2_Entry_id
		) base
		PIVOT
		(   MAX(Value) FOR field IN ( timestamp_create      
									 ,timestamp_update
									 ,id_global          
									 ,first_name         
									 ,middle_initial     
									 ,middle_name	     
									 ,last_name          
									 ,name               
									 ,email              
           							 ,company_name		
									 ,address_street_1   
									 ,address_street_2   
									 ,address_city       
									 ,address_division_1 
									 ,address_postal     
									 ,address_country    
									 ,phone              
									 ,phone_daytime      
									 ,phone_evening	     
									 ,phone_mobile	     
									 ,segment
									)
		) pvt
		     
	CREATE NONCLUSTERED INDEX IX_yinzID ON #stg (YinzID)

	/*====================================================================================================
												LOAD ODS
	====================================================================================================*/
	MERGE INTO ods.Yinzcam_VTX AS MyTarget

	USING (SELECT *
		   FROM (SELECT *
					   ,ROW_NUMBER() OVER(PARTITION BY YinzID ORDER BY ETL__insert_datetime, NEWID()) rnk
				 FROM #stg
				)x
		   WHERE rnk = 1
		   ) AS MySource
		
		ON MyTarget.yinzid = MySource.YinzID


	WHEN MATCHED
	THEN UPDATE SET

   
	MyTarget.[ETL_UpdatedDate]       = GETDATE()     
   ,MyTarget.[timestamp_create]  	= MySource.[timestamp_create]     
   ,MyTarget.[timestamp_update]		= MySource.[timestamp_update]   
   ,MyTarget.[id_global]        	= MySource.[id_global]            
   ,MyTarget.[first_name]        	= MySource.[first_name]           
   ,MyTarget.[middle_initial]    	= MySource.[middle_initial]       
   ,MyTarget.[middle_name]			= MySource.[middle_name]	       
   ,MyTarget.[last_name]        	= MySource.[last_name]            
   ,MyTarget.[name]              	= MySource.[name]                 
   ,MyTarget.[email]             	= MySource.[email]                
   ,MyTarget.[company_name]			= MySource.[company_name]		   
   ,MyTarget.[address_street_1]  	= MySource.[address_street_1]     
   ,MyTarget.[address_street_2]  	= MySource.[address_street_2]     
   ,MyTarget.[address_city]     	= MySource.[address_city]        
   ,MyTarget.[address_division_1]	= MySource.[address_division_1]   
   ,MyTarget.[address_postal]    	= MySource.[address_postal]       
   ,MyTarget.[address_country]   	= MySource.[address_country]      
   ,MyTarget.[phone]             	= MySource.[phone]                
   ,MyTarget.[phone_daytime]     	= MySource.[phone_daytime]        
   ,MyTarget.[phone_evening]	    = MySource.[phone_evening]	       
   ,MyTarget.[phone_mobile]			= MySource.[phone_mobile]	       
   ,MyTarget.[segment]				= MySource.[segment]   
   ,MyTarget.[ETL_IsDeleted]        = 0        
   ,MyTarget.[ETL_DeletedDate]      = NULL   
   
     
	 WHEN NOT MATCHED BY TARGET	THEN INSERT (ETL_CreatedDate 
									 ,ETL_UpdatedDate 
									 ,timestamp_create 
									 ,YinzID ,timestamp_create   
									 ,timestamp_update
									 ,id_global          
									 ,first_name         
									 ,middle_initial     
									 ,middle_name	     
									 ,last_name          
									 ,name               
									 ,email              
           							 ,company_name		
									 ,address_street_1   
									 ,address_street_2   
									 ,address_city       
									 ,address_division_1 
									 ,address_postal     
									 ,address_country    
									 ,phone              
									 ,phone_daytime      
									 ,phone_evening	     
									 ,phone_mobile	     
									 ,segment
									 ,ETL_IsDeleted 
									 ,ETL_DeletedDate)       
     
	 VALUES (

	 GETDATE()									--ETL_CreatedDate       
	,GETDATE()       							--ETL_UpdatedDate       
	,MySource.[ETL_UpdatedDate]     		--timestamp_create      
	,MySource.[timestamp_create]  			--YinzID                
	,MySource.[timestamp_update]				--entity_class          
	,MySource.[id_global]        			--id_name               
	,MySource.[first_name]        			--id_global             
	,MySource.[middle_initial]    			--id_links              
	,MySource.[middle_name]					--first_name            
	,MySource.[last_name]        			--middle_initial        
	,MySource.[name]              			--last_name             
	,MySource.[email]             			--name                  
	,MySource.[company_name]					--email                 
	,MySource.[address_street_1]  			--email_format          
	,MySource.[address_street_2]  			--email_optout          
	,MySource.[address_city]     			--sms_optout            
	,MySource.[address_division_1]			--address_street_1      
	,MySource.[address_postal]    			--address_city          
	,MySource.[address_country]   			--address_division_1    
	,MySource.[phone]             			--address_postal        
	,MySource.[phone_daytime]     			--address_country       
	,MySource.[phone_evening]	   			--phone                 
	,MySource.[phone_mobile]					--phone_daytime         
	,MySource.[segment]						--phone_alternate_1     
	,0       									--ETL_IsDeleted         
	,NULL       								--ETL_DeletedDate       
	)

	WHEN NOT MATCHED BY SOURCE THEN UPDATE 

	SET  MyTarget.[ETL_IsDeleted]         	= 1   
		,MyTarget.[ETL_DeletedDate]       	= GETDATE()

	;


	IF EXISTS (SELECT * FROM sys.indexes  WHERE name='IX_yinzID' AND object_id = OBJECT_ID('ods.Yinzcam_TM') )
	BEGIN DROP INDEX IX_yinzID on ods.Yinzcam_TM END

	CREATE NONCLUSTERED INDEX IX_yinzID ON ods.Yinzcam_TM (YinzID)
	/*====================================================================================================
												LOG RESULTS
	====================================================================================================*/

	INSERT INTO etl.YinzCam_Load_Monitoring (
	RunDate			--DATE
	,ProcName		--VARCHAR(100)
	,StartTime		--DATETIME
	,EndTime		--DATETIME
	,Completed		--BIT
	,LoadCount		--INT
	,ErrorMessage	--NVARCHAR(4000)
	,ErrorSeverity  --INT
	,ErrorState	    --INT
	)

	VALUES(
	@RunDate
	,@ProcName
	,@RunTime
	,GETDATE()
	,1
	,NULL
	,NULL
	,NULL
	,NULL
	)

	DROP TABLE #stg

	IF EXISTS (SELECT * FROM sys.indexes  WHERE name='IX_VERITIX2_id' AND object_id = OBJECT_ID('stg.yinzcam_VERITIX2_0') )
	BEGIN DROP INDEX IX_VERITIX2_id ON stg.yinzcam_VERITIX2_0 END

	IF EXISTS (SELECT * FROM sys.indexes  WHERE name='IX_VERITIX2_id' AND object_id = OBJECT_ID('stg.yinzcam_VERITIX2_Entry_1') )
	BEGIN DROP INDEX IX_VERITIX2_id ON stg.yinzcam_VERITIX2_Entry_1 END
	
	IF EXISTS (SELECT * FROM sys.indexes  WHERE name='IX_Entry_id' AND object_id = OBJECT_ID('stg.yinzcam_VERITIX2_Entry_1') )
	BEGIN DROP INDEX IX_Entry_id ON stg.yinzcam_VERITIX2_Entry_1 END
	
	IF EXISTS (SELECT * FROM sys.indexes  WHERE name='IX_Entry_id' AND object_id = OBJECT_ID('stg.yinzcam_VERITIX2_Entry_Values_2') )
	BEGIN DROP INDEX IX_Entry_id ON stg.yinzcam_VERITIX2_Entry_Values_2 END

END TRY
/*========================================================================================================================
													START CATCH
========================================================================================================================*/

BEGIN CATCH

	/*====================================================================================================
												LOG ERRORS
	====================================================================================================*/

	SET @ErrorMessage  = ERROR_MESSAGE()	
	SET @ErrorSeverity = ERROR_SEVERITY()	
	SET @ErrorState	   = ERROR_STATE()	


	INSERT INTO etl.YinzCam_Load_Monitoring (
	RunDate			--DATE
	,ProcName		--VARCHAR(100)
	,StartTime		--DATETIME
	,EndTime		--DATETIME
	,Completed		--BIT
	,LoadCount		--INT
	,ErrorMessage	--NVARCHAR(4000)
	,ErrorSeverity  --INT
	,ErrorState	    --INT
	)

	VALUES(
	@RunDate
	,@ProcName
	,@RunTime
	,GETDATE()
	,0
	,NULL
	,@ErrorMessage 
	,@ErrorSeverity
	,@ErrorState	  
	)

	IF EXISTS (SELECT * FROM sys.indexes  WHERE name='IX_ticketmaster_id' AND object_id = OBJECT_ID('stg.yinzcam_VERITIX2_0') )
	BEGIN DROP INDEX IX_VERITIX2_id ON stg.yinzcam_VERITIX2_0 END

	IF EXISTS (SELECT * FROM sys.indexes  WHERE name='IX_ticketmaster_id' AND object_id = OBJECT_ID('stg.yinzcam_VERITIX2_Entry_1') )
	BEGIN DROP INDEX IX_VERITIX2_id ON stg.yinzcam_VERITIX2_Entry_1 END
	
	IF EXISTS (SELECT * FROM sys.indexes  WHERE name='IX_Entry_id' AND object_id = OBJECT_ID('stg.yinzcam_VERITIX2_Entry_1') )
	BEGIN DROP INDEX IX_Entry_id ON stg.yinzcam_VERITIX2_Entry_1 END
	
	IF EXISTS (SELECT * FROM sys.indexes  WHERE name='IX_Entry_id' AND object_id = OBJECT_ID('stg.yinzcam_VERITIX2_Entry_Values_2') )
	BEGIN DROP INDEX IX_Entry_id ON stg.yinzcam_VERITIX2_Entry_Values_2 END

END CATCH






GO

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


CREATE PROC [etl].[Load_Yinzcam_USER]

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
	IF NOT EXISTS (SELECT * FROM sys.indexes  WHERE name='IX_USER_id' AND object_id = OBJECT_ID('stg.YinzCam_user_0') )
	BEGIN CREATE NONCLUSTERED INDEX IX_USER_id on stg.YinzCam_USER_0				(ETL__YinzCam_USER_id)		   END

	IF NOT EXISTS (SELECT * FROM sys.indexes  WHERE name='IX_user_id' AND object_id = OBJECT_ID('stg.YinzCam_user_Entry_1') )
	BEGIN CREATE NONCLUSTERED INDEX IX_USER_id on stg.YinzCam_USER_Entry_1			(ETL__YinzCam_USER_id)	   END
	
	IF NOT EXISTS (SELECT * FROM sys.indexes  WHERE name='IX_Entry_id' AND object_id = OBJECT_ID('stg.YinzCam_user_Entry_1') )
	BEGIN CREATE NONCLUSTERED INDEX IX_Entry_id on stg.YinzCam_USER_Entry_1		(ETL__YinzCam_USER_Entry_id)   END
	
	IF NOT EXISTS (SELECT * FROM sys.indexes  WHERE name='IX_Entry_id' AND object_id = OBJECT_ID('stg.YinzCam_user_Entry_Values_2') )
	BEGIN CREATE NONCLUSTERED INDEX IX_Entry_id on stg.YinzCam_USER_Entry_Values_2 (ETL__YinzCam_USER_Entry_id) END

IF OBJECT_ID('tempdb..#stg') IS NOT NULL
DROP TABLE #stg



SELECT  YinzID
		   ,abi_optout
		   ,birth_date
		   ,birthdate
		   ,email
		   ,filter_presets
		   ,first_name
		   ,segment
	INTO #stg
	FROM
		(  SELECT a.ETL__insert_datetime
				  ,CONVERT(VARCHAR(50),a.YinzID) YinzID
				  ,b.[Key] AS field
				  ,c.Value
			FROM stg.YinzCam_user_0 a
				JOIN stg.YinzCam_user_Entry_1 b ON b.ETL__YinzCam_user_id = a.ETL__YinzCam_user_id
				JOIN stg.YinzCam_user_Entry_Values_2 c ON c.ETL__YinzCam_user_Entry_id = b.ETL__YinzCam_user_Entry_id
		) base
		PIVOT
		(   MAX(Value) FOR field IN ( abi_optout
									 ,birth_date
									 ,birthdate
									 ,email
									 ,filter_presets
									 ,first_name
									 ,segment
									 )
		) pvt

CREATE NONCLUSTERED INDEX IX_yinzID ON #stg (YinzID)

SELECT * FROM #stg

	MERGE INTO ods.YinzCam_USER AS MyTarget

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

	 MyTarget.[ETL_UpdatedDate]		= GETDATE()
	,MyTarget.[abi_optout]			= MySource.[abi_optout]		      
	,MyTarget.[birth_date]			= MySource.[birth_date]		      
	,MyTarget.[birthdate]			= MySource.[birthdate]		      
	,MyTarget.[email]				= MySource.[email]			      
	,MyTarget.[filter_presets]		= MySource.[filter_presets]		
	,MyTarget.[first_name]			= MySource.[first_name]			
	,MyTarget.[segment]				= MySource.[segment]			      
	,MyTarget.[ETL_IsDeleted]		= 0  
	,MyTarget.[ETL_DeletedDate]		= NULL
   
     
	 WHEN NOT MATCHED BY TARGET	THEN INSERT (ETL_CreatedDate,ETL_UpdatedDate,YinzID,abi_optout,birth_date,birthdate,email,filter_presets,first_name,segment,ETL_IsDeleted,ETL_DeletedDate)
	     
     
	 VALUES (   GETDATE()										      
			  , GETDATE()                  						      
			  , MySource.[YinzID]								  
			  , MySource.[abi_optout]		 		  
			  , MySource.[birth_date]		 		  
			  , MySource.[birthdate]		 		  
			  , MySource.[email]						
			  , MySource.[filter_presets]			
			  , MySource.[first_name]		 		  
			  , MySource.[segment]			 		  
			  , 0                  								      
			  , NULL                  							      
    
	)

	WHEN NOT MATCHED BY SOURCE THEN UPDATE 

	SET  MyTarget.[ETL_IsDeleted]         	= 1   
		,MyTarget.[ETL_DeletedDate]       	= GETDATE()
	;

	IF EXISTS (SELECT * FROM sys.indexes  WHERE name='IX_yinzID' AND object_id = OBJECT_ID('ods.YinzCam_USER') )
	BEGIN DROP INDEX IX_yinzID ON ods.YinzCam_USER END
	
	CREATE NONCLUSTERED INDEX IX_yinzID ON ods.YinzCam_USER (YinzID)

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

	IF EXISTS (SELECT * FROM sys.indexes  WHERE name='IX_USER_id' AND object_id = OBJECT_ID('stg.YinzCam_USER_0') )
	BEGIN DROP INDEX IX_user_id ON stg.YinzCam_user_0 END

	IF EXISTS (SELECT * FROM sys.indexes  WHERE name='IX_USER_id' AND object_id = OBJECT_ID('stg.YinzCam_USER_Entry_1') )
	BEGIN DROP INDEX IX_user_id ON stg.YinzCam_user_Entry_1 END
	
	IF EXISTS (SELECT * FROM sys.indexes  WHERE name='IX_Entry_id' AND object_id = OBJECT_ID('stg.YinzCam_USER_Entry_1') )
	BEGIN DROP INDEX IX_Entry_id ON stg.YinzCam_user_Entry_1 END
	
	IF EXISTS (SELECT * FROM sys.indexes  WHERE name='IX_Entry_id' AND object_id = OBJECT_ID('stg.YinzCam_USER_Entry_Values_2') )
	BEGIN DROP INDEX IX_Entry_id ON stg.YinzCam_user_Entry_Values_2 END

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



	IF EXISTS (SELECT * FROM sys.indexes  WHERE name='IX_USER_id' AND object_id = OBJECT_ID('stg.YinzCam_USER_0') )
	BEGIN DROP INDEX IX_user_id ON stg.YinzCam_user_0 END

	IF EXISTS (SELECT * FROM sys.indexes  WHERE name='IX_USER_id' AND object_id = OBJECT_ID('stg.YinzCam_USER_Entry_1') )
	BEGIN DROP INDEX IX_user_id ON stg.YinzCam_user_Entry_1 END
	
	IF EXISTS (SELECT * FROM sys.indexes  WHERE name='IX_Entry_id' AND object_id = OBJECT_ID('stg.YinzCam_USER_Entry_1') )
	BEGIN DROP INDEX IX_Entry_id ON stg.YinzCam_user_Entry_1 END
	
	IF EXISTS (SELECT * FROM sys.indexes  WHERE name='IX_Entry_id' AND object_id = OBJECT_ID('stg.YinzCam_USER_Entry_Values_2') )
	BEGIN DROP INDEX IX_Entry_id ON stg.YinzCam_user_Entry_Values_2 END

END CATCH






GO

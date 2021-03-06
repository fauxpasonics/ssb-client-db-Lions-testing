SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE PROCEDURE [etl].[SSB_ProcessStandardMerge_SCD3]
(
	@BatchId NVARCHAR(50),
	@Target VARCHAR(256),
	@Source VARCHAR(256),
	@BusinessKey VARCHAR(256),
	@Options NVARCHAR(MAX)
)

AS
BEGIN

/**************************************Comments***************************************
**************************************************************************************
Mod #:		1
Name:		ssbcloud\zfrick
Date:		04/17/2016
Comments:	Dynamically generates and executes standard SSB Merge from source table to destination table.

*************************************************************************************/

DECLARE
     @SQL VARCHAR(MAX),
	 @SQL2 VARCHAR(MAX),
	 @SQL3 VARCHAR(MAX)

DECLARE @JoinString varchar(MAX)

SELECT *
INTO #SourceColumns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = PARSENAME(@Source, 2) AND TABLE_NAME = PARSENAME(@Source, 1)

SELECT *
INTO #TargetColumns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = PARSENAME(@Target, 2) AND TABLE_NAME = PARSENAME(@Target, 1)


SELECT t.*
INTO #SharedColumns
FROM #SourceColumns s
INNER JOIN #TargetColumns t ON s.COLUMN_NAME = t.COLUMN_NAME
--WHERE ISNULL(s.COLUMN_NAME,'') NOT LIKE 'ETL__%'
--AND ISNULL(t.COLUMN_NAME,'') NOT LIKE 'ETL__%'


DECLARE @ColString AS VARCHAR(MAX) = ''

SELECT @ColString = @ColString + '' +
CASE
	WHEN DATA_TYPE IN ('bit') THEN 'TRY_CAST([' + COLUMN_NAME + '] AS ' + DATA_TYPE + ') [' + COLUMN_NAME + ']'
	WHEN DATA_TYPE like '%int%' THEN 'TRY_CAST([' + COLUMN_NAME + '] AS DECIMAL(19,0)) [' + COLUMN_NAME + ']'
	WHEN DATA_TYPE IN ('decimal', 'numeric') THEN 'TRY_CAST([' + COLUMN_NAME + '] AS ' + DATA_TYPE + '(18,6)) [' + COLUMN_NAME + ']'
	WHEN DATA_TYPE IN ('date', 'datetime', 'datetime2', 'time')	THEN 'TRY_CAST([' + COLUMN_NAME + '] AS ' + DATA_TYPE + ') [' + COLUMN_NAME + ']'
	ELSE '[' + COLUMN_NAME + ']'
END + ', '
FROM #SharedColumns

SET @ColString = left(@ColString, LEN(@ColString) - 1)


DECLARE @DeltaHashKeySyntax AS VARCHAR(MAX) = ''

	SELECT @DeltaHashKeySyntax = @DeltaHashKeySyntax +
	CASE DATA_TYPE 
	WHEN 'int' THEN 'ISNULL(RTRIM(CONVERT(varchar(10),[' + COLUMN_NAME + '])),''DBNULL_INT'')'
	WHEN 'bigint' THEN 'ISNULL(RTRIM(CONVERT(varchar(25),[' + COLUMN_NAME + '])),''DBNULL_BIGINT'')'
	WHEN 'datetime' THEN 'ISNULL(RTRIM(CONVERT(varchar(25),[' + COLUMN_NAME + '])),''DBNULL_DATETIME'')'  
	WHEN 'datetime2' THEN 'ISNULL(RTRIM(CONVERT(varchar(25),[' + COLUMN_NAME + '])),''DBNULL_DATETIME'')'
	WHEN 'date' THEN 'ISNULL(RTRIM(CONVERT(varchar(10),[' + COLUMN_NAME + '],112)),''DBNULL_DATE'')' 
	WHEN 'bit' THEN 'ISNULL(RTRIM(CONVERT(varchar(10),[' + COLUMN_NAME + '])),''DBNULL_BIT'')'  
	WHEN 'decimal' THEN 'ISNULL(RTRIM(CONVERT(varchar(25),['+ COLUMN_NAME + '])),''DBNULL_NUMBER'')' 
	WHEN 'numeric' THEN 'ISNULL(RTRIM(CONVERT(varchar(25),['+ COLUMN_NAME + '])),''DBNULL_NUMBER'')' 
	ELSE 'ISNULL(RTRIM([' + COLUMN_NAME + ']),''DBNULL_TEXT'')'
	END + ' COLLATE SQL_Latin1_General_CP1_CS_AS + '
	FROM #SharedColumns
	WHERE ISNULL(CHARACTER_MAXIMUM_LENGTH, 0) >= 0
	ORDER BY COLUMN_NAME

SET @DeltaHashKeySyntax = 'HASHBYTES(''sha2_256'', ' + LEFT(@DeltaHashKeySyntax, (LEN(@DeltaHashKeySyntax) - 2)) + ')'


IF (ISNULL(@JoinString,'') = '')
BEGIN

SET @JoinString = 
	(
		SELECT STUFF ((
        SELECT ' and ' + match  
        FROM
		(
			select 't.[' + a.Item + '] = s.[' + a.Item + ']' as match
			from dbo.Split (@BusinessKey, ',') a 
		)	x	
        FOR XML PATH('')), 1, 5, '')
	)


END


DECLARE @SqlStringMax AS VARCHAR(MAX) = ''
	
SELECT @SqlStringMax = @sqlStringMax + 'OR ISNULL(s.[' + COLUMN_NAME + '],'''') <> ' + 'ISNULL(t.[' + COLUMN_NAME + '],'''') '
FROM #SharedColumns	
WHERE ISNULL(CHARACTER_MAXIMUM_LENGTH, 0) < 0

DECLARE @SchemaName  AS VARCHAR(255) = [dbo].[fnGetValueFromDelimitedString](@Source, '.' ,1)
DECLARE @Table AS VARCHAR(255) = [dbo].[fnGetValueFromDelimitedString](@Source, '.' ,2)


	
SELECT @SQL = 
'
DECLARE @RunTime DATETIME = GETDATE()

DECLARE @BatchId NVARCHAR(50) = ''' + @BatchId + ''';
DECLARE @ExecutionId uniqueidentifier = newid();
DECLARE @EventSource nvarchar(255) = ''ProcessStandardMerge_' + @Target + '''
DECLARE @SrcRowCount int = ISNULL((SELECT CONVERT(varchar, COUNT(*)) FROM ' + @Source + '),''0'');	
DECLARE @SrcDataSize NVARCHAR(255) = ''0'';
DECLARE @Client NVARCHAR(255) = (SELECT ISNULL(etl.fnGetClientSetting(''ClientName''), DB_NAME()));

/*Load Options into a temp table*/
--SELECT Col1 AS OptionKey, Col2 as OptionValue INTO #Options FROM [dbo].[SplitMultiColumn](@Options, ''='', '';'')

--DECLARE @DisableDelete nvarchar(5) = ISNULL((SELECT OptionValue FROM #Options WHERE OptionKey = ''DisableDelete''),''true'')

BEGIN TRY 

PRINT ''Execution Id: '' + CONVERT(NVARCHAR(100),@ExecutionId)

EXEC etl.CreateEventLogRecord @Batchid, @Client, ''Info'', @EventSource, ''Merge Load'', ''Procedure Processing'', ''Start'', @ExecutionId
EXEC etl.CreateEventLogRecord @Batchid, @Client, ''Info'', @EventSource, ''Merge Load'', ''Src Row Count'', @SrcRowCount, @ExecutionId
EXEC etl.CreateEventLogRecord @Batchid, @Client, ''Info'', @EventSource, ''Merge Load'', ''Src DataSize'', @SrcDataSize, @ExecutionId


SELECT ROW_NUMBER() OVER(ORDER BY ' + @BusinessKey + ') RowIndex
, * 
INTO #data
FROM ' + @Source + '

CREATE NONCLUSTERED INDEX IDX_RowIndex ON #data (RowIndex)

DECLARE @RecordCount INT = (SELECT COUNT(*) FROM #data)
DECLARE @StartIndex INT = 1, @PageCount INT = 1000000
DECLARE @EndIndex INT = (@StartIndex + @PageCount - 1)

WHILE @StartIndex <= @RecordCount
BEGIN

SELECT CAST(NULL AS BINARY(32)) ETL__DeltaHashKey
, ' + @ColString + '
INTO #SrcData
FROM #data
WHERE RowIndex BETWEEN @StartIndex AND @EndIndex

EXEC etl.CreateEventLogRecord @Batchid, @Client, ''Info'', @EventSource, ''Merge Load'', ''Src Table Setup'', ''Temp Table Loaded'', @ExecutionId

UPDATE #SrcData
SET ETL__DeltaHashKey = ' + @DeltaHashKeySyntax + '

EXEC etl.CreateEventLogRecord @Batchid, @Client, ''Info'', @EventSource, ''Merge Load'', ''Src Table Setup'', ''ETL_Sync_DeltaHashKey Set'', @ExecutionId

CREATE NONCLUSTERED INDEX IDX_Load_Key ON #SrcData (' + @BusinessKey + ')
CREATE NONCLUSTERED INDEX IDX_ETL_Sync_DeltaHashKey ON #SrcData (ETL__DeltaHashKey)

EXEC etl.CreateEventLogRecord @Batchid, @Client, ''Info'', @EventSource, ''Merge Load'', ''Src Table Setup'', ''Temp Table Indexes Created'', @ExecutionId

EXEC etl.CreateEventLogRecord @Batchid, @Client, ''Info'', @EventSource, ''Merge Load'', ''Merge Statement Execution'', ''Start'', @ExecutionId
';

-------------------------------------------------------------------------------------------------

SELECT @SQL2 = 
'
MERGE ' + @Target + ' AS t

USING (
	SELECT * FROM #SrcData
) AS s
    
	ON ' + @JoinString + '

WHEN MATCHED AND (
     ISNULL(s.ETL__DeltaHashKey,-1) <> ISNULL(t.ETL__DeltaHashKey, -1)
	 AND t.ETL__EndDate IS NULL
	 ' + @SqlStringMax + '
)
THEN UPDATE SET
	ETL__EndDate = @RunTime
';

-------------------------------------------------------------------------------------------------

SELECT @SQL3 = 
'WHEN NOT MATCHED BY Target
THEN INSERT
     (
		ETL__CreatedBy
		, ETL__CreatedDate
		, ETL__StartDate
		, ETL__DeltaHashKey
	 , ' + 
          STUFF ((
                    SELECT ',[' + COLUMN_NAME + ']' + CHAR(10) + '     '
					FROM #SharedColumns
					ORDER BY ORDINAL_POSITION
                    FOR XML PATH('')), 1, 1, '') + ')
VALUES
     (
		SUSER_NAME() --ETL__CreatedBy
		, GETDATE() --ETL__CreatedDate
		, @RunTime	--ETL__StartDate
		, s.ETL__DeltaHashKey	
	 , ' + 
          STUFF ((
                    SELECT ',s.[' + COLUMN_NAME + ']' + CHAR(10) + '     '
					FROM #SharedColumns					
					ORDER BY ORDINAL_POSITION
                    FOR XML PATH('')), 1, 1, '') + ')
;

EXEC etl.CreateEventLogRecord @Batchid, @Client, ''Info'', @EventSource, ''Merge Load'', ''Merge Statement Execution'', ''Complete'', @ExecutionId

INSERT INTO ' + @Target + ' (
		ETL__CreatedBy
		, ETL__CreatedDate
		, ETL__StartDate
		, ETL__DeltaHashKey
	 , ' + 
          STUFF ((
                    SELECT ',[' + COLUMN_NAME + ']' + CHAR(10) + '     '
					FROM #SharedColumns
					ORDER BY ORDINAL_POSITION
                    FOR XML PATH('')), 1, 1, '') + ')

SELECT 
	SUSER_NAME() --ETL__CreatedBy
	, GETDATE() --ETL__CreatedDate
	, @RunTime	--ETL__StartDate
	, s.*
FROM #SrcData s
INNER JOIN ' + @Target + ' t ON ' + @JoinString + '
WHERE t.ETL__EndDate = @RunTime


DROP TABLE #SrcData

SET @StartIndex = @EndIndex + 1
SET @EndIndex = @EndIndex + @PageCount

END --End Of Paging Loop


DROP TABLE #data

END TRY 
BEGIN CATCH 

	DECLARE @ErrorMessage nvarchar(4000) = ERROR_MESSAGE();
	DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
	DECLARE @ErrorState INT = ERROR_STATE();
			
	PRINT @ErrorMessage
	EXEC etl.CreateEventLogRecord @Batchid, @Client, ''Error'', @EventSource, ''Merge Load'', ''Merge Error'', @ErrorMessage, @ExecutionId
	EXEC etl.CreateEventLogRecord @Batchid, @Client, ''Info'', @EventSource, ''Merge Load'', ''Procedure Processing'', ''Complete'', @ExecutionId

	RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)

END CATCH

EXEC etl.CreateEventLogRecord @Batchid, @Client, ''Info'', @EventSource, ''Merge Load'', ''Procedure Processing'', ''Complete'', @ExecutionId
'

--PRINT @SQL
--PRINT @SQL2 
--PRINT @SQL3

DECLARE @Full_SQL NVARCHAR(MAX) = @SQL + @SQL2 + @SQL3;

--SELECT @Full_SQL

IF (@Options LIKE 'RunMode:Debug')
BEGIN

--PRINT @SQL
--PRINT @SQL2 
--PRINT @SQL3

SELECT @Full_SQL

END
ELSE BEGIN

EXEC (@Full_SQL)

END

END






GO

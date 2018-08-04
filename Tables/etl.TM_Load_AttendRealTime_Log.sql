CREATE TABLE [etl].[TM_Load_AttendRealTime_Log]
(
[LogId] [int] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime] NULL,
[BatchId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [etl].[TM_Load_AttendRealTime_Log] ADD CONSTRAINT [PK__TM_Load___5E54864816FBAC57] PRIMARY KEY CLUSTERED  ([LogId])
GO

CREATE TABLE [etl].[ZF_QA]
(
[TableName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MinDate] [datetime] NULL,
[MaxDate] [datetime] NULL,
[cnt] [int] NULL
)
GO

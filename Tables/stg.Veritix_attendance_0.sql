CREATE TABLE [stg].[Veritix_attendance_0]
(
[ETL__Veritix_attendance_id] [uniqueidentifier] NOT NULL,
[ETL__session_id] [uniqueidentifier] NOT NULL,
[ETL__insert_datetime] [datetime] NOT NULL CONSTRAINT [DF__Veritix_a__ETL____4A55F802] DEFAULT (getutcdate()),
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ActionID] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Valid] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HistoryPointer] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Barcode] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ActionDate] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Message] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [stg].[Veritix_attendance_0] ADD CONSTRAINT [PK__Veritix___3E0CFE9E547A14A5] PRIMARY KEY CLUSTERED  ([ETL__Veritix_attendance_id])
GO

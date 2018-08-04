CREATE TABLE [stg].[Veritix_attendance_audit_trail_source_object_log]
(
[ETL__audit_id] [uniqueidentifier] NOT NULL,
[ETL__Veritix_attendance_id] [uniqueidentifier] NULL,
[ETL__session_id] [uniqueidentifier] NOT NULL,
[ETL__insert_datetime] [datetime] NOT NULL CONSTRAINT [DF__Veritix_a__ETL____47798B57] DEFAULT (getutcdate()),
[json_payload] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[raw_response] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [stg].[Veritix_attendance_audit_trail_source_object_log] ADD CONSTRAINT [PK__Veritix___DB9573BC6F87B079] PRIMARY KEY CLUSTERED  ([ETL__audit_id])
GO

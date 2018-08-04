CREATE TABLE [stg].[Veritix_fsattendance_audit_trail_source_object_log]
(
[ETL__audit_id] [uniqueidentifier] NOT NULL,
[ETL__Veritix_fsattendance_id] [uniqueidentifier] NULL,
[ETL__session_id] [uniqueidentifier] NOT NULL,
[ETL__insert_datetime] [datetime] NOT NULL CONSTRAINT [DF__Veritix_f__ETL____37631F1F] DEFAULT (getutcdate()),
[json_payload] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[raw_response] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [stg].[Veritix_fsattendance_audit_trail_source_object_log] ADD CONSTRAINT [PK__Veritix___DB9573BCA99F96AE] PRIMARY KEY CLUSTERED  ([ETL__audit_id])
GO

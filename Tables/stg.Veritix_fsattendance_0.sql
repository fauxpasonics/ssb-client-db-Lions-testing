CREATE TABLE [stg].[Veritix_fsattendance_0]
(
[ETL__Veritix_fsattendance_id] [uniqueidentifier] NOT NULL,
[ETL__session_id] [uniqueidentifier] NOT NULL,
[ETL__insert_datetime] [datetime] NOT NULL CONSTRAINT [DF__Veritix_f__ETL____3A3F8BCA] DEFAULT (getutcdate()),
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RedemptionActionID] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FSTicketID] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MemberID] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriceCodeID] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriceLevelID] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContextID] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EventID] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ZoneID] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ParentID] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SeatID] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Section] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Row] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Seat] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FaceValuePrice] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ScannedDate] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RedemptionActionType] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [stg].[Veritix_fsattendance_0] ADD CONSTRAINT [PK__Veritix___6787B80752B6FD83] PRIMARY KEY CLUSTERED  ([ETL__Veritix_fsattendance_id])
GO

CREATE TABLE [stg].[fsattendancetest]
(
[ETL__ID] [bigint] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime] NOT NULL,
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL__DeltaHashKey] [binary] (32) NULL,
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
ALTER TABLE [stg].[fsattendancetest] ADD CONSTRAINT [PK__fsattend__C4EA244590950DF6] PRIMARY KEY CLUSTERED  ([ETL__ID])
GO

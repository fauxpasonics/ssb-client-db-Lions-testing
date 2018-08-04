CREATE TABLE [dbo].[FactAttendance]
(
[FactAttendanceId] [bigint] NOT NULL IDENTITY(1, 1),
[ETL__SourceSystem] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__CreatedDate] [datetime] NOT NULL,
[ETL__UpdatedDate] [datetime] NOT NULL,
[DimEventId] [int] NOT NULL,
[DimSeatId] [int] NOT NULL,
[ScanDateTime] [datetime] NOT NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_dbo_FactAttendance] ON [dbo].[FactAttendance]
GO

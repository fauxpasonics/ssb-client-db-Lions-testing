CREATE TABLE [ods].[VTX_eventcategoryrelation]
(
[tixeventid] [decimal] (10, 0) NULL,
[categoryid] [decimal] (10, 0) NULL,
[createdate] [datetime2] NULL,
[createdby] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_eventcategoryrelation] ON [ods].[VTX_eventcategoryrelation]
GO

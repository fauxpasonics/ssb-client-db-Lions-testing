CREATE TABLE [bkp].[Sync_temp_ods_VTX_eventcategoryrelation]
(
[tixeventid] [decimal] (10, 0) NULL,
[categoryid] [decimal] (10, 0) NULL,
[createdate] [datetime2] NULL,
[createdby] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_eventcategoryrelation] ADD CONSTRAINT [PK__Sync_tem__19364FD2D8FA889C] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

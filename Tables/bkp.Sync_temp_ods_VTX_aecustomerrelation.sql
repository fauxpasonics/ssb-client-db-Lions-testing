CREATE TABLE [bkp].[Sync_temp_ods_VTX_aecustomerrelation]
(
[userid] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[customerid] [decimal] (38, 10) NOT NULL,
[aeroleid] [decimal] (38, 10) NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_aecustomerrelation] ADD CONSTRAINT [PK__Sync_tem__19364FD2249FD027] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

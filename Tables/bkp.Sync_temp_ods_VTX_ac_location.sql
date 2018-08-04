CREATE TABLE [bkp].[Sync_temp_ods_VTX_ac_location]
(
[locationid] [int] NOT NULL,
[description] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[location] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[server] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[email] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[active] [int] NULL,
[lastupdated] [datetime2] NULL,
[current_status] [int] NULL,
[suite_lock_enabled] [int] NULL,
[remotepollenabled] [decimal] (10, 0) NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_ac_location] ADD CONSTRAINT [PK__Sync_tem__19364FD2BFA9C13E] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

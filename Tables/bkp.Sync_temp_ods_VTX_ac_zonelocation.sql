CREATE TABLE [bkp].[Sync_temp_ods_VTX_ac_zonelocation]
(
[tixeventid] [decimal] (10, 0) NOT NULL,
[tixeventzoneid] [int] NOT NULL,
[locationid] [int] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_ac_zonelocation] ADD CONSTRAINT [PK__Sync_tem__19364FD24EDF4D67] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

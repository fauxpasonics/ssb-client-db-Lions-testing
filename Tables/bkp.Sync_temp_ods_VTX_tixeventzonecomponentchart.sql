CREATE TABLE [bkp].[Sync_temp_ods_VTX_tixeventzonecomponentchart]
(
[tixeventid] [decimal] (10, 0) NOT NULL,
[tixeventzoneid] [int] NOT NULL,
[tixevtznpricelevelcode] [decimal] (10, 0) NOT NULL,
[tixevtznpricecodecode] [decimal] (10, 0) NOT NULL,
[component1price] [decimal] (18, 4) NULL,
[component2price] [decimal] (18, 4) NULL,
[component3price] [decimal] (18, 4) NULL,
[component4price] [decimal] (18, 4) NULL,
[component5price] [decimal] (18, 4) NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_tixeventzonecomponentchart] ADD CONSTRAINT [PK__Sync_tem__19364FD2F36A15E3] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

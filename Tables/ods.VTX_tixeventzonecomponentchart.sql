CREATE TABLE [ods].[VTX_tixeventzonecomponentchart]
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
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO

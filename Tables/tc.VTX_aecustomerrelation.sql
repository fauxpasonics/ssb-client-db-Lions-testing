CREATE TABLE [tc].[VTX_aecustomerrelation]
(
[ETL__ID] [int] NOT NULL IDENTITY(1, 1),
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__CreatedDate] [datetime] NOT NULL,
[ETL__StartDate] [datetime] NOT NULL,
[ETL__EndDate] [datetime] NULL,
[ETL__DeltaHashKey] [binary] (32) NULL,
[userid] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[customerid] [decimal] (38, 10) NOT NULL,
[aeroleid] [decimal] (38, 10) NOT NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_tc__VTX_aecustomerrelation] ON [tc].[VTX_aecustomerrelation]
GO

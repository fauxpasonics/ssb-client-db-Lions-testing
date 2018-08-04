CREATE TABLE [ods].[VTX_offer]
(
[offerid] [decimal] (20, 0) NOT NULL,
[description] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[offercode] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[offertypeid] [decimal] (38, 10) NOT NULL,
[mintickets] [decimal] (10, 0) NOT NULL,
[maxtickets] [decimal] (10, 0) NOT NULL,
[ticketincrement] [decimal] (10, 0) NOT NULL,
[startdate] [datetime2] NULL,
[enddate] [datetime2] NULL,
[producttype] [decimal] (10, 0) NOT NULL,
[eventid] [decimal] (10, 0) NULL,
[zoneid] [int] NULL,
[packageid] [decimal] (10, 0) NULL,
[productvendortype] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[productvendorkey] [decimal] (10, 0) NULL,
[productid] [decimal] (10, 0) NULL,
[outletid] [decimal] (10, 0) NULL,
[aetypeid] [decimal] (10, 0) NULL,
[aeuserid] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [varchar] (765) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[showincategorylist] [int] NULL,
[displaydate] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO

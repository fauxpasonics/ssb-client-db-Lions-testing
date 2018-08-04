CREATE TABLE [ods].[VTX_tixeventzoneseats]
(
[tixeventid] [decimal] (10, 0) NOT NULL,
[tixeventzoneid] [int] NOT NULL,
[tixseatgroupid] [int] NOT NULL,
[tixseatid] [decimal] (10, 0) NOT NULL,
[tixseatdesc] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixseatcurrentstatus] [decimal] (10, 0) NOT NULL,
[tixseatecommercehdrlink] [decimal] (10, 0) NULL,
[tixseatecommercedtllink] [int] NULL,
[tixseatseasonticket] [decimal] (10, 0) NULL,
[tixseatbarcode] [varchar] (96) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixseatdefltavailstatus] [decimal] (10, 0) NOT NULL,
[tixseatprintcount] [decimal] (10, 0) NOT NULL,
[tixseatnexthistoryptr] [int] NULL,
[tixseatprimaryspeccode] [int] NULL,
[tixseatpricecode] [decimal] (10, 0) NULL,
[tixseatvaluebeforediscounts] [decimal] (19, 4) NULL,
[tixseatpriceafterdiscounts] [decimal] (19, 4) NULL,
[tixseatpaidtodate] [decimal] (19, 4) NULL,
[tixseatpricetoprintonticket] [decimal] (19, 4) NULL,
[tixseatsold] [int] NOT NULL,
[tixseatpaid] [int] NULL,
[tixseatrenewable] [int] NULL,
[tixseatthiseventownersuserid] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixseatnexteventownersuserid] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixseatholdexpiration] [datetime2] NULL,
[tixseatsoldfromoutlet] [decimal] (10, 0) NULL,
[tixseatprintbatchid] [decimal] (10, 0) NULL,
[tixseatpackageon] [int] NULL,
[tixseatpackage] [int] NULL,
[tixseatpackageid] [decimal] (10, 0) NULL,
[tixseatspecialtycode_ctrlreqd] [int] NULL,
[tixseatspecialtycode_ctrlopt] [decimal] (10, 0) NULL,
[tixseatlastupdate] [datetime2] NULL,
[tixseatprintable] [int] NULL,
[tixseatprinted] [int] NOT NULL,
[tixseatshipdate] [datetime2] NULL,
[tixseatshipservecharge] [decimal] (19, 4) NULL,
[tixseatrenewalexpiredate] [datetime2] NULL,
[tixseatprojectedprice] [decimal] (19, 4) NULL,
[tixseateventtype] [int] NULL,
[tixseatprintfilename] [varchar] (765) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixseatpkgpricecode] [int] NULL,
[tixseatmod] [decimal] (10, 0) NULL,
[tixseatshippingoption] [decimal] (10, 0) NULL,
[tixseattrackingnumber] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixseatofferid] [decimal] (20, 0) NULL,
[tixseatlastscandate] [datetime2] NULL,
[tixseatoffergroupid] [decimal] (20, 0) NULL,
[tixseatordergroupid] [decimal] (20, 0) NULL,
[tixseatinfo1] [decimal] (10, 0) NULL,
[tixseatinfo2] [decimal] (10, 0) NULL,
[tixseatlocked] [int] NULL,
[change_group_id] [decimal] (10, 0) NULL,
[seat_bit_flags] [int] NULL,
[tixhandheldmessage_id] [int] NULL,
[tixseatdisplayorder] [decimal] (10, 0) NULL,
[paper_converted] [int] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__Vtx_tixeventzoneseats] ON [ods].[VTX_tixeventzoneseats]
GO
CREATE NONCLUSTERED INDEX [IX_tixseatbarcode] ON [ods].[VTX_tixeventzoneseats] ([tixseatbarcode])
GO
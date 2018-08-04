CREATE TABLE [ods].[VTX_userccinfo]
(
[userccuserid] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[usercckey] [int] NOT NULL,
[usercctype] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[userccexp] [datetime2] NULL,
[usercclastfour] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[userccactive] [int] NOT NULL,
[usercchiddenfromuser] [int] NOT NULL,
[userccinitdate] [datetime2] NULL,
[usercclastupdatewhen] [datetime2] NULL,
[usercclastupdatewho] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[userccbanned] [int] NOT NULL,
[userccname] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[userccaddress1] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[userccaddress2] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[userccaddress3] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[usercccity] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[userccst] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[usercccountry] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[usercczip] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[userccstatecode] [int] NULL,
[usercchistoryflags] [int] NULL,
[userccusetype] [int] NULL,
[userccdisplaytouser] [decimal] (10, 0) NULL,
[customerid] [decimal] (38, 10) NULL,
[userccpaymenttranstype] [int] NULL,
[authdate] [datetime2] NULL,
[token_id] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cc_first_six] [varchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cc_hash_info_id] [decimal] (10, 0) NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__VTX_userccinfo] ON [ods].[VTX_userccinfo]
GO

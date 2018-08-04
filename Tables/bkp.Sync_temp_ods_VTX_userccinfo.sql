CREATE TABLE [bkp].[Sync_temp_ods_VTX_userccinfo]
(
[userccuserid] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[usercckey] [int] NOT NULL,
[usercctype] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[userccexp] [datetime2] NULL,
[usercclastfour] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[userccactive] [int] NOT NULL,
[usercchiddenfromuser] [int] NOT NULL,
[userccinitdate] [datetime2] NULL,
[usercclastupdatewhen] [datetime2] NULL,
[usercclastupdatewho] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[userccbanned] [int] NOT NULL,
[userccname] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[userccaddress1] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[userccaddress2] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[userccaddress3] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[usercccity] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[userccst] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[usercccountry] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[usercczip] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[userccstatecode] [int] NULL,
[usercchistoryflags] [int] NULL,
[userccusetype] [int] NULL,
[userccdisplaytouser] [decimal] (10, 0) NULL,
[customerid] [decimal] (38, 10) NULL,
[userccpaymenttranstype] [int] NULL,
[authdate] [datetime2] NULL,
[token_id] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cc_first_six] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cc_hash_info_id] [decimal] (10, 0) NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_userccinfo] ADD CONSTRAINT [PK__Sync_tem__19364FD25B61F70D] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

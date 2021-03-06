CREATE TABLE [bkp].[Sync_temp_ods_VTX_customers]
(
[id] [decimal] (38, 10) NOT NULL,
[accountnumber] [nvarchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lastname] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[firstname] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[middle] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[phone1] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[phone2] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[address1] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[address2] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[city] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[state] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[zip] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email] [nvarchar] (765) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[initdate] [datetime2] NULL,
[lastupdate] [datetime2] NULL,
[password] [nvarchar] (45) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[primarycc] [decimal] (38, 10) NULL,
[notes] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[companyname] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[birthday] [datetime2] NULL,
[fullname] [nvarchar] (456) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[prefix] [nvarchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[suffix] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[phone3] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[phone1type] [decimal] (38, 10) NULL,
[phone2type] [decimal] (38, 10) NULL,
[phone3type] [decimal] (38, 10) NULL,
[salutation] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[search] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[careof] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[stateid] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sentwelcomemessage] [decimal] (38, 10) NULL,
[optedin] [decimal] (38, 10) NULL,
[addressid] [decimal] (38, 10) NULL,
[fax] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[isfemale] [int] NULL,
[country] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[usersearch] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[legacyid] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[securityquestionid] [int] NULL,
[securityanswer] [nvarchar] (750) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[securityquestion2id] [int] NULL,
[securityanswer2] [nvarchar] (750) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[convertfsunpaiddefault] [int] NULL,
[primarybankacc] [decimal] (38, 10) NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_customers] ADD CONSTRAINT [PK__Sync_tem__19364FD286FEC60D] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

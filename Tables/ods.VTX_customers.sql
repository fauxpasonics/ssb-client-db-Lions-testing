CREATE TABLE [ods].[VTX_customers]
(
[id] [decimal] (38, 10) NOT NULL,
[accountnumber] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lastname] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[firstname] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[middle] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[phone1] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[phone2] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[address1] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[address2] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[city] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[state] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[zip] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email] [varchar] (765) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[initdate] [datetime2] NULL,
[lastupdate] [datetime2] NULL,
[password] [varchar] (45) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[primarycc] [decimal] (38, 10) NULL,
[notes] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[companyname] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[birthday] [datetime2] NULL,
[fullname] [varchar] (456) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[prefix] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[suffix] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[phone3] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[phone1type] [decimal] (38, 10) NULL,
[phone2type] [decimal] (38, 10) NULL,
[phone3type] [decimal] (38, 10) NULL,
[salutation] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[search] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[careof] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[stateid] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sentwelcomemessage] [decimal] (38, 10) NULL,
[optedin] [decimal] (38, 10) NULL,
[addressid] [decimal] (38, 10) NULL,
[fax] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[isfemale] [int] NULL,
[country] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[usersearch] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[legacyid] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[securityquestionid] [int] NULL,
[securityanswer] [varchar] (750) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[securityquestion2id] [int] NULL,
[securityanswer2] [varchar] (750) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[convertfsunpaiddefault] [int] NULL,
[primarybankacc] [decimal] (38, 10) NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO

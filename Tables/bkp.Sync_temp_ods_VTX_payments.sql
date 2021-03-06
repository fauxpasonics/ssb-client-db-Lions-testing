CREATE TABLE [bkp].[Sync_temp_ods_VTX_payments]
(
[paymentid] [decimal] (10, 0) NOT NULL,
[paymentccbatchid] [decimal] (10, 0) NULL,
[paymenttranstype] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paymentusercckey] [int] NULL,
[paymentamount] [decimal] (19, 4) NOT NULL,
[paymentauthcode] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paymentrefnumber] [nvarchar] (96) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paymentdate] [datetime2] NULL,
[paymentsetup] [datetime2] NOT NULL,
[paymentsetdown] [datetime2] NULL,
[paymentmerchid] [int] NULL,
[paymentname] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paymentaddress1] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paymentaddress2] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paymentcity] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paymentst] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paymentcountry] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paymentzip] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paymentstatecode] [int] NULL,
[paymentrelatedpaymentid] [decimal] (10, 0) NULL,
[paymentsetdownperforminguser] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paymenttransactiondate] [datetime2] NULL,
[paymentuserccvalidcoderesponse] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paymentcardentryindicator] [int] NULL,
[paymentproviderresponsecode] [int] NULL,
[paymenthostresponsemessage] [nvarchar] (240) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paymenthostresponsecode] [nvarchar] (90) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paymentavsresultcode] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paymentuserccname] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paymentuserccexp] [datetime2] NULL,
[paymentusercctype] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paymentsetupperforminguser] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paymentstatus] [decimal] (10, 0) NULL,
[paymentresult] [decimal] (10, 0) NULL,
[paymentoutletid] [int] NULL,
[paymentchannel] [int] NULL,
[paymentsetupoutletid] [int] NULL,
[customerid] [decimal] (38, 10) NULL,
[ordergroupid] [decimal] (20, 0) NULL,
[client_id] [decimal] (10, 0) NOT NULL,
[paymentusercclastfour] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cctransactiontype] [int] NULL,
[provider_response_details] [nvarchar] (3000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cc_token_id] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cc_first_six] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[application_id] [int] NULL,
[paymentprocessorresponsecode] [nvarchar] (90) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cc_hash_info_id] [decimal] (10, 0) NULL,
[ach_acct_id] [decimal] (38, 0) NULL,
[forte_trans_token] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_payments] ADD CONSTRAINT [PK__Sync_tem__19364FD2F213B643] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

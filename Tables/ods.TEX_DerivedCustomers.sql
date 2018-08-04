CREATE TABLE [ods].[TEX_DerivedCustomers]
(
[ETL__ID] [int] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime2] NULL,
[ETL__UpdatedDate] [datetime2] NULL,
[ETL__CustomerHash] [binary] (32) NOT NULL,
[buyerfirstname] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[buyerlastname] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[addressline1] [varchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[addressline2] [varchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[city] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[state] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[postalcode] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[country] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dayphone] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[eveningphone] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[emailaddress] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

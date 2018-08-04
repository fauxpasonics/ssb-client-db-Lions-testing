CREATE TABLE [config].[Element]
(
[ElementID] [int] NOT NULL IDENTITY(1, 1),
[Element] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ElementType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ElementFieldList] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ElementUpdateStatement] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ElementIsCleanField] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Custom] [bit] NULL,
[IsDeleted] [bit] NULL,
[DateCreated] [date] NULL CONSTRAINT [DF__Element__DateCre__5F9B5F75] DEFAULT (getdate()),
[DateUpdated] [date] NULL CONSTRAINT [DF__Element__DateUpd__608F83AE] DEFAULT (getdate())
)
GO
ALTER TABLE [config].[Element] ADD CONSTRAINT [PK__Element__A429723A9AB590B8] PRIMARY KEY CLUSTERED  ([ElementID])
GO

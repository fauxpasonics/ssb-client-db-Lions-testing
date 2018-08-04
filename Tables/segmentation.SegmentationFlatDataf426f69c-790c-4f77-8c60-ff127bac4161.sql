CREATE TABLE [segmentation].[SegmentationFlatDataf426f69c-790c-4f77-8c60-ff127bac4161]
(
[id] [uniqueidentifier] NULL,
[DocumentType] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SessionId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Environment] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TenantId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[_rn] [bigint] NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactId] [uniqueidentifier] NULL,
[Name] [nvarchar] (160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Created] [datetime] NULL,
[WebContentIDName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WebContentID] [uniqueidentifier] NULL,
[CampaignIDName] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FormName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PostedFormID] [uniqueidentifier] NOT NULL,
[CampaignID] [uniqueidentifier] NULL
)
GO

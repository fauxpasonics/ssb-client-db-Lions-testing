CREATE TABLE [segmentation].[SegmentationFlatDatacc50885a-684d-473c-a7bf-4190fcde3705]
(
[id] [uniqueidentifier] NOT NULL,
[DocumentType] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SessionId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Environment] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TenantId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[_rn] [bigint] NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountID] [uniqueidentifier] NULL,
[AccountIDName] [nvarchar] (160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CDI_ContactID] [uniqueidentifier] NULL,
[ContactName] [nvarchar] (160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PostedSubscriptionID] [uniqueidentifier] NULL,
[Preference] [bit] NULL,
[PrefernceName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SubscriptinListID] [uniqueidentifier] NULL,
[SubscriptionListName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SubscriptionPreferenceID] [uniqueidentifier] NOT NULL,
[CreatedDate] [datetime] NULL,
[ModifiedDate] [datetime] NULL,
[StatusName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [segmentation].[SegmentationFlatDatacc50885a-684d-473c-a7bf-4190fcde3705] ADD CONSTRAINT [pk_SegmentationFlatDatacc50885a-684d-473c-a7bf-4190fcde3705] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatDatacc50885a-684d-473c-a7bf-4190fcde3705] ON [segmentation].[SegmentationFlatDatacc50885a-684d-473c-a7bf-4190fcde3705] ([_rn])
GO

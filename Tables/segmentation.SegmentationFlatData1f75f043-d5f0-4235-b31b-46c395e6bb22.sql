CREATE TABLE [segmentation].[SegmentationFlatData1f75f043-d5f0-4235-b31b-46c395e6bb22]
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
ALTER TABLE [segmentation].[SegmentationFlatData1f75f043-d5f0-4235-b31b-46c395e6bb22] ADD CONSTRAINT [pk_SegmentationFlatData1f75f043-d5f0-4235-b31b-46c395e6bb22] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatData1f75f043-d5f0-4235-b31b-46c395e6bb22] ON [segmentation].[SegmentationFlatData1f75f043-d5f0-4235-b31b-46c395e6bb22] ([_rn])
GO

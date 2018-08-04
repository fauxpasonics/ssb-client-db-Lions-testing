CREATE TABLE [segmentation].[SegmentationFlatData490efe30-609c-4e94-9285-ad4a7810642f]
(
[id] [uniqueidentifier] NOT NULL,
[DocumentType] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SessionId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Environment] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TenantId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[_rn] [bigint] NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerSourceSystem] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
ALTER TABLE [segmentation].[SegmentationFlatData490efe30-609c-4e94-9285-ad4a7810642f] ADD CONSTRAINT [pk_SegmentationFlatData490efe30-609c-4e94-9285-ad4a7810642f] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatData490efe30-609c-4e94-9285-ad4a7810642f] ON [segmentation].[SegmentationFlatData490efe30-609c-4e94-9285-ad4a7810642f] ([_rn])
GO

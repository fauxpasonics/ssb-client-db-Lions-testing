CREATE TABLE [segmentation].[SegmentationFlatDataeeb44cf0-2b09-4684-a437-2fb341284d32]
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
ALTER TABLE [segmentation].[SegmentationFlatDataeeb44cf0-2b09-4684-a437-2fb341284d32] ADD CONSTRAINT [pk_SegmentationFlatDataeeb44cf0-2b09-4684-a437-2fb341284d32] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatDataeeb44cf0-2b09-4684-a437-2fb341284d32] ON [segmentation].[SegmentationFlatDataeeb44cf0-2b09-4684-a437-2fb341284d32] ([_rn])
GO

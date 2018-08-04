CREATE TABLE [ods].[VTX_tixevents]
(
[tixeventid] [decimal] (10, 0) NOT NULL,
[tixeventtitleshort] [varchar] (384) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[tixeventtitlelong] [varchar] (3072) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixeventonsale] [datetime2] NULL,
[tixeventstartdate] [datetime2] NULL,
[tixeventenddate] [datetime2] NULL,
[tixeventgatesopen] [datetime2] NULL,
[tixeventtourid] [int] NULL,
[tixeventlookupid] [varchar] (48) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixeventinitdate] [datetime2] NULL,
[tixeventlastupdwhen] [datetime2] NULL,
[tixeventlastupdatewho] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixeventtype] [int] NOT NULL,
[tixeventemailnotifydate] [datetime2] NULL,
[tixeventcategoryid] [decimal] (38, 10) NULL,
[establishmenttype] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixrenewalid] [decimal] (38, 10) NULL,
[tixeventcurrentuntil] [datetime2] NULL,
[display_in_reports] [int] NOT NULL,
[tixeventdisplaydate] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixeventimagepath] [varchar] (384) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixeventsoundfilepath] [varchar] (384) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixeventvisible] [int] NULL,
[eticketschedule] [datetime2] NULL,
[allowcontinueshopping] [int] NULL,
[venueestablishmenttype] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[venueestablishmentkey] [decimal] (10, 0) NULL,
[ac_exportevent] [int] NULL,
[client_id] [decimal] (10, 0) NOT NULL,
[flashseats_schedule] [datetime2] NULL,
[tixeventversion] [decimal] (18, 0) NULL,
[tixeventkeywords] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tixeventinternalinformation] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[web_tracking_profile_id] [decimal] (10, 0) NULL,
[default_offer_id] [decimal] (18, 0) NULL,
[visible_to_web] [int] NULL,
[image_id] [decimal] (18, 0) NULL,
[flasheventid] [decimal] (38, 10) NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO
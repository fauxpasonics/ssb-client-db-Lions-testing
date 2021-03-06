CREATE TABLE [ods].[VTX_establishments]
(
[establishmenttype] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[establishmentkey] [decimal] (10, 0) NOT NULL,
[establishmentfullname] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentdescription] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentcompanyname] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentaffilation] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentownership] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentsecuritygroup1] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentaddress1] [varchar] (90) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentaddress2] [varchar] (90) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentaddress3] [varchar] (90) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentcity] [varchar] (90) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentstate] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentstatecode] [int] NULL,
[establishmentzip] [varchar] (90) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentcountry] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentlocationcode] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentsecuritygroup2] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentdirectline] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmenttollfreeinstate] [varchar] (39) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmenttollfreeoutstate] [varchar] (39) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentexecofficenumber] [varchar] (39) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentsecuritygroup3] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentpublicemail] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmenthomepage] [varchar] (765) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentsecuritygroup4] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentsitecreated] [datetime2] NULL,
[establishmentinitdate] [datetime2] NULL,
[establishmentsuggestedby] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentsuggestedbystring] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentlastupdatewhen] [datetime2] NULL,
[establishmentlastupdatewho] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentquicknavcode] [decimal] (10, 0) NULL,
[establishmentremoteadmincode] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentbannerfilename] [varchar] (765) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentbannerorigfile] [varchar] (765) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentbanneruploadwhen] [datetime2] NULL,
[establishmentbanneruploadwho] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentbannersizebytes] [decimal] (10, 0) NULL,
[establishmentbannersizewidth] [decimal] (10, 0) NULL,
[establishmentbannersizeheight] [decimal] (10, 0) NULL,
[establishmentbannerapproved] [int] NOT NULL,
[establishmentbannerapprovewhen] [datetime2] NULL,
[establishmentbannerapprovewho] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentbannerswap] [int] NOT NULL,
[establishmentlinkexchange] [int] NOT NULL,
[establishmentbannerweightperc] [decimal] (38, 10) NULL,
[establishmentbannerweightshar] [decimal] (38, 10) NULL,
[establishmentbannertimemult] [decimal] (38, 10) NULL,
[establishmentevtschedstatus] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentevtschedlimitlist] [varchar] (765) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentevtschedsysname] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentevtschedmaxdb1rec] [decimal] (10, 0) NULL,
[establishmentevtschedmaxdb2rec] [decimal] (10, 0) NULL,
[establishmentevtscheddb1name] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentevtscheddb2name] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentevtscheddb1item] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentevtscheddb2item] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentevtscheddb1refint] [int] NOT NULL,
[establishmentevtscheddb2refint] [int] NOT NULL,
[establishmentevtschedeventname] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentevtschedeventitem] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentevtscheddb1mode] [int] NULL,
[establishmentevtscheddb2mode] [int] NULL,
[establishmentevtscheddefltdb1] [int] NOT NULL,
[establishmentevtscheddb1type] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentevtscheddb1key] [decimal] (10, 0) NULL,
[establishmentevtscheddb1id] [decimal] (10, 0) NULL,
[establishmentevtscheddb2type] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentevtscheddb2key] [decimal] (10, 0) NULL,
[establishmentevtscheddb2id] [decimal] (10, 0) NULL,
[establishmentevtscheddb2pname] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentevtscheddb2pitem] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentevtschedcalline1] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentevtschedcalline2] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentevtschedcalline3] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentevtschedmmmaxbyte] [decimal] (10, 0) NULL,
[establishmentevtschedmaxestrec] [decimal] (10, 0) NULL,
[establishmentevtscheddefltdays] [decimal] (10, 0) NULL,
[establishmentevtschedlinkcntrl] [varchar] (765) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentprimarytype] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentsecondarytype] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentfanclubstatus] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentfaxnumber] [varchar] (39) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentvthomepage] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentfanclubnewmembers] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentvtphotospage] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmententrypoint] [int] NULL,
[establishmentcountycode] [int] NULL,
[usercountycode] [int] NULL,
[establishmentbannernotes] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentevtschednotes] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentfanclubnewmemberm] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[establishmentnotes] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[client_id] [decimal] (10, 0) NOT NULL,
[spacebisonenabled] [int] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL,
[ETL_Sync_UpdatedDate] [datetime] NULL
)
GO

CREATE TABLE [bkp].[Sync_temp_ods_VTX_products]
(
[productvendortype] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[productvendorkey] [decimal] (10, 0) NULL,
[productid] [decimal] (10, 0) NULL,
[producttype] [int] NULL,
[productdescription] [nvarchar] (384) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[productdetails2] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[productdetails3] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[productdefaultmerchid] [int] NULL,
[productvendorstocknumber] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[productvendorcostmethod] [int] NULL,
[productvendorcosttable] [int] NULL,
[productvendorcost] [decimal] (19, 4) NULL,
[productvendorcostrate2] [decimal] (19, 4) NULL,
[productvendorcostrate3] [decimal] (19, 4) NULL,
[productusercostmethod] [int] NULL,
[productusercosttable] [int] NULL,
[productusercost] [decimal] (19, 4) NULL,
[productqty] [decimal] (38, 10) NULL,
[productunits] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[productshipinitzip] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[productavailable] [int] NOT NULL,
[productdisplaytousers] [int] NOT NULL,
[productdisplayorder] [int] NULL,
[producttimeoutdays] [decimal] (38, 10) NULL,
[productsearchgroups] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[producttaxtable] [int] NULL,
[productsplittable] [int] NOT NULL,
[productinitdate] [datetime2] NULL,
[productlastupdatewhen] [datetime2] NULL,
[productlastupdatewho] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[producttaxpoint] [int] NULL,
[productspecialprocessing] [nvarchar] (48) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[productteaserstoryid] [decimal] (10, 0) NULL,
[productinfostoryid] [decimal] (10, 0) NULL,
[productvolumediscountcategory] [int] NULL,
[prodvolumediscountsubcategory] [int] NULL,
[prodvolumediscountdiscntcode] [int] NULL,
[prodvolumediscountdiscntentry] [int] NULL,
[prodoutofstockfullfillprocess] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[prodinstockfullfillmentprocess] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[prodcustomvolumediscountinplay] [int] NOT NULL,
[prodsubscriptfreetimedatepart] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[prodsubscripfreetimeincrement] [int] NULL,
[prodincrementloyaltypntprogram] [nvarchar] (48) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[prodloyaltypntprogramincrement] [nvarchar] (192) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[productcustomshipserveinplay] [int] NOT NULL,
[productdetails4] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[productonsalediscount] [nvarchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[productshipinitstate] [int] NULL,
[productshipinitcounty] [int] NULL,
[productcurrentstockquantity] [decimal] (10, 0) NULL,
[productlowstocklevelquantity] [decimal] (10, 0) NULL,
[productdetails] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[productvalidshippingoptions] [nvarchar] (96) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[productaddadvsecroles] [nvarchar] (96) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[productadduserretrcodes] [nvarchar] (192) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[productglcode] [nvarchar] (384) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[productinactive] [int] NOT NULL,
[refundaltpaymenttype] [decimal] (10, 0) NULL,
[productentityid] [int] NULL,
[productdisplaydescription] [nvarchar] (384) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[channel1merchid] [int] NULL,
[channel2merchid] [int] NULL,
[channel3merchid] [int] NULL,
[channel4merchid] [int] NULL,
[channel5merchid] [int] NULL,
[id] [decimal] (20, 0) NOT NULL,
[client_id] [decimal] (10, 0) NOT NULL,
[settlement_code_id] [decimal] (18, 0) NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [bkp].[Sync_temp_ods_VTX_products] ADD CONSTRAINT [PK__Sync_tem__19364FD2DE467A5A] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

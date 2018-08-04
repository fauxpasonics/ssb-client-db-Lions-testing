SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [etl].[vw_Load_tc_VTX_ordergroups] AS (
	SELECT CAST('etl.vw_Load_tc_VTX_ordergroups' AS NVARCHAR(255)) ETL__Source,
		ordergroup, ordergroupsegregationcode, ordergrouppaymentmode, ordergroupshipservechargemode, ordergroupmasterorderid, ordergroupinituser,
        ordergroupenteredby, ordergrouporiginaltotal, ordergroupgrandtotal, ordergrouptotaldiscounts, ordergrouptotaltax, ordergroupshippingtotal,
        ordergroupshippingdiscounts, ordergroupshippingtax, ordergroupservicechgtotal, ordergroupservicechgdiscount, ordergroupservicechgtax,
        ordergrouptotalpaymentsreq, ordergrouptotalaltpayments, ordergrouprelatedestabtype, ordergrouprelatedestabkey, ordergroupordertype,
        ordergroupsingleormultiuser, ordergroupshippingdestmode, ordergrouprelatedestabrelation, ordergroupshipname, ordergroupshipaddress1,
        ordergroupshipaddress2, ordergroupshipcity, ordergroupshipst, ordergroupshipcountry, ordergroupshipzip, ordergroupshipstatecode, ordergroupshippingzone,
        ordergroupshippingzoneinvalid, usercountycode, ordergroupinitialep, ordergroupcheckoutep, ordergroupshipcountycode, ordergroupuserid,
        ordergroupconfirmationnumber, ordergrouptimetoplaceorder, ordergroupbottomlineorigtotal, ordergroupbottomlinegrandtotal, ordergroupbottomlineactivtotal,
        ordergroupbottomlinetotaltax, ordergroupbottomlinetotaldisc, ordergroupactivetotal, ordergroupshippingactivetotal, ordergroupservicechgactivtotal,
        ordergrouptotalpaymentscleared, ordergrouptotalpaymentsonhold, ordergrouptotalpaymentsinqueue, ordergrouppaymentbalance, ordergroupdate,
        ordergroupclosedondate, ordergroupstatus, ordergrouptimetocompleteorder, ordergroupclosed, ordergrouplastupdated, ordergroupinvoicenumber, commentid,
        ordergroupoutletid, ordergrouppaymentstatus, eticketemail, customerid, willcallcode, addressid, willcallname, client_id, tickets_ever_in_fs,
        convertfsunpaid, tags, ordergrouppaymentbypass

	FROM ods.VTX_ordergroups (NOLOCK)
	WHERE ETL_Sync_UpdatedDate > GETDATE() - 3
	
)



GO

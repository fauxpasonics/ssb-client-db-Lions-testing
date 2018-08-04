SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE VIEW [ro].[vw_VTX_OrderItemDetails]
AS
SELECT oi.order_id ,
		tso.tixoutletdesc,
        oi.id Order_Item_Id,
		og.ordergroupdate ,
		oi.sale_date ,
        oi.value ,
        oi.paid_amount ,
        oi.product_id ,
        p.productdescription ,
        oi.inventory_type Inventory_Type_Code ,
		CASE WHEN oi.inventory_type=2 THEN 'Ticket' WHEN oi.inventory_type=0 THEN 'Fee' ELSE 'Unknown' END AS Inventory_Type ,
        oi.number1 Event_Id,
        te.tixeventtitleshort Event_Name,
        --f.name ,
        oi.number2 Zone_ID,
        ez.tixeventzonedesc Zone_Name,
        oi.number3 Seat_Group_Id,
        sec.tixseatgroupdesc Section,
		sg.tixseatgroupdesc Row,
        --oi2.id ,
        oi.number4 Seat_Id,
        tezs.tixseatdesc Seat_Num,
		--tezs.tixseatid ,
        oi.number5 Offer_Id,
        o.name Offer_Name,
		o.Lookup Offer_Lookup_Id,
        oi.number6 Offer_Group_Id,
        ogs.name Offer_Group_Name,
        oi.number7 Price_Code,
        pc.tixsyspricecodedesc Price_Code_Name,
		pct.tixsyspricecodetypedesc Price_Code_Type ,
        oi.number8 Price_Level_Id,
        pl.tixsyspriceleveldesc Price_Level_Name,
		oi.sale_user ,
		aecr.userid AccountRep ,
		og.Tags,
		oi.canceled
 FROM   ods.VTX_order_items oi ( NOLOCK )
		JOIN ods.VTX_ordergroups og ( NOLOCK ) ON og.ordergroup=oi.order_id
        JOIN ods.VTX_products p ( NOLOCK ) ON p.id = oi.product_id
        LEFT JOIN ods.VTX_tixevents te ( NOLOCK ) ON te.tixeventid = oi.number1
                                                     AND oi.inventory_type = 2
       -- LEFT JOIN ods.VTX_fees f ( NOLOCK ) ON f.id = oi.number1
                                              -- AND oi.inventory_type = 0
        LEFT JOIN ods.VTX_tixeventzones ez ( NOLOCK ) ON ez.tixeventzoneid = oi.number2
														 AND ez.tixeventid=oi.number1
                                                         AND oi.inventory_type = 2
        LEFT JOIN ods.VTX_tixeventzoneseatgroups sg ( NOLOCK ) ON sg.tixseatgroupid = oi.number3
                                                              AND sg.tixeventid = oi.number1
															  AND sg.tixeventzoneid=oi.number2
                                                              AND oi.inventory_type = 2
        --LEFT JOIN ods.VTX_order_items oi2 ( NOLOCK ) ON oi2.id = oi.number3
                                                        --AND oi.inventory_type = 0
        LEFT JOIN ods.VTX_tixeventzoneseats tezs ( NOLOCK ) ON oi.number4 = tezs.tixseatid
															AND tezs.tixeventid=oi.number1
															AND tezs.tixeventzoneid=oi.number2
															AND tezs.tixseatgroupid=oi.number3
															 AND oi.order_id=tezs.tixseatordergroupid
                                                              AND oi.inventory_type = 2
        LEFT JOIN ods.VTX_offers o ( NOLOCK ) ON o.id = oi.number5
                                                AND oi.inventory_type = 2
        LEFT JOIN ods.VTX_offer_groups ogs ( NOLOCK ) ON ogs.id = oi.number6
														AND ogs.offer_id=oi.number5
                                                         AND oi.inventory_type = 2
        LEFT JOIN ods.VTX_tixsyspricecodes pc ( NOLOCK ) ON pc.tixsyspricecodecode = oi.number7
                                                            AND oi.inventory_type = 2
        LEFT JOIN ods.VTX_tixsyspricelevels pl ( NOLOCK ) ON pl.tixsyspricelevelcode = oi.number8
                                                             AND oi.inventory_type = 2
		LEFT JOIN ods.VTX_aecustomerrelation aecr ( NOLOCK ) ON og.customerid=aecr.customerid
																AND aecr.aeroleid='3672.0000000000'
		LEFT JOIN ods.VTX_tixsysPriceCodeTypes pct ( NOLOCK ) ON pct.tixsyspricecodetype=pc.tixsyspricecodetype
		LEFT JOIN ods.VTX_tixeventzoneseatgroups sec ( NOLOCK ) ON sg.tixseatgroupparentgroup = sec.tixseatgroupid
                                                              AND sec.tixeventid = oi.number1
															  AND sec.tixeventzoneid=oi.number2
                                                              AND oi.inventory_type = 2
		LEFT JOIN ods.VTX_tixsysoutlets tso (NOLOCK) ON oi.sale_outlet=tso.tixoutletid
WHERE 1=1
AND oi.inventory_type=2
-- AND sec.tixseatgroupdesc IS NOT NULL
-- AND oi.order_id=37056603
-- ORDER BY Order_Item_Id

GO

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






CREATE PROC [etl].[Cust_FactTicketSalesProcessing_VTX]
AS
/*========================
NEW VERSION 12-06-2017 CTW
========================*/
 WITH   GameCount ( ordernum, dimpricecodeid, gamect )
          AS ( SELECT   fts.OrderNum ,
                        fts.DimPriceCodeId ,
                        COUNT(DISTINCT fts.DimEventId) gamect
               FROM     dbo.FactTicketSales fts ( NOLOCK )
               GROUP BY fts.OrderNum ,
                        fts.DimPriceCodeId
             )
UPDATE fts
--SELECT DISTINCT
--    dpc.PriceCodeDesc,
    SET fts.dimtickettypeid= CASE
        WHEN dpc.PriceCodeDesc LIKE '%Season%' 
		AND dpc.PriceCodeDesc LIKE '%Parking%' AND dpc.PriceCodeDesc LIKE '%Suite%'
		THEN 14
		WHEN dpc.PriceCodeDesc LIKE '%Season%' 
		AND dpc.PriceCodeDesc LIKE '%Premium%' AND dpc.PriceCodeDesc LIKE '%Suite%'
		THEN 8
		WHEN dpc.PriceCodeDesc LIKE '%Season%' 
		AND dpc.PriceCodeDesc NOT LIKE '%Premium%' AND dpc.PriceCodeDesc NOT LIKE '%Parking%' AND dpc.PriceCodeDesc LIKE '%Suite%'
		THEN 5
		WHEN dpc.PriceCodeDesc LIKE '%Season%' AND dpc.PriceCodeDesc LIKE '%Parking%'
		THEN 14
		WHEN dpc.PriceCodeDesc LIKE '%Season%' 
		AND dpc.PriceCodeDesc NOT LIKE '%Parking%' AND dpc.PriceCodeDesc NOT LIKE '%Suite%' 
		THEN 1
		WHEN dpc.PriceCodeDesc LIKE '%Comp%' 
		AND (dpc.PriceCodeDesc LIKE '%loge%' OR dpc.PriceCodeDesc LIKE '%FLS%')
		THEN 12
		WHEN dpc.PriceCodeDesc LIKE '%Comp%' 
		AND dpc.PriceCodeDesc NOT LIKE '%loge%' AND dpc.PriceCodeDesc NOT LIKE '%FLS%'
		THEN 11
		WHEN dpc.PriceCodeDesc NOT LIKE '%Season%' 
		AND dpc.PriceCodeDesc LIKE '%Parking%'
		THEN 15
		WHEN dpc.PriceCodeDesc LIKE '%Individual%'
		AND (dpc.PriceCodeDesc LIKE '%Group%' OR dpc.PriceCodeDesc LIKE '%RT%') AND dpc.PriceCodeDesc NOT LIKE '%partners%'
		THEN 9
		WHEN dpc.PriceCodeDesc ='G - Group'
		THEN 9
		WHEN dpc.PriceCodeDesc LIKE '%Individual%'
		AND dpc.PriceCodeDesc LIKE '%Fan Plan%'
		THEN 4
		WHEN dpc.PriceCodeDesc LIKE '%Fan Plan%'
		THEN 4
		WHEN dpc.PriceCodeDesc LIKE '%Individual%'
		AND (dpc.PriceCodeDesc LIKE '%PN%' OR dpc.PriceCodeDesc LIKE '%PR%')AND dpc.PriceCodeDesc NOT LIKE '%partners%' AND dpc.PriceCodeDesc NOT LIKE '%taproom%'
		THEN 3
		WHEN dpc.PriceCodeDesc LIKE '%Individual%'
		AND dpc.PriceCodeDesc LIKE '%Suite%' AND dpc.PriceCodeDesc NOT LIKE'%lease%'
		THEN 6
		WHEN dpc.PriceCodeDesc LIKE '%Individual%'
		AND dpc.PriceCodeDesc LIKE '%Suite%' AND dpc.PriceCodeDesc LIKE'%lease%'
		THEN 5
		WHEN dpc.PriceCodeDesc LIKE '%Individual%'
		AND dpc.PriceCodeDesc NOT LIKE '%Group%' AND dpc.PriceCodeDesc NOT LIKE '%Fan Plan%' AND dpc.PriceCodeDesc NOT LIKE '%Suite%'
		THEN 10
		WHEN dpc.PriceCodeDesc LIKE '%Premium%'
		AND dpc.PriceCodeDesc LIKE '%non%'
		THEN 8
		WHEN dpc.PriceCodeDesc LIKE '%Premium%'
		AND dpc.PriceCodeDesc NOT LIKE '%non%'
		THEN 7
		WHEN dpc.PriceCodeDesc IN ('Indivdiual 9','I - Ind Game')
		THEN 10
		WHEN dpc.PriceCodeDesc LIKE 'GA%'
		THEN 10
		WHEN dpc.PriceCodeDesc = 'SRO-The Lounge'
		THEN 1
		WHEN dpc.PriceCodeDesc LIKE 'Credential%'
		AND dpc.PriceCodeDesc NOT LIKE '%Season%' OR dpc.PriceCodeDesc IN ('Credentail-Media','Crendential Legend')
		THEN 10
		WHEN dpc.PriceCodeDesc LIKE 'Credential%'
		AND dpc.PriceCodeDesc LIKE '%season%'
		THEN 1
		WHEN dpc.PriceCodeDesc LIKE '%Playoffs%'
		THEN 10
		WHEN dpc.PriceCodeDesc='Insurance'
		THEN 16
		WHEN dpc.PriceCodeDesc LIKE '%Deposit%'
		THEN 10
		WHEN dpc.PriceCodeDesc LIKE 'RV%'
		THEN 10
		WHEN dpc.PriceCodeDesc LIKE 'STM%'
		THEN 10
		WHEN dpc.PriceCodeDesc IN ('A'
		,'A - Base'
		,'Adult'
		,'AS'
		,'AU - Youth/Charity'
		,'Community PARTNER'
		,'Discount'
		,'Fast Pass Entry'
		,'Field Promotions'
		,'FP8'
		,'Full Price'
		,'Partnership'
		,'Pregame Field Reporter'
		,'Tunnel Club Wait List'
		,'VIP 1')
		THEN 10
		WHEN dpc.PriceCodeDesc LIKE '%Suite%' AND dpc.PriceCodeDesc NOT LIKE'%lease%'
		THEN 6
		WHEN dpc.PriceCodeDesc LIKE '%Suite%' AND dpc.PriceCodeDesc LIKE'%lease%'
		THEN 5
		ELSE -1 END,
    fts.dimplantypeid= CASE
        WHEN dpc.PriceCodeDesc LIKE '%Season%' 
		AND dpc.PriceCodeDesc LIKE '%Parking%' AND dpc.PriceCodeDesc LIKE '%Suite%'
		THEN 8
		WHEN dpc.PriceCodeDesc LIKE '%Season%' 
		AND dpc.PriceCodeDesc LIKE '%Premium%' AND dpc.PriceCodeDesc LIKE '%Suite%'
		THEN 8
		WHEN dpc.PriceCodeDesc LIKE '%Season%' 
		AND dpc.PriceCodeDesc NOT LIKE '%Premium%' AND dpc.PriceCodeDesc NOT LIKE '%Parking%' AND dpc.PriceCodeDesc LIKE '%Suite%' AND dpc.PriceCodeDesc LIKE '%new%' AND dpc.PriceCodeDesc NOT LIKE '%Renew%'
		THEN 1
		WHEN dpc.PriceCodeDesc LIKE '%Season%' 
		AND dpc.PriceCodeDesc NOT LIKE '%Premium%' AND dpc.PriceCodeDesc NOT LIKE '%Parking%' AND dpc.PriceCodeDesc LIKE '%Suite%' AND dpc.PriceCodeDesc LIKE '%Renew%'
		THEN 2
		WHEN dpc.PriceCodeDesc LIKE '%Season%' AND dpc.PriceCodeDesc LIKE '%Parking%'
		THEN 8
		WHEN dpc.PriceCodeDesc LIKE '%Season%' 
		AND dpc.PriceCodeDesc NOT LIKE '%Parking%' AND dpc.PriceCodeDesc NOT LIKE '%Suite%' AND dpc.PriceCodeDesc LIKE '%new%' AND dpc.PriceCodeDesc NOT LIKE '%Renew%'
		THEN 1
		WHEN dpc.PriceCodeDesc LIKE '%Season%' 
		AND dpc.PriceCodeDesc NOT LIKE '%Parking%' AND dpc.PriceCodeDesc NOT LIKE '%Suite%' AND dpc.PriceCodeDesc LIKE '%Renew%' AND dpc.PriceCodeDesc NOT LIKE '%sponsorship%' AND dpc.PriceCodeDesc NOT LIKE '%BR%'
		THEN 2
		WHEN dpc.PriceCodeDesc LIKE '%Season%' 
		AND dpc.PriceCodeDesc NOT LIKE '%Parking%' AND dpc.PriceCodeDesc NOT LIKE '%Suite%' AND dpc.PriceCodeDesc LIKE '%sponsorship%'
		THEN 4
		WHEN dpc.PriceCodeDesc LIKE '%Season%' 
		AND dpc.PriceCodeDesc NOT LIKE '%Parking%' AND dpc.PriceCodeDesc NOT LIKE '%Suite%' AND dpc.PriceCodeDesc LIKE '%BR%'
		THEN 7
		WHEN dpc.PriceCodeDesc LIKE '%Comp%' 
		AND (dpc.PriceCodeDesc LIKE '%loge%' OR dpc.PriceCodeDesc LIKE '%FLS%')
		THEN 8
		WHEN dpc.PriceCodeDesc LIKE '%Comp%' 
		AND dpc.PriceCodeDesc NOT LIKE '%loge%' AND dpc.PriceCodeDesc NOT LIKE '%FLS%'
		THEN 8
		WHEN dpc.PriceCodeDesc NOT LIKE '%Season%' 
		AND dpc.PriceCodeDesc LIKE '%Parking%'
		THEN 8
		WHEN dpc.PriceCodeDesc LIKE '%Individual%'
		AND (dpc.PriceCodeDesc LIKE '%Group%' OR dpc.PriceCodeDesc LIKE '%RT%') AND dpc.PriceCodeDesc NOT LIKE '%partners%'
		THEN 8
		WHEN dpc.PriceCodeDesc LIKE '%Individual%'
		AND dpc.PriceCodeDesc LIKE '%Fan Plan%'
		THEN 8
		WHEN dpc.PriceCodeDesc LIKE '%Individual%'
		AND (dpc.PriceCodeDesc LIKE '%PN%' OR dpc.PriceCodeDesc LIKE '%PR%')
		THEN 8
		WHEN dpc.PriceCodeDesc LIKE '%Individual%'
		AND dpc.PriceCodeDesc LIKE '%Suite%' AND dpc.PriceCodeDesc NOT LIKE'%lease%'
		THEN 8
		WHEN dpc.PriceCodeDesc LIKE '%Individual%'
		AND dpc.PriceCodeDesc LIKE '%Suite%' AND dpc.PriceCodeDesc LIKE'%lease%'
		THEN 8
		WHEN dpc.PriceCodeDesc LIKE '%Individual%'
		AND dpc.PriceCodeDesc NOT LIKE '%Group%' AND dpc.PriceCodeDesc NOT LIKE '%RT%' AND dpc.PriceCodeDesc NOT LIKE '%Fan Plan%' AND dpc.PriceCodeDesc NOT LIKE '%PN%' AND dpc.PriceCodeDesc NOT LIKE '%PR%' AND dpc.PriceCodeDesc NOT LIKE '%Suite%'
		THEN 8
		WHEN dpc.PriceCodeDesc LIKE '%Premium%'
		AND dpc.PriceCodeDesc LIKE '%non%'
		THEN 8
		WHEN dpc.PriceCodeDesc LIKE '%Premium%'
		AND dpc.PriceCodeDesc NOT LIKE '%non%'
		THEN 8
		WHEN dpc.PriceCodeDesc IN ('Indivdiual 9','I - Ind Game')
		THEN 8
		WHEN dpc.PriceCodeDesc LIKE 'GA%'
		THEN 8
		WHEN dpc.PriceCodeDesc = 'SRO-The Lounge'
		THEN 1
		WHEN dpc.PriceCodeDesc LIKE '%N - Season'
		THEN 1
		WHEN dpc.PriceCodeDesc LIKE '%R - Season'
		THEN 2
		WHEN dpc.PriceCodeDesc IN ('Credential-Season Laminate'
		,'S - Season'
		,'Season Ticket Membership'
		,'Season-Youth')
		THEN -1
		ELSE 8
    END
FROM dbo.FactTicketSales fts 
    JOIN dbo.DimEventZone ez 
        ON ez.DimEventZoneId = fts.DimEventZoneId
    --JOIN ods.VTX_tixeventzones ez ( NOLOCK ) ON fts.SSID_Event_Id = ez.tixeventid
    --                                            AND fts.SSID_Event_Zone = ez.tixeventzoneid
    JOIN dbo.DimPriceType pct 
        ON pct.DimPriceTypeId = fts.DimPriceTypeId
    JOIN dbo.DimPriceCode dpc 
        ON dpc.DimPriceCodeId = fts.DimPriceCodeId
    --JOIN ods.VTX_tixevents e ( NOLOCK ) ON fts.SSID_Event_Id = e.tixeventid
    JOIN GameCount gc ON gc.ordernum = fts.OrderNum
                         AND gc.dimpricecodeid = fts.DimPriceCodeId
    JOIN dbo.DimEvent de 
        ON de.DimEventId = fts.DimEventId
           AND de.ETL__EndDate IS NULL
    JOIN dbo.DimOffer o 
        ON o.DimOfferId = fts.DimOfferId
	JOIN dbo.DimSeason ds 
		ON ds.DimSeasonId = fts.DimSeasonId
--LEFT JOIN ods.VTX_tixsyspricecodes tspc ( NOLOCK ) ON fts.SSID_Price_Code = tspc.tixsyspricecodecode
--LEFT JOIN ods.VTX_shippingoptions so (NOLOCK) ON 
WHERE fts.DimSeasonId <> -1
AND ds.Activity  IN ('Lions', 'Entertainment') AND ds.SeasonClass='Event'
--ORDER BY dpc.PriceCodeDesc


/*===================
OLD VERSION 
====================*/
/*WITH   GameCount ( ordernum, dimpricecodeid, gamect )
          AS ( SELECT   fts.OrderNum ,
                        fts.DimPriceCodeId ,
                        COUNT(DISTINCT fts.DimEventId) gamect
               FROM     dbo.FactTicketSales fts ( NOLOCK )
               GROUP BY fts.OrderNum ,
                        fts.DimPriceCodeId
             )
    --SELECT 
UPDATE  fts
SET     fts.DimTicketTypeId = CASE WHEN ez.EventZoneName = 'Admissions'
                                        AND pct.PriceTypeDesc LIKE 'Season%'
                                        AND gc.gamect >= 10 THEN 1
                                   WHEN ez.EventZoneName = 'Admissions'
                                        AND pct.PriceTypeDesc LIKE 'Season%'
                                        AND gc.gamect <= 9
                                        AND gc.gamect >= 6 THEN 2
                                   WHEN ez.EventZoneName = 'Admissions'
                                        AND pct.PriceTypeDesc LIKE 'Season%'
                                        AND gc.gamect <= 5
                                        AND gc.gamect >= 4 THEN 3
                                   WHEN ez.EventZoneName = 'Admissions'
                                        AND pct.PriceTypeDesc LIKE 'Season%'
                                        AND gc.gamect <= 3 THEN 4
                                   WHEN ez.EventZoneName = 'Suites'
                                        AND pct.PriceTypeDesc LIKE 'Season%'
                                   THEN 5
                                   WHEN ez.EventZoneName = 'Suites'
                                        AND pct.PriceTypeDesc = 'Individual'
                                   THEN 6
                                   WHEN (ez.EventZoneName = 'Suites Premium' OR EventZoneName LIKE '%Suite Premium')
                                        AND de.EventCode LIKE '%_SP' 
								   THEN 7
                                   WHEN (ez.EventZoneName = 'Suites Premium' OR EventZoneName LIKE '%Suite Premium')
                                        AND de.EventCode NOT LIKE '%_SP'
                                   THEN 8
                                   WHEN (ez.EventZoneName = 'Admissions'
                                        AND pct.PriceTypeDesc LIKE 'Group%')
										OR (ez.EventZoneName = 'Admissions'
										AND pct.PriceTypeDesc ='Individual'
										AND dpc.PriceCodeName LIKE '%Group%')
                                   THEN 9
                                   WHEN ez.EventZoneName = 'Admissions'
                                        AND pct.PriceTypeDesc = 'Individual'
										AND dpc.PriceCodeName NOT LIKE '%Group%'
                                   THEN 10
                                   WHEN ez.EventZoneName = 'Admissions'
                                        AND fts.TotalRevenue = '0.00'
                                        AND o.OfferDesc NOT LIKE '%Season%'
                                   THEN 11
                                   WHEN ez.EventZoneName = 'Admissions'
                                        AND fts.TotalRevenue = '0.00'
                                        AND o.OfferDesc LIKE '%Season%'
                                        AND o.OfferDesc NOT LIKE '%Preseason%'
                                   THEN 12
                                   WHEN ez.EventZoneName = 'Admissions'
                                        AND fts.TotalRevenue = '0.00'
                                        AND o.OfferDesc LIKE '%Preseason%'
                                   THEN 11
                                   WHEN ez.EventZoneName LIKE 'Parking%'
                                        AND pct.PriceTypeDesc = 'Comp'
                                   THEN 13
                                   WHEN ez.EventZoneName LIKE 'Parking%'
                                        AND pct.PriceTypeDesc LIKE '%Season%'
                                   THEN 14
                                   WHEN ez.EventZoneName LIKE 'Parking%'
                                        AND pct.PriceTypeDesc = 'Individual'
                                   THEN 15
                                   WHEN ez.EventZoneName NOT IN ( 'Admissions',
                                                              'Suites' )
                                        AND ez.EventZoneName NOT LIKE 'Parking%'
					--AND ez.tixeventzonedesc NOT LIKE''
                                   THEN 16
                                   WHEN ez.EventZoneName LIKE 'Suite%'
                                        AND pct.PriceTypeDesc = 'Comp'
                                   THEN 17
                                   ELSE -1
                              END ,
        fts.DimPlanTypeId = CASE WHEN pct.PriceTypeDesc = 'Season - New'
                                      AND dpc.PriceCodeDesc NOT LIKE '%-BR'
                                 THEN 1
                                 WHEN pct.PriceTypeDesc = 'Season - Renew'
                                      AND dpc.PriceCodeDesc NOT LIKE '%-BR'
                                 THEN 2
                                 WHEN pct.PriceTypeDesc = 'Sponsor - New'
                                 THEN 3
                                 WHEN pct.PriceTypeDesc = 'Sponsor - Renew'
                                 THEN 4
                                 WHEN pct.PriceTypeDesc LIKE 'Comp%Emp'
                                      OR dpc.PriceCodeDesc LIKE 'Comp%Emp%'
                                 THEN 5
                                 WHEN pct.PriceTypeDesc = 'Season - New'
                                      AND dpc.PriceCodeDesc LIKE '%-BR' THEN 6
                                 WHEN pct.PriceTypeDesc = 'Season - Renew'
                                      AND dpc.PriceCodeDesc LIKE '%-BR' THEN 7
                                 WHEN pct.PriceTypeDesc = 'Individual'
                                      OR ( ez.EventZoneName = 'Suites'
                                           AND pct.PriceTypeDesc NOT LIKE 'Season%'
                                           AND o.OfferName NOT LIKE '%Season%'
                                         )
                                      OR ( pct.PriceTypeDesc = 'Admissions'
                                           AND o.OfferDesc NOT LIKE '%Season%'
                                         ) THEN 8
                            END
FROM    dbo.FactTicketSales fts ( NOLOCK )
        JOIN dbo.DimEventZone ez ( NOLOCK ) ON ez.DimEventZoneId = fts.DimEventZoneId
            --JOIN ods.VTX_tixeventzones ez ( NOLOCK ) ON fts.SSID_Event_Id = ez.tixeventid
            --                                            AND fts.SSID_Event_Zone = ez.tixeventzoneid
        JOIN dbo.DimPriceType pct ( NOLOCK ) ON pct.DimPriceTypeId = fts.DimPriceTypeId
        JOIN dbo.DimPriceCode dpc ( NOLOCK ) ON dpc.DimPriceCodeId = fts.DimPriceCodeId
            --JOIN ods.VTX_tixevents e ( NOLOCK ) ON fts.SSID_Event_Id = e.tixeventid
        JOIN GameCount gc ON gc.ordernum = fts.OrderNum
                             AND gc.dimpricecodeid = fts.DimPriceCodeId
        JOIN dbo.DimEvent de ( NOLOCK ) ON de.DimEventId = fts.DimEventId
                                           AND de.ETL__EndDate IS NULL
        JOIN dbo.DimOffer o ( NOLOCK ) ON o.DimOfferId = fts.DimOfferId
            --LEFT JOIN ods.VTX_tixsyspricecodes tspc ( NOLOCK ) ON fts.SSID_Price_Code = tspc.tixsyspricecodecode
				--LEFT JOIN ods.VTX_shippingoptions so (NOLOCK) ON 
WHERE   fts.DimSeasonId <> -1
    --ORDER BY --fts.SSID_Cust_Id, 
    --        fts.OrderNum
	;
		

                --INNER JOIN ( SELECT c.accountnumber ,
                --                    LEFT(e.tixeventlookupid, 4) SeasonCode ,
                --                    pct.tixsyspricecodetypedesc ,
                --                    COUNT(DISTINCT e.tixeventlookupid) SeasonGameCnt
                --             FROM   ods.VTX_tixeventzoneseats a ( NOLOCK )
                --                    INNER JOIN ods.VTX_ordergroups og ( NOLOCK ) ON a.tixseatordergroupid = og.ordergroup
                --                    INNER JOIN ods.VTX_customers c ( NOLOCK ) ON og.customerid = c.id
                --                    INNER JOIN ods.VTX_tixevents e ( NOLOCK ) ON a.tixeventid = e.tixeventid
                --                    INNER JOIN ods.VTX_tixsyspricecodes pc ( NOLOCK ) ON a.tixseatpricecode = pc.tixsyspricecodecode
                --                    INNER JOIN ods.VTX_tixsyspricecodetypes pct ( NOLOCK ) ON pc.tixsyspricecodetype = pct.tixsyspricecodetype
                --                    INNER JOIN ods.VTX_tixeventzones ez ( NOLOCK ) ON a.tixeventid = ez.tixeventid
                --                                              AND a.tixeventzoneid = ez.tixeventzoneid
                --             WHERE  ez.tixeventzonedesc = 'Admissions'
                --             GROUP BY c.accountnumber ,
                --                    LEFT(e.tixeventlookupid, 4) ,
                --                    pct.tixsyspricecodetypedesc
                --           ) x ON x.accountnumber = fts.SSID_Cust_Id
                --                  AND x.SeasonCode = LEFT(e.tixeventlookupid,
                --                                          4);

			--SELECT * FROM ods.VTX_tixsyspricecodes

			--SELECT * FROM dbo.FactTicketSales WHERE DimOfferId =-1
GO
*/

GO

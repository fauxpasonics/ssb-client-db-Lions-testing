SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






CREATE PROCEDURE [etl].[Cust_FactTicketSalesProcessing]
(
	@BatchId NVARCHAR(50) = '00000000-0000-0000-0000-000000000000',
	@Options NVARCHAR(MAX) = null
)

AS

BEGIN

UPDATE fts
--SELECT fts.ETL__SSID_TM_acct_id,
--       de.EventCode,
--       de.EventName,
--       dpl.PlanCode,
--       dpl.PlanName,
--       dpc.PriceCode,
--       fts.TM_purchase_price,
--       t.section_name,
--       t.comp_name,
--       t.delivery_method_name,
SET fts.dimtickettypeid = CASE
           WHEN dpl.PlanCode LIKE 'DL%10'
                AND dpc.PC2 IN ( 'N', 'R' )
                AND fts.TM_purchase_price != '0.00' THEN
               2
           WHEN (
                    dpl.PlanCode LIKE 'DL%6'
                    OR dpl.PlanCode LIKE 'DL%7'
                    OR dpl.PlanCode LIKE 'DL%8'
                    OR dpl.PlanCode LIKE 'DL%9'
                )
                AND dpc.PC2 IN ( 'N', 'R' )
                AND fts.TM_purchase_price != '0.00' THEN
               3
           WHEN (
                    dpl.PlanCode LIKE 'DL%4'
                    OR dpl.PlanCode LIKE 'DL%5'
                )
                AND dpc.PC2 IN ( 'P', 'Q' ) THEN
               4
           WHEN dpl.PlanCode LIKE 'DL%3'
                AND dpc.PC2 = 'F' THEN
               5
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP[0-9]%'
                )
                AND dpc.PC2 IN ( 'N', 'R' )
                AND ISNULL(dpc.PC3, '') IN ( 'Y', 'Z' ) THEN
               6
           WHEN de.EventCode LIKE 'ST%'
                AND dpc.PC2 = 'I' THEN
               7
           WHEN de.EventCode LIKE 'SP%' THEN
               8
           WHEN de.EventCode LIKE 'DL%'
                AND de.EventCode NOT LIKE 'DL%DP'
                AND dpc.PC2 = 'G' THEN
               10
           WHEN de.EventCode LIKE 'DL%'
                AND de.EventCode NOT LIKE 'DL%DP'
                AND dpc.PC2 IN ( 'I', 'D' )
                AND fts.TM_purchase_price != '0.00' THEN
               11
           WHEN de.EventCode LIKE 'DL%'
                AND de.EventCode NOT LIKE 'DL%DP'
                AND dpc.PC2 = 'I'
                AND fts.TM_purchase_price = '0.00' THEN
               12
           WHEN dpl.PlanCode LIKE 'DL%'
                AND de.EventCode NOT LIKE 'DL%DP'
                AND dpc.PC2 IN ( 'N', 'R' )
                AND fts.TM_purchase_price = '0.00' THEN
               13
           WHEN de.EventCode LIKE 'PK%'
                AND dpc.PC2 = 'I'
                AND fts.TM_purchase_price = '0.00' THEN
               14
           WHEN (
                    de.EventCode LIKE 'PK[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'PK%'
                )
                AND dpc.PC2 = 'I'
                AND fts.TM_purchase_price != '0.00' THEN
               16
           WHEN (
                    de.EventCode LIKE 'PK[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'PK%'
                )
                AND dpc.PC2 IN ( 'R', 'N' ) THEN
               15
           WHEN de.EventCode LIKE 'FEE%'
                OR de.EventCode LIKE 'SD[0-9]%'
                OR de.EventCode LIKE 'DL%DP%' THEN
               17
           ELSE
               -1
       END,
       fts.dimplantypeid = CASE
           WHEN dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                AND ISNULL(dpc.PC2, '') IN ( 'N', 'P' )
                AND ISNULL(dpc.PC3, '') NOT IN ( 'B', 'K' )
                AND t.comp_name = 'Not Comp' THEN
               1
           WHEN dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                AND ISNULL(dpc.PC2, '') IN ( 'R', 'Q' )
                AND ISNULL(dpc.PC3, '') NOT IN ( 'B', 'K' )
                AND t.comp_name = 'Not Comp' THEN
               2
           WHEN dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                AND ISNULL(dpc.PC2, '') IN ( 'N', 'P' )
                AND ISNULL(dpc.PC3, '') = 'K' THEN
               3
           WHEN dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                AND ISNULL(dpc.PC2, '') IN ( 'R', 'Q' )
                AND ISNULL(dpc.PC3, '') = 'K' THEN
               4
           WHEN dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                AND ISNULL(dpc.PC2, '') IN ( 'R', 'N' )
                AND t.comp_name LIKE '%Other Club Employees' THEN
               5
           WHEN dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                AND ISNULL(dpc.PC2, '') IN ( 'N', 'P' )
                AND ISNULL(dpc.PC3, '') = 'B' THEN
               6
           WHEN dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                AND ISNULL(dpc.PC2, '') IN ( 'R', 'Q' )
                AND ISNULL(dpc.PC3, '') = 'B' THEN
               7
           WHEN de.EventCode LIKE 'FEE%'
                OR de.EventCode LIKE 'FF%'
                OR dpl.PlanCode LIKE 'PK%'
                OR de.EventCode LIKE 'PK%' THEN
               0
           WHEN de.EventCode LIKE 'DL[0-9][0-9]DPST' THEN
               1
           ELSE
               -1
       END ,
       fts.Dimticketclassid = CASE
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP10'
                )
                AND ISNULL(dpc.PC1, '')
                BETWEEN 'A' AND 'R'
                AND ISNULL(dpc.PC2, '') = 'N'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Ticket Stock Delivery' THEN
               1
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP10'
                )
                AND ISNULL(dpc.PC1, '')
                BETWEEN '1' AND '7'
                AND ISNULL(dpc.PC2, '') = 'N'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Ticket Stock Delivery' THEN
               2
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP10'
                )
                AND ISNULL(dpc.PC1, '') = 'U'
                AND ISNULL(dpc.PC2, '') = 'N'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Ticket Stock Delivery' THEN
               3
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP10'
                )
                AND ISNULL(dpc.PC1, '') = 'S'
                AND ISNULL(dpc.PC2, '') = 'N'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Ticket Stock Delivery' THEN
               4
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP10'
                )
                AND ISNULL(dpc.PC1, '') IN ( '8', '9' )
                AND ISNULL(dpc.PC2, '') = 'N'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Ticket Stock Delivery' THEN
               5
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP10'
                )
                AND ISNULL(dpc.PC1, '')
                BETWEEN 'A' AND 'R'
                AND ISNULL(dpc.PC2, '') = 'R'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Ticket Stock Delivery' THEN
               6
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP10'
                )
                AND ISNULL(dpc.PC1, '')
                BETWEEN '1' AND '7'
                AND ISNULL(dpc.PC2, '') = 'R'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Ticket Stock Delivery' THEN
               7
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP10'
                )
                AND ISNULL(dpc.PC1, '') = 'U'
                AND ISNULL(dpc.PC2, '') = 'R'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Ticket Stock Delivery' THEN
               8
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP10'
                )
                AND ISNULL(dpc.PC1, '') = 'S'
                AND ISNULL(dpc.PC2, '') = 'R'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Ticket Stock Delivery' THEN
               9
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP10'
                )
                AND ISNULL(dpc.PC1, '') IN ( '8', '9' )
                AND ISNULL(dpc.PC2, '') = 'R'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Ticket Stock Delivery' THEN
               10
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP10'
                )
                AND ISNULL(dpc.PC1, '')
                BETWEEN 'A' AND 'R'
                AND ISNULL(dpc.PC2, '') = 'N'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Mobile Delivery' THEN
               11
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP10'
                )
                AND ISNULL(dpc.PC1, '')
                BETWEEN '1' AND '7'
                AND ISNULL(dpc.PC2, '') = 'N'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Mobile Delivery' THEN
               12
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP10'
                )
                AND ISNULL(dpc.PC1, '') = 'U'
                AND ISNULL(dpc.PC2, '') = 'N'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Mobile Delivery' THEN
               13
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP10'
                )
                AND ISNULL(dpc.PC1, '') = 'S'
                AND ISNULL(dpc.PC2, '') = 'N'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Mobile Delivery' THEN
               14
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP10'
                )
                AND ISNULL(dpc.PC1, '') IN ( '8', '9' )
                AND ISNULL(dpc.PC2, '') = 'N'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Mobile Delivery' THEN
               15
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP10'
                )
                AND ISNULL(dpc.PC1, '')
                BETWEEN 'A' AND 'R'
                AND ISNULL(dpc.PC2, '') = 'R'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Mobile Delivery' THEN
               16
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP10'
                )
                AND ISNULL(dpc.PC1, '')
                BETWEEN '1' AND '7'
                AND ISNULL(dpc.PC2, '') = 'R'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Mobile Delivery' THEN
               17
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP10'
                )
                AND ISNULL(dpc.PC1, '') = 'U'
                AND ISNULL(dpc.PC2, '') = 'R'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Mobile Delivery' THEN
               18
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP10'
                )
                AND ISNULL(dpc.PC1, '') = 'S'
                AND ISNULL(dpc.PC2, '') = 'R'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Mobile Delivery' THEN
               19
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP10'
                )
                AND ISNULL(dpc.PC1, '') IN ( '8', '9' )
                AND ISNULL(dpc.PC2, '') = 'R'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Mobile Delivery' THEN
               20
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP10'
                )
                AND ISNULL(dpc.PC2, '') IN ( 'N', 'R' )
                AND fts.TM_purchase_price = '0.00'
                AND t.comp_name = 'NFL-Other Club Employees' THEN
               21
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP10'
                )
                AND ISNULL(dpc.PC2, '') IN ( 'N', 'R' )
                AND fts.TM_purchase_price = '0.00'
                AND t.comp_name = 'NFL-Coaches/Trainers' THEN
               22
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP10'
                )
                AND ISNULL(dpc.PC2, '') IN ( 'N', 'R' )
                AND fts.TM_purchase_price = '0.00'
                AND t.comp_name = 'NFL-Front Office' THEN
               23
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR (
                           dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                           AND RIGHT(dpl.PlanCode, 1) IN ( '6', '7', '8', '9' )
                       )
                )
                AND ISNULL(dpc.PC1, '')
                BETWEEN 'A' AND 'R'
                AND ISNULL(dpc.PC2, '') = 'N'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Ticket Stock Delivery' THEN
               24
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR (
                           dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                           AND RIGHT(dpl.PlanCode, 1) IN ( '6', '7', '8', '9' )
                       )
                )
                AND ISNULL(dpc.PC1, '')
                BETWEEN '1' AND '7'
                AND ISNULL(dpc.PC2, '') = 'N'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Ticket Stock Delivery' THEN
               25
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR (
                           dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                           AND RIGHT(dpl.PlanCode, 1) IN ( '6', '7', '8', '9' )
                       )
                )
                AND ISNULL(dpc.PC1, '') = 'U'
                AND ISNULL(dpc.PC2, '') = 'N'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Ticket Stock Delivery' THEN
               26
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR (
                           dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                           AND RIGHT(dpl.PlanCode, 1) IN ( '6', '7', '8', '9' )
                       )
                )
                AND ISNULL(dpc.PC1, '') = 'S'
                AND ISNULL(dpc.PC2, '') = 'N'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Ticket Stock Delivery' THEN
               27
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR (
                           dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                           AND RIGHT(dpl.PlanCode, 1) IN ( '6', '7', '8', '9' )
                       )
                )
                AND ISNULL(dpc.PC1, '') IN ( '8', '9' )
                AND ISNULL(dpc.PC2, '') = 'N'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Ticket Stock Delivery' THEN
               28
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR (
                           dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                           AND RIGHT(dpl.PlanCode, 1) IN ( '6', '7', '8', '9' )
                       )
                )
                AND ISNULL(dpc.PC1, '')
                BETWEEN 'A' AND 'R'
                AND ISNULL(dpc.PC2, '') = 'R'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Ticket Stock Delivery' THEN
               29
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR (
                           dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                           AND RIGHT(dpl.PlanCode, 1) IN ( '6', '7', '8', '9' )
                       )
                )
                AND ISNULL(dpc.PC1, '')
                BETWEEN '1' AND '7'
                AND ISNULL(dpc.PC2, '') = 'R'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Ticket Stock Delivery' THEN
               30
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR (
                           dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                           AND RIGHT(dpl.PlanCode, 1) IN ( '6', '7', '8', '9' )
                       )
                )
                AND ISNULL(dpc.PC1, '') = 'U'
                AND ISNULL(dpc.PC2, '') = 'R'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Ticket Stock Delivery' THEN
               31
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR (
                           dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                           AND RIGHT(dpl.PlanCode, 1) IN ( '6', '7', '8', '9' )
                       )
                )
                AND ISNULL(dpc.PC1, '') = 'S'
                AND ISNULL(dpc.PC2, '') = 'R'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Ticket Stock Delivery' THEN
               32
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR (
                           dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                           AND RIGHT(dpl.PlanCode, 1) IN ( '6', '7', '8', '9' )
                       )
                )
                AND ISNULL(dpc.PC1, '') IN ( '8', '9' )
                AND ISNULL(dpc.PC2, '') = 'R'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Ticket Stock Delivery' THEN
               33
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR (
                           dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                           AND RIGHT(dpl.PlanCode, 1) IN ( '6', '7', '8', '9' )
                       )
                )
                AND ISNULL(dpc.PC1, '')
                BETWEEN 'A' AND 'R'
                AND ISNULL(dpc.PC2, '') = 'N'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Mobile Delivery' THEN
               34
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR (
                           dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                           AND RIGHT(dpl.PlanCode, 1) IN ( '6', '7', '8', '9' )
                       )
                )
                AND ISNULL(dpc.PC1, '')
                BETWEEN '1' AND '7'
                AND ISNULL(dpc.PC2, '') = 'N'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Mobile Delivery' THEN
               35
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR (
                           dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                           AND RIGHT(dpl.PlanCode, 1) IN ( '6', '7', '8', '9' )
                       )
                )
                AND ISNULL(dpc.PC1, '') = 'U'
                AND ISNULL(dpc.PC2, '') = 'N'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Mobile Delivery' THEN
               36
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR (
                           dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                           AND RIGHT(dpl.PlanCode, 1) IN ( '6', '7', '8', '9' )
                       )
                )
                AND ISNULL(dpc.PC1, '') = 'S'
                AND ISNULL(dpc.PC2, '') = 'N'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Mobile Delivery' THEN
               37
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR (
                           dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                           AND RIGHT(dpl.PlanCode, 1) IN ( '6', '7', '8', '9' )
                       )
                )
                AND ISNULL(dpc.PC1, '') IN ( '8', '9' )
                AND ISNULL(dpc.PC2, '') = 'N'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Mobile Delivery' THEN
               38
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR (
                           dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                           AND RIGHT(dpl.PlanCode, 1) IN ( '6', '7', '8', '9' )
                       )
                )
                AND ISNULL(dpc.PC1, '')
                BETWEEN 'A' AND 'R'
                AND ISNULL(dpc.PC2, '') = 'R'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Mobile Delivery' THEN
               39
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR (
                           dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                           AND RIGHT(dpl.PlanCode, 1) IN ( '6', '7', '8', '9' )
                       )
                )
                AND ISNULL(dpc.PC1, '')
                BETWEEN '1' AND '7'
                AND ISNULL(dpc.PC2, '') = 'R'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Mobile Delivery' THEN
               40
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR (
                           dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                           AND RIGHT(dpl.PlanCode, 1) IN ( '6', '7', '8', '9' )
                       )
                )
                AND ISNULL(dpc.PC1, '') = 'U'
                AND ISNULL(dpc.PC2, '') = 'R'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Mobile Delivery' THEN
               41
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR (
                           dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                           AND RIGHT(dpl.PlanCode, 1) IN ( '6', '7', '8', '9' )
                       )
                )
                AND ISNULL(dpc.PC1, '') = 'S'
                AND ISNULL(dpc.PC2, '') = 'R'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Mobile Delivery' THEN
               42
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR (
                           dpl.PlanCode LIKE 'DL[0-9][0-9]SP%'
                           AND RIGHT(dpl.PlanCode, 1) IN ( '6', '7', '8', '9' )
                       )
                )
                AND ISNULL(dpc.PC1, '') IN ( '8', '9' )
                AND ISNULL(dpc.PC2, '') = 'R'
                AND /*fts.Custom_nVarChar_1*/ t.delivery_method_name = 'Mobile Delivery' THEN
               43
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP3'
                )
                AND ISNULL(dpc.PC1, '')
                BETWEEN 'A' AND 'R'
                AND ISNULL(dpc.PC2, '') = 'F' THEN
               44
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP3'
                )
                AND ISNULL(dpc.PC1, '')
                BETWEEN '1' AND '7'
                AND ISNULL(dpc.PC2, '') = 'F' THEN
               45
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP3'
                )
                AND ISNULL(dpc.PC1, '') = 'U'
                AND ISNULL(dpc.PC2, '') = 'F' THEN
               46
           WHEN (
                    de.EventCode LIKE 'PK[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'PK%'
                )
                AND ISNULL(dpc.PC2, '') IN ( 'N', 'R' )
                AND t.section_name = 'LOT4' THEN
               67
           WHEN (
                    de.EventCode LIKE 'PK[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'PK%'
                )
                AND ISNULL(dpc.PC2, '') IN ( 'N', 'R' )
                AND t.section_name = 'LOT5' THEN
               68
           WHEN (
                    de.EventCode LIKE 'PK[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'PK%'
                )
                AND ISNULL(dpc.PC2, '') IN ( 'N', 'R' )
                AND t.section_name = 'LOT6' THEN
               69
           WHEN (
                    de.EventCode LIKE 'PK[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'PK%'
                )
                AND ISNULL(dpc.PC2, '') IN ( 'N', 'R' )
                AND t.section_name = 'DECK' THEN
               70
           WHEN (
                    de.EventCode LIKE 'PK[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'PK%'
                )
                AND ISNULL(dpc.PC2, '') IN ( 'N', 'R' )
                AND t.section_name = 'TIGERS' THEN
               71
           WHEN (
                    de.EventCode LIKE 'PK[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'PK%'
                )
                AND ISNULL(dpc.PC2, '') IN ( 'N', 'R' )
                AND t.section_name = 'CAMPUS' THEN
               72
           WHEN (
                    de.EventCode LIKE 'PK[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'PK%'
                )
                AND ISNULL(dpc.PC2, '') IN ( 'N', 'R' )
                AND t.section_name = 'VALET' THEN
               73
           WHEN (
                    de.EventCode LIKE 'DL[0-9][0-9][0-9][0-9][0-9][0-9]%'
                    OR dpl.PlanCode LIKE 'DL[0-9][0-9]SP10'
                )
                AND ISNULL(dpc.PC2, '') IN ( 'N', 'R' )
                AND fts.TM_purchase_price = '0.00'
                AND t.comp_name NOT IN ( 'Not Comp', 'NFL-Other Club Employees', 'NFL-Coaches/Trainers',
                                         'NFL-Front Office'
                                       ) THEN
               81
           WHEN dpl.PlanCode LIKE 'DL[0-9][0-9]SP[0-9]%'
                AND ISNULL(dpc.PC1, '') IN ( 'Y', 'Z' )
                AND ISNULL(dpc.PC2, '') IN ( 'N', 'R' ) THEN
               47
           WHEN dpl.PlanCode LIKE 'DL[0-9][0-9]SP[0-9]%'
                AND ISNULL(dpc.PC1, '') = 'Z'
                AND ISNULL(dpc.PC2, '') = 'I' THEN
               48
           WHEN de.EventCode LIKE 'SB[0-9][0-9][0-9][0-9]'
                AND ISNULL(dpc.PC1, '') = 'A' THEN
               49
           WHEN (de.EventCode LIKE 'PK[0-9][0-9][0-9][0-9][0-9][0-9]%')
                AND ISNULL(dpc.PC2, '') = 'I'
                AND t.section_name = 'LOT4' THEN
               74
           WHEN (de.EventCode LIKE 'PK[0-9][0-9][0-9][0-9][0-9][0-9]%')
                AND ISNULL(dpc.PC2, '') = 'I'
                AND t.section_name = 'LOT5' THEN
               75
           WHEN (de.EventCode LIKE 'PK[0-9][0-9][0-9][0-9][0-9][0-9]%')
                AND ISNULL(dpc.PC2, '') = 'I'
                AND t.section_name = 'LOT6' THEN
               76
           WHEN (de.EventCode LIKE 'PK[0-9][0-9][0-9][0-9][0-9][0-9]%')
                AND ISNULL(dpc.PC2, '') = 'I'
                AND t.section_name = 'DECK' THEN
               77
           WHEN (de.EventCode LIKE 'PK[0-9][0-9][0-9][0-9][0-9][0-9]%')
                AND ISNULL(dpc.PC2, '') = 'I'
                AND t.section_name = 'TIGERS' THEN
               78
           WHEN (de.EventCode LIKE 'PK[0-9][0-9][0-9][0-9][0-9][0-9]%')
                AND ISNULL(dpc.PC2, '') = 'I'
                AND t.section_name = 'CAMPUS' THEN
               79
           WHEN (de.EventCode LIKE 'PK[0-9][0-9][0-9][0-9][0-9][0-9]%')
                AND ISNULL(dpc.PC2, '') = 'I'
                AND t.section_name = 'VALET' THEN
               80
           ELSE
               -1
       END 
FROM etl.vw_Load_TM_FactTicketSales fts
    JOIN dbo.DimEvent_V2 de
        ON de.DimEventId = fts.DimEventId
    JOIN dbo.DimPriceCode_V2 dpc
        ON dpc.DimPriceCodeId = fts.DimPriceCodeId
    JOIN dbo.DimPlan_V2 dpl
        ON dpl.DimPlanId = fts.DimPlanId
    JOIN ods.TM_Ticket t
        ON fts.ETL__SSID_TM_event_id = t.event_id
           AND fts.ETL__SSID_TM_section_id = t.section_id
           AND fts.ETL__SSID_TM_row_id = t.row_id
           AND fts.ETL__SSID_TM_seat_num = t.seat_num
           AND fts.TM_order_num = t.order_num
           AND fts.TM_order_line_item = t.order_line_item
           AND fts.TM_order_line_item_seq = t.order_line_item_seq;

END

GO

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO







-- still need to figure out how to match




CREATE VIEW [segmentation].[vw__Demographics]
AS
SELECT con.SSB_CRMSYSTEM_CONTACT_ID 
, CONCAT([con].[FirstName], ' ', [con].[LastName]) AS FullName
, [App].[Source]
, [App].[Accounts]
, [App].[City]
, [App].[State]
, [App].[EmailAddress]
, [App].[Edit Fail]
, [App].[lacLinks_Returned_Code]
, [App].[Personicx Lifestage Cluster Code]
 ,CONCAT(CASE WHEN LEFT(RIGHT(App.[Community Involvement - Causes Supported Financially],13),1)=1 then 'Donate to Charitable Causes' end,
 CASE WHEN LEFT(RIGHT(App.[Community Involvement - Causes Supported Financially],12),1)=1 then ', Animal Welfare' end,
 CASE WHEN LEFT(RIGHT(App.[Community Involvement - Causes Supported Financially],11),1)=1 then ', Arts or Culture' end,
 CASE WHEN LEFT(RIGHT(App.[Community Involvement - Causes Supported Financially],10),1)=1 then ', Children' end,
 CASE WHEN LEFT(RIGHT(App.[Community Involvement - Causes Supported Financially],9),1)=1 then ', Environment or Wildlife' end,
 CASE WHEN LEFT(RIGHT(App.[Community Involvement - Causes Supported Financially],8),1)=1 then ', Health' end,
 CASE WHEN LEFT(RIGHT(App.[Community Involvement - Causes Supported Financially],7),1)=1 then ', International Aid' end,
 CASE WHEN LEFT(RIGHT(App.[Community Involvement - Causes Supported Financially],6),1)=1 then ', Political' end,
 CASE WHEN LEFT(RIGHT(App.[Community Involvement - Causes Supported Financially],5),1)=1 then ', Political - Conservative' end,
 CASE WHEN LEFT(RIGHT(App.[Community Involvement - Causes Supported Financially],4),1)=1 then ', Political - Liberal' end,
 CASE WHEN LEFT(RIGHT(App.[Community Involvement - Causes Supported Financially],3),1)=1 then ', Religious' end,
 CASE WHEN LEFT(RIGHT(App.[Community Involvement - Causes Supported Financially],2),1)=1 then ', Veterans' end,
 CASE WHEN LEFT(RIGHT(App.[Community Involvement - Causes Supported Financially],1),1)=1 then ', other' end) AS [Community Involvement - Causes Supported Financially]
, CASE WHEN [App].[Business Owner] = 'A' THEN 'Accountant' WHEN [App].[Business Owner] = 'B' THEN 'Builder'
  WHEN [App].[Business Owner] = 'C' THEN 'Contractor'  WHEN [App].[Business Owner] = 'D' Then 'Dealer/Retailer/Storekeeper' 
  WHEN [App].[Business Owner] = 'E' THEN 'Distributor/Wholesaler'  WHEN [App].[Business Owner] = 'F' THEN 'Funeral Director'
  WHEN [App].[Business Owner] = 'M' THEN 'Maker/Manufacturer' WHEN [App].[Business Owner] = 'O' THEN 'Owner' 
  WHEN [App].[Business Owner] = 'P' THEN 'Partner' WHEN [App].[Business Owner] = 'S' THEN 'Self-Employed' ELSE [App].[Business Owner] END AS [Business Owner]
, [App].[Veteran]
, CASE WHEN [App].[Occupation - Detail - Input Individual] = 'A000' THEN ' Professional' 
 WHEN [APP].[Occupation - Detail - Input Individual] = 'A001' THEN ' Architect' 						
 WHEN [APP].[Occupation - Detail - Input Individual] = 'A002' THEN ' Chemist '						
 WHEN [APP].[Occupation - Detail - Input Individual] = 'A003' THEN ' Curator'						
 WHEN [APP].[Occupation - Detail - Input Individual] = 'A004' THEN ' Engineer' 						
 WHEN [APP].[Occupation - Detail - Input Individual] = 'A005' THEN ' Engineer/Aerospace' 			
 WHEN [APP].[Occupation - Detail - Input Individual] = 'A006' THEN ' Engineer/Chemical' 				
 WHEN [APP].[Occupation - Detail - Input Individual] = 'A007' THEN ' Engineer/Civil '				
 WHEN [APP].[Occupation - Detail - Input Individual] = 'A008' THEN ' Engineer/Electrical/Electronic'
 WHEN [APP].[Occupation - Detail - Input Individual] = 'A009' THEN ' Engineer/Field' 
 WHEN [APP].[Occupation - Detail - Input Individual] = 'A010' THEN ' Engineer/Industrial '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'A011' THEN ' Engineer/Mechanical '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'A012' THEN ' Geologist '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'A013' THEN ' Home Economist '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'A014' THEN ' Legal/Attorney/Lawyer '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'A015' THEN ' Librarian/Archivist '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'A016' THEN ' Medical Doctor/Physician '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'A017' THEN ' Pastor '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'A018' THEN ' Pilot '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'A019' THEN ' Scientist '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'A020' THEN ' Statistician/Actuary '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'A021' THEN ' Veterinarian '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'B000' THEN ' Executive/Upper Management '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'B001' THEN ' CEO/CFO/Chairman/Corp Officer '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'B002' THEN ' Comptroller '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'B003' THEN ' Politician/Legislator/Diplomat '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'B004' THEN ' President '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'B005' THEN ' Treasurer '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'B006' THEN ' Vice President '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C000' THEN ' Middle Management '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C001' THEN ' Account Executive '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C002' THEN ' Director/Art Director '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C003' THEN ' Director/Executive Director '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C004' THEN ' Editor '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C005' THEN ' Manager '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C006' THEN ' Manager/Assistant Manager '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C007' THEN ' Manager/Branch Manager '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C008' THEN ' Manager/Credit Manager '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C009' THEN ' Manager/District Manager '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C010' THEN ' Manager/Division Manager '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C011' THEN ' Manager/General Manager '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C012' THEN ' Manager/Marketing Manager '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C013' THEN ' Manager/Office Manager '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C014' THEN ' Manager/Plant Manager '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C015' THEN ' Manager/Product Manager '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C016' THEN ' Manager/Project Manager '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C017' THEN ' Manager/Property Manager '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C018' THEN ' Manager/Regional Manager '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C019' THEN ' Manager/Sales Manager '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C020' THEN ' Manager/Store Manager '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C021' THEN ' Manager/Traffic Manager '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C022' THEN ' Manager/Warehouse Manager '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C023' THEN ' Planner '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C024' THEN ' Principal/Dean/Educator '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C025' THEN ' Superintendent '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'C026' THEN ' Supervisor '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D000' THEN ' White Collar Worker '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D001' THEN ' Accounting/Biller/Billing clerk '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D002' THEN ' Actor/Entertainer/Announcer '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D003' THEN ' Adjuster '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D004' THEN ' Administration/Management '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D005' THEN ' Advertising '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D006' THEN ' Agent '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D007' THEN ' Aide/Assistant '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D008' THEN ' Aide/Assistant/Executive '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D009' THEN ' Aide/Assistant/Office '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D010' THEN ' Aide/Assistant/School '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D011' THEN ' Aide/Assistant/Staff '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D012' THEN ' Aide/Assistant/Technical '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D013' THEN ' Analyst D014Appraiser '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D015' THEN ' Artist D016 Auctioneer '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D017' THEN ' Auditor '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D018' THEN ' Banker '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D019' THEN ' Banker/Loan Office '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D020' THEN ' Banker/Loan Processor '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D021' THEN ' Bookkeeper '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D022' THEN ' Broker '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D023' THEN ' Broker/Stock/Trader '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D024' THEN ' Buyer '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D025' THEN ' Cashier '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D026' THEN ' Caterer '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D027' THEN ' Checker '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D028' THEN ' Claims Examiner/Rep/Adjudicator '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D029' THEN ' Clerk '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D030' THEN ' Clerk/File '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D031' THEN ' Collector '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D032' THEN ' Communications '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D033' THEN ' Conservation/Environment '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D034' THEN ' Consultant/Advisor '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D035' THEN ' Coordinator '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D036' THEN ' Customer Service/Representative '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D037' THEN ' Designer '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D038' THEN ' Detective/Investigator '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D039' THEN ' Dispatcher '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D040' THEN ' Draftsman '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D041' THEN ' Estimator '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D042' THEN ' Expeditor '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D043' THEN ' Finance '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D044' THEN ' Flight Attendant/Steward '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D045' THEN ' Florist '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D046' THEN ' Graphic Designer/Commercial Artist '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D047' THEN ' Hostess/Host/Usher '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D048' THEN ' Insurance/Agent '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D049' THEN ' Insurance/Underwriter '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D050' THEN ' Interior Designer '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D051' THEN ' Jeweler '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D052' THEN ' Marketing '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D053' THEN ' Merchandiser '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D054' THEN ' Model '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D055' THEN ' Musician/Music/Dance '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D056' THEN ' Personnel/Recruiter/Interviewer '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D057' THEN ' Photography '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D058' THEN ' Public Relations '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D059' THEN ' Publishing '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D060' THEN ' Purchasing '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D061' THEN ' Quality Control '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D062' THEN ' Real Estate/Realtor '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D063' THEN ' Receptionist '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D064' THEN ' Reporter '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D065' THEN ' Researcher '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D066' THEN ' Sales '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D067' THEN ' Sales Clerk/Counterman '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D068' THEN ' Security '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D069' THEN ' Surveyor '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D070' THEN ' Technician '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D071' THEN ' Telemarketer/Telephone/Operator '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D072' THEN ' Teller/Bank Teller '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D073' THEN ' Tester '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D074' THEN ' Transcripter/Translator '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D075' THEN ' Travel Agent '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D076' THEN ' Union Member/Rep. '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D077' THEN ' Ward Clerk '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D078' THEN ' Water Treatment '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'D079' THEN ' Writer '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E001' THEN ' Blue Collar Worker '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E002' THEN ' Animal Technician/Groomer '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E003' THEN ' Apprentice '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E004' THEN ' Assembler '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E005' THEN ' Athlete/Professional '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E006' THEN ' Attendant '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E007' THEN ' Auto Mechanic '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E008' THEN ' Baker '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E009' THEN ' Barber/Hairstylist/Beautician '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E010' THEN ' Bartender '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E011' THEN ' Binder '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E012' THEN ' Bodyman '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E013' THEN ' Brakeman '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E014' THEN ' Brewer '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E015' THEN ' Butcher/Meat Cutter '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E016' THEN ' Carpenter/Furniture/Woodworking '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E017' THEN ' Chef/Butler '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E018' THEN ' Child Care/Day Care/Babysitter '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E019' THEN ' Cleaner/Laundry '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E020' THEN ' Clerk/Deli '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E021' THEN ' Clerk/Produce '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E022' THEN ' Clerk/Stock '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E023' THEN ' Conductor '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E024' THEN ' Construction '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E025' THEN ' Cook '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E026' THEN ' Cosmetologist '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E027' THEN ' Courier/Delivery/Messenger '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E028' THEN ' Crewman '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E029' THEN ' Custodian '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E030' THEN ' Cutter '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E031' THEN ' Dock Worker '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E032' THEN ' Driver '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E033' THEN ' Driver/Bus Driver '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E034' THEN ' Driver/Truck Driver '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E035' THEN ' Electrician '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E036' THEN ' Fabricator '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E037' THEN ' Factory Workman '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E038' THEN ' Farmer/Dairyman '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E039' THEN ' Finisher '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E040' THEN ' Fisherman/Seaman '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E041' THEN ' Fitter '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E042' THEN ' Food Service '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E043' THEN ' Foreman/Crew leader '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E044' THEN ' Foreman/Shop Foreman '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E045' THEN ' Forestry '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E046' THEN ' Foundry Worker '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E047' THEN ' Furrier '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E048' THEN ' Gardener/Landscaper '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E049' THEN ' Glazier '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E050' THEN ' Grinder '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E051' THEN ' Grocer '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E052' THEN ' Helper '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E053' THEN ' Housekeeper/Maid '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E054' THEN ' Inspector '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E055' THEN ' Installer '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E056' THEN ' Ironworker '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E057' THEN ' Janitor '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E058' THEN ' Journeyman '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E059' THEN ' Laborer '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E060' THEN ' Lineman E'
 WHEN [APP].[Occupation - Detail - Input Individual] = '061 ' THEN ' Lithographer '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E062' THEN ' Loader '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E063' THEN ' Locksmith '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E064' THEN ' Machinist '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E065' THEN ' Maintenance '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E066' THEN ' Maintenance/Supervisor '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E067' THEN ' Mason/Brick/Etc. '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E068' THEN ' Material Handler '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E069' THEN ' Mechanic '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E070' THEN ' Meter Reader '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E071' THEN ' Mill worker '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E072' THEN ' Millwright '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E073' THEN ' Miner '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E074' THEN ' Mold Maker/Molder/Injection Mold '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E075' THEN ' Oil Industry/Driller '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E076' THEN ' Operator '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E077' THEN ' Operator/Boilermaker '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E078' THEN ' Operator/Crane Operator '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E079' THEN ' Operator/Forklift Operator '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E080' THEN ' Operator/Machine Operator '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E081' THEN ' Packer '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E082' THEN ' Painter '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E083' THEN ' Parts (Auto Etc.) '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E084' THEN ' Pipe fitter '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E085' THEN ' Plumber '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E086' THEN ' Polisher '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E087' THEN ' Porter '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E088' THEN ' Press Operator '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E089' THEN ' Presser '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E090' THEN ' Printer '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E091' THEN ' Production '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E092' THEN ' Repairman '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E093' THEN ' Roofer '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E094' THEN ' Sanitation/Exterminator '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E095' THEN ' Seamstress/Tailor/Handicraft '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E096' THEN ' Setup man '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E097' THEN ' Sheet Metal Worker/Steel Worker '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E098' THEN ' Shipping/Import/Export/Custom '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E099' THEN ' Sorter '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E100' THEN ' Toolmaker '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E101' THEN ' Transportation '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E102' THEN ' Typesetter '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E103' THEN ' Upholstery '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E104' THEN ' Utility '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E105' THEN ' Waiter/Waitress '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'E106' THEN ' Welder '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'F000' THEN ' Health Services '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'F001' THEN ' Chiropractor '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'F002' THEN ' Dental Assistant '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'F003' THEN ' Dental Hygienist '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'F004' THEN ' Dentist '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'F005' THEN ' Dietician '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'F006' THEN ' Health Care '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'F007' THEN ' Medical Assistant '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'F008' THEN ' Medical Secretary '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'F009' THEN ' Medical Technician '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'F010' THEN ' Medical/Paramedic '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'F011' THEN ' Nurses Aide/Orderly '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'F012' THEN ' Optician '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'F013' THEN ' Optometrist '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'F014' THEN ' Pharmacist/Pharmacy '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'F015' THEN ' Psychologist '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'F016' THEN ' Technician/Lab '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'F017' THEN ' Technician/X-ray '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'F018' THEN ' Therapist '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'F019' THEN ' Therapists/Physical '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'G001' THEN ' Legal/Paralegal/Assistant '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'G002' THEN ' Legal Secretary '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'G003' THEN ' Secretary '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'G004' THEN ' Typist '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'H001' THEN ' Homemaker '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'I000' THEN ' Retired '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'I001' THEN ' Retired/Pensioner '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'K000' THEN ' Military Personnel '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'K001' THEN ' Armed Forces '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'K002' THEN ' Army Credit Union Trades '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'K003' THEN ' Navy Credit Union Trades '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'K004' THEN ' Air Force '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'K005' THEN ' National Guard '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'K006' THEN ' Coast Guard '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'K007' THEN ' Marines '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'L001' THEN ' Coach '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'L002' THEN ' Counselor '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'L003' THEN ' Instructor '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'L004' THEN ' Lecturer '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'L005' THEN ' Professor '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'L006' THEN ' Teacher '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'L007' THEN ' Trainer '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'M001' THEN ' Nurse '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'M002' THEN ' Nurse (Registered) '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'M003' THEN ' Nurse/LPN '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'N000' THEN ' Computer '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'N001' THEN ' Computer Operator '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'N002' THEN ' Computer Programmer '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'N003' THEN ' Computer/Systems Analyst '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'N004' THEN ' Data Entry/Key Punch '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'P000' THEN ' Civil Service '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'P001' THEN ' Air Traffic Control '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'P002' THEN ' Civil Service/Government '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'P003' THEN ' Corrections/Probation/Parole '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'P004' THEN ' Court Reporter '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'P005' THEN ' Firefighter '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'P006' THEN ' Judge/Referee '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'P007' THEN ' Mail Carrier/Postal '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'P008' THEN ' Mail/Postmaster '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'P009' THEN ' Police/Trooper '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'P010' THEN ' Social Worker/Case Worker'
 WHEN [APP].[Occupation - Detail - Input Individual] = 'Q001' THEN ' Part Time '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'R001' THEN ' Student '
 WHEN [APP].[Occupation - Detail - Input Individual] = 'S001' THEN ' Volunteer '
 ELSE [APP].[Occupation - Detail - Input Individual] END AS [Occupation - Detail - Input Individual]
, [App].[Religious   Inspirational]
, [App].[Investments - Personal]
, [App].[Investments - Real Estate]
, [App].[Investments - Stocks   Bonds]
, [App].[Boating   Sailing]
, CASE WHEN [App].[Vehicle - Truck Motorcycle RV Owner] = 100 THEN 'Truck'
 WHEN [App].[Vehicle - Truck Motorcycle RV Owner] = 10 THEN 'Motorcycle'
 WHEN [App].[Vehicle - Truck Motorcycle RV Owner] = 1 THEN 'RV'
 WHEN [App].[Vehicle - Truck Motorcycle RV Owner] = 110 THEN 'Truck/Motorcycle'
 WHEN [App].[Vehicle - Truck Motorcycle RV Owner] = 101 THEN 'Truck/RV'
 WHEN [App].[Vehicle - Truck Motorcycle RV Owner] = 11 THEN 'Motorcycle/RV'
 WHEN [App].[Vehicle - Truck Motorcycle RV Owner] = 111 THEN 'Truck/Motorcycle/RV' 
 ELSE [App].[Vehicle - Truck Motorcycle RV Owner] END AS [Vehicle - Truck Motorcycle RV Owner]
, CONCAT(CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],31),1) = 1 then 'Apparel - Female Apparel MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],30),1) = 1 then 'Apparel - Jewelry MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],29),1) = 1 then 'Apparel - Male Apparel MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],28),1) = 1 then 'Apparel - Pus Size Women Apparel MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],27),1) = 1 then 'Apparel - Teen Fashion MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],26),1) = 1 then 'Apparel - Unknown, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],25),1) = 1 then 'Art & Antique MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],24),1) = 1 then 'Arts & Crafts MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],23),1) = 1 then 'Auto Supplies MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],22),1) = 1 then 'Beauty MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],21),1) = 1 then 'Book MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],20),1) = 1 then 'Children''s Merchandise MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],19),1) = 1 then 'Collectible MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],18),1) = 1 then 'Computer Software MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],17),1) = 1 then 'Electronic MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],16),1) = 1 then 'Equestrian MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],15),1) = 1 then 'Food MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],14),1) = 1 then 'General Gifts and Merchandise MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],13),1) = 1 then 'Gift MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],12),1) = 1 then 'Health, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],11),1) = 1 then 'Home Furnishing and Decorating MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],10),1) = 1 then 'Merchandise - High Ticket Merchandise MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],9),1) = 1 then 'Merchandise - Low Ticket Merchandise MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],8),1) = 1 then 'Music MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],7),1) = 1 then 'Outdoor/Gardening MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],6),1) = 1 then 'Outdoor/Hunting & Fishing MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],5),1) = 1 then 'Pet Supplies MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],4),1) = 1 then 'Golf MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],3),1) = 1 then 'Sports MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],2),1) = 1 then 'Travel MOB, ' END,
CASE WHEN LEFT(RIGHT([App].[Mail Order Buyer Categories],1),1) = 1 then 'Video/DVD MOB, ' END) AS [Mail Order Buyer Categories]
, [App].[Mail Order Donor]
, CASE WHEN [App].[Home Property Type Detail (RP)] = 'G' THEN 'Apartment(5+ units)'
 WHEN [App].[Home Property Type Detail (RP)] = 'A' THEN 'Single Family Residential'
 WHEN [App].[Home Property Type Detail (RP)] = 'M' THEN 'Mobile Home '
 WHEN [App].[Home Property Type Detail (RP)] = 'T' THEN 'Timeshare ' 
 WHEN [App].[Home Property Type Detail (RP)] = 'B' THEN 'Condo' 
 ELSE '' END AS [Home Property Type Detail (RP)]
,CASE WHEN [App].[Home Year Built - Actual (RP)] = 'A' THEN 'Before 1900' 
 WHEN [App].[Home Year Built - Actual (RP)] = 'B' THEN '1900 - 1940'
 WHEN [App].[Home Year Built - Actual (RP)] = 'C' THEN '1941 - 1950'
 WHEN [App].[Home Year Built - Actual (RP)] = 'D' THEN '1951 - 1960'
 WHEN [App].[Home Year Built - Actual (RP)] = 'E' THEN '1961 - 1970'
 WHEN [App].[Home Year Built - Actual (RP)] = 'F' THEN '1971 - 1980'
 WHEN [App].[Home Year Built - Actual (RP)] = 'G' THEN '1981 - 1985'
 WHEN [App].[Home Year Built - Actual (RP)] = 'H' THEN '1986 - 1990'
 WHEN [App].[Home Year Built - Actual (RP)] = 'I' THEN '1991 - 1995'
 WHEN [App].[Home Year Built - Actual (RP)] = 'J' THEN '1996 - 2000'
 WHEN [App].[Home Year Built - Actual (RP)] = 'K' THEN '2001 - 2005'
 WHEN [App].[Home Year Built - Actual (RP)] = 'L' THEN '2006 - Present' 
 ELSE '' END AS [Home Year Built - Actual (RP)]
, CONCAT(CASE WHEN LEFT(RIght([App].[Adult Age Ranges Present in Household],21),1) = 1 THEN 'Males 18-24, ' END, 
CASE WHEN LEFT(RIght([App].[Adult Age Ranges Present in Household],20),1) = 1 THEN 'Females 18-24, ' END, 
CASE WHEN LEFT(RIght([App].[Adult Age Ranges Present in Household],19),1) = 1 THEN 'UNknown 18-24, ' END, 
CASE WHEN LEFT(RIght([App].[Adult Age Ranges Present in Household],18),1) = 1 THEN 'Males 25-34, ' END, 
CASE WHEN LEFT(RIght([App].[Adult Age Ranges Present in Household],17),1) = 1 THEN 'Females 25-34, ' END, 
CASE WHEN LEFT(RIght([App].[Adult Age Ranges Present in Household],16),1) = 1 THEN 'Unknown 25-34, ' END, 
CASE WHEN LEFT(RIght([App].[Adult Age Ranges Present in Household],15),1) = 1 THEN 'Males 35-44, ' END, 
CASE WHEN LEFT(RIght([App].[Adult Age Ranges Present in Household],14),1) = 1 THEN 'Females 35-44, ' END, 
CASE WHEN LEFT(RIght([App].[Adult Age Ranges Present in Household],13),1) = 1 THEN 'UNknown 35-44, ' END, 
CASE WHEN LEFT(RIght([App].[Adult Age Ranges Present in Household],12),1) = 1 THEN 'Males 45-54, ' END, 
CASE WHEN LEFT(RIght([App].[Adult Age Ranges Present in Household],11),1) = 1 THEN 'Females 45-54, ' END, 
CASE WHEN LEFT(RIght([App].[Adult Age Ranges Present in Household],10),1) = 1 THEN 'Unknown 45-54, ' END, 
CASE WHEN LEFT(RIght([App].[Adult Age Ranges Present in Household],9),1) = 1 THEN 'Males 55-64, ' END, 
CASE WHEN LEFT(RIght([App].[Adult Age Ranges Present in Household],8),1) = 1 THEN 'Females 55-64, ' END, 
CASE WHEN LEFT(RIght([App].[Adult Age Ranges Present in Household],7),1) = 1 THEN 'Unknown 55-64, ' END, 
CASE WHEN LEFT(RIght([App].[Adult Age Ranges Present in Household],6),1) = 1 THEN 'Males 65-74, ' END, 
CASE WHEN LEFT(RIght([App].[Adult Age Ranges Present in Household],5),1) = 1 THEN 'Females 65-74, ' END, 
CASE WHEN LEFT(RIght([App].[Adult Age Ranges Present in Household],4),1) = 1 THEN 'Unknown 65-74, ' END, 
CASE WHEN LEFT(RIght([App].[Adult Age Ranges Present in Household],3),1) = 1 THEN 'Males 75+, ' END, 
CASE WHEN LEFT(RIght([App].[Adult Age Ranges Present in Household],2),1) = 1 THEN 'Females 75+, ' END, 
CASE WHEN LEFT(RIght([App].[Adult Age Ranges Present in Household],1),1) = 1 THEN 'Unknown 75+, ' END) AS [Adult Age Ranges Present in Household]
, CONCAT( CASE WHEN LEFT(RIGHT([App].[Children's Age Ranges Present in Household],15),1) = 1 THEN 'Males 0-2, ' END, 
CASE WHEN LEFT(RIGHT([App].[Children's Age Ranges Present in Household],14),1) = 1 THEN 'Females 0-2, ' END,
CASE WHEN LEFT(RIGHT([App].[Children's Age Ranges Present in Household],13),1) = 1 THEN 'Unknown 0-2, ' END,
CASE WHEN LEFT(RIGHT([App].[Children's Age Ranges Present in Household],12),1) = 1 THEN 'Males 3-5, ' END,
CASE WHEN LEFT(RIGHT([App].[Children's Age Ranges Present in Household],11),1) = 1 THEN 'Females 3-5, ' END,
CASE WHEN LEFT(RIGHT([App].[Children's Age Ranges Present in Household],10),1) = 1 THEN 'Unknown 3-5, ' END,
CASE WHEN LEFT(RIGHT([App].[Children's Age Ranges Present in Household],9),1) = 1 THEN 'Males 6-10, ' END,
CASE WHEN LEFT(RIGHT([App].[Children's Age Ranges Present in Household],8),1) = 1 THEN 'Females 6-10, ' END,
CASE WHEN LEFT(RIGHT([App].[Children's Age Ranges Present in Household],7),1) = 1 THEN 'Unknown 6-10, ' END,
CASE WHEN LEFT(RIGHT([App].[Children's Age Ranges Present in Household],6),1) = 1 THEN 'Males 11-15, ' END,
CASE WHEN LEFT(RIGHT([App].[Children's Age Ranges Present in Household],5),1) = 1 THEN 'Females 11-15, ' END,
CASE WHEN LEFT(RIGHT([App].[Children's Age Ranges Present in Household],4),1) = 1 THEN 'Unknown 11-15, ' END,
CASE WHEN LEFT(RIGHT([App].[Children's Age Ranges Present in Household],3),1) = 1 THEN 'Males 16-17, ' END,
CASE WHEN LEFT(RIGHT([App].[Children's Age Ranges Present in Household],2),1) = 1 THEN 'Females 16-17, ' END,
CASE WHEN LEFT(RIGHT([App].[Children's Age Ranges Present in Household],1),1) = 1 THEN 'Unknown 16-17, ' END) AS [Children's Age Ranges Present in Household]
, CASE WHEN [App].[Occupation - 1st Individual] = '1' THEN 'Professional/Technical'
 WHEN [App].[Occupation - 1st Individual] = '2' THEN 'Administration/Managerial'
 WHEN [App].[Occupation - 1st Individual] = '3' THEN 'Sales/Service'
 WHEN [App].[Occupation - 1st Individual] = '4' THEN 'Clerical/White Collar'
 WHEN [App].[Occupation - 1st Individual] = '5' THEN 'Craftsman/Blue Collar'
 WHEN [App].[Occupation - 1st Individual] = '6' THEN 'Student'
 WHEN [App].[Occupation - 1st Individual] = '7' THEN 'Homemaker'
 WHEN [App].[Occupation - 1st Individual] = '8' THEN 'Retired'
 WHEN [App].[Occupation - 1st Individual] = '9' THEN 'Farmer'
 WHEN [App].[Occupation - 1st Individual] = 'A' THEN 'Military'
 WHEN [App].[Occupation - 1st Individual] = 'B' THEN 'Religious'
 WHEN [App].[Occupation - 1st Individual] = 'C' THEN 'Self Employed'
 WHEN [App].[Occupation - 1st Individual] = 'D' THEN 'Self Employed - Professional/Technical'
 WHEN [App].[Occupation - 1st Individual] = 'E' THEN 'Self Employed - Administration/Managerial'
 WHEN [App].[Occupation - 1st Individual] = 'F' THEN 'Self Employed - Sales/Service'
 WHEN [App].[Occupation - 1st Individual] = 'G' THEN 'Self Employed - Clerical/White Collar'
 WHEN [App].[Occupation - 1st Individual] = 'H' THEN 'Self Employed - Craftsman/Blue Collar'
 WHEN [App].[Occupation - 1st Individual] = 'I' THEN 'Self Employed - Student'
 WHEN [App].[Occupation - 1st Individual] = 'J' THEN 'Self Employed - Homemaker'
 WHEN [App].[Occupation - 1st Individual] = 'K' THEN 'Self Employed - Retired'
 WHEN [App].[Occupation - 1st Individual] = 'L' THEN 'Self Employed - Other'
 WHEN [App].[Occupation - 1st Individual] = 'V' THEN 'Educator'
 WHEN [App].[Occupation - 1st Individual] = 'W' THEN 'Financial Professional'
 WHEN [App].[Occupation - 1st Individual] = 'X' THEN 'Legal Professional'
 WHEN [App].[Occupation - 1st Individual] = 'Y' THEN 'Medical Professional'
 WHEN [App].[Occupation - 1st Individual] = 'Z' THEN 'Other'
 ELSE [App].[Occupation - 1st Individual] END AS [Occupation - 1st Individual]
, CASE WHEN [App].[Occupation - 2nd Individual] = '1' THEN 'Professional/Technical'
 WHEN [App].[Occupation - 2nd Individual] = '2' THEN 'Administration/Managerial'
 WHEN [App].[Occupation - 2nd Individual] = '3' THEN 'Sales/Service'
 WHEN [App].[Occupation - 2nd Individual] = '4' THEN 'Clerical/White Collar'
 WHEN [App].[Occupation - 2nd Individual] = '5' THEN 'Craftsman/Blue Collar'
 WHEN [App].[Occupation - 2nd Individual] = '6' THEN 'Student'
 WHEN [App].[Occupation - 2nd Individual] = '7' THEN 'Homemaker'
 WHEN [App].[Occupation - 2nd Individual] = '8' THEN 'Retired'
 WHEN [App].[Occupation - 2nd Individual] = '9' THEN 'Farmer'
 WHEN [App].[Occupation - 2nd Individual] = 'A' THEN 'Military'
 WHEN [App].[Occupation - 2nd Individual] = 'B' THEN 'Religious'
 WHEN [App].[Occupation - 2nd Individual] = 'C' THEN 'Self Employed'
 WHEN [App].[Occupation - 2nd Individual] = 'D' THEN 'Self Employed - Professional/Technical'
 WHEN [App].[Occupation - 2nd Individual] = 'E' THEN 'Self Employed - Administration/Managerial'
 WHEN [App].[Occupation - 2nd Individual] = 'F' THEN 'Self Employed - Sales/Service'
 WHEN [App].[Occupation - 2nd Individual] = 'G' THEN 'Self Employed - Clerical/White Collar'
 WHEN [App].[Occupation - 2nd Individual] = 'H' THEN 'Self Employed - Craftsman/Blue Collar'
 WHEN [App].[Occupation - 2nd Individual] = 'I' THEN 'Self Employed - Student'
 WHEN [App].[Occupation - 2nd Individual] = 'J' THEN 'Self Employed - Homemaker'
 WHEN [App].[Occupation - 2nd Individual] = 'K' THEN 'Self Employed - Retired'
 WHEN [App].[Occupation - 2nd Individual] = 'L' THEN 'Self Employed - Other'
 WHEN [App].[Occupation - 2nd Individual] = 'V' THEN 'Educator'
 WHEN [App].[Occupation - 2nd Individual] = 'W' THEN 'Financial Professional'
 WHEN [App].[Occupation - 2nd Individual] = 'X' THEN 'Legal Professional'
 WHEN [App].[Occupation - 2nd Individual] = 'Y' THEN 'Medical Professional'
 WHEN [App].[Occupation - 2nd Individual] = 'Z' THEN 'Other' 
 ELSE App.[Occupation - 2nd Individual] END AS [Occupation - 2nd Individual]
, CASE WHEN [App].[Home Owner   Renter] = 'O' THEN 'Home Owner'
 WHEN [App].[Home Owner   Renter] = 'R' THEN 'Renter' END AS [Home Owner   Renter]
, CASE WHEN [App].[Home Length of Residence]= '00' THEN 'Less than 1 Year'
 WHEN App.[Home Length of Residence] = '01' THEN '1 Year  '
 WHEN App.[Home Length of Residence] = '02' THEN '2 Years '
 WHEN App.[Home Length of Residence] = '03' THEN '3 Years '
 WHEN App.[Home Length of Residence] = '04' THEN '4 years '
 WHEN App.[Home Length of Residence] = '05' THEN '5 Years '
 WHEN App.[Home Length of Residence] = '06' THEN '6 Years '
 WHEN App.[Home Length of Residence] = '07' THEN '7 Years '
 WHEN App.[Home Length of Residence] = '08' THEN '8 Years '
 WHEN App.[Home Length of Residence] = '09' THEN '9 Years '
 WHEN App.[Home Length of Residence] = '10' THEN '10 Years'
 WHEN App.[Home Length of Residence] = '11' THEN '11 Years'
 WHEN App.[Home Length of Residence] = '12' THEN '12 Years'
 WHEN App.[Home Length of Residence] = '13' THEN '13 Years'
 WHEN App.[Home Length of Residence] = '14' THEN '14 Years'
 WHEN App.[Home Length of Residence] = '15' THEN 'Greater than 14 Years' 
 ELSE App.[Home Length of Residence] END AS [Home Length of Residence]
, CASE WHEN [App].[Dwelling Type] = 'M' THEN 'Multiple Family Dwelling Unit'
 WHEN App.[Dwelling Type] = 'S' THEN 'Single FAmily Dwelling Type' 
 ELSE App.[Dwelling Type] END AS [Dwelling Type]
, CASE WHEN [App].[Marital Status] = 'M' THEN 'Married'
 WHEN App.[Marital Status] = 'S' THEN 'Single'
 WHEN App.[Marital Status] = 'A' THEN 'Inferred Married'
 WHEN App.[Marital Status] = 'B' THEN 'Inferred Single' 
 ELSE App.[Marital Status] END AS [Marital Status]
, CASE WHEN RIGHT([App].[Name   Gender - 1st Individual],1) = 'M' THEN REPLACE(RIGHT([App].[Name   Gender - 1st Individual],1),'M',' Male')
 WHEN RIGHT([App].[Name   Gender - 1st Individual],1) = 'F' THEN REPLACE(RIGHT([App].[Name   Gender - 1st Individual],1),'F',' Female')
 WHEN RIGHT([App].[Name   Gender - 1st Individual],1) = 'U' THEN REPLACE(RIGHT([App].[Name   Gender - 1st Individual],1),'U',' Unknown')
 ELSE [App].[Name   Gender - 1st Individual] END AS [Name   Gender - 1st Individual]
, CASE WHEN RIGHT([App].[Name   Gender - 2nd Individual] ,1) = 'M' THEN REPLACE(RIGHT([App].[Name   Gender - 2nd Individual],1),'M',' Male')
 WHEN RIGHT([App].[Name   Gender - 2nd Individual],1) = 'F' THEN REPLACE(RIGHT([App].[Name   Gender - 2nd Individual],1),'F',' Female')
 WHEN RIGHT([App].[Name   Gender - 2nd Individual],1) = 'U' THEN REPLACE(RIGHT([App].[Name   Gender - 2nd Individual],1),'U',' Unknown')
 ELSE [App].[Name   Gender - 2nd Individual] END AS [Name   Gender - 2nd Individual]
, CASE WHEN [App].[Base Record Verification Date] = '' THEN '' ELSE CONCAT(LEFT([App].[Base Record Verification Date],4),' Quarter ', RIGHT([App].[Base Record Verification Date],1)) END AS [Base Record Verification Date]
, CASE WHEN [App].[Mail Order Buyer] = 'B' THEN 'Mail Order Buyer'
 ELSE App.[Mail Order Buyer] END AS [Mail Order Buyer]
, CASE WHEN [App].[Age in Two-Year Increments - 1st Individual] IS NULL THEN '' WHEN [App].[Age in Two-Year Increments - 1st Individual] = '' THEN '' ELSE 
 CONCAT([App].[Age in Two-Year Increments - 1st Individual],'-',CAST([App].[Age in Two-Year Increments - 1st Individual] AS INT)+1) END AS [Age in Two-Year Increments - 1st Individual]
, CASE WHEN [App].[Age in Two-Year Increments - 2nd Individual] IS NULL THEN '' WHEN [App].[Age in Two-Year Increments - 2nd Individual] = '' THEN '' ELSE 
 CONCAT([App].[Age in Two-Year Increments - 2nd Individual],'-',CAST([App].[Age in Two-Year Increments - 2nd Individual] AS INT)+1) END AS [Age in Two-Year Increments - 2nd Individual]
, CASE WHEN [App].[Age in Two-Year Increments - Input Individual] IS NULL THEN '' WHEN [App].[Age in Two-Year Increments - Input Individual] = '' THEN '' ELSE 
 CONCAT([App].[Age in Two-Year Increments - Input Individual],'-',CAST([App].[Age in Two-Year Increments - Input Individual] AS INT)+1) END AS [Age in Two-Year Increments - Input Individual]
, [App].[Working Woman]
, [App].[Mail Order Responder]
, CONCAT(CASE WHEN RIGHT(App.[Credit Card Indicator], 6) LIKE '1%' THEN 'Bank Card ' ELSE ''end, CASE WHEN RIGHT(App.[Credit Card Indicator], 5) LIKE '1%' THEN 'Gas/Department/Retail Card ' ELSE ''end, 
  CASE WHEN RIGHT(App.[Credit Card Indicator], 4) LIKE '1%' THEN 'Travel/Entertainment Card ' ELSE ''end, CASE WHEN RIGHT(App.[Credit Card Indicator], 3) LIKE '1%' THEN 'Credit Card ' ELSE ''end, 
  CASE WHEN RIGHT(App.[Credit Card Indicator], 2) LIKE '1%' THEN 'Premium Card ' ELSE ''end, CASE WHEN RIGHT(App.[Credit Card Indicator], 1) LIKE '1%' THEN 'Upscale Card ' ELSE ''end, 
  CASE WHEN App.[Credit Card Indicator] = '0' THEN 'No Card Information ' END, 'Holder') AS [Credit Card Indicator]
, CASE WHEN [App].[Presence of Children] = 'Y' THEN 'Children Present' WHEN [App].[Presence of Children] = 'N' THEN 'No Children Present' ELSE '' END AS[Presence Of Children]
, CASE WHEN [App].[Number of Adults] = '6' THEN 'Greater than 5' ELSE [App].[Number of Adults] END AS [Number of Adults]
, CASE WHEN [App].[Occupation - Input Individual] = '1' THEN 'Professional/Technical'
 WHEN [App].[Occupation - Input Individual] = '2' THEN 'Administration/Managerial'
 WHEN [App].[Occupation - Input Individual] = '3' THEN 'Sales/Service'
 WHEN [App].[Occupation - Input Individual] = '4' THEN 'Clerical/White Collar'
 WHEN [App].[Occupation - Input Individual] = '5' THEN 'Craftsman/Blue Collar'
 WHEN [App].[Occupation - Input Individual] = '6' THEN 'Student'
 WHEN [App].[Occupation - Input Individual] = '7' THEN 'Homemaker'
 WHEN [App].[Occupation - Input Individual] = '8' THEN 'Retired'
 WHEN [App].[Occupation - Input Individual] = '9' THEN 'Farmer'
 WHEN [App].[Occupation - Input Individual] = 'A' THEN 'Military'
 WHEN [App].[Occupation - Input Individual] = 'B' THEN 'Religious'
 WHEN [App].[Occupation - Input Individual] = 'C' THEN 'Self Employed'
 WHEN [App].[Occupation - Input Individual] = 'D' THEN 'Self Employed - Professional/Technical'
 WHEN [App].[Occupation - Input Individual] = 'E' THEN 'Self Employed - Administration/Managerial'
 WHEN [App].[Occupation - Input Individual] = 'F' THEN 'Self Employed - Sales/Service'
 WHEN [App].[Occupation - Input Individual] = 'G' THEN 'Self Employed - Clerical/White Collar'
 WHEN [App].[Occupation - Input Individual] = 'H' THEN 'Self Employed - Craftsman/Blue Collar'
 WHEN [App].[Occupation - Input Individual] = 'I' THEN 'Self Employed - Student'
 WHEN [App].[Occupation - Input Individual] = 'J' THEN 'Self Employed - Homemaker'
 WHEN [App].[Occupation - Input Individual] = 'K' THEN 'Self Employed - Retired'
 WHEN [App].[Occupation - Input Individual] = 'L' THEN 'Self Employed - Other'
 WHEN [App].[Occupation - Input Individual] = 'V' THEN 'Educator'
 WHEN [App].[Occupation - Input Individual] = 'W' THEN 'Financial Professional'
 WHEN [App].[Occupation - Input Individual] = 'X' THEN 'Legal Professional'
 WHEN [App].[Occupation - Input Individual] = 'Y' THEN 'Medical Professional'
 WHEN [App].[Occupation - Input Individual] = 'Z' THEN 'Other'
 ELSE [App].[Occupation - Input Individual] END AS [Occupation - Input Individual]
, CASE WHEN [App].[InfoBase Positive Match Indicator] = 'M' THEN 'Name and/or Address was found on InfoBase Consumer Data Enhancement'
ELSE 'Name and/or Address was not found on InfoBase Consumer Data Enhancement' END AS [InfoBase Positive Match Indicator]
, [App].[Number of Sources]
, CASE WHEN [App].[Income - Estimated Household] = 1 THEN 'Less than $15,000'
 WHEN App.[Income - Estimated Household] = 2 THEN '$15,000 - $19,999'
 WHEN App.[Income - Estimated Household] = 3 THEN '$20,000 - $29,999'
 WHEN App.[Income - Estimated Household] = 4 THEN '$30,000 - $39,999'
 WHEN App.[Income - Estimated Household] = 5 THEN '$40,000 - $49,999'
 WHEN App.[Income - Estimated Household] = 6 THEN '$50,000 - $74,999'
 WHEN App.[Income - Estimated Household] = 7 THEN '$75,000 - $99,999'
 WHEN App.[Income - Estimated Household] = 8 THEN '$100,000 - $124,999'
 WHEN App.[Income - Estimated Household] = 9 THEN 'Greater than $124,999'
 ELSE '' END AS [Income - Estimated Household]
, CASE WHEN [App].[Home Market Value - Estimated - Ranges] = 'A' THEN '$1,000 - $24,999'
 WHEN App.[Home Market Value - Estimated - Ranges] = 'B' THEN '$25,000 - $49,999'
 WHEN App.[Home Market Value - Estimated - Ranges] = 'C' THEN '$50,000 - $74,999'
 WHEN App.[Home Market Value - Estimated - Ranges] = 'D' THEN '$75,000 - $99,999'
 WHEN App.[Home Market Value - Estimated - Ranges] = 'E' THEN '$100,000 - $124,999'
 WHEN App.[Home Market Value - Estimated - Ranges] = 'F' THEN '$125,000 - $149,999'
 WHEN App.[Home Market Value - Estimated - Ranges] = 'G' THEN '$150,000 - $174,999'
 WHEN App.[Home Market Value - Estimated - Ranges] = 'H' THEN '$175,000 - $199,999'
 WHEN App.[Home Market Value - Estimated - Ranges] = 'I' THEN '$200,000 - $224,999'
 WHEN App.[Home Market Value - Estimated - Ranges] = 'J' THEN '$225,000 - $249,999'
 WHEN App.[Home Market Value - Estimated - Ranges] = 'K' THEN '$250,000 - $274,999'
 WHEN App.[Home Market Value - Estimated - Ranges] = 'L' THEN '$275,000 - $299,999'
 WHEN App.[Home Market Value - Estimated - Ranges] = 'M' THEN '$300,000 - $349,999'
 WHEN App.[Home Market Value - Estimated - Ranges] = 'N' THEN '$350,000 - $399,999'
 WHEN App.[Home Market Value - Estimated - Ranges] = 'O' THEN '$400,000 - $449,999'
 WHEN App.[Home Market Value - Estimated - Ranges] = 'P' THEN '$450,000 - $499,999'
 WHEN App.[Home Market Value - Estimated - Ranges] = 'Q' THEN '$500,000 - $749,999'
 WHEN App.[Home Market Value - Estimated - Ranges] = 'R' THEN '$750,000 - $999,999'
 WHEN App.[Home Market Value - Estimated - Ranges] = 'S' THEN '$1,000,000 Plus' 
 ELSE '' END AS [Home Market Value - Estimated - Ranges]
, [App].[Vehicle - New Car Buyer]
, CASE WHEN [App].[Vehicle - Known Owned Number] = 3 THEN '3 or more' ELSE App.[Vehicle - Known Owned Number] END AS [Vehicle - Known Owned Number]
, CASE WHEN [App].[Vehicle - Dominant Lifestyle Indicator] = 'A' THEN 'Luxury / Upper sporty Classification'
 WHEN App.[Vehicle - Dominant Lifestyle Indicator] = 'B' THEN 'Truck Classification'
 WHEN App.[Vehicle - Dominant Lifestyle Indicator] = 'C' THEN 'Sport Utility Vehicle Classification'
 WHEN App.[Vehicle - Dominant Lifestyle Indicator] = 'D' THEN 'Mini-Van Classification'
 WHEN App.[Vehicle - Dominant Lifestyle Indicator] = 'E' THEN 'Regular Classification (Mid-Size / Small)'
 WHEN App.[Vehicle - Dominant Lifestyle Indicator] = 'F' THEN 'Upper Classification (Mid-Size / Large)'
 WHEN App.[Vehicle - Dominant Lifestyle Indicator] = 'G' THEN 'Basic Sporty Classification'
 ELSE '' END AS [Vehicle - Dominant Lifestyle Indicator]
, [App].[Online Purchasing Indicator]
, [App].[Gender - Input Individual]
, CASE WHEN [App].[Overall Match Indicator] = 'M' then 'Matched Record' ELSE '' END AS [Overall Match Indicator]
, LEFT(RIGHT([App].[Credit Card - Frequency of Purchase],7),1) AS [Credit Card - Frequency of Purchace 0-3 Months]
, LEFT(RIGHT([App].[Credit Card - Frequency of Purchase],6),1) AS [Credit Card - Frequency of Purchace 4-6 Months]
, LEFT(RIGHT([App].[Credit Card - Frequency of Purchase],5),1) AS [Credit Card - Frequency of Purchace 7-9 Months]
, LEFT(RIGHT([App].[Credit Card - Frequency of Purchase],4),1) AS [Credit Card - Frequency of Purchace 10-12 Months]
, LEFT(RIGHT([App].[Credit Card - Frequency of Purchase],3),1) AS [Credit Card - Frequency of Purchace 13-18 Months]
, LEFT(RIGHT([App].[Credit Card - Frequency of Purchase],2),1) AS [Credit Card - Frequency of Purchace 19-24 Months]
, LEFT(RIGHT([App].[Credit Card - Frequency of Purchase],1),1) AS [Credit Card - Frequency of Purchace 24+ Months]
, CASE WHEN [App].[Retail Activity Date of Last] = '' THEN '' ELSE CONCAT(left(right([App].[Retail Activity Date of Last],4),2),'/',left([App].[Retail Activity Date of Last],4)) END AS [Retail Activity Date of Last]
, CONCAT(CASE WHEN LEFT(RIght([App].[Retail Purchases - Categories],21),1) = 1 THEN 'Std Ret, Membership Warehouse , ' END, 
CASE WHEN LEFT(RIght([App].[Retail Purchases - Categories],20),1) = 1 THEN 'Std Ret, Catalog Showroom , ' END, 
CASE WHEN LEFT(RIght([App].[Retail Purchases - Categories],19),1) = 1 THEN 'Std Ret, Main Street Retail , ' END, 
CASE WHEN LEFT(RIght([App].[Retail Purchases - Categories],18),1) = 1 THEN 'Std Ret, HiVol Low End Dpt Store, ' END, 
CASE WHEN LEFT(RIght([App].[Retail Purchases - Categories],17),1) = 1 THEN 'Std Ret, Std Retail , ' END, 
CASE WHEN LEFT(RIght([App].[Retail Purchases - Categories],16),1) = 1 THEN 'Std Specialty, Sporting goods, ' END, 
CASE WHEN LEFT(RIght([App].[Retail Purchases - Categories],15),1) = 1 THEN 'Std Specialty, Specialty Apparel , ' END, 
CASE WHEN LEFT(RIght([App].[Retail Purchases - Categories],14),1) = 1 THEN 'Std Specialty, Specialty, ' END, 
CASE WHEN LEFT(RIght([App].[Retail Purchases - Categories],13),1) = 1 THEN 'Std Specialty, Computer/Electronics, ' END, 
CASE WHEN LEFT(RIght([App].[Retail Purchases - Categories],12),1) = 1 THEN 'Std Specialty, Furniture Buyer, ' END, 
CASE WHEN LEFT(RIght([App].[Retail Purchases - Categories],11),1) = 1 THEN 'Std Specialty, H.Office Supply Purchases , ' END, 
CASE WHEN LEFT(RIght([App].[Retail Purchases - Categories],10),1) = 1 THEN 'Std Specialty, Home Improvement , ' END, 
CASE WHEN LEFT(RIght([App].[Retail Purchases - Categories],9),1) = 1 THEN 'Upscale Retail, Hi-end Retail Buyers, Upscale Retail, ' END, 
CASE WHEN LEFT(RIght([App].[Retail Purchases - Categories],8),1) = 1 THEN 'Upscale Specialty, Travel/Personal Services, ' END, 
CASE WHEN LEFT(RIght([App].[Retail Purchases - Categories],7),1) = 1 THEN 'Bank, Financial Svcs - Banking, ' END, 
CASE WHEN LEFT(RIght([App].[Retail Purchases - Categories],6),1) = 1 THEN 'Finance Co., Financial Svcs - Install Credit, ' END, 
CASE WHEN LEFT(RIght([App].[Retail Purchases - Categories],5),1) = 1 THEN 'Oil Company, Oil Company, ' END, 
CASE WHEN LEFT(RIght([App].[Retail Purchases - Categories],4),1) = 1 THEN 'Misc, Financial Svcs - Insurance, ' END, 
CASE WHEN LEFT(RIght([App].[Retail Purchases - Categories],3),1) = 1 THEN 'Misc, TV/Mail Order Purchases , ' END, 
CASE WHEN LEFT(RIght([App].[Retail Purchases - Categories],2),1) = 1 THEN 'Misc, Grocery , ' END, 
CASE WHEN LEFT(RIght([App].[Retail Purchases - Categories],1),1) = 1 THEN 'Misc, Misc, ' END) AS [Retail Purchases - Categories]
, CASE WHEN [App].[Retail Purchases - Most Frequent Category] = 'A1'THEN 'Std Ret, Membership Warehouse'
 WHEN [App].[Retail Purchases - Most Frequent Category] = 'A2' THEN 'Std Ret, Catalog Showroom'
 WHEN [App].[Retail Purchases - Most Frequent Category] = 'A3' THEN 'Std Ret, Main Street Retail'
 WHEN [App].[Retail Purchases - Most Frequent Category] = 'A4' THEN 'Std Ret, HiVol Low End Dpt Store'
 WHEN [App].[Retail Purchases - Most Frequent Category] = 'A5' THEN 'Std Ret, Std Retail'
 WHEN [App].[Retail Purchases - Most Frequent Category] = 'B1' THEN 'Std Specialty, Sporting goods'
 WHEN [App].[Retail Purchases - Most Frequent Category] = 'B2' THEN 'Std Specialty, Specialty Apparel'
 WHEN [App].[Retail Purchases - Most Frequent Category] = 'B3' THEN 'Std Specialty, Specialty'
 WHEN [App].[Retail Purchases - Most Frequent Category] = 'B4' THEN 'Std Specialty, Computer/Electronics'
 WHEN [App].[Retail Purchases - Most Frequent Category] = 'B5' THEN 'Std Specialty, Furniture Buyers'
 WHEN [App].[Retail Purchases - Most Frequent Category] = 'B6' THEN 'Std Specialty, H.Office Supply Purchases'
 WHEN [App].[Retail Purchases - Most Frequent Category] = 'B7' THEN 'Std Specialty, Home Improvement'
 WHEN [App].[Retail Purchases - Most Frequent Category] = 'C1' THEN 'Upscale Retail, Hi-end Retail Buyers, Upscale Retail'
 WHEN [App].[Retail Purchases - Most Frequent Category] = 'D1' THEN 'Upscale Specialty, Travel/Personal Services'
 WHEN [App].[Retail Purchases - Most Frequent Category] = 'E1' THEN 'Bank, Financial Svcs - Banking'
 WHEN [App].[Retail Purchases - Most Frequent Category] = 'F1' THEN 'Finance Co., Financial Svcs - Install Credit'
 WHEN [App].[Retail Purchases - Most Frequent Category] = 'G1' THEN 'Oil Company, Oil Company'
 WHEN [App].[Retail Purchases - Most Frequent Category] = 'H1' THEN 'Misc, Financial Svcs - Insurance'
 WHEN [App].[Retail Purchases - Most Frequent Category] = 'H2' THEN 'Misc, TV/Mail Order Purchases'
 WHEN [App].[Retail Purchases - Most Frequent Category] = 'H3' THEN 'Misc, Grocery'
 WHEN [App].[Retail Purchases - Most Frequent Category] = 'H4' THEN 'Misc, Misc'
 ELSE '' END AS [Retail Purchases - Most Frequent Category]
, CASE WHEN [App].[Education - 1st Individual] = 1 THEN 'Completed High School'
 WHEN [App].[Education - 1st Individual] = 2 THEN 'Completed College'
 WHEN [App].[Education - 1st Individual] = 3 THEN 'Completed Graduate School'
 WHEN [App].[Education - 1st Individual] = 4 THEN 'Attended Vocational/Technical'
 ELSE '' END AS [Education - 1st Individual]
, CASE WHEN [App].[Education - 2nd Individual] = 1 THEN 'Completed High School'
 WHEN [App].[Education - 2nd Individual] = 2 THEN 'Completed College'
 WHEN [App].[Education - 2nd Individual] = 3 THEN 'Completed Graduate School'
 WHEN [App].[Education - 2nd Individual] = 4 THEN 'Attended Vocational/Technical'
 ELSE '' END AS [Education - 2nd Individual]
 , CASE WHEN [App].[Education - Input Individual] = 1 THEN 'Completed High School'
 WHEN [App].[Education - Input Individual] = 2 THEN 'Completed College'
 WHEN [App].[Education - Input Individual] = 3 THEN 'Completed Graduate School'
 WHEN [App].[Education - Input Individual] = 4 THEN 'Attended Vocational/Technical'
 ELSE '' END AS [Education - Input Individual]
, CASE WHEN [App].[Suppression - Mail - DMA] = 'N' THEN 'Do Not Mail This Individual' ELSE '' END AS [Suppression - Mail - DMA]
, CASE WHEN [App].[Vehicle - Classic Car Owner] IS NULL THEN '' WHEN [App].[Vehicle - Classic Car Owner] = '' THEN '' ELSE CONCAT('Year of classic vehicled owned is ', [App].[Vehicle - Classic Car Owner]) end AS [Vehicle - Classic Car Owner]



    FROM ( SELECT [Last Name]
	  ,[Source]
      ,[Accounts]
      ,[City]
      ,[State]
      ,[EmailAddress]
      ,[Edit Fail]
      ,[lacLinks_Returned_Code]
      ,[Personicx Lifestage Cluster Code]
	  ,CASE WHEN LEN([Community Involvement - Causes Supported Financially]) = 1 THEN '000000000000' +[Community Involvement - Causes Supported Financially]
	  WHEN LEN([Community Involvement - Causes Supported Financially]) = 2 THEN '00000000000' +[Community Involvement - Causes Supported Financially]
	  WHEN LEN([Community Involvement - Causes Supported Financially]) = 3 THEN '0000000000' +[Community Involvement - Causes Supported Financially]
	  WHEN LEN([Community Involvement - Causes Supported Financially]) = 4 THEN '000000000' +[Community Involvement - Causes Supported Financially]
	  WHEN LEN([Community Involvement - Causes Supported Financially]) = 5 THEN '00000000' +[Community Involvement - Causes Supported Financially]
	  WHEN LEN([Community Involvement - Causes Supported Financially]) = 6 THEN '0000000' +[Community Involvement - Causes Supported Financially]
	  WHEN LEN([Community Involvement - Causes Supported Financially]) = 7 THEN '000000' +[Community Involvement - Causes Supported Financially]
	  WHEN LEN([Community Involvement - Causes Supported Financially]) = 8 THEN '00000' +[Community Involvement - Causes Supported Financially]
	  WHEN LEN([Community Involvement - Causes Supported Financially]) = 9 THEN '0000' +[Community Involvement - Causes Supported Financially]
	  WHEN LEN([Community Involvement - Causes Supported Financially]) = 10 THEN '000' +[Community Involvement - Causes Supported Financially]
	  WHEN LEN([Community Involvement - Causes Supported Financially]) = 11 THEN '00' +[Community Involvement - Causes Supported Financially]
	  WHEN LEN([Community Involvement - Causes Supported Financially]) = 12 THEN '0' +[Community Involvement - Causes Supported Financially]
	  ELSE [Community Involvement - Causes Supported Financially] END AS [Community Involvement - Causes Supported Financially]
      ,[Business Owner]
      ,[Veteran]
      ,[Occupation - Detail - Input Individual]
      ,[Religious   Inspirational]
      ,[Investments - Personal]
      ,[Investments - Real Estate]
      ,[Investments - Stocks   Bonds]
      ,[Boating   Sailing]
      ,[Vehicle - Truck Motorcycle RV Owner]
      ,CASE WHEN LEN([Mail Order Buyer Categories]) = 1 THEN  '000000000000000000000000000000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 2 THEN  '00000000000000000000000000000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 3 THEN  '0000000000000000000000000000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 4 THEN  '000000000000000000000000000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 5 THEN  '00000000000000000000000000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 6 THEN  '0000000000000000000000000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 7 THEN  '000000000000000000000000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 8 THEN  '00000000000000000000000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 9 THEN  '0000000000000000000000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 10 THEN  '000000000000000000000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 11 THEN  '00000000000000000000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 12 THEN  '0000000000000000000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 13 THEN  '000000000000000000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 14 THEN  '00000000000000000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 15 THEN  '0000000000000000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 16 THEN  '000000000000000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 17 THEN  '00000000000000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 18 THEN  '0000000000000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 19 THEN  '000000000000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 20 THEN  '00000000000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 21 THEN  '0000000000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 22 THEN  '000000000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 23 THEN  '00000000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 24 THEN  '0000000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 25 THEN  '000000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 26 THEN  '00000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 27 THEN  '0000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 28 THEN  '000' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 29 THEN  '00' + [Mail Order Buyer Categories]
	  WHEN LEN([Mail Order Buyer Categories]) = 30 THEN  '0' + [Mail Order Buyer Categories] 
	  ELSE [Mail Order Buyer Categories]  END AS [Mail Order Buyer Categories]
      ,[Mail Order Donor]
      ,[Home Property Type Detail (RP)]
      ,[Home Year Built - Actual (RP)]
      ,CASE WHEN LEN([Adult Age Ranges Present in Household]) = 1 then '00000000000000000000' + [Adult Age Ranges Present in Household]
	  WHEN LEN([Adult Age Ranges Present in Household]) = 2 then '0000000000000000000' + [Adult Age Ranges Present in Household]
	  WHEN LEN([Adult Age Ranges Present in Household]) = 3 then '000000000000000000' + [Adult Age Ranges Present in Household]
	  WHEN LEN([Adult Age Ranges Present in Household]) = 4 then '00000000000000000' + [Adult Age Ranges Present in Household]
	  WHEN LEN([Adult Age Ranges Present in Household]) = 5 then '0000000000000000' + [Adult Age Ranges Present in Household]
	  WHEN LEN([Adult Age Ranges Present in Household]) = 6 then '000000000000000' + [Adult Age Ranges Present in Household]
	  WHEN LEN([Adult Age Ranges Present in Household]) = 7 then '00000000000000' + [Adult Age Ranges Present in Household]
	  WHEN LEN([Adult Age Ranges Present in Household]) = 8 then '0000000000000' + [Adult Age Ranges Present in Household]
	  WHEN LEN([Adult Age Ranges Present in Household]) = 9 then '000000000000' + [Adult Age Ranges Present in Household]
	  WHEN LEN([Adult Age Ranges Present in Household]) = 10 then '00000000000' + [Adult Age Ranges Present in Household]
	  WHEN LEN([Adult Age Ranges Present in Household]) = 11 then '0000000000' + [Adult Age Ranges Present in Household]
	  WHEN LEN([Adult Age Ranges Present in Household]) = 12 then '000000000' + [Adult Age Ranges Present in Household]
	  WHEN LEN([Adult Age Ranges Present in Household]) = 13 then '00000000' + [Adult Age Ranges Present in Household]
	  WHEN LEN([Adult Age Ranges Present in Household]) = 14 then '0000000' + [Adult Age Ranges Present in Household]
	  WHEN LEN([Adult Age Ranges Present in Household]) = 15 then '000000' + [Adult Age Ranges Present in Household]
	  WHEN LEN([Adult Age Ranges Present in Household]) = 16 then '00000' + [Adult Age Ranges Present in Household]
	  WHEN LEN([Adult Age Ranges Present in Household]) = 17 then '0000' + [Adult Age Ranges Present in Household]
	  WHEN LEN([Adult Age Ranges Present in Household]) = 18 then '000' + [Adult Age Ranges Present in Household]
	  WHEN LEN([Adult Age Ranges Present in Household]) = 19 then '00' + [Adult Age Ranges Present in Household]
	  WHEN LEN([Adult Age Ranges Present in Household]) = 20 then '0' + [Adult Age Ranges Present in Household]
	  ELSE [Adult Age Ranges Present in Household] END AS [Adult Age Ranges Present in Household]
      , CASE WHEN LEN([Children's Age Ranges Present in Household]) = 1 THEN '00000000000000' + [Children's Age Ranges Present in Household]
	  WHEN LEN([Children's Age Ranges Present in Household]) = 2 THEN '0000000000000' + [Children's Age Ranges Present in Household]
	  WHEN LEN([Children's Age Ranges Present in Household]) = 3 THEN '000000000000' + [Children's Age Ranges Present in Household]
	  WHEN LEN([Children's Age Ranges Present in Household]) = 4 THEN '00000000000' + [Children's Age Ranges Present in Household]
	  WHEN LEN([Children's Age Ranges Present in Household]) = 5 THEN '0000000000' + [Children's Age Ranges Present in Household]
	  WHEN LEN([Children's Age Ranges Present in Household]) = 6 THEN '000000000' + [Children's Age Ranges Present in Household]
	  WHEN LEN([Children's Age Ranges Present in Household]) = 7 THEN '00000000' + [Children's Age Ranges Present in Household]
	  WHEN LEN([Children's Age Ranges Present in Household]) = 8 THEN '0000000' + [Children's Age Ranges Present in Household]
	  WHEN LEN([Children's Age Ranges Present in Household]) = 9 THEN '000000' + [Children's Age Ranges Present in Household]
	  WHEN LEN([Children's Age Ranges Present in Household]) = 10 THEN '00000' + [Children's Age Ranges Present in Household]
	  WHEN LEN([Children's Age Ranges Present in Household]) = 11 THEN '0000' + [Children's Age Ranges Present in Household]
	  WHEN LEN([Children's Age Ranges Present in Household]) = 12 THEN '000' + [Children's Age Ranges Present in Household]
	  WHEN LEN([Children's Age Ranges Present in Household]) = 13 THEN '00' + [Children's Age Ranges Present in Household]
	  WHEN LEN([Children's Age Ranges Present in Household]) = 14 THEN '0' + [Children's Age Ranges Present in Household]
	  ELSE [Children's Age Ranges Present in Household] END AS [Children's Age Ranges Present in Household]
      ,[Occupation - 1st Individual]
      ,[Occupation - 2nd Individual]
      ,[Home Owner   Renter]
      ,[Home Length of Residence]
      ,[Dwelling Type]
      ,[Marital Status]
      ,[Name   Gender - 1st Individual]
      ,[Name   Gender - 2nd Individual]
      ,[Base Record Verification Date]
      ,[Mail Order Buyer]
      ,[Age in Two-Year Increments - 1st Individual]
      ,[Age in Two-Year Increments - 2nd Individual]
      ,[Age in Two-Year Increments - Input Individual]
      ,[Working Woman]
      ,[Mail Order Responder]
      ,[Credit Card Indicator]
      ,[Presence Of Children]
      ,[Number of Adults]
      ,[Occupation - Input Individual]
      ,[InfoBase Positive Match Indicator]
      ,[Number of Sources]
      ,[Income - Estimated Household]
      ,[Home Market Value - Estimated - Ranges]
      ,[Vehicle - New Car Buyer]
      ,[Vehicle - Known Owned Number]
      ,[Vehicle - Dominant Lifestyle Indicator]
      ,[Online Purchasing Indicator]
      ,[Gender - Input Individual]
      ,[Overall Match Indicator]
      ,[Credit Card - Frequency of Purchase]
      ,[Retail Activity Date of Last]
      ,CASE WHEN LEN([Retail Purchases - Categories]) = 1 then '00000000000000000000' + [Retail Purchases - Categories]
	  WHEN LEN([Retail Purchases - Categories]) = 2 then '0000000000000000000' + [Retail Purchases - Categories]
	  WHEN LEN([Retail Purchases - Categories]) = 3 then '000000000000000000' + [Retail Purchases - Categories]
	  WHEN LEN([Retail Purchases - Categories]) = 4 then '00000000000000000' + [Retail Purchases - Categories]
	  WHEN LEN([Retail Purchases - Categories]) = 5 then '0000000000000000' + [Retail Purchases - Categories]
	  WHEN LEN([Retail Purchases - Categories]) = 6 then '000000000000000' + [Retail Purchases - Categories]
	  WHEN LEN([Retail Purchases - Categories]) = 7 then '00000000000000' + [Retail Purchases - Categories]
	  WHEN LEN([Retail Purchases - Categories]) = 8 then '0000000000000' + [Retail Purchases - Categories]
	  WHEN LEN([Retail Purchases - Categories]) = 9 then '000000000000' + [Retail Purchases - Categories]
	  WHEN LEN([Retail Purchases - Categories]) = 10 then '00000000000' + [Retail Purchases - Categories]
	  WHEN LEN([Retail Purchases - Categories]) = 11 then '0000000000' + [Retail Purchases - Categories]
	  WHEN LEN([Retail Purchases - Categories]) = 12 then '000000000' + [Retail Purchases - Categories]
	  WHEN LEN([Retail Purchases - Categories]) = 13 then '00000000' + [Retail Purchases - Categories]
	  WHEN LEN([Retail Purchases - Categories]) = 14 then '0000000' + [Retail Purchases - Categories]
	  WHEN LEN([Retail Purchases - Categories]) = 15 then '000000' + [Retail Purchases - Categories]
	  WHEN LEN([Retail Purchases - Categories]) = 16 then '00000' + [Retail Purchases - Categories]
	  WHEN LEN([Retail Purchases - Categories]) = 17 then '0000' + [Retail Purchases - Categories]
	  WHEN LEN([Retail Purchases - Categories]) = 18 then '000' + [Retail Purchases - Categories]
	  WHEN LEN([Retail Purchases - Categories]) = 19 then '00' + [Retail Purchases - Categories]
	  WHEN LEN([Retail Purchases - Categories]) = 20 then '0' + [Retail Purchases - Categories]
	  ELSE [Retail Purchases - Categories] END AS [Retail Purchases - Categories]
      ,[Retail Purchases - Most Frequent Category]
      ,[Education - 1st Individual]
      ,[Education - 2nd Individual]
      ,[Education - Input Individual]
      ,[Suppression - Mail - DMA]
      ,[Vehicle - Classic Car Owner]
	
	FROM [Lions].[ods].[Appends]) App
    JOIN    dbo.vwCompositeRecord_ModAcctID con ON App.EmailAddress=con.EmailPrimary AND App.[Last Name] = con.LastName

GO

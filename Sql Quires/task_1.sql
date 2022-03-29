/****** Script for SelectTopNRows command from SSMS  ******/

SELECT
	--format(EKKO.AEDAT,'d', 'en-US') as ODate,
	SUM(EBAN.PREIS*EBAN.MENGE) NET_ORDER_VALUE
      --sum(EKPO.[NETWR]) as TotalNet
  FROM [Task1Db].[dbo].[EKKO] 
  JOIN [Task1Db].[dbo].EKPO ON EKPO.MANDT=EKKO.MANDT AND EKPO.EBELN=EKKO.EBELN
  join [Task1Db].[dbo].EBAN ON EBAN.MANDT=EKPO.MANDT--EBAN.BNFPO = EKPO.BNFPO
where EKKO.MANDT=800 AND EKKO.EBELN=4500005013 AND CAST(EKKO.AEDAT AS date) ='2016-05-09'
GROUP BY format(EKKO.AEDAT,'d', 'en-US');

-----OPTION 1 WITH ONLY 2 TABLES
/* Assuming that EKKO has only purchase order numbers for each client and EKPO has a list of all items for a specific order 
  if a 3rd item is added to EKPO we would like to compute the net purchase order price using this function
We see that EKPO.NETPR has 0's as well which is net price, i guess its a bad data
*/
SELECT --EKPO.[NETPR] as netprice, EKPO.[MENGE] as quantity
	 sum(cast(EKPO.[NETPR] as float) * cast(EKPO.[MENGE] as float) ) as TOTAL_ORDER_VALUE
	FROM [Task1Db].[dbo].[EKKO] 
		JOIN EKPO ON EKPO.MANDT=EKKO.MANDT AND EKPO.EBELN=EKKO.EBELN
	where EKKO.MANDT=800 AND EKKO.EBELN=4500005013 AND CAST(EKKO.AEDAT AS date) ='2016-05-09'
	--AND EKPO.LOEKZ IS NULL OR = 0 --- assuming a item is not deleted by either marking = 0 or if its NULL


/* OPTION 2 WITH ALL 3 TABLES
Assuming the new item was only added to EBAN table and doesnt exist in EKPO then we look for the EBAN.MANDT and compute the price from EBAN table to populate the  EKPO
since the EBAN data wasn't provided and there is no information on where the new item would not exist on I made diff assumptions and came up with multiple cursors
*/
SELECT
	SUM(EBAN.PREIS*EBAN.MENGE) NET_ORDER_VALUE
  FROM [Task1Db].[dbo].[EKKO] 
  JOIN [Task1Db].[dbo].EKPO ON EKPO.MANDT=EKKO.MANDT AND EKPO.EBELN=EKKO.EBELN
  join [Task1Db].[dbo].EBAN ON EBAN.MANDT=EKPO.MANDT
where EKKO.MANDT=800 AND EKKO.EBELN=4500005013 AND CAST(EKKO.AEDAT AS date) ='2016-05-09';

SELECT * FROM [Task1Db].[dbo].EKPO;

SELECT * FROM  [Task1Db].[dbo].[EKKO];

SELECT * FROM [Task1Db].[dbo].EKPO;

SELECT * FROM [Task1Db].[dbo].EBAN;

create TABLE Task1Db].[dbo].EBAN(
MANDT INT,
BANFN INT,
BNFPO NUMBER,
BSART NVARCHAR(50), 

);


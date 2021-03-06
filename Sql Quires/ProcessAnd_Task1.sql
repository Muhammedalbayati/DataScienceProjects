
CREATE OR ALTER PROCEDURE [dbo].[sp_GetTotalNet]
(
	@MANDT int,
	@EBELN float,
	@D_DATE DATE,
	@TOTAL_NETWR float OUTPUT
)
AS
	BEGIN

	-----OPTION 1 WITH ONLY 2 TABLES(EKPO and EKKO)
/* Assuming that EKKO has only purchase order numbers for each client and EKPO has a list of all items for a specific order 
  if a 3rd item is added to EKPO we would like to compute the net purchase order price using this function
I see that EKPO.NETPR has 0's as well which is net price, i guess its a bad data
*/

SELECT --EKPO.[NETPR] as netprice, EKPO.[MENGE] as quantity
	 @TOTAL_NETWR = sum(cast(EKPO.[NETPR] as float) * cast(EKPO.[MENGE] as float) ) 
	FROM [Task1Db].[dbo].[EKKO] 
		JOIN EKPO ON EKPO.MANDT=EKKO.MANDT AND EKPO.EBELN=EKKO.EBELN
	where EKKO.MANDT=@MANDT AND EKKO.EBELN=@EBELN AND CAST(EKKO.AEDAT AS date) =@D_DATE
	--AND EKPO.LOEKZ IS NULL OR = 0 --- assuming a item is not deleted by either marking = 0 or if its NULL


/* OPTION 2 WITH ALL 3 TABLES
Assuming the new item was only added to EBAN table and doesnt exist in EKPO then we look for the EBAN.MANDT and compute the price from EBAN table to populate the  EKPO
since the EBAN data wasn't provided and there is no information on where the new item would not exist on I made diff assumptions and came up with multiple cursors

	SELECT
	 @TOTAL_NETWR = SUM(EBAN.PREIS*EBAN.MENGE) 
  FROM [Task1Db].[dbo].[EKKO] 
  JOIN [Task1Db].[dbo].EKPO ON EKPO.MANDT=EKKO.MANDT AND EKPO.EBELN=EKKO.EBELN
  join [Task1Db].[dbo].EBAN ON EBAN.MANDT=EKPO.MANDT
  where EKKO.MANDT=@MANDT AND EKKO.EBELN=@EBELN AND CAST(EKKO.AEDAT AS date) =@D_DATE
*/
	END

	/* Execution part
	declare @TOTAL_NETWR float
	execute sp_GetTotalNet 800,4500005013,'2016-05-09', @TOTAL_NETWR output
	print @TOTAL_NETWR

	*/
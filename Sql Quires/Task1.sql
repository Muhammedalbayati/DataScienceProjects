CREATE PROCEDURE sp_GetTotalNet
(
	@MANDT int,
	@EBELN float,
	@D_DATE DATE,
	@TOTAL_NETWR float OUTPUT
)
AS
	BEGIN
SELECT
	@TOTAL_NETWR= sum(EKPO.[NETPR] * EKPO.[MENGE])
	FROM [Task1Db].[dbo].[EKKO] 
		JOIN EKPO ON EKPO.MANDT=EKKO.MANDT AND EKPO.EBELN=EKKO.EBELN
	where EKKO.MANDT=@MANDT AND EKKO.EBELN=@EBELN AND CAST(EKKO.AEDAT AS date) =@D_DATE

	END
	GO
	-- EKKO.MANDT=800 , EKKO.EBELN=4500005013 , EKKO.AEDAT  ='2016-05-09'
	declare @OrderTotalNet float
	execute sp_GetTotalNet 800,4500005013,'2016-05-09', @OrderTotalNet output
	print @OrderTotalNet
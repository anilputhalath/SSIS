ALTER PROCEDURE PrcGetProducts
(
	@ProductID int,
	@ProductName varchar(100) OUT,
	@Price money = 0 OUT,
	@Color varchar(10) OUT
)
AS
BEGIN
	-- Check if Product exists.
	IF EXISTS(SELECT 1 FROM DimProduct
				WHERE ProductKey = @ProductID)
    BEGIN
		-- Store data in parameters so that
		-- it can be sent back to the calling application.
		SELECT @ProductName = EnglishProductName,
		       @Price = ISNull(ListPrice,0),
			   @Color = Color
		  FROM DimProduct
		  WHERE ProductKey = @ProductID
		  RETURN 1 -- Return success.
	END
	ELSE
		RAISERROR('Product not found', 16, 1)
		RETURN 0 -- Return Failure.
END
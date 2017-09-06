DECLARE @ReturnValue int
DECLARE @Name varchar(100)
DECLARE @Cost money
DECLARE @Color varchar(15)
DECLARE @ProductID int = 1
EXEC @ReturnValue = PrcGetProducts 
@ProductID, @Name OUT, @Cost OUT, @Color OUT
PRINT @Name
PRINT @Cost
PRINT @Color
PRINT @ReturnValue


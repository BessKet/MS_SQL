CREATE FUNCTION dbo.udf_GetSKUPrice (@ID_SKU AS ID_SKU)
RETURNS decimal (18, 2)
AS
BEGIN (
    SELECT SUM(Value)/SUM(Quantity) AS val
    FROM dbo.Basket
    WHERE ID = @ID_SKU
    GROUP BY @ID_SKU
)
RETURN val
END;
GO

/* Рассчитывает стоимость передаваемого продукта из таблицы dbo.Basket по формуле 
сумма Value по переданному SKU / сумма Quantity по переданному SKU */
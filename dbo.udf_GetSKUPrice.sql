CREATE FUNCTION dbo.udf_GetSKUPrice (@ID_SKU)
RETURNS decimal(18, 2)
AS
RETURN
(
    SELECT SUM(Value)/SUM(Quantity)
    FROM dbo.Basket
    WHERE ID = @ID_SKU
    GROUP BY @ID_SKU
);
GO

/* Рассчитывает стоимость передаваемого продукта из таблицы dbo.Basket по формуле 
сумма Value по переданному SKU / сумма Quantity по переданному SKU */
CREATE VIEW vw_SKUPrice 
AS   
SELECT *, 
    dbo.udf_GetSKUPrice(ID)    
FROM dbo.SKU;  
GO  
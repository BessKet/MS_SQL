CREATE TRIGGER TR_Basket_insert_update
ON dbo.Basket 
BEFORE INSERT   
AS 
BEGIN
  IF (EXISTS(SELECT 1 FROM dbo.Basket WHERE ID_SKU = NEW.ID_SKU)) 
    THEN
        UPDATE DiscountValue = Value * 0,5;
    ELSE
        UPDATE DiscountValue = 0;
  END IF;
END
GO 

/*Если в таблицу dbo.Basket за раз добавляются 2 и более записей одного ID_SKU, то значение в поле DiscountValue, 
для этого ID_SKU рассчитывается по формуле Value * 5%, иначе DiscountValue = 0*/
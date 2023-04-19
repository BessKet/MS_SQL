CREATE PROCEDURE dbo.usp_MakeFamilyPurchase
    @FamilySurName varchar(255)
AS
SET NOCOUNT ON;
UPDATE dbo.Family
SET BudgetValue = dbo.Family.BudgetValue - sum(dbo.Basket.Value)
WHERE dbo.Family.ID = dbo.Basket.ID_Family;
GO


/* Процедура при вызове обновляет данные в таблицы dbo.Family в поле BudgetValue по логике
dbo.Family.BudgetValue - sum(dbo.Basket.Value), где dbo.Basket.Value покупки для переданной в процедуру семьи
При передаче несуществующего dbo.Family.SurName пользователю выдается ошибка, что такой семьи нет — с этим пока не разобралась */
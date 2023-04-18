use tsql2012;

if object_id ('dbo.SKU', 'U') is not null
    drop table dbo.SKU;

create table dbo.SKU (
    ID identity, 
    Name,
    Code AS "s" + ID,
    CONSTRAINT UNQ_SKU_Code
    UNIQUE(Code)
);

if object_id ('dbo.Family', 'U') is not null
    drop table dbo.Family;

create table dbo.Family (
    ID identity, 
    SurName, 
    BudgetValue
);

if object_id ('dbo.Basket', 'U') is not null
    drop table dbo.Basket;

create table dbo.Basket (
    ID identity, 
    ID_SKU, 
    ID_Family (Внешний ключ на таблицу dbo.Family) ,
    Quantity, 
    Value, 
    PurchaseDate, 
    DiscountValue,
    ADD CONSTRAINT FK_Basket_SKU
    FOREIGN KEY(ID_SKU)
    REFERENCES dbo.SKU(ID),
    ADD CONSTRAINT FK_Basket_Family
    FOREIGN KEY(ID_Family)
    REFERENCES dbo.Family(ID),
    ADD CONSTRAINT DFT_Basket_PurchaseDate
    DEFAULT(SYSDATETIME()) FOR PurchaseDate,
    ADD CONSTRAINT CHK_Basket_Quantity
    CHECK(Quantity > 0.00),
    ADD CONSTRAINT CHK_Basket_Value
    CHECK(Value > 0.00),
);
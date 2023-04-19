use tsql2012;

if object_id ('dbo.SKU', 'U') is not null
    drop table dbo.SKU;

create table dbo.SKU (
    ID int, 
    Name varchar,
    Code AS "s" + ID,
    CONSTRAINT UNQ_SKU_Code
    UNIQUE(Code)
);

if object_id ('dbo.Family', 'U') is not null
    drop table dbo.Family;

create table dbo.Family (
    ID int, 
    SurName VARCHAR, 
    BudgetValue DECIMAL
);

if object_id ('dbo.Basket', 'U') is not null
    drop table dbo.Basket;

create table dbo.Basket (
    ID int, 
    ID_SKU int, 
    ID_Family int,
    Quantity int, 
    Value decimal, 
    PurchaseDate date, 
    DiscountValue decimal);

ALTER TABLE dbo.Basket 
ADD CONSTRAINT FK_Basket_SKU
    FOREIGN KEY(ID_SKU)
    REFERENCES dbo.SKU(ID);

ALTER TABLE dbo.Basket 
ADD CONSTRAINT FK_Basket_Family
    FOREIGN KEY(ID_Family)
    REFERENCES dbo.Family(ID);

ALTER TABLE dbo.Basket 
ADD CONSTRAINT DFT_Basket_PurchaseDate
    DEFAULT(SYSDATETIME()) FOR PurchaseDate;

ALTER TABLE dbo.Basket 
ADD CONSTRAINT CHK_Basket_Quantity
    CHECK(Quantity > 0.00);

ALTER TABLE dbo.Basket 
ADD CONSTRAINT CHK_Basket_Value
    CHECK(Value > 0.00);
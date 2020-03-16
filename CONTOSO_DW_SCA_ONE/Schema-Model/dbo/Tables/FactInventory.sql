CREATE TABLE [dbo].[FactInventory]
(
[InventoryKey] [int] NOT NULL IDENTITY(1, 1),
[DateKey] [datetime] NOT NULL,
[StoreKey] [int] NOT NULL,
[ProductKey] [int] NOT NULL,
[CurrencyKey] [int] NOT NULL,
[OnHandQuantity] [int] NOT NULL,
[OnOrderQuantity] [int] NOT NULL,
[SafetyStockQuantity] [int] NULL,
[UnitCost] [money] NOT NULL,
[DaysInStock] [int] NULL,
[MinDayInStock] [int] NULL,
[MaxDayInStock] [int] NULL,
[Aging] [int] NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
ALTER TABLE [dbo].[FactInventory] ADD CONSTRAINT [PK_FactInventory_InventoryKey] PRIMARY KEY CLUSTERED  ([InventoryKey])
GO
ALTER TABLE [dbo].[FactInventory] ADD CONSTRAINT [FK_FactInventory_DimCurrency] FOREIGN KEY ([CurrencyKey]) REFERENCES [dbo].[DimCurrency] ([CurrencyKey])
GO
ALTER TABLE [dbo].[FactInventory] ADD CONSTRAINT [FK_FactInventory_DimDate] FOREIGN KEY ([DateKey]) REFERENCES [dbo].[DimDate] ([Datekey])
GO
ALTER TABLE [dbo].[FactInventory] ADD CONSTRAINT [FK_FactInventory_DimProduct] FOREIGN KEY ([ProductKey]) REFERENCES [dbo].[DimProduct] ([ProductKey])
GO
ALTER TABLE [dbo].[FactInventory] ADD CONSTRAINT [FK_FactInventory_DimStore] FOREIGN KEY ([StoreKey]) REFERENCES [dbo].[DimStore] ([StoreKey])
GO

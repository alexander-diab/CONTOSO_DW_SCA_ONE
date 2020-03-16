CREATE TABLE [dbo].[FactSales]
(
[SalesKey] [int] NOT NULL IDENTITY(1, 1),
[DateKey] [datetime] NOT NULL,
[channelKey] [int] NOT NULL,
[StoreKey] [int] NOT NULL,
[ProductKey] [int] NOT NULL,
[PromotionKey] [int] NOT NULL,
[CurrencyKey] [int] NOT NULL,
[UnitCost] [money] NOT NULL,
[UnitPrice] [money] NOT NULL,
[SalesQuantity] [int] NOT NULL,
[ReturnQuantity] [int] NOT NULL,
[ReturnAmount] [money] NULL,
[DiscountQuantity] [int] NULL,
[DiscountAmount] [money] NULL,
[TotalCost] [money] NOT NULL,
[SalesAmount] [money] NOT NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
ALTER TABLE [dbo].[FactSales] ADD CONSTRAINT [PK_FactSales_SalesKey] PRIMARY KEY CLUSTERED  ([SalesKey])
GO
ALTER TABLE [dbo].[FactSales] ADD CONSTRAINT [FK_FactSales_DimChannel] FOREIGN KEY ([channelKey]) REFERENCES [dbo].[DimChannel] ([ChannelKey])
GO
ALTER TABLE [dbo].[FactSales] ADD CONSTRAINT [FK_FactSales_DimCurrency] FOREIGN KEY ([CurrencyKey]) REFERENCES [dbo].[DimCurrency] ([CurrencyKey])
GO
ALTER TABLE [dbo].[FactSales] ADD CONSTRAINT [FK_FactSales_DimDate] FOREIGN KEY ([DateKey]) REFERENCES [dbo].[DimDate] ([Datekey])
GO
ALTER TABLE [dbo].[FactSales] ADD CONSTRAINT [FK_FactSales_DimProduct] FOREIGN KEY ([ProductKey]) REFERENCES [dbo].[DimProduct] ([ProductKey])
GO
ALTER TABLE [dbo].[FactSales] ADD CONSTRAINT [FK_FactSales_DimPromotion] FOREIGN KEY ([PromotionKey]) REFERENCES [dbo].[DimPromotion] ([PromotionKey])
GO
ALTER TABLE [dbo].[FactSales] ADD CONSTRAINT [FK_FactSales_DimStore] FOREIGN KEY ([StoreKey]) REFERENCES [dbo].[DimStore] ([StoreKey])
GO

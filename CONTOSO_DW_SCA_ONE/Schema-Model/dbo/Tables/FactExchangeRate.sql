CREATE TABLE [dbo].[FactExchangeRate]
(
[ExchangeRateKey] [int] NOT NULL IDENTITY(1, 1),
[CurrencyKey] [int] NOT NULL,
[DateKey] [datetime] NOT NULL,
[AverageRate] [float] NOT NULL,
[EndOfDayRate] [float] NOT NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
ALTER TABLE [dbo].[FactExchangeRate] ADD CONSTRAINT [PK_FactExchangeRate_ExchangeRateKey] PRIMARY KEY CLUSTERED  ([ExchangeRateKey])
GO
ALTER TABLE [dbo].[FactExchangeRate] ADD CONSTRAINT [FK_FactExchangeRate_DimCurrency] FOREIGN KEY ([CurrencyKey]) REFERENCES [dbo].[DimCurrency] ([CurrencyKey])
GO
ALTER TABLE [dbo].[FactExchangeRate] ADD CONSTRAINT [FK_FactExchangeRate_DimDate] FOREIGN KEY ([DateKey]) REFERENCES [dbo].[DimDate] ([Datekey])
GO

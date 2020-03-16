CREATE TABLE [dbo].[DimCurrency]
(
[CurrencyKey] [int] NOT NULL IDENTITY(1, 1),
[CurrencyLabel] [nvarchar] (10) NOT NULL,
[CurrencyName] [nvarchar] (20) NOT NULL,
[CurrencyDescription] [nvarchar] (50) NOT NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
ALTER TABLE [dbo].[DimCurrency] ADD CONSTRAINT [PK_DimCurrency_CurrencyKey] PRIMARY KEY CLUSTERED  ([CurrencyKey])
GO
ALTER TABLE [dbo].[DimCurrency] ADD CONSTRAINT [AK_DimCurrency_CurrencyLabel] UNIQUE NONCLUSTERED  ([CurrencyLabel])
GO

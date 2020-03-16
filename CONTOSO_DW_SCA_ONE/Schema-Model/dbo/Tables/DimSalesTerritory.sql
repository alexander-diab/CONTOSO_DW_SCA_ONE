CREATE TABLE [dbo].[DimSalesTerritory]
(
[SalesTerritoryKey] [int] NOT NULL IDENTITY(1, 1),
[GeographyKey] [int] NOT NULL,
[SalesTerritoryLabel] [nvarchar] (100) NULL,
[SalesTerritoryName] [nvarchar] (50) NOT NULL,
[SalesTerritoryRegion] [nvarchar] (50) NOT NULL,
[SalesTerritoryCountry] [nvarchar] (50) NOT NULL,
[SalesTerritoryGroup] [nvarchar] (50) NULL,
[SalesTerritoryLevel] [nvarchar] (10) NULL,
[SalesTerritoryManager] [int] NULL,
[StartDate] [datetime] NULL,
[EndDate] [datetime] NULL,
[Status] [nvarchar] (50) NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
ALTER TABLE [dbo].[DimSalesTerritory] ADD CONSTRAINT [PK_DimSalesTerritory_SalesTerritoryKey] PRIMARY KEY CLUSTERED  ([SalesTerritoryKey])
GO
ALTER TABLE [dbo].[DimSalesTerritory] ADD CONSTRAINT [AK_DimSalesTerritory_SalesTerritoryLabel] UNIQUE NONCLUSTERED  ([SalesTerritoryLabel])
GO
ALTER TABLE [dbo].[DimSalesTerritory] ADD CONSTRAINT [FK_DimSalesTerritory_DimGeography] FOREIGN KEY ([GeographyKey]) REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO

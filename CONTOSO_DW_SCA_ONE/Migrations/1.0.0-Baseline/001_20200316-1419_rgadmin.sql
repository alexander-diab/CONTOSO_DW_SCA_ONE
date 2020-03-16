-- <Migration ID="c4b4cac9-aab6-40ea-8b97-85fe139d88dc" />
GO

PRINT N'Creating [dbo].[DimGeography]'
GO
CREATE TABLE [dbo].[DimGeography]
(
[GeographyKey] [int] NOT NULL IDENTITY(1, 1),
[GeographyType] [nvarchar] (50) NOT NULL,
[ContinentName] [nvarchar] (50) NOT NULL,
[CityName] [nvarchar] (100) NULL,
[StateProvinceName] [nvarchar] (100) NULL,
[RegionCountryName] [nvarchar] (100) NULL,
[Geometry] [sys].[geometry] NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_DimGeography_GeographyKey] on [dbo].[DimGeography]'
GO
ALTER TABLE [dbo].[DimGeography] ADD CONSTRAINT [PK_DimGeography_GeographyKey] PRIMARY KEY CLUSTERED  ([GeographyKey])
GO
PRINT N'Creating [dbo].[DimCustomer]'
GO
CREATE TABLE [dbo].[DimCustomer]
(
[CustomerKey] [int] NOT NULL IDENTITY(1, 1),
[GeographyKey] [int] NOT NULL,
[CustomerLabel] [nvarchar] (100) NOT NULL,
[Title] [nvarchar] (8) NULL,
[FirstName] [nvarchar] (50) NULL,
[MiddleName] [nvarchar] (50) NULL,
[LastName] [nvarchar] (50) NULL,
[NameStyle] [bit] NULL,
[BirthDate] [date] NULL,
[MaritalStatus] [nchar] (1) NULL,
[Suffix] [nvarchar] (10) NULL,
[Gender] [nvarchar] (1) NULL,
[EmailAddress] [nvarchar] (50) NULL,
[YearlyIncome] [money] NULL,
[TotalChildren] [tinyint] NULL,
[NumberChildrenAtHome] [tinyint] NULL,
[Education] [nvarchar] (40) NULL,
[Occupation] [nvarchar] (100) NULL,
[HouseOwnerFlag] [nchar] (1) NULL,
[NumberCarsOwned] [tinyint] NULL,
[AddressLine1] [nvarchar] (120) NULL,
[AddressLine2] [nvarchar] (120) NULL,
[Phone] [nvarchar] (20) NULL,
[DateFirstPurchase] [date] NULL,
[CustomerType] [nvarchar] (15) NULL,
[CompanyName] [nvarchar] (100) NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_DimCustomer_CustomerKey] on [dbo].[DimCustomer]'
GO
ALTER TABLE [dbo].[DimCustomer] ADD CONSTRAINT [PK_DimCustomer_CustomerKey] PRIMARY KEY CLUSTERED  ([CustomerKey])
GO
PRINT N'Adding constraints to [dbo].[DimCustomer]'
GO
ALTER TABLE [dbo].[DimCustomer] ADD CONSTRAINT [IX_DimCustomer_CustomerLabel] UNIQUE NONCLUSTERED  ([CustomerLabel])
GO
PRINT N'Creating [dbo].[DimStore]'
GO
CREATE TABLE [dbo].[DimStore]
(
[StoreKey] [int] NOT NULL IDENTITY(1, 1),
[GeographyKey] [int] NOT NULL,
[StoreManager] [int] NULL,
[StoreType] [nvarchar] (15) NULL,
[StoreName] [nvarchar] (100) NOT NULL,
[StoreDescription] [nvarchar] (300) NOT NULL,
[Status] [nvarchar] (20) NOT NULL,
[OpenDate] [datetime] NOT NULL,
[CloseDate] [datetime] NULL,
[EntityKey] [int] NULL,
[ZipCode] [nvarchar] (20) NULL,
[ZipCodeExtension] [nvarchar] (10) NULL,
[StorePhone] [nvarchar] (15) NULL,
[StoreFax] [nvarchar] (14) NULL,
[AddressLine1] [nvarchar] (100) NULL,
[AddressLine2] [nvarchar] (100) NULL,
[CloseReason] [nvarchar] (20) NULL,
[EmployeeCount] [int] NULL,
[SellingAreaSize] [float] NULL,
[LastRemodelDate] [datetime] NULL,
[GeoLocation] [sys].[geography] NULL,
[Geometry] [sys].[geometry] NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_DimStore_StoreKey] on [dbo].[DimStore]'
GO
ALTER TABLE [dbo].[DimStore] ADD CONSTRAINT [PK_DimStore_StoreKey] PRIMARY KEY CLUSTERED  ([StoreKey])
GO
PRINT N'Creating [dbo].[DimMachine]'
GO
CREATE TABLE [dbo].[DimMachine]
(
[MachineKey] [int] NOT NULL,
[MachineLabel] [nvarchar] (100) NULL,
[StoreKey] [int] NOT NULL,
[MachineType] [nvarchar] (50) NOT NULL,
[MachineName] [nvarchar] (100) NOT NULL,
[MachineDescription] [nvarchar] (200) NOT NULL,
[VendorName] [nvarchar] (50) NOT NULL,
[MachineOS] [nvarchar] (50) NOT NULL,
[MachineSource] [nvarchar] (100) NOT NULL,
[MachineHardware] [nvarchar] (100) NULL,
[MachineSoftware] [nvarchar] (100) NOT NULL,
[Status] [nvarchar] (50) NOT NULL,
[ServiceStartDate] [datetime] NOT NULL,
[DecommissionDate] [datetime] NULL,
[LastModifiedDate] [datetime] NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_DimMachine_MachineKey] on [dbo].[DimMachine]'
GO
ALTER TABLE [dbo].[DimMachine] ADD CONSTRAINT [PK_DimMachine_MachineKey] PRIMARY KEY CLUSTERED  ([MachineKey])
GO
PRINT N'Creating [dbo].[DimProductSubcategory]'
GO
CREATE TABLE [dbo].[DimProductSubcategory]
(
[ProductSubcategoryKey] [int] NOT NULL IDENTITY(1, 1),
[ProductSubcategoryLabel] [nvarchar] (100) NULL,
[ProductSubcategoryName] [nvarchar] (50) NOT NULL,
[ProductSubcategoryDescription] [nvarchar] (100) NULL,
[ProductCategoryKey] [int] NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_DimProductSubcategory_ProductSubcategoryKey] on [dbo].[DimProductSubcategory]'
GO
ALTER TABLE [dbo].[DimProductSubcategory] ADD CONSTRAINT [PK_DimProductSubcategory_ProductSubcategoryKey] PRIMARY KEY CLUSTERED  ([ProductSubcategoryKey])
GO
PRINT N'Adding constraints to [dbo].[DimProductSubcategory]'
GO
ALTER TABLE [dbo].[DimProductSubcategory] ADD CONSTRAINT [AK_DimProductSubcategory_ProductSubcategoryLabel] UNIQUE NONCLUSTERED  ([ProductSubcategoryLabel])
GO
PRINT N'Creating [dbo].[DimProduct]'
GO
CREATE TABLE [dbo].[DimProduct]
(
[ProductKey] [int] NOT NULL IDENTITY(1, 1),
[ProductLabel] [nvarchar] (255) NULL,
[ProductName] [nvarchar] (500) NULL,
[ProductDescription] [nvarchar] (400) NULL,
[ProductSubcategoryKey] [int] NULL,
[Manufacturer] [nvarchar] (50) NULL,
[BrandName] [nvarchar] (50) NULL,
[ClassID] [nvarchar] (10) NULL,
[ClassName] [nvarchar] (20) NULL,
[StyleID] [nvarchar] (10) NULL,
[StyleName] [nvarchar] (20) NULL,
[ColorID] [nvarchar] (10) NULL,
[ColorName] [nvarchar] (20) NOT NULL,
[Size] [nvarchar] (50) NULL,
[SizeRange] [nvarchar] (50) NULL,
[SizeUnitMeasureID] [nvarchar] (20) NULL,
[Weight] [float] NULL,
[WeightUnitMeasureID] [nvarchar] (20) NULL,
[UnitOfMeasureID] [nvarchar] (10) NULL,
[UnitOfMeasureName] [nvarchar] (40) NULL,
[StockTypeID] [nvarchar] (10) NULL,
[StockTypeName] [nvarchar] (40) NULL,
[UnitCost] [money] NULL,
[UnitPrice] [money] NULL,
[AvailableForSaleDate] [datetime] NULL,
[StopSaleDate] [datetime] NULL,
[Status] [nvarchar] (7) NULL,
[ImageURL] [nvarchar] (150) NULL,
[ProductURL] [nvarchar] (150) NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_DimProduct_ProductKey] on [dbo].[DimProduct]'
GO
ALTER TABLE [dbo].[DimProduct] ADD CONSTRAINT [PK_DimProduct_ProductKey] PRIMARY KEY CLUSTERED  ([ProductKey])
GO
PRINT N'Creating [dbo].[DimProductCategory]'
GO
CREATE TABLE [dbo].[DimProductCategory]
(
[ProductCategoryKey] [int] NOT NULL IDENTITY(1, 1),
[ProductCategoryLabel] [nvarchar] (100) NULL,
[ProductCategoryName] [nvarchar] (30) NOT NULL,
[ProductCategoryDescription] [nvarchar] (50) NOT NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_DimProductCategory_ProductCategoryKey] on [dbo].[DimProductCategory]'
GO
ALTER TABLE [dbo].[DimProductCategory] ADD CONSTRAINT [PK_DimProductCategory_ProductCategoryKey] PRIMARY KEY CLUSTERED  ([ProductCategoryKey])
GO
PRINT N'Adding constraints to [dbo].[DimProductCategory]'
GO
ALTER TABLE [dbo].[DimProductCategory] ADD CONSTRAINT [AK_DimProductCategory_ProductCategoryLabel] UNIQUE NONCLUSTERED  ([ProductCategoryLabel])
GO
PRINT N'Creating [dbo].[DimSalesTerritory]'
GO
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
PRINT N'Creating primary key [PK_DimSalesTerritory_SalesTerritoryKey] on [dbo].[DimSalesTerritory]'
GO
ALTER TABLE [dbo].[DimSalesTerritory] ADD CONSTRAINT [PK_DimSalesTerritory_SalesTerritoryKey] PRIMARY KEY CLUSTERED  ([SalesTerritoryKey])
GO
PRINT N'Adding constraints to [dbo].[DimSalesTerritory]'
GO
ALTER TABLE [dbo].[DimSalesTerritory] ADD CONSTRAINT [AK_DimSalesTerritory_SalesTerritoryLabel] UNIQUE NONCLUSTERED  ([SalesTerritoryLabel])
GO
PRINT N'Creating [dbo].[DimCurrency]'
GO
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
PRINT N'Creating primary key [PK_DimCurrency_CurrencyKey] on [dbo].[DimCurrency]'
GO
ALTER TABLE [dbo].[DimCurrency] ADD CONSTRAINT [PK_DimCurrency_CurrencyKey] PRIMARY KEY CLUSTERED  ([CurrencyKey])
GO
PRINT N'Adding constraints to [dbo].[DimCurrency]'
GO
ALTER TABLE [dbo].[DimCurrency] ADD CONSTRAINT [AK_DimCurrency_CurrencyLabel] UNIQUE NONCLUSTERED  ([CurrencyLabel])
GO
PRINT N'Creating [dbo].[FactExchangeRate]'
GO
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
PRINT N'Creating primary key [PK_FactExchangeRate_ExchangeRateKey] on [dbo].[FactExchangeRate]'
GO
ALTER TABLE [dbo].[FactExchangeRate] ADD CONSTRAINT [PK_FactExchangeRate_ExchangeRateKey] PRIMARY KEY CLUSTERED  ([ExchangeRateKey])
GO
PRINT N'Creating [dbo].[DimDate]'
GO
CREATE TABLE [dbo].[DimDate]
(
[Datekey] [datetime] NOT NULL,
[FullDateLabel] [nvarchar] (20) NOT NULL,
[DateDescription] [nvarchar] (20) NOT NULL,
[CalendarYear] [int] NOT NULL,
[CalendarYearLabel] [nvarchar] (20) NOT NULL,
[CalendarHalfYear] [int] NOT NULL,
[CalendarHalfYearLabel] [nvarchar] (20) NOT NULL,
[CalendarQuarter] [int] NOT NULL,
[CalendarQuarterLabel] [nvarchar] (20) NULL,
[CalendarMonth] [int] NOT NULL,
[CalendarMonthLabel] [nvarchar] (20) NOT NULL,
[CalendarWeek] [int] NOT NULL,
[CalendarWeekLabel] [nvarchar] (20) NOT NULL,
[CalendarDayOfWeek] [int] NOT NULL,
[CalendarDayOfWeekLabel] [nvarchar] (10) NOT NULL,
[FiscalYear] [int] NOT NULL,
[FiscalYearLabel] [nvarchar] (20) NOT NULL,
[FiscalHalfYear] [int] NOT NULL,
[FiscalHalfYearLabel] [nvarchar] (20) NOT NULL,
[FiscalQuarter] [int] NOT NULL,
[FiscalQuarterLabel] [nvarchar] (20) NOT NULL,
[FiscalMonth] [int] NOT NULL,
[FiscalMonthLabel] [nvarchar] (20) NOT NULL,
[IsWorkDay] [nvarchar] (20) NOT NULL,
[IsHoliday] [int] NOT NULL,
[HolidayName] [nvarchar] (20) NOT NULL,
[EuropeSeason] [nvarchar] (50) NULL,
[NorthAmericaSeason] [nvarchar] (50) NULL,
[AsiaSeason] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK_DimDate_DateKey] on [dbo].[DimDate]'
GO
ALTER TABLE [dbo].[DimDate] ADD CONSTRAINT [PK_DimDate_DateKey] PRIMARY KEY CLUSTERED  ([Datekey])
GO
PRINT N'Creating [dbo].[FactInventory]'
GO
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
PRINT N'Creating primary key [PK_FactInventory_InventoryKey] on [dbo].[FactInventory]'
GO
ALTER TABLE [dbo].[FactInventory] ADD CONSTRAINT [PK_FactInventory_InventoryKey] PRIMARY KEY CLUSTERED  ([InventoryKey])
GO
PRINT N'Creating [dbo].[FactITMachine]'
GO
CREATE TABLE [dbo].[FactITMachine]
(
[ITMachinekey] [int] NOT NULL IDENTITY(1, 1),
[MachineKey] [int] NOT NULL,
[Datekey] [datetime] NOT NULL,
[CostAmount] [money] NULL,
[CostType] [nvarchar] (200) NOT NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_FactITMachine] on [dbo].[FactITMachine]'
GO
ALTER TABLE [dbo].[FactITMachine] ADD CONSTRAINT [PK_FactITMachine] PRIMARY KEY CLUSTERED  ([ITMachinekey])
GO
PRINT N'Creating [dbo].[FactITSLA]'
GO
CREATE TABLE [dbo].[FactITSLA]
(
[ITSLAkey] [int] NOT NULL IDENTITY(1, 1),
[DateKey] [datetime] NOT NULL,
[StoreKey] [int] NOT NULL,
[MachineKey] [int] NOT NULL,
[OutageKey] [int] NOT NULL,
[OutageStartTime] [datetime] NOT NULL,
[OutageEndTime] [datetime] NOT NULL,
[DownTime] [int] NOT NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_FactITSLA_ITSLAKey] on [dbo].[FactITSLA]'
GO
ALTER TABLE [dbo].[FactITSLA] ADD CONSTRAINT [PK_FactITSLA_ITSLAKey] PRIMARY KEY CLUSTERED  ([ITSLAkey])
GO
PRINT N'Creating [dbo].[DimOutage]'
GO
CREATE TABLE [dbo].[DimOutage]
(
[OutageKey] [int] NOT NULL IDENTITY(1, 1),
[OutageLabel] [nvarchar] (100) NOT NULL,
[OutageName] [nvarchar] (50) NOT NULL,
[OutageDescription] [nvarchar] (200) NOT NULL,
[OutageType] [nvarchar] (50) NOT NULL,
[OutageTypeDescription] [nvarchar] (200) NOT NULL,
[OutageSubType] [nvarchar] (50) NOT NULL,
[OutageSubTypeDescription] [nvarchar] (200) NOT NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_DimOutage_OutageKey] on [dbo].[DimOutage]'
GO
ALTER TABLE [dbo].[DimOutage] ADD CONSTRAINT [PK_DimOutage_OutageKey] PRIMARY KEY CLUSTERED  ([OutageKey])
GO
PRINT N'Creating [dbo].[FactOnlineSales]'
GO
CREATE TABLE [dbo].[FactOnlineSales]
(
[OnlineSalesKey] [int] NOT NULL IDENTITY(1, 1),
[DateKey] [datetime] NOT NULL,
[StoreKey] [int] NOT NULL,
[ProductKey] [int] NOT NULL,
[PromotionKey] [int] NOT NULL,
[CurrencyKey] [int] NOT NULL,
[CustomerKey] [int] NOT NULL,
[SalesOrderNumber] [nvarchar] (20) NOT NULL,
[SalesOrderLineNumber] [int] NULL,
[SalesQuantity] [int] NOT NULL,
[SalesAmount] [money] NOT NULL,
[ReturnQuantity] [int] NOT NULL,
[ReturnAmount] [money] NULL,
[DiscountQuantity] [int] NULL,
[DiscountAmount] [money] NULL,
[TotalCost] [money] NOT NULL,
[UnitCost] [money] NULL,
[UnitPrice] [money] NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_FactOnlineSales_SalesKey] on [dbo].[FactOnlineSales]'
GO
ALTER TABLE [dbo].[FactOnlineSales] ADD CONSTRAINT [PK_FactOnlineSales_SalesKey] PRIMARY KEY CLUSTERED  ([OnlineSalesKey])
GO
PRINT N'Creating [dbo].[DimPromotion]'
GO
CREATE TABLE [dbo].[DimPromotion]
(
[PromotionKey] [int] NOT NULL IDENTITY(1, 1),
[PromotionLabel] [nvarchar] (100) NULL,
[PromotionName] [nvarchar] (100) NULL,
[PromotionDescription] [nvarchar] (255) NULL,
[DiscountPercent] [float] NULL,
[PromotionType] [nvarchar] (50) NULL,
[PromotionCategory] [nvarchar] (50) NULL,
[StartDate] [datetime] NOT NULL,
[EndDate] [datetime] NULL,
[MinQuantity] [int] NULL,
[MaxQuantity] [int] NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_DimPromotion_PromotionKey] on [dbo].[DimPromotion]'
GO
ALTER TABLE [dbo].[DimPromotion] ADD CONSTRAINT [PK_DimPromotion_PromotionKey] PRIMARY KEY CLUSTERED  ([PromotionKey])
GO
PRINT N'Adding constraints to [dbo].[DimPromotion]'
GO
ALTER TABLE [dbo].[DimPromotion] ADD CONSTRAINT [AK_DimPromotion_PromotionLabel] UNIQUE NONCLUSTERED  ([PromotionLabel])
GO
PRINT N'Creating [dbo].[DimChannel]'
GO
CREATE TABLE [dbo].[DimChannel]
(
[ChannelKey] [int] NOT NULL IDENTITY(1, 1),
[ChannelLabel] [nvarchar] (100) NOT NULL,
[ChannelName] [nvarchar] (20) NULL,
[ChannelDescription] [nvarchar] (50) NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_DimChannel_ChannelKey] on [dbo].[DimChannel]'
GO
ALTER TABLE [dbo].[DimChannel] ADD CONSTRAINT [PK_DimChannel_ChannelKey] PRIMARY KEY CLUSTERED  ([ChannelKey])
GO
PRINT N'Creating [dbo].[FactSales]'
GO
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
PRINT N'Creating primary key [PK_FactSales_SalesKey] on [dbo].[FactSales]'
GO
ALTER TABLE [dbo].[FactSales] ADD CONSTRAINT [PK_FactSales_SalesKey] PRIMARY KEY CLUSTERED  ([SalesKey])
GO
PRINT N'Creating [dbo].[FactSalesQuota]'
GO
CREATE TABLE [dbo].[FactSalesQuota]
(
[SalesQuotaKey] [int] NOT NULL IDENTITY(1, 1),
[ChannelKey] [int] NOT NULL,
[StoreKey] [int] NOT NULL,
[ProductKey] [int] NOT NULL,
[DateKey] [datetime] NOT NULL,
[CurrencyKey] [int] NOT NULL,
[ScenarioKey] [int] NOT NULL,
[SalesQuantityQuota] [money] NOT NULL,
[SalesAmountQuota] [money] NOT NULL,
[GrossMarginQuota] [money] NOT NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_FactSalesQuota_SalesQuotaKey] on [dbo].[FactSalesQuota]'
GO
ALTER TABLE [dbo].[FactSalesQuota] ADD CONSTRAINT [PK_FactSalesQuota_SalesQuotaKey] PRIMARY KEY CLUSTERED  ([SalesQuotaKey])
GO
PRINT N'Creating [dbo].[DimScenario]'
GO
CREATE TABLE [dbo].[DimScenario]
(
[ScenarioKey] [int] NOT NULL IDENTITY(1, 1),
[ScenarioLabel] [nvarchar] (100) NOT NULL,
[ScenarioName] [nvarchar] (20) NULL,
[ScenarioDescription] [nvarchar] (50) NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_DimScenario] on [dbo].[DimScenario]'
GO
ALTER TABLE [dbo].[DimScenario] ADD CONSTRAINT [PK_DimScenario] PRIMARY KEY CLUSTERED  ([ScenarioKey])
GO
PRINT N'Creating [dbo].[DimAccount]'
GO
CREATE TABLE [dbo].[DimAccount]
(
[AccountKey] [int] NOT NULL IDENTITY(1, 1),
[ParentAccountKey] [int] NULL,
[AccountLabel] [nvarchar] (100) NULL,
[AccountName] [nvarchar] (50) NULL,
[AccountDescription] [nvarchar] (50) NULL,
[AccountType] [nvarchar] (50) NULL,
[Operator] [nvarchar] (50) NULL,
[CustomMembers] [nvarchar] (300) NULL,
[ValueType] [nvarchar] (50) NULL,
[CustomMemberOptions] [nvarchar] (200) NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_DimAccount_AccountKey] on [dbo].[DimAccount]'
GO
ALTER TABLE [dbo].[DimAccount] ADD CONSTRAINT [PK_DimAccount_AccountKey] PRIMARY KEY CLUSTERED  ([AccountKey])
GO
PRINT N'Creating [dbo].[FactStrategyPlan]'
GO
CREATE TABLE [dbo].[FactStrategyPlan]
(
[StrategyPlanKey] [int] NOT NULL IDENTITY(1, 1),
[Datekey] [datetime] NOT NULL,
[EntityKey] [int] NOT NULL,
[ScenarioKey] [int] NOT NULL,
[AccountKey] [int] NOT NULL,
[CurrencyKey] [int] NOT NULL,
[ProductCategoryKey] [int] NULL,
[Amount] [money] NOT NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_FactStrategyPlan_StrategyPlanKey] on [dbo].[FactStrategyPlan]'
GO
ALTER TABLE [dbo].[FactStrategyPlan] ADD CONSTRAINT [PK_FactStrategyPlan_StrategyPlanKey] PRIMARY KEY CLUSTERED  ([StrategyPlanKey])
GO
PRINT N'Creating [dbo].[DimEntity]'
GO
CREATE TABLE [dbo].[DimEntity]
(
[EntityKey] [int] NOT NULL IDENTITY(1, 1),
[EntityLabel] [nvarchar] (100) NULL,
[ParentEntityKey] [int] NULL,
[ParentEntityLabel] [nvarchar] (100) NULL,
[EntityName] [nvarchar] (50) NULL,
[EntityDescription] [nvarchar] (100) NULL,
[EntityType] [nvarchar] (100) NULL,
[StartDate] [datetime] NULL,
[EndDate] [datetime] NULL,
[Status] [nvarchar] (50) NULL CONSTRAINT [DF_DimEntity_Status] DEFAULT (N'Current'),
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_DimEntity_EntityKey] on [dbo].[DimEntity]'
GO
ALTER TABLE [dbo].[DimEntity] ADD CONSTRAINT [PK_DimEntity_EntityKey] PRIMARY KEY CLUSTERED  ([EntityKey])
GO
PRINT N'Creating [dbo].[V_ProductForecast]'
GO
CREATE VIEW [dbo].[V_ProductForecast]
AS
SELECT     D.CalendarMonth, CONVERT(datetime, CONVERT(varchar(6), D.CalendarMonth) + '01', 120) AS ReportDate, C.ProductCategoryName, SUM(S.SalesQuantity) 
                      AS SalesQuantity, SUM(S.SalesAmount) AS SalesAmount
FROM         dbo.FactOnlineSales AS S INNER JOIN
                      dbo.DimProduct AS P ON S.ProductKey = P.ProductKey INNER JOIN
                      dbo.DimProductSubcategory AS SC ON P.ProductSubcategoryKey = SC.ProductSubcategoryKey INNER JOIN
                      dbo.DimProductCategory AS C ON SC.ProductCategoryKey = C.ProductCategoryKey INNER JOIN
                      dbo.DimDate AS D ON S.DateKey = D.Datekey
GROUP BY D.CalendarMonth, C.ProductCategoryName
GO
PRINT N'Creating [dbo].[V_CustomerOrders]'
GO
CREATE VIEW [dbo].[V_CustomerOrders]
AS
    SELECT
        pc.[ProductCategoryName]
        ,psc.ProductSubcategoryName AS ProductSubcategory
        ,p.ProductName AS Product
        ,c.[CustomerKey]
        ,g.RegionCountryName AS [Region]
        ,CASE
            WHEN Month(GetDate()) < Month(c.[BirthDate])
                THEN DateDiff(yy,c.[BirthDate],GetDate()) - 1
            WHEN Month(GetDate()) = Month(c.[BirthDate])
            AND Day(GetDate()) < Day(c.[BirthDate])
                THEN DateDiff(yy,c.[BirthDate],GetDate()) - 1
            ELSE DateDiff(yy,c.[BirthDate],GetDate())
        END AS [Age]
        ,CASE
            WHEN c.[YearlyIncome] < 40000 THEN 'Low'
            WHEN c.[YearlyIncome] > 100000 THEN 'High'
            ELSE 'Moderate'
        END AS [IncomeGroup]
        ,d.[CalendarYear]
        ,d.[FiscalYear]
        ,d.[CalendarMonth] AS [Month]
        ,f.[SalesOrderNumber] AS [OrderNumber]
        ,f.SalesOrderLineNumber AS LineNumber
        ,f.SalesQuantity AS Quantity
        ,f.SalesAmount AS Amount  
    FROM
        [dbo].[FactOnlineSales] f
    INNER JOIN [dbo].[DimDate] d
        ON f.[DateKey] = d.[DateKey]
    INNER JOIN [dbo].[DimProduct] p
        ON f.[ProductKey] = p.[ProductKey]
    INNER JOIN [dbo].[DimProductSubcategory] psc
        ON p.[ProductSubcategoryKey] = psc.[ProductSubcategoryKey]
    INNER JOIN [dbo].[DimProductCategory] pc
        ON psc.[ProductCategoryKey] = pc.[ProductCategoryKey]
    INNER JOIN [dbo].[DimCustomer] c
        ON f.[CustomerKey] = c.[CustomerKey]
    INNER JOIN [dbo].[DimGeography] g
        ON c.[GeographyKey] = g.[GeographyKey]
   
;

GO
PRINT N'Creating [dbo].[V_OnlineSalesOrderDetail]'
GO
CREATE VIEW [dbo].[V_OnlineSalesOrderDetail]
AS
SELECT     OrderNumber, LineNumber, Product
FROM         dbo.V_CustomerOrders
WHERE     (CalendarYear = 2007)
GO
PRINT N'Creating [dbo].[V_Customer]'
GO
CREATE VIEW [dbo].[V_Customer]
AS
SELECT     C.CustomerKey, DATEDIFF(year, C.BirthDate, GETDATE()) AS Age, C.MaritalStatus, C.Gender, C.YearlyIncome, C.TotalChildren, C.NumberChildrenAtHome, C.Education, 
                      C.HouseOwnerFlag, C.NumberCarsOwned, S.Consumption
FROM         dbo.DimCustomer AS C INNER JOIN
                          (SELECT     CustomerKey, SUM(SalesAmount) AS Consumption
                            FROM          dbo.FactOnlineSales
                            GROUP BY CustomerKey) AS S ON C.CustomerKey = S.CustomerKey
WHERE     (C.CustomerType = 'Person')
GO
PRINT N'Creating [dbo].[V_CustomerPromotion]'
GO
CREATE VIEW [dbo].[V_CustomerPromotion]
AS
SELECT     dbo.DimCustomer.CustomerKey, DATEDIFF(year, dbo.DimCustomer.BirthDate, GETDATE()) AS Age, dbo.DimCustomer.MaritalStatus, dbo.DimCustomer.Gender, 
                      dbo.DimCustomer.YearlyIncome, dbo.DimCustomer.TotalChildren, dbo.DimCustomer.NumberChildrenAtHome, dbo.DimCustomer.Education, 
                      dbo.DimCustomer.HouseOwnerFlag, dbo.DimCustomer.NumberCarsOwned, dbo.DimPromotion.PromotionName, dbo.DimPromotion.PromotionType, 
                      dbo.FactOnlineSales.ProductKey, dbo.FactOnlineSales.PromotionKey
FROM         dbo.DimCustomer INNER JOIN
                      dbo.FactOnlineSales ON dbo.DimCustomer.CustomerKey = dbo.FactOnlineSales.CustomerKey INNER JOIN
                      dbo.DimPromotion ON dbo.FactOnlineSales.PromotionKey = dbo.DimPromotion.PromotionKey
WHERE     (dbo.DimCustomer.CustomerType = 'Person') AND (dbo.FactOnlineSales.ProductKey >= 1144) AND (dbo.FactOnlineSales.ProductKey <= 1246)
GO
PRINT N'Creating [dbo].[V_OnlineSalesOrder]'
GO
CREATE VIEW [dbo].[V_OnlineSalesOrder]
AS
SELECT DISTINCT OrderNumber, CustomerKey, Region, IncomeGroup
FROM         dbo.V_CustomerOrders
WHERE     (CalendarYear = 2007)
GO
PRINT N'Creating [dbo].[P_FactStrategyPlan]'
GO



CREATE PROC [dbo].[P_FactStrategyPlan]
(
	@AdminCost float,----The percentage of the account
	@ITCost float,
	@HRCost float,
	@EnergyCost float,
	@FixedCost float,
	@VariableCost float,
	@AdCost float,
	@SpringAdCost float,
	@BackSchool float,
	@HolidayAdCost float,
	@CostofGoodsSold float,
	@SellCost float
)
AS
Begin
---Basic Data
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 2 as ScenarioKey, 8 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,
SUM(SalesAmount)*(RAND()*0.2+0.95) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY a.CalendarMonth,a.EntityKey,a.ProductCategoryKey

---Generate data for different account.
---AdminCost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 1 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@AdminCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---ITCost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 2 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@ITCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---HR Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 3 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@HRCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
from FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Energy Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 4 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@EnergyCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Fixed Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 5 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@FixedCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Variable Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 6 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@VariableCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Ad Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 7 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@AdCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Total Product Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 9 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(a.TotalCost)) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey


---Spring / Back to Business Ad Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 10 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@SpringAdCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Back-to-School Ad Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 11 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@BackSchool) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
from FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Holiday Ad Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 12 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@HolidayAdCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Cost of Goods Sold 
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 13 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@CostofGoodsSold) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Selling, General & Administrative Expenses  
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 14 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@SellCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

End


GO
PRINT N'Creating [dbo].[P_FactSalesQuota]'
GO

--EXEC P_FactSalesQuota 0.25,0.45,0.35,0.25,0.35,0.3,0.2,0.25,0.2,0.15,0.05,0.05,0.2,0.05,0.05,0.1,0.05,0.05

CREATE PROC [dbo].[P_FactSalesQuota]
(
	@NAmerican2007 float,-----The forecast parameter
	@NAmerican2008 float,
	@NAmerican2009 float,
	@Europe2007 float,
	@Europe2008 float,
	@Europe2009 float,
	@Asia2007 float,
	@Asia2008 float,
	@Asia2009 float,
	@NAmerican2007Budget float,
	@NAmerican2008Budget float,
	@NAmerican2009Budget float,
	@Europe2007Budget float,
	@Europe2008Budget float,
	@Europe2009Budget float,
	@Asia2007Budget float,
	@Asia2008Budget float,
	@Asia2009Budget float	
)
AS
BEGIN
---Generate Basic Data
INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
 
SELECT      S.channelKey,S.StoreKey,S.ProductKey,
            DATEADD(d,-DAY(S.DateKey)+1,S.DateKey) AS DateKey,
            S.CurrencyKey,1 AS ScenarioKey,--Actual
            SUM(S.SalesQuantity) AS SalesQuantityQuota,
            SUM(S.SalesAmount) AS SalesAmount,
            SUM(S.SalesAmount)-SUM(S.ReturnAmount)-SUM(S.TotalCost) AS GrossMarginQuota,
            1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM		FactSales S
GROUP BY    S.StoreKey,DATEADD(d,-DAY(S.DateKey)+1,S.DateKey),
			S.channelKey,S.ProductKey,S.CurrencyKey

                  
---Update the Basic Data
---NAmerican
INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@NAmerican2007 + 0.9)) ,
            s.SalesAmountQuota * (RAND()*@NAmerican2007 + 0.9) , 
            s.GrossMarginQuota * (RAND()*@NAmerican2007 + 0.9) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE	s.ScenarioKey = 1 and s.DateKey>='20070101' and s.DateKey<='20080630' 
		and SubString(e.EntityLabel,1,2) = '01'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@NAmerican2008 + 1)) ,
            s.SalesAmountQuota * (RAND()*@NAmerican2008 + 1) , 
            s.GrossMarginQuota * (RAND()*@NAmerican2008 + 1) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20080701' and s.DateKey<='20081231' and SubString(e.EntityLabel,1,2) = '01'


INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@NAmerican2009 + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@NAmerican2009 + 0.8) , 
            s.GrossMarginQuota * (RAND()*@NAmerican2009 + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20090101' and s.DateKey<='20091231' and SubString(e.EntityLabel,1,2) = '01'

---Europe
INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Europe2007 + 0.9)) ,
            s.SalesAmountQuota * (RAND()*@Europe2007 + 0.9) , 
            s.GrossMarginQuota * (RAND()*@Europe2007 + 0.9) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20070101' and s.DateKey<='20080630' and SubString(e.EntityLabel,1,2) = '02'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Europe2008 + 1)) ,
            s.SalesAmountQuota * (RAND()*@Europe2008 + 1) , 
            s.GrossMarginQuota * (RAND()*@Europe2008 + 1) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20080701' and s.DateKey<='20081231' and SubString(e.EntityLabel,1,2) = '02'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Europe2009 + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Europe2009 + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Europe2009 + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20090101' and s.DateKey<='20091231' and SubString(e.EntityLabel,1,2) = '02'

---Asia
INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Asia2007 + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Asia2007 + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Asia2007 + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20070101' and s.DateKey<='20080630' and SubString(e.EntityLabel,1,2) = '03'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Asia2008 + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Asia2008 + 0.9) , 
            s.GrossMarginQuota * (RAND()*@Asia2008 + 0.9) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20080701' and s.DateKey<='20081231' and SubString(e.EntityLabel,1,2) = '03'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
           Convert(int, s.SalesQuantityQuota * (RAND()*@Asia2009 + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Asia2009 + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Asia2009 + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20090101' and s.DateKey<='20091231' and SubString(e.EntityLabel,1,2) = '03'


---NAmerican budget data
INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@NAmerican2007Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@NAmerican2007Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@NAmerican2007Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20070101' and s.DateKey<='20080630' and SubString(e.EntityLabel,1,2) = '01'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@NAmerican2008Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@NAmerican2008Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@NAmerican2008Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20080701' and s.DateKey<='20081231' and SubString(e.EntityLabel,1,2) = '01'


INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@NAmerican2009Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@NAmerican2009Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@NAmerican2009Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20090101' and s.DateKey<='20091231' and SubString(e.EntityLabel,1,2) = '01'

---Europe budget data
INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Europe2007Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Europe2007Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Europe2007Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20070101' and s.DateKey<='20080630' and SubString(e.EntityLabel,1,2) = '02'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Europe2008Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Europe2008Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Europe2008Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20080701' and s.DateKey<='20081231' and SubString(e.EntityLabel,1,2) = '02'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Europe2009Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Europe2009Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Europe2009Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20090101' and s.DateKey<='20091231' and SubString(e.EntityLabel,1,2) = '02'

---Asia budget
INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Asia2007Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Asia2007Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Asia2007Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20070101' and s.DateKey<='20080630' and SubString(e.EntityLabel,1,2) = '03'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Asia2008Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Asia2008Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Asia2008Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20080701' and s.DateKey<='20081231' and SubString(e.EntityLabel,1,2) = '03'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
           Convert(int, s.SalesQuantityQuota * (RAND()*@Asia2009Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Asia2009Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Asia2009Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20090101' and s.DateKey<='20091231' and SubString(e.EntityLabel,1,2) = '03'

--End
End



GO
PRINT N'Creating [dbo].[DimEmployee]'
GO
CREATE TABLE [dbo].[DimEmployee]
(
[EmployeeKey] [int] NOT NULL IDENTITY(1, 1),
[ParentEmployeeKey] [int] NULL,
[FirstName] [nvarchar] (50) NOT NULL,
[LastName] [nvarchar] (50) NOT NULL,
[MiddleName] [nvarchar] (50) NULL,
[Title] [nvarchar] (50) NULL,
[HireDate] [date] NULL,
[BirthDate] [date] NULL,
[EmailAddress] [nvarchar] (50) NULL,
[Phone] [nvarchar] (25) NULL,
[MaritalStatus] [nchar] (1) NULL,
[EmergencyContactName] [nvarchar] (50) NULL,
[EmergencyContactPhone] [nvarchar] (25) NULL,
[SalariedFlag] [bit] NULL,
[Gender] [nchar] (1) NULL,
[PayFrequency] [tinyint] NULL,
[BaseRate] [money] NULL,
[VacationHours] [smallint] NULL,
[CurrentFlag] [bit] NOT NULL,
[SalesPersonFlag] [bit] NOT NULL,
[DepartmentName] [nvarchar] (50) NULL,
[StartDate] [date] NULL,
[EndDate] [date] NULL,
[Status] [nvarchar] (50) NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_DimEmployee_EmployeeKey] on [dbo].[DimEmployee]'
GO
ALTER TABLE [dbo].[DimEmployee] ADD CONSTRAINT [PK_DimEmployee_EmployeeKey] PRIMARY KEY CLUSTERED  ([EmployeeKey])
GO
PRINT N'Adding foreign keys to [dbo].[FactStrategyPlan]'
GO
ALTER TABLE [dbo].[FactStrategyPlan] ADD CONSTRAINT [FK_FactStrategyPlan_DimAccount] FOREIGN KEY ([AccountKey]) REFERENCES [dbo].[DimAccount] ([AccountKey])
GO
ALTER TABLE [dbo].[FactStrategyPlan] ADD CONSTRAINT [FK_FactStrategyPlan_DimCurrency] FOREIGN KEY ([CurrencyKey]) REFERENCES [dbo].[DimCurrency] ([CurrencyKey])
GO
ALTER TABLE [dbo].[FactStrategyPlan] ADD CONSTRAINT [FK_FactStrategyPlan_DimDate] FOREIGN KEY ([Datekey]) REFERENCES [dbo].[DimDate] ([Datekey])
GO
ALTER TABLE [dbo].[FactStrategyPlan] ADD CONSTRAINT [FK_FactStrategyPlan_DimEntity] FOREIGN KEY ([EntityKey]) REFERENCES [dbo].[DimEntity] ([EntityKey])
GO
ALTER TABLE [dbo].[FactStrategyPlan] ADD CONSTRAINT [FK_FactStrategyPlan_DimProductCategory] FOREIGN KEY ([ProductCategoryKey]) REFERENCES [dbo].[DimProductCategory] ([ProductCategoryKey])
GO
ALTER TABLE [dbo].[FactStrategyPlan] ADD CONSTRAINT [FK_FactStrategyPlan_DimScenario] FOREIGN KEY ([ScenarioKey]) REFERENCES [dbo].[DimScenario] ([ScenarioKey])
GO
PRINT N'Adding foreign keys to [dbo].[FactSales]'
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
PRINT N'Adding foreign keys to [dbo].[FactSalesQuota]'
GO
ALTER TABLE [dbo].[FactSalesQuota] ADD CONSTRAINT [FK_FactSalesQuota_DimChannel] FOREIGN KEY ([ChannelKey]) REFERENCES [dbo].[DimChannel] ([ChannelKey])
GO
ALTER TABLE [dbo].[FactSalesQuota] ADD CONSTRAINT [FK_FactSalesQuota_DimCurrency] FOREIGN KEY ([CurrencyKey]) REFERENCES [dbo].[DimCurrency] ([CurrencyKey])
GO
ALTER TABLE [dbo].[FactSalesQuota] ADD CONSTRAINT [FK_FactSalesQuota_DimDate] FOREIGN KEY ([DateKey]) REFERENCES [dbo].[DimDate] ([Datekey])
GO
ALTER TABLE [dbo].[FactSalesQuota] ADD CONSTRAINT [FK_FactSalesQuota_DimProduct] FOREIGN KEY ([ProductKey]) REFERENCES [dbo].[DimProduct] ([ProductKey])
GO
ALTER TABLE [dbo].[FactSalesQuota] ADD CONSTRAINT [FK_FactSalesQuota_DimScenario] FOREIGN KEY ([ScenarioKey]) REFERENCES [dbo].[DimScenario] ([ScenarioKey])
GO
ALTER TABLE [dbo].[FactSalesQuota] ADD CONSTRAINT [FK_FactSalesQuota_DimStore] FOREIGN KEY ([StoreKey]) REFERENCES [dbo].[DimStore] ([StoreKey])
GO
PRINT N'Adding foreign keys to [dbo].[FactExchangeRate]'
GO
ALTER TABLE [dbo].[FactExchangeRate] ADD CONSTRAINT [FK_FactExchangeRate_DimCurrency] FOREIGN KEY ([CurrencyKey]) REFERENCES [dbo].[DimCurrency] ([CurrencyKey])
GO
ALTER TABLE [dbo].[FactExchangeRate] ADD CONSTRAINT [FK_FactExchangeRate_DimDate] FOREIGN KEY ([DateKey]) REFERENCES [dbo].[DimDate] ([Datekey])
GO
PRINT N'Adding foreign keys to [dbo].[FactInventory]'
GO
ALTER TABLE [dbo].[FactInventory] ADD CONSTRAINT [FK_FactInventory_DimCurrency] FOREIGN KEY ([CurrencyKey]) REFERENCES [dbo].[DimCurrency] ([CurrencyKey])
GO
ALTER TABLE [dbo].[FactInventory] ADD CONSTRAINT [FK_FactInventory_DimDate] FOREIGN KEY ([DateKey]) REFERENCES [dbo].[DimDate] ([Datekey])
GO
ALTER TABLE [dbo].[FactInventory] ADD CONSTRAINT [FK_FactInventory_DimProduct] FOREIGN KEY ([ProductKey]) REFERENCES [dbo].[DimProduct] ([ProductKey])
GO
ALTER TABLE [dbo].[FactInventory] ADD CONSTRAINT [FK_FactInventory_DimStore] FOREIGN KEY ([StoreKey]) REFERENCES [dbo].[DimStore] ([StoreKey])
GO
PRINT N'Adding foreign keys to [dbo].[FactOnlineSales]'
GO
ALTER TABLE [dbo].[FactOnlineSales] ADD CONSTRAINT [FK_FactOnlineSales_DimCurrency] FOREIGN KEY ([CurrencyKey]) REFERENCES [dbo].[DimCurrency] ([CurrencyKey])
GO
ALTER TABLE [dbo].[FactOnlineSales] ADD CONSTRAINT [FK_FactOnlineSales_DimCustomer] FOREIGN KEY ([CustomerKey]) REFERENCES [dbo].[DimCustomer] ([CustomerKey])
GO
ALTER TABLE [dbo].[FactOnlineSales] ADD CONSTRAINT [FK_FactOnlineSales_DimDate] FOREIGN KEY ([DateKey]) REFERENCES [dbo].[DimDate] ([Datekey])
GO
ALTER TABLE [dbo].[FactOnlineSales] ADD CONSTRAINT [FK_FactOnlineSales_DimProduct] FOREIGN KEY ([ProductKey]) REFERENCES [dbo].[DimProduct] ([ProductKey])
GO
ALTER TABLE [dbo].[FactOnlineSales] ADD CONSTRAINT [FK_FactOnlineSales_DimPromotion] FOREIGN KEY ([PromotionKey]) REFERENCES [dbo].[DimPromotion] ([PromotionKey])
GO
ALTER TABLE [dbo].[FactOnlineSales] ADD CONSTRAINT [FK_FactOnlineSales_DimStore] FOREIGN KEY ([StoreKey]) REFERENCES [dbo].[DimStore] ([StoreKey])
GO
PRINT N'Adding foreign keys to [dbo].[DimCustomer]'
GO
ALTER TABLE [dbo].[DimCustomer] ADD CONSTRAINT [FK_DimCustomer_DimGeography] FOREIGN KEY ([GeographyKey]) REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO
PRINT N'Adding foreign keys to [dbo].[FactITMachine]'
GO
ALTER TABLE [dbo].[FactITMachine] ADD CONSTRAINT [FK_FactITMachine_DimDate] FOREIGN KEY ([Datekey]) REFERENCES [dbo].[DimDate] ([Datekey])
GO
ALTER TABLE [dbo].[FactITMachine] ADD CONSTRAINT [FK_FactITMachine_DimMachine] FOREIGN KEY ([MachineKey]) REFERENCES [dbo].[DimMachine] ([MachineKey])
GO
PRINT N'Adding foreign keys to [dbo].[FactITSLA]'
GO
ALTER TABLE [dbo].[FactITSLA] ADD CONSTRAINT [FK_FactITSLA_DimDate] FOREIGN KEY ([DateKey]) REFERENCES [dbo].[DimDate] ([Datekey])
GO
ALTER TABLE [dbo].[FactITSLA] ADD CONSTRAINT [FK_FactITSLA_DimMachine] FOREIGN KEY ([MachineKey]) REFERENCES [dbo].[DimMachine] ([MachineKey])
GO
ALTER TABLE [dbo].[FactITSLA] ADD CONSTRAINT [FK_FactITSLA_DimOutage] FOREIGN KEY ([OutageKey]) REFERENCES [dbo].[DimOutage] ([OutageKey])
GO
ALTER TABLE [dbo].[FactITSLA] ADD CONSTRAINT [FK_FactITSLA_DimStore] FOREIGN KEY ([StoreKey]) REFERENCES [dbo].[DimStore] ([StoreKey])
GO
PRINT N'Adding foreign keys to [dbo].[DimEmployee]'
GO
ALTER TABLE [dbo].[DimEmployee] ADD CONSTRAINT [FK_DimEmployee_DimEmployee] FOREIGN KEY ([ParentEmployeeKey]) REFERENCES [dbo].[DimEmployee] ([EmployeeKey])
GO
PRINT N'Adding foreign keys to [dbo].[DimSalesTerritory]'
GO
ALTER TABLE [dbo].[DimSalesTerritory] ADD CONSTRAINT [FK_DimSalesTerritory_DimGeography] FOREIGN KEY ([GeographyKey]) REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO
PRINT N'Adding foreign keys to [dbo].[DimStore]'
GO
ALTER TABLE [dbo].[DimStore] ADD CONSTRAINT [FK_DimStore_DimGeography] FOREIGN KEY ([GeographyKey]) REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO
PRINT N'Adding foreign keys to [dbo].[DimMachine]'
GO
ALTER TABLE [dbo].[DimMachine] ADD CONSTRAINT [FK_DimMachine_DimStore] FOREIGN KEY ([StoreKey]) REFERENCES [dbo].[DimStore] ([StoreKey])
GO
PRINT N'Adding foreign keys to [dbo].[DimProductSubcategory]'
GO
ALTER TABLE [dbo].[DimProductSubcategory] ADD CONSTRAINT [FK_DimProductSubcategory_DimProductCategory] FOREIGN KEY ([ProductCategoryKey]) REFERENCES [dbo].[DimProductCategory] ([ProductCategoryKey])
GO
PRINT N'Adding foreign keys to [dbo].[DimProduct]'
GO
ALTER TABLE [dbo].[DimProduct] ADD CONSTRAINT [FK_DimProduct_DimProductSubcategory] FOREIGN KEY ([ProductSubcategoryKey]) REFERENCES [dbo].[DimProductSubcategory] ([ProductSubcategoryKey])
GO
PRINT N'Creating extended properties'
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[20] 2[28] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -384
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DimCustomer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 319
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "FactOnlineSales"
            Begin Extent = 
               Top = 6
               Left = 279
               Bottom = 311
               Right = 477
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "DimPromotion"
            Begin Extent = 
               Top = 6
               Left = 515
               Bottom = 250
               Right = 705
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2775
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'V_CustomerPromotion', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'V_CustomerPromotion', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "S"
            Begin Extent = 
               Top = 6
               Left = 279
               Bottom = 95
               Right = 439
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'V_Customer', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'V_Customer', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "V_CustomerOrders"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'V_OnlineSalesOrderDetail', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'V_OnlineSalesOrderDetail', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "V_CustomerOrders"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'V_OnlineSalesOrder', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'V_OnlineSalesOrder', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[28] 4[36] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "S"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 65
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 252
               Bottom = 65
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SC"
            Begin Extent = 
               Top = 66
               Left = 38
               Bottom = 125
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 66
               Left = 252
               Bottom = 125
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "D"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 185
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 1575
         Table = 1170
         Output = ', 'SCHEMA', N'dbo', 'VIEW', N'V_ProductForecast', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'V_ProductForecast', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'V_ProductForecast', NULL, NULL
GO

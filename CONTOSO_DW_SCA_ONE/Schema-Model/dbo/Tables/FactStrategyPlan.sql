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
ALTER TABLE [dbo].[FactStrategyPlan] ADD CONSTRAINT [PK_FactStrategyPlan_StrategyPlanKey] PRIMARY KEY CLUSTERED  ([StrategyPlanKey])
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

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
ALTER TABLE [dbo].[DimScenario] ADD CONSTRAINT [PK_DimScenario] PRIMARY KEY CLUSTERED  ([ScenarioKey])
GO

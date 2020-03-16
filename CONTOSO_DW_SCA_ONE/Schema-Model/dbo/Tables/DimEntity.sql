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
ALTER TABLE [dbo].[DimEntity] ADD CONSTRAINT [PK_DimEntity_EntityKey] PRIMARY KEY CLUSTERED  ([EntityKey])
GO

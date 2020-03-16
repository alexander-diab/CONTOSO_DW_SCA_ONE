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
ALTER TABLE [dbo].[DimOutage] ADD CONSTRAINT [PK_DimOutage_OutageKey] PRIMARY KEY CLUSTERED  ([OutageKey])
GO

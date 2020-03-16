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
ALTER TABLE [dbo].[DimProductCategory] ADD CONSTRAINT [PK_DimProductCategory_ProductCategoryKey] PRIMARY KEY CLUSTERED  ([ProductCategoryKey])
GO
ALTER TABLE [dbo].[DimProductCategory] ADD CONSTRAINT [AK_DimProductCategory_ProductCategoryLabel] UNIQUE NONCLUSTERED  ([ProductCategoryLabel])
GO

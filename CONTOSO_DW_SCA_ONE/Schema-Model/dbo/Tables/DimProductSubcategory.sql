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
ALTER TABLE [dbo].[DimProductSubcategory] ADD CONSTRAINT [PK_DimProductSubcategory_ProductSubcategoryKey] PRIMARY KEY CLUSTERED  ([ProductSubcategoryKey])
GO
ALTER TABLE [dbo].[DimProductSubcategory] ADD CONSTRAINT [AK_DimProductSubcategory_ProductSubcategoryLabel] UNIQUE NONCLUSTERED  ([ProductSubcategoryLabel])
GO
ALTER TABLE [dbo].[DimProductSubcategory] ADD CONSTRAINT [FK_DimProductSubcategory_DimProductCategory] FOREIGN KEY ([ProductCategoryKey]) REFERENCES [dbo].[DimProductCategory] ([ProductCategoryKey])
GO

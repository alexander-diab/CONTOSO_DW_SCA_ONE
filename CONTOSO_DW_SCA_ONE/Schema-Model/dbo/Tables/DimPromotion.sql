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
ALTER TABLE [dbo].[DimPromotion] ADD CONSTRAINT [PK_DimPromotion_PromotionKey] PRIMARY KEY CLUSTERED  ([PromotionKey])
GO
ALTER TABLE [dbo].[DimPromotion] ADD CONSTRAINT [AK_DimPromotion_PromotionLabel] UNIQUE NONCLUSTERED  ([PromotionLabel])
GO

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
ALTER TABLE [dbo].[DimStore] ADD CONSTRAINT [PK_DimStore_StoreKey] PRIMARY KEY CLUSTERED  ([StoreKey])
GO
ALTER TABLE [dbo].[DimStore] ADD CONSTRAINT [FK_DimStore_DimGeography] FOREIGN KEY ([GeographyKey]) REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO

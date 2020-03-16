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
ALTER TABLE [dbo].[DimGeography] ADD CONSTRAINT [PK_DimGeography_GeographyKey] PRIMARY KEY CLUSTERED  ([GeographyKey])
GO

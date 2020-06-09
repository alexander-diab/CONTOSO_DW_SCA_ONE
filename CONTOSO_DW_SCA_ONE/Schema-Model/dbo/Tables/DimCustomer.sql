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
[UpdateDate] [datetime] NULL,
[twitter] [nchar] (10) NULL,
[facebook] [nchar] (10) NULL
)
GO
ALTER TABLE [dbo].[DimCustomer] ADD CONSTRAINT [PK_DimCustomer_CustomerKey] PRIMARY KEY CLUSTERED  ([CustomerKey])
GO
ALTER TABLE [dbo].[DimCustomer] ADD CONSTRAINT [IX_DimCustomer_CustomerLabel] UNIQUE NONCLUSTERED  ([CustomerLabel])
GO
ALTER TABLE [dbo].[DimCustomer] ADD CONSTRAINT [FK_DimCustomer_DimGeography] FOREIGN KEY ([GeographyKey]) REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO

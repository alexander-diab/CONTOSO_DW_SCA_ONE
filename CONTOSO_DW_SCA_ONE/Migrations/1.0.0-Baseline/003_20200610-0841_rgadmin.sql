-- <Migration ID="a1847548-fa88-4724-8b83-049ea1a6c0ac" />
GO

PRINT N'Altering [dbo].[DimCustomer]'
GO
ALTER TABLE [dbo].[DimCustomer] ADD
[instagram] [nchar] (10) NULL
GO

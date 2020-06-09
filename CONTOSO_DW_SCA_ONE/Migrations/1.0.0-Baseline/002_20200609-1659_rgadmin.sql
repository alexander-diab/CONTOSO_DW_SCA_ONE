-- <Migration ID="36d36727-456f-412d-96e5-7cc348f0b19e" />
GO

PRINT N'Altering [dbo].[DimCustomer]'
GO
ALTER TABLE [dbo].[DimCustomer] ADD
[twitter] [nchar] (10) NULL,
[facebook] [nchar] (10) NULL
GO

CREATE TABLE [dbo].[DimAccount]
(
[AccountKey] [int] NOT NULL IDENTITY(1, 1),
[ParentAccountKey] [int] NULL,
[AccountLabel] [nvarchar] (100) NULL,
[AccountName] [nvarchar] (50) NULL,
[AccountDescription] [nvarchar] (50) NULL,
[AccountType] [nvarchar] (50) NULL,
[Operator] [nvarchar] (50) NULL,
[CustomMembers] [nvarchar] (300) NULL,
[ValueType] [nvarchar] (50) NULL,
[CustomMemberOptions] [nvarchar] (200) NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
ALTER TABLE [dbo].[DimAccount] ADD CONSTRAINT [PK_DimAccount_AccountKey] PRIMARY KEY CLUSTERED  ([AccountKey])
GO

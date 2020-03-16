CREATE TABLE [dbo].[DimEmployee]
(
[EmployeeKey] [int] NOT NULL IDENTITY(1, 1),
[ParentEmployeeKey] [int] NULL,
[FirstName] [nvarchar] (50) NOT NULL,
[LastName] [nvarchar] (50) NOT NULL,
[MiddleName] [nvarchar] (50) NULL,
[Title] [nvarchar] (50) NULL,
[HireDate] [date] NULL,
[BirthDate] [date] NULL,
[EmailAddress] [nvarchar] (50) NULL,
[Phone] [nvarchar] (25) NULL,
[MaritalStatus] [nchar] (1) NULL,
[EmergencyContactName] [nvarchar] (50) NULL,
[EmergencyContactPhone] [nvarchar] (25) NULL,
[SalariedFlag] [bit] NULL,
[Gender] [nchar] (1) NULL,
[PayFrequency] [tinyint] NULL,
[BaseRate] [money] NULL,
[VacationHours] [smallint] NULL,
[CurrentFlag] [bit] NOT NULL,
[SalesPersonFlag] [bit] NOT NULL,
[DepartmentName] [nvarchar] (50) NULL,
[StartDate] [date] NULL,
[EndDate] [date] NULL,
[Status] [nvarchar] (50) NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
ALTER TABLE [dbo].[DimEmployee] ADD CONSTRAINT [PK_DimEmployee_EmployeeKey] PRIMARY KEY CLUSTERED  ([EmployeeKey])
GO
ALTER TABLE [dbo].[DimEmployee] ADD CONSTRAINT [FK_DimEmployee_DimEmployee] FOREIGN KEY ([ParentEmployeeKey]) REFERENCES [dbo].[DimEmployee] ([EmployeeKey])
GO

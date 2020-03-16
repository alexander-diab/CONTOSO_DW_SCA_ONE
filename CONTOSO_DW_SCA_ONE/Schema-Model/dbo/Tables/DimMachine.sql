CREATE TABLE [dbo].[DimMachine]
(
[MachineKey] [int] NOT NULL,
[MachineLabel] [nvarchar] (100) NULL,
[StoreKey] [int] NOT NULL,
[MachineType] [nvarchar] (50) NOT NULL,
[MachineName] [nvarchar] (100) NOT NULL,
[MachineDescription] [nvarchar] (200) NOT NULL,
[VendorName] [nvarchar] (50) NOT NULL,
[MachineOS] [nvarchar] (50) NOT NULL,
[MachineSource] [nvarchar] (100) NOT NULL,
[MachineHardware] [nvarchar] (100) NULL,
[MachineSoftware] [nvarchar] (100) NOT NULL,
[Status] [nvarchar] (50) NOT NULL,
[ServiceStartDate] [datetime] NOT NULL,
[DecommissionDate] [datetime] NULL,
[LastModifiedDate] [datetime] NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
ALTER TABLE [dbo].[DimMachine] ADD CONSTRAINT [PK_DimMachine_MachineKey] PRIMARY KEY CLUSTERED  ([MachineKey])
GO
ALTER TABLE [dbo].[DimMachine] ADD CONSTRAINT [FK_DimMachine_DimStore] FOREIGN KEY ([StoreKey]) REFERENCES [dbo].[DimStore] ([StoreKey])
GO

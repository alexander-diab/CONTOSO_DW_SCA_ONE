CREATE TABLE [dbo].[FactITSLA]
(
[ITSLAkey] [int] NOT NULL IDENTITY(1, 1),
[DateKey] [datetime] NOT NULL,
[StoreKey] [int] NOT NULL,
[MachineKey] [int] NOT NULL,
[OutageKey] [int] NOT NULL,
[OutageStartTime] [datetime] NOT NULL,
[OutageEndTime] [datetime] NOT NULL,
[DownTime] [int] NOT NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
ALTER TABLE [dbo].[FactITSLA] ADD CONSTRAINT [PK_FactITSLA_ITSLAKey] PRIMARY KEY CLUSTERED  ([ITSLAkey])
GO
ALTER TABLE [dbo].[FactITSLA] ADD CONSTRAINT [FK_FactITSLA_DimDate] FOREIGN KEY ([DateKey]) REFERENCES [dbo].[DimDate] ([Datekey])
GO
ALTER TABLE [dbo].[FactITSLA] ADD CONSTRAINT [FK_FactITSLA_DimMachine] FOREIGN KEY ([MachineKey]) REFERENCES [dbo].[DimMachine] ([MachineKey])
GO
ALTER TABLE [dbo].[FactITSLA] ADD CONSTRAINT [FK_FactITSLA_DimOutage] FOREIGN KEY ([OutageKey]) REFERENCES [dbo].[DimOutage] ([OutageKey])
GO
ALTER TABLE [dbo].[FactITSLA] ADD CONSTRAINT [FK_FactITSLA_DimStore] FOREIGN KEY ([StoreKey]) REFERENCES [dbo].[DimStore] ([StoreKey])
GO

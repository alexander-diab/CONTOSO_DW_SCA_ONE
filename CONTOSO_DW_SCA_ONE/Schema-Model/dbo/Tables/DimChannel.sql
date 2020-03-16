CREATE TABLE [dbo].[DimChannel]
(
[ChannelKey] [int] NOT NULL IDENTITY(1, 1),
[ChannelLabel] [nvarchar] (100) NOT NULL,
[ChannelName] [nvarchar] (20) NULL,
[ChannelDescription] [nvarchar] (50) NULL,
[ETLLoadID] [int] NULL,
[LoadDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
ALTER TABLE [dbo].[DimChannel] ADD CONSTRAINT [PK_DimChannel_ChannelKey] PRIMARY KEY CLUSTERED  ([ChannelKey])
GO

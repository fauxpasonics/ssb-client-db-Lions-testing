CREATE TYPE [dbo].[abc] AS TABLE
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[MyValue] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
PRIMARY KEY CLUSTERED  ([Id])
)
GO

IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'SSBINFO\BI Developers')
CREATE LOGIN [SSBINFO\BI Developers] FROM WINDOWS
GO
CREATE USER [SSBCLOUD\bi developers] FOR LOGIN [SSBINFO\BI Developers]
GO

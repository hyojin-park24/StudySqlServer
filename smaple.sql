USE [sqlDB]
GO

UPDATE [dbo].[userTBL]
   SET [userName] = '관운장'
      WHERE [userID] = 'JKW'
GO

delete from userTBL
 where userID = 'JKW';
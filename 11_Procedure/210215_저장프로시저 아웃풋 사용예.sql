USE [sqlDB]
GO
/****** Object:  StoredProcedure [dbo].[usp_users]    Script Date: 2021-02-15 오후 2:12:08 ******/
create or alter procedure usp_users4
	@txtValue nvarchar(20),
	@outValue int output

as
	insert into testTBL values (@txtValue);
	select @outValue = IDENT_CURRENT('testTBL'); --testTBL의 현재 identity 값 리턴
	go


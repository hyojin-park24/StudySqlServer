use sqlDB;
go

-- ���ν��� ����
create procedure usp_users
as
	select userID, userID, birthYear from userTBL;
	go

-- ���ν��� ����
alter procedure usp_users
as
	select userID, userID, birthYear from userTBL;
	go

-- ���ν��� ���� �Ǵ� ������ ���ÿ� 
create or alter procedure usp_users
as
	select userID, userID, birthYear from userTBL;
	go

exec usp_users;
use sqlDB;
go

create or alter trigger trg_backupUsertbl
on userTBL
--with encryption --��ȣȭ (����) : ������ư �ȴ����� 
after update, delete
as
	declare @modType nchar(2);

	if(COLUMNS_UPDATED () > 0) --������Ʈ
	begin 
		set @modType = '����';
	end
	else -- �ƴϸ� ����
	begin
		set @modType = '����';
	end

	insert into backup_userTBL	
			SELECT [userID]
				  ,[userName]
				  ,[birthYear]
				  ,[addr]
				  ,[mobile1]
				  ,[mobile2]
				  ,[height]
				  ,[mDate]
				  ,@modType
				  ,GETDATE()
				  ,USER_NAME()
			  FROM deleted;


go
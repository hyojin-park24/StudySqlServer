use tempdb;
create table bankBook
	(uName NVARCHAR(10),
	 uMoney INT , 
			constraint CK_money
			Check (uMoney > = 0) );
go

insert into bankBook values (N'������', 1000);
insert into bankBook values (N'�Ǹ���', 0);
/*
update bankBook set uMoney = uMoney - 500 where uName = N'������';
update bankBook set uMoney = uMoney + 500 where uName = N'�Ǹ���';
select * from bankBook;*/

begin try

	begin tran

	update bankBook set uMoney = uMoney - 600 where uName = N'������';
	update bankBook set uMoney = uMoney + 600 where uName = N'�Ǹ���';

	commit tran
end try
begin catch
	rollback tran
end catch
select * from bankBook;
use tempdb;
create table bankBook
	(uName NVARCHAR(10),
	 uMoney INT , 
			constraint CK_money
			Check (uMoney > = 0) );
go

insert into bankBook values (N'구매자', 1000);
insert into bankBook values (N'판매자', 0);
/*
update bankBook set uMoney = uMoney - 500 where uName = N'구매자';
update bankBook set uMoney = uMoney + 500 where uName = N'판매자';
select * from bankBook;*/

begin try

	begin tran

	update bankBook set uMoney = uMoney - 600 where uName = N'구매자';
	update bankBook set uMoney = uMoney + 600 where uName = N'판매자';

	commit tran
end try
begin catch
	rollback tran
end catch
select * from bankBook;
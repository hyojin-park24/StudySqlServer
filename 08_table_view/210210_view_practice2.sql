create view uv_user177
as
	select * from userTBL where height >= 177;
go

create view uv_buyTbl
as
 select * from buyTbl where groupName = '전자';
 go

 select * from uv_buyTbl;


begin tran; -- 트랜잭션

delete from uv_buyTbl ;


rollback; --원상태 복귀
create view uv_user177
as
	select * from userTBL where height >= 177;
go

create view uv_buyTbl
as
 select * from buyTbl where groupName = '����';
 go

 select * from uv_buyTbl;


begin tran; -- Ʈ�����

delete from uv_buyTbl ;


rollback; --������ ����
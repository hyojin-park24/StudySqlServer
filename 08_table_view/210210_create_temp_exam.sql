use tempdb;
go

create table #tempTbl (id int, txt nvarchar (10));
create table ##tempTbl (id int, txt nvarchar(10)); 

insert into #tempTbl values(1, '지역임시테이블');
insert into ##tempTbl values (2, '지역임시테이블');
go

select * from #tempTbl;
select * from ##tempTbl;
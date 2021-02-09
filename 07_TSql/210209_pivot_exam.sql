use sqlDB;
go

select ROW_NUMBER() over(order by height desc, userName asc) as '키큰순위',
		userName, addr, height
from userTBL;

select Rank() over(order by height desc) as '키큰순위',
		userName, addr, height
from userTBL;

select dense_Rank() over(order by height desc) as '키큰순위',
		userName, addr, height
from userTBL;

select Rank() over(partition by addr order by height desc) as '키큰순위',
		userName, addr, height
from userTBL;

--pivot
/*
create table pivotTbl
(
	userNamne varchar(10),
	season varchar(2),
	amount int
);

insert into pivotTbl values ()'
							*/


-- json
select userName, height, userID
	from userTBL 
	where height >= 180
	 for json auto;
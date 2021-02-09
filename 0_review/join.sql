-- join practice 

select * from userTBL;
select * from buyTbl;

use sqlDB
go

select * 
	from buyTbl
	inner join userTBL
	on buyTbl.userID = userTBL.userID
	where buyTbl.userID = 'JYP'; 

-- p.306부터 해야함


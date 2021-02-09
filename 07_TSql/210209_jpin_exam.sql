select * from usertbl;
select * from buyTbl;

select * from userTBL where userID = 'JYP';
select * from buyTbl where userID = 'JYP';

select * from buyTbl where userID ='BBK';

--inner join
select * 
	from buyTbl
	inner join userTBL
		on buyTbl.userID = userTBL.userID
	where buyTbl.userID = 'JYP'

select userTBL.userID,userTBL.addr,
		CONCAT(userTBL.mobile1,'-', userTBL.mobile2) as mbile,
		buyTbl.prodName, buyTbl.price, buyTbl.user
	from buyTbl
	inner join userTBL
		on buyTbl.userID = userTBL.userID
	where buyTbl.userID = 'JYP';
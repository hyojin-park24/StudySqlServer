/*select * from stdtbl;
select * from clubtbl;
select * from clubregtbl;
*/

--stander sql
select s.id, s.stdName, c.clubName, c.buildingNum
	from stdtbl as s
	inner join clubregtbl as r
	  on s.id = r.std_id
	inner join clubtbl as c
      on r.club_id = c.id; 

--inner join (내부 조인) 약식(sql server t-sql)
select s.id, s.stdName, c.clubName, c.buildingNum
	from stdtbl as s, clubregtbl as r, clubtbl as c
	where s.id = r.std_id
	 and r.club_id = c.id;

-- outerjoin (외부조인)
select s.id, s.stdName, c.clubName, c.buildingNum
	from stdtbl as s
	left outer join clubregtbl as r
	  on s.id = r.std_id
	left outer join clubtbl as c
      on r.club_id = c.id; 

--usertbl / buytbl
select u.userName, u.addr, b.prodName, b.price 
	from userTBL as u
	inner join buyTbl as b
	  on u.userID = b.userID;

select u.userName, u.addr, b.prodName, b.price 
	from userTBL as u
	left outer join buyTbl as b
	  on u.userID = b.userID;

select u.userName, u.addr, b.prodName, b.price 
	from userTBL as u
	right outer join buyTbl as b
	  on u.userID = b.userID;

select u.userName, u.addr, b.prodName, b.price 
	from userTBL as u
	full outer join buyTbl as b
	  on u.userID = b.userID;


select * from buyTbl
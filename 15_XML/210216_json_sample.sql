select u.userID, u.userName, u.birthYear, u.addr, u.height, b.prodName, b.price
	from userTBL as u
  inner join buyTbl as b 
	on u.userID = b.userID
	where u.height > 170
	for json auto;
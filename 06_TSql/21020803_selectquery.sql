use sqlDB
go

-- �̸��� ���ȣ�� ��� ��ȸ 
select * from userTBL
	where userName = '���ȣ';

-- 1970�� ���� ���, Ű 182�̻��� ����� ���̵�, �̸��� ��ȸ
select userID, userName, height
	from userTBL
	where birthYear >= 1970 
	and height >= 182
	and userName like '��%';

-- 1970�� ���� ��� '�̰ų�' Ű 182�̻��̰ų� �� ����� ��ȸ
select userID, userName, height
	from userTBL
	where birthYear >= 1970 
	or height >= 182;

-- Ű�� 180~183������ ����� ��ȸ
select userID, userName, height
	from userTBL
	where height >=180
	and height <=183;
-- between ~ and
select userID, userName, height
	from userTBL
	where height between 180 and 183;

--������ �泲, ����, ���
select userID, userName, addr
	from userTBL
	where addr = '�泲'
		or addr = '����'
		or addr = '���';

select userID, userName, addr
	from userTBL
	where addr in ('�泲', '����', '���');

-- like �� (��¥ ���� ���� �ڡڡ�)
select userID, userName
	from userTBL
	where userName like '��%'; -- '%'  ���� ����ϰڴٴ� �� 
select userID, userName
	from userTBL
	where userName like '_����'; -- '_' , '%' �˻� ���� �������� �� 

--SUBQUERY
select userName, height
	from userTBL
	where height > 177;

select userName, height
	from userTBL
	where height > (
		select height from userTBL where userName = '���ȣ'
	);

select userName, height
	from userTBL
	where height in -- any, all, some ��� ���� (���������� �� / in�� ���� ��)
	(select height from userTBL where addr = '�泲');
	-- any : ���� �ϳ��� ������ �� 
	-- all : ���� ���� �� �� ���Ǵ� �´� ��쿡 ����� ���� 
	-- �ǹ������� �����ϴ� ��찡 ���� 
	-- '�泲' ���� height�� ������ �Ǳ� ������ height ������ ���� 

--OREDER BY ���� ex) ���θ� 
select userName, mDate
	from userTBL
	order by mDate asc; --desc ���� ����, asc ���� ���� 
	
select *
	from userTBL
	order by userID desc;

--distinct (�ߺ�����)
select distinct addr
	from userTBL;

select top(5)* 
	from userTBL
	order by mDate desc;

--offset �ռ� ������ŭ �پ���� �� ��ȸ(�ǹ����� �ѹ��� ������� ����)
select userID, userName, birthYear
	from userTBL
	order by birthYear
	offset 4 rows;

-- ���� (pk���°� Ư¡, ���̺�� �����͸� �����) 
select * into buyTbl2 from buyTbl;
select userID, prodName into buyTbl3 from buyTbl;

--Group By
select userID, amount
	from buyTbl
	order by userID;

select userID, sum(amount) as '�����հ�' --as "�� ���� ~��� �θ���"
	from buyTbl
	group by userID;

--min, max 
select min(height) as '���� Ű'
	from userTBL;

select max(height) as 'ūŰ'
	from userTBL;
-- 
select userID, userName, min(height) as '���� Ű', max(height) as 'ūŰ'
	from userTBL
	group by userID, userName;

select userID, userName, height
	from userTBL
	where height = (select min(height) from userTBL)
	   or height = (select max(height) from userTBL);

-- �� ������ ����
select count(*) as 'ȸ����' from userTBL; --10��
select count(*) as '���ų�����' from buyTbl;--12��

--�߸��� ���͸�
select userID, sum(price * amount) as 'ID�� ���� �ݾ�'
	from buyTbl
	-- where sum(price * amount) > 1000
	group by userID
	having sum(price * amount) > 1000
	order by sum(price * amount) desc;

--rollup / cube
select num, groupName, sum(price * amount) as '���űݾ�',
	     GROUPING_ID(groupName)
	from buyTbl
	group by rollup(groupName, num);

--userID, groupName ������ cube ������ �հ� 
select userID, groupName, sum(price * amount) as '���űݾ�'
	from buyTbl
	group by cube(groupName, userID);

select userID,sum(price * amount) as '���űݾ�'
	from buyTbl
	group by rollup( userID);
select groupName,sum(price * amount) as '���űݾ�'
	from buyTbl
	group by rollup(groupName);

-- without cte : �Լ���� �ι��̻� 
select userID, sum (price * amount) as 'total'
	from buyTbl
	group by userID
	order by sum(price * amount) desc;
-- with cte
	with cte_tmp(userID,total) -- ���� ���̺� �̸� 'cte_tmp' (������ ���̺��� �� �� �����), �Լ���� �ѹ�
	as
	(
	 	select userID, sum(price * amount) as 'total'
			from buyTbl
			group by userID)
			select * from cte_tmp order by total desc;
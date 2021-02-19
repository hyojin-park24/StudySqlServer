--1-1 ����

select lower(m.Email) as 'email', m.Mobile as 'mobile', m.Names as 'names', m.Addr as 'addr'
	from membertbl as m
	order by m.Names desc;

--1-2 ����
select b.Names, b.Author, b.ReleaseDate, b.Price
	from bookstbl as b;

-- 2-1���� 
select   Top(10)
	    concat(right(m.Names,2), ' , ', left(m.Names,1)) as 'names'
	  , m.Levels
	  , left(m.Addr,2) as 'addr'
	  , lower(m.Email) as 'email'
	from membertbl as m;
	
-- 2-2���� 
select
		b.idx
	  , concat('���� : ', b.Names) as Names
	  , concat('���� > ', b.Author) as Author
	  , format(b.ReleaseDate, 'yyyy�� MM�� dd��') as ������
	  , b.ISBN
	  , format(b.price, '#,# ��') as '����'

	  from bookstbl as b
	  order by b.Idx desc;

-- 3-1���� 
select 
		 b.Idx as ��ȣ
	   , b.Division as �帣��ȣ
	   , d.Names as �帣
	   , b.Names as å����
	   , b.Author as ���� 
	from bookstbl as b
	inner join divtbl as d
		on b.Division = d.Division
	where b.Division = 'B002';

-- 3-2���� 
select 
		m.Names
	  , m.Levels
	  , m.Addr
	  , r.rentalDate
	from membertbl as m
	left outer join rentaltbl as r
	 on m.Idx = r.memberIdx
	 where r.rentalDate is null;

-- 4-1����
insert into divtbl values ('I002', '�ڱⰳ�߼�');

-- 4-2���� 
update membertbl
	set Addr = '�λ�� �ؿ�뱸'
	  , Mobile = '010-6683-7732'
	  where Idx = 26;

-- 3-1���� �ٸ��� Ǫ�� ���(1) ,�� where �� innerjoin  ����
select 
		 b.Idx  ��ȣ
	   , b.Division  �帣��ȣ
	   , d.Names  �帣
	   , b.Names  å���� 
	   , b.Author  ���� 
	from bookstbl  b
		,divtbl  d
    where b.Division = d.Division
	  and b.Division = 'B002';

-- 3-1���� �ٸ��� Ǫ�� ���(2) ��������
select 
		 b.Idx as ��ȣ
	   , b.Division as �帣��ȣ
	   , (select Names from divtbl where Division = b.Division) as �帣
	   , b.Names as å����
	   , b.Author as ���� 
	from bookstbl as b
	where b.Division = 'B002';


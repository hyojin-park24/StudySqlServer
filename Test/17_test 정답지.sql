--1-1 문제

select lower(m.Email) as 'email', m.Mobile as 'mobile', m.Names as 'names', m.Addr as 'addr'
	from membertbl as m
	order by m.Names desc;

--1-2 문제
select b.Names, b.Author, b.ReleaseDate, b.Price
	from bookstbl as b;

-- 2-1문제 
select   Top(10)
	    concat(right(m.Names,2), ' , ', left(m.Names,1)) as 'names'
	  , m.Levels
	  , left(m.Addr,2) as 'addr'
	  , lower(m.Email) as 'email'
	from membertbl as m;
	
-- 2-2문제 
select
		b.idx
	  , concat('제목 : ', b.Names) as Names
	  , concat('저자 > ', b.Author) as Author
	  , format(b.ReleaseDate, 'yyyy년 MM월 dd일') as 출판일
	  , b.ISBN
	  , format(b.price, '#,# 원') as '가격'

	  from bookstbl as b
	  order by b.Idx desc;

-- 3-1문제 
select 
		 b.Idx as 번호
	   , b.Division as 장르번호
	   , d.Names as 장르
	   , b.Names as 책제목
	   , b.Author as 저자 
	from bookstbl as b
	inner join divtbl as d
		on b.Division = d.Division
	where b.Division = 'B002';

-- 3-2문제 
select 
		m.Names
	  , m.Levels
	  , m.Addr
	  , r.rentalDate
	from membertbl as m
	left outer join rentaltbl as r
	 on m.Idx = r.memberIdx
	 where r.rentalDate is null;

-- 4-1문제
insert into divtbl values ('I002', '자기개발서');

-- 4-2문제 
update membertbl
	set Addr = '부산시 해운대구'
	  , Mobile = '010-6683-7732'
	  where Idx = 26;

-- 3-1문제 다르게 푸는 방법(1) ,와 where 로 innerjoin  생략
select 
		 b.Idx  번호
	   , b.Division  장르번호
	   , d.Names  장르
	   , b.Names  책제목 
	   , b.Author  저자 
	from bookstbl  b
		,divtbl  d
    where b.Division = d.Division
	  and b.Division = 'B002';

-- 3-1문제 다르게 푸는 방법(2) 서브쿼리
select 
		 b.Idx as 번호
	   , b.Division as 장르번호
	   , (select Names from divtbl where Division = b.Division) as 장르
	   , b.Names as 책제목
	   , b.Author as 저자 
	from bookstbl as b
	where b.Division = 'B002';


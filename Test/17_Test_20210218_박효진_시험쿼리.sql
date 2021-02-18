-- 1번문항 1-1
SELECT 
		lower(Email) as 'email'
		,Mobile as 'mobile'
		,Names as 'names'
		,Addr as 'addr'
    FROM membertbl
  order by Names desc;

-- 1번문항 1-2
select Names, author, releaseDate,price	
	from bookstbl;



-- 2번 문항 2-1
select 
		 Top 10 concat(right(Names,2), ',' , left(Names,1)) as '변경이름'
	   , Levels as 'levels'
	   , concat (right(Addr,0),left(Addr,2)) as '도시'
	   , lower(Email) as '이메일'
	from membertbl;

-- 2번 문항 2-2
SELECT 
        Idx 
      , concat ( N'제목', ' : ', Names) as 'Names'
      , concat(N'저자  > ',Author) as 'Author'
      , format(releaseDate, 'yyyy년 MM월 dd일') as '출판일 '
      , ISBN
      , format(price,'#,# 원') as '가격'
  FROM bookrentalshop.dbo.bookstbl
	order by idx desc;



-- 3번 문항 3-1 
select 
		 b.Idx as '번호'
	   , d.Division as '장르번호'
	   , d.Names as '장르'
	   , b.Names as '책 제목'
       , b.Author as '저자'

	from bookstbl as b 
 inner join divtbl as d
	on b.Division = d.Division 
	where d.Division like 'B002';

-- 3번 문항 3-2 
SELECT 
        m.Names
	  , m.Levels
	  , m.Addr
	  , r.rentalDate
	from membertbl as m
	left outer join rentaltbl as r
		on m.idx = r.memberidx 
		where rentalDate is null;



-- 4번 문항 4-1
select * from divtbl

Insert into divtbl (Division,Names) values ('I002', N'자기개발서')

-- 4번 문항 4-2
select * from membertbl;
begin tran

	Update membertbl set Mobile = '010-6683-7732'
	where Names = '성명건'
	update membertbl set Addr = '부산시 해운대구'
	where Names = '성명건';


rollback;
commit;



-- 5번 문항 
select d.Names
     , sum(b.Price) as '총합계금액'
  from bookstbl as b
 inner join divtbl as d
    on b.Division = d.Division
 group by rollup(d.Names);

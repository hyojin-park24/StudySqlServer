-- S1
select memberID, memberName, levels, mobile, email
	from MemberTBL -- 보고싶은 데이터 찾는 것
	where levels <> 'S' -- <> 아니다 : 레벨 없애는 것 
 order by levels desc/*asc*/, memberName ; --오름차순, 내림차순
 -- F1



 --S2
 -- 책 정보, 가격이 비싼 것 부터 나오게 해볼게 
 select cateidx, bookName, author, interpreter, company, price
	from BooksTBL
	order by price desc;
--F2



--S3
select * from CateTBL;


--S4 사용자 정의 함수사용 쿼리

-- 그냥 내용을 나오게 하는 것이 아니라 , 우리가 원하는대로 나오게 하는 것 (포멧팅) 사용자를 위해
-- 시스템 함수 사용 쿼리 (한 컬럼당 하나씩 줄 맞춰주기)
select 
	   -- 전화번호에 '-' 추가할래 근데 패스한데 ㅎㅎ  
	   memberID,
	   -- 이름 성과 이름을 구분해달래 그때 <right, left>로 구분하고 <concat>로 합쳐줘 
	   concat(right(memberName,2), ',' , left(memberName,1)) as '미국 식 이름',
	   --레벨을 A는 VIP 등 레벨에 이름을 메기고 싶어 그 때  < case ... when ... end> 데이터 베이스에만 쓰임 
	   dbo.ufn_getLevel(levels) as '회원레벨',
	   mobile, 
	   --이메일만 대문자로 쓰고싶어 (어퍼 UPPER) 시스템 함수를 쓰면, 열이름이 없어져 그 때 as''사용
	   upper(email) as '이메일'
  from MemberTBL 
	where levels <> 'S' 
 order by levels asc, memberName asc ;
 
 -- 한번 이상 쓸 함수는 사용자 정의 함수나 모듈로 만들어 준다. 
 -- 사용자 레벨 리턴해주는 함수 만들어 볼게 <create or alter function>

--F4 


/* create or alter function dbo.ufn_getLevel (@levels char(1))
 returns nvarchar(5) 
 as
 begin
	declare @result nvarchar(5);--골드,실버,브론즈,철회,관리자 회원 입력되는 변수 선언! 
	  set @result = case @levels
					when 'A' then '골드회원'
					when 'B' then '실버회원'
					when 'C' then '브론즈 회원'
					when 'D' then '철 회원'
					when 'S' then '관리자'
					else '비회원'
				    end
	 return @result;
 end
 go
 -- create 는 새쿼리에서 생성해야함 다른 쿼리 select 구문이랑 같이 쓰면 안됌
 */



 --S5
 --책 정보, 시스템 함수, 포맷 함수 쿼리
 SELECT bookidx
      , cateidx
      , concat(N'책 제목 > ',bookName) as bookName -- 행 안의 내용 수정 할 때! 
      , author
      , isnull (interpreter, '(역자없음)') as '번역가' -- null 값에 특정  내용 넣을 때! isnull
      , format(releaseDate, 'yyyy년 MM월 dd일') as '출판일 ' -- 년,월,일로 만들 때!
      , format(price,'#,# 원') as '가격' --천단위 매기고 단위표시 할 때!
      , company
  FROM BooksTBL


  --S6
  -- 책 정보 조인
  SELECT b.bookidx
      ,  -- b.cateidx
	     c.cateName
      ,  b.bookName
      ,  b.author
      ,  b.interpreter
      ,  b.company
  FROM dbo.BooksTBL  as b -- 조인할 때는 항상 별명 붙여서 사용! 왜? 기니깐.
  inner join CateTBL as c 
	on b.cateidx = c.cateidx;
--F6


--S7
-- 대여된 책의 정보 쿼리 조인
SELECT r.rentalIdx
      ,r.memberIdx
      --r.bookIdx
	  ,b.bookName
	  ,b.author
      ,format(r.rentalDt, 'yyyy-MM-dd') as '대여일'
      ,format(r.returnDt, 'yyyy-MM-dd') as '반납일'
      ,dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM dbo.RentalTBL as r
  inner join BooksTBL as b
	on r.bookIdx = b.bookidx
  inner join MemberTBL as m
	on r.memberIdx = m.memberidx;
-- F7


--S8
-- 책을 안빌린 회원 조회
SELECT r.rentalIdx
      --r.memberIdx
	  ,m.memberName
      --r.bookIdx
	  ,b.bookName
	  ,b.author
      ,format(r.rentalDt, 'yyyy-MM-dd') as '대여일'
      ,dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM dbo.RentalTBL as r
  right outer join BooksTBL as b
	on r.bookIdx = b.bookidx
  right outer join MemberTBL as m --outer join 은 무조건 기준점을 줘야함 그게 left, right OK? ull값들 조회
	on r.memberIdx = m.memberidx
 where r.rentalIdx is null;
--F8

--S9
--우리 책 대여점에 없는 소설 장르
select c.cateIdx
	  ,c.cateName
	  ,b.bookName
	from CateTBL as c
	left outer join BooksTBL as b
	 on c.cateidx = b.cateidx
--F9
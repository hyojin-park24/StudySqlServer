use sqlDB
go

-- 이름이 김경호인 사람 조회 
select * from userTBL
	where userName = '김경호';

-- 1970년 이후 출생, 키 182이상인 사람의 아이디, 이름만 조회
select userID, userName, height
	from userTBL
	where birthYear >= 1970 
	and height >= 182
	and userName like '성%';

-- 1970년 이후 출생 '이거나' 키 182이상이거나 인 사람들 조회
select userID, userName, height
	from userTBL
	where birthYear >= 1970 
	or height >= 182;

-- 키가 180~183사이인 사람만 조회
select userID, userName, height
	from userTBL
	where height >=180
	and height <=183;
-- between ~ and
select userID, userName, height
	from userTBL
	where height between 180 and 183;

--지역이 경남, 전남, 경북
select userID, userName, addr
	from userTBL
	where addr = '경남'
		or addr = '전남'
		or addr = '경북';

select userID, userName, addr
	from userTBL
	where addr in ('경남', '전남', '경북');

-- like 문 (진짜 많이 쓰임 ★★★)
select userID, userName
	from userTBL
	where userName like '김%'; -- '%'  뭐든 허용하겠다는 말 
select userID, userName
	from userTBL
	where userName like '_종신'; -- '_' , '%' 검색 성능 떨어지게 함 

--SUBQUERY
select userName, height
	from userTBL
	where height > 177;

select userName, height
	from userTBL
	where height > (
		select height from userTBL where userName = '김경호'
	);

select userName, height
	from userTBL
	where height in -- any, all, some 사용 가능 (에러잡을때 씀 / in을 자주 씀)
	(select height from userTBL where addr = '경남');
	-- any : 둘중 하나만 맞으면 됨 
	-- all : 안쪽 조건 중 두 조건다 맞는 경우에 결과값 인정 
	-- 실무에서는 적용하는 경우가 적음 
	-- '경남' 에서 height가 적용이 되기 때문에 height 기준이 생김 

--OREDER BY 정렬 ex) 쇼핑몰 
select userName, mDate
	from userTBL
	order by mDate asc; --desc 내림 차순, asc 오름 차순 
	
select *
	from userTBL
	order by userID desc;

--distinct (중복제거)
select distinct addr
	from userTBL;

select top(5)* 
	from userTBL
	order by mDate desc;

--offset 앞선 갯수만큼 뛰어넘은 후 조회(실무에서 한번도 사용하지 않음)
select userID, userName, birthYear
	from userTBL
	order by birthYear
	offset 4 rows;

-- 복사 (pk없는게 특징, 테이블과 데이터만 복사됨) 
select * into buyTbl2 from buyTbl;
select userID, prodName into buyTbl3 from buyTbl;

--Group By
select userID, amount
	from buyTbl
	order by userID;

select userID, sum(amount) as '구매합계' --as "이 값은 ~라고 부른다"
	from buyTbl
	group by userID;

--min, max 
select min(height) as '작은 키'
	from userTBL;

select max(height) as '큰키'
	from userTBL;
-- 
select userID, userName, min(height) as '작은 키', max(height) as '큰키'
	from userTBL
	group by userID, userName;

select userID, userName, height
	from userTBL
	where height = (select min(height) from userTBL)
	   or height = (select max(height) from userTBL);

-- 총 데이터 개수
select count(*) as '회원수' from userTBL; --10개
select count(*) as '구매내역수' from buyTbl;--12개

--잘못된 필터링
select userID, sum(price * amount) as 'ID별 구매 금액'
	from buyTbl
	-- where sum(price * amount) > 1000
	group by userID
	having sum(price * amount) > 1000
	order by sum(price * amount) desc;

--rollup / cube
select num, groupName, sum(price * amount) as '구매금액',
	     GROUPING_ID(groupName)
	from buyTbl
	group by rollup(groupName, num);

--userID, groupName 가지고 cube 다차원 합계 
select userID, groupName, sum(price * amount) as '구매금액'
	from buyTbl
	group by cube(groupName, userID);

select userID,sum(price * amount) as '구매금액'
	from buyTbl
	group by rollup( userID);
select groupName,sum(price * amount) as '구매금액'
	from buyTbl
	group by rollup(groupName);

-- without cte : 함수출력 두번이상 
select userID, sum (price * amount) as 'total'
	from buyTbl
	group by userID
	order by sum(price * amount) desc;
-- with cte
	with cte_tmp(userID,total) -- 가상 테이블 이름 'cte_tmp' (복잡한 테이블을 쓸 때 사용함), 함수출력 한번
	as
	(
	 	select userID, sum(price * amount) as 'total'
			from buyTbl
			group by userID)
			select * from cte_tmp order by total desc;
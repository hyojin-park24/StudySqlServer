use sqlDB;
go

declare @myVar1 int;
declare @myVar2 smallint, @myVar3 decimal(10,6);
declare @myVar4 char(20);

set @myVar1 = 5;
set @myVar2 = 3;
set @myVar3 = 3.141592;
set @myVar4 = '가수 이름 ==> ' ;

select @myVar1;
select @myVar2 + @myVar3;
select @myVar4, userName from userTBL where height > 180;

declare @myVar5 tinyint; --255
set @myVar5 = 3;

select top (@myVar5) userName, height from userTBL order by height desc;

select @@VERSION;

-- 형변환 함수
select convert (float, amount) as amount from buyTbl;
select TRY_CAST (float, amount) as amount from buyTbl;
select AVG(convert(float,amount)) as '평균구매개수' from buyTbl;

select price, amount, price/amount as [단가/수량] from buyTbl;

--
'1000' --> 숫자
select parse ('2021년 2월 9일' as date);
select TRY_PARSE ('2021년 2월 39일' as date);

select try_PARSE ('123.5' as int);
select PARSE ('123.5' as int);

select PARSE ('123.5' as decimal(5,2));
select try_PARSE ('123.5' as float);


	--스칼라 함수 (단일 리턴 함수)
select GETDATE()as '현재 날짜';

select year(GETDATE ()) as'금년';
select month(GETDATE ()) as'이번달';
select day(GETDATE ()) as'오늘 일';

select abs(-100); 

select ROUND(3.1415, 3);
select ROUND(1234.5678, -1);

select RAND()*100; --랜덤 숫자
select cast((RAND()*100)as int); --랜덤 숫자 소숫점 없애기 

select IIF(20 < 10, '참', '거짓');

-- 문자열 함수 
select ASCII('a'), ASCII('A');
select char(98), char(66);
select UNICODE('나');

-- 진짜 진짜 많이 쓰이는것
-- 문자열 결합
select CONCAT('SQL ', 'Sever ',2019);
-- 문자열 시작위치 리컨
select CHARindex ('sever','SQL Sever 2019');
--left,right
select left('SQL Sever 2019',3), RIGHT('SQL Sever 2019',7);
--substring : 진짜 많이 쓰임!!!!
select SUBSTRING('Hello World!', 7, 5);
select SUBSTRING('안녕하세요, sql서버 입니다!',11, 2);
--len
select LEN('안녕하세요'), LEN('Hello World!');
select LEN('안녕하세요'), LEN('Hello World!    ');
--lower, upper
select LOWER ('abcdeFG') , UPPER('abcdeFG');
--ltrim, rtrim
select len(LTRIM ('  Hello, World!   ')), 
		len(RTRIM('   Hello, World!    ')) , 
		len(TRIM('    Hello, World!  '));

select REPLACE('SQL Sever 2016', '2016', '2019');

--정말정말정말정말정말정말정말정말정말 많이 쓰는 함수!!
select FORMAT(getdate (), ''); --기본
select FORMAT(getdate (), 'dd/MM/yyy'); 
select FORMAT(getdate (), 'yyyy-MM-dd hh:mm:ss'); --우리나라 사람들이 제일 좋아하는 폼 형식
select FORMAT(getdate (), 'yyyy-MM-dd'); 
select FORMAT(getdate (), 'hh:mm:ss'); 

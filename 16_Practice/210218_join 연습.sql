--outer join  쿼리 
--join 하면 무조건 as하고 쓰는게 편함

SELECT  r.rentalIdx
        -- r.memberIdx
	  , m.memberName
        -- r.bookIdx
	  , b.bookName
      , format(r.rentalDt, 'yyy-MM-dd') as rentalDt
      , format(r.returnDt, 'yyy-MM-dd') as returnDt
      , dbo.ufn_getState (r.rentalState) as '대여상태'
  FROM RentalTBL as r
  inner join MemberTBL as m
   on r.memberIdx = m.memberidx
  inner join BooksTBL as b
   on r.bookIdx = b.bookIdx;


 --데이터 입력
 insert into BooksTBL
 (
	 cateidx,
	 bookName,
	 author,
	 company,
	 releaseDate,
	 ISBN,
	 price
 )
 values
 (
	'N0002',
	'순수하지 않은 감각',
	'요안나',
	'로코코',
	'2019-10-02',
	'9791135445705',
	12500
 );

 --책 테이블 위 책 정보중, 설명, 등록일자 수정 
 begin tran;

 select *
	from BooksTBL;
 
 update BooksTBL
	set descriptions = '부명 그룹의 브레인이자 핵심 TF팀 리더, 강태욱 수석.'
		, regDate = '2021-02-18'
where bookidx = 20

rollback;
commit;


--카테고리 입력
begin tran;

insert into CateTBL values ('I0001','대화/협상'),
						   ('I0002','성공/처세'),
						   ('I0003','성공/처세');

select * from CateTBL;

rollback;
commit;

delete from CateTBL where cateidx = 'I0003';


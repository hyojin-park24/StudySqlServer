--outer join  ���� 
--join �ϸ� ������ as�ϰ� ���°� ����

SELECT  r.rentalIdx
        -- r.memberIdx
	  , m.memberName
        -- r.bookIdx
	  , b.bookName
      , format(r.rentalDt, 'yyy-MM-dd') as rentalDt
      , format(r.returnDt, 'yyy-MM-dd') as returnDt
      , dbo.ufn_getState (r.rentalState) as '�뿩����'
  FROM RentalTBL as r
  inner join MemberTBL as m
   on r.memberIdx = m.memberidx
  inner join BooksTBL as b
   on r.bookIdx = b.bookIdx;


 --������ �Է�
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
	'�������� ���� ����',
	'��ȳ�',
	'������',
	'2019-10-02',
	'9791135445705',
	12500
 );

 --å ���̺� �� å ������, ����, ������� ���� 
 begin tran;

 select *
	from BooksTBL;
 
 update BooksTBL
	set descriptions = '�θ� �׷��� �극������ �ٽ� TF�� ����, ���¿� ����.'
		, regDate = '2021-02-18'
where bookidx = 20

rollback;
commit;


--ī�װ� �Է�
begin tran;

insert into CateTBL values ('I0001','��ȭ/����'),
						   ('I0002','����/ó��'),
						   ('I0003','����/ó��');

select * from CateTBL;

rollback;
commit;

delete from CateTBL where cateidx = 'I0003';


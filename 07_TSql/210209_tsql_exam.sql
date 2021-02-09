use sqlDB;
go

declare @myVar1 int;
declare @myVar2 smallint, @myVar3 decimal(10,6);
declare @myVar4 char(20);

set @myVar1 = 5;
set @myVar2 = 3;
set @myVar3 = 3.141592;
set @myVar4 = '���� �̸� ==> ' ;

select @myVar1;
select @myVar2 + @myVar3;
select @myVar4, userName from userTBL where height > 180;

declare @myVar5 tinyint; --255
set @myVar5 = 3;

select top (@myVar5) userName, height from userTBL order by height desc;

select @@VERSION;

-- ����ȯ �Լ�
select convert (float, amount) as amount from buyTbl;
select TRY_CAST (float, amount) as amount from buyTbl;
select AVG(convert(float,amount)) as '��ձ��Ű���' from buyTbl;

select price, amount, price/amount as [�ܰ�/����] from buyTbl;

--
'1000' --> ����
select parse ('2021�� 2�� 9��' as date);
select TRY_PARSE ('2021�� 2�� 39��' as date);

select try_PARSE ('123.5' as int);
select PARSE ('123.5' as int);

select PARSE ('123.5' as decimal(5,2));
select try_PARSE ('123.5' as float);


	--��Į�� �Լ� (���� ���� �Լ�)
select GETDATE()as '���� ��¥';

select year(GETDATE ()) as'�ݳ�';
select month(GETDATE ()) as'�̹���';
select day(GETDATE ()) as'���� ��';

select abs(-100); 

select ROUND(3.1415, 3);
select ROUND(1234.5678, -1);

select RAND()*100; --���� ����
select cast((RAND()*100)as int); --���� ���� �Ҽ��� ���ֱ� 

select IIF(20 < 10, '��', '����');

-- ���ڿ� �Լ� 
select ASCII('a'), ASCII('A');
select char(98), char(66);
select UNICODE('��');

-- ��¥ ��¥ ���� ���̴°�
-- ���ڿ� ����
select CONCAT('SQL ', 'Sever ',2019);
-- ���ڿ� ������ġ ����
select CHARindex ('sever','SQL Sever 2019');
--left,right
select left('SQL Sever 2019',3), RIGHT('SQL Sever 2019',7);
--substring : ��¥ ���� ����!!!!
select SUBSTRING('Hello World!', 7, 5);
select SUBSTRING('�ȳ��ϼ���, sql���� �Դϴ�!',11, 2);
--len
select LEN('�ȳ��ϼ���'), LEN('Hello World!');
select LEN('�ȳ��ϼ���'), LEN('Hello World!    ');
--lower, upper
select LOWER ('abcdeFG') , UPPER('abcdeFG');
--ltrim, rtrim
select len(LTRIM ('  Hello, World!   ')), 
		len(RTRIM('   Hello, World!    ')) , 
		len(TRIM('    Hello, World!  '));

select REPLACE('SQL Sever 2016', '2016', '2019');

--������������������������������������ ���� ���� �Լ�!!
select FORMAT(getdate (), ''); --�⺻
select FORMAT(getdate (), 'dd/MM/yyy'); 
select FORMAT(getdate (), 'yyyy-MM-dd hh:mm:ss'); --�츮���� ������� ���� �����ϴ� �� ����
select FORMAT(getdate (), 'yyyy-MM-dd'); 
select FORMAT(getdate (), 'hh:mm:ss'); 

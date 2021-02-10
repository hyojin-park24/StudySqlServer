declare @curDate date;
declare @curYear varchar(4);
declare @curMonth varchar(2);
declare @curDay varchar(2);
declare @sql varchar(2000);

set @curDate = GETDATE();
set @curYear = YEAR (@curDate);
set @curMonth = month(@curDate);
set @curDay = day(@curDate);

print @curYear;
print replicate ('0', 2 - len (@curMonth)) + @curMonth;
print right(( '00' + @curMonth), 2);
print @curDay;

print format(@curDate, 'yyyy-MM-dd'); -- 제일 쉬운 방법

set @sql = 'create table backup_' + format(@curDate, 'yyyy_MM_dd');
set @sql += ' (id int not null primary key, bName nvarchar(100) not null); ' ;
print @sql;
exec(@sql); 

-- 매일 날짜가 쌓여서 백업됨 
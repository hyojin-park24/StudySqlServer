use sqlDB;
go

create or alter function ufn_getAge
	(@birthYear int)
	returns int
as
	begin
		declare @age int;
		set @age = YEAR(getdate()) - @birthYear + 1;
		return @age;
	end
go
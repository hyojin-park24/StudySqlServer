create or alter function dbo.ufn_getLevel (@levels char(1))
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
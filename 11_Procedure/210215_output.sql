--exec usp_users '김경호';

--exec usp_users2 1970,180;

declare @myvalue int;
exec usp_users4 '테스트 값 1', @myvalue output;

print concat ('현재 입력된 값는 ==>', @myValue);
select @myvalue; 
--exec usp_users '���ȣ';

--exec usp_users2 1970,180;

declare @myvalue int;
exec usp_users4 '�׽�Ʈ �� 1', @myvalue output;

print concat ('���� �Էµ� ���� ==>', @myValue);
select @myvalue; 
declare @var1 int; --���� ����
set @var1 = 100; -- ���� �� ���� (��)
--print 
if @var1 = 100
begin
	print '@var1 100��';
end
else
begin
	 print '@var1 100�� �ƴ�';
end

--select 
if @var1 = 100
begin
	select '@var1 100��';
end
else
begin
	 select '@var1 100�� �ƴ�';
end
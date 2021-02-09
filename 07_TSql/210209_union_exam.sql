select clubname as bname, buildingNum as blocation from clubtbl
union
select stdName, region from stdtbl;

-- union all
select stdName, region from stdtbl
union all
select stdName, region from stdtbl;

--except (ТїС§Че)
select stdName, region from stdtbl
except
select stdName, region from stdtbl;

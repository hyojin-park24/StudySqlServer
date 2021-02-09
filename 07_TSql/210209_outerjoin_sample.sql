-- 테이블 3개 outer join
select * 
	from stdtbl as s
	left outer join clubregtbl as r
	 on s.id = r.std_id
	full outer join clubtbl as c
	 on r.club_id = c.id

select * 
	from stdtbl as s
	left outer join clubregtbl as r
	 on s.id = r.std_id;


select *
	from clubregtbl as r
	right outer join clubtbl as c
		on r.club_id = c.id;
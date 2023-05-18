do
$$
declare
	rec record;
	fim_name CHARACTER VARYING = 'K%';
begin
	select fid, film 
	into strict rec
	from films
	where film like fim_name;
	
	raise notice '%', rec;
	
	exception 
		when too_many_rows then
			raise exception 'Search query returns too many rows';
end;
$$
language plpgsql;


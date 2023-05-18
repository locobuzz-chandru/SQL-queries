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
	   when sqlstate 'P0002' then 
	      raise exception 'film not found';
		when sqlstate 'P0003' then
			raise exception 'Search query returns too many rows';
end;
$$
language plpgsql;
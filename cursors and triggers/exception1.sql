do
$$
declare
	rec record;
	v_film_id int = 20;
begin
	select fid, film 
	into strict rec
	from films
	where fid = v_film_id;
	
	raise notice '%', rec;
	
	exception 
	   when no_data_found then 
	      raise exception 'film % not found', v_film_id;
end;
$$
language plpgsql;
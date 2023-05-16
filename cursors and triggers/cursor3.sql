create or replace procedure for_loop_cursor(in_actor_id in integer)
language plpgsql
as $$
declare
lv_string character varying(200);
loop_rec record;

begin
for loop_rec in
	select f.film from actors_film fa, films f
	where fa.film_id = f.fid
	and fa.actor_id = in_actor_id
loop
	lv_string := 'Title: '||loop_rec.film;
	raise notice '%', lv_string;
end loop;
exception when others then
	raise 'Something went wrong';
end;
$$


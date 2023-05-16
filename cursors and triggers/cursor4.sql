--select refcursor_cursor(2, 'lv_refcursor');
--fetch all in lv_refcursor;

create or replace function refcursor_cursor(in_actor_id in integer, lv_ref_cur refcursor)
returns refcursor
language plpgsql
as $$

begin
open lv_ref_cur
	for select 'Film: '||f.film as Film from actors_film fa, films f
	where fa.film_id = f.fid and fa.actor_id = in_actor_id;
return lv_ref_cur;

exception when others then
	raise 'Something went wrong';
end;
$$
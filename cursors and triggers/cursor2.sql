create or replace procedure parameterized_cursor(in_id in integer)
language plpgsql
as $$
declare
lv_string character varying(200);
rec1 record;
cur1 cursor for
	select name, age, city from company where id = in_id order by id;
begin
	open cur1;
	loop
		fetch cur1 into rec1;
		exit when not found;
		lv_string := 'Employee Name: '||rec1.name||', Employee City: '||rec1.city||'';
		raise notice '%', lv_string;
	end loop;
	close cur1;
exception when others then
	raise 'Something went wrong';
end;
$$
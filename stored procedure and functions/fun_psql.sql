create or replace FUNCTION fnMakeCall(firstName varchar, lastName varchar)
returns VARCHAR
as
$$
BEGIN
	if firstName is null and lastName is null then
		return null;
	elsif firstName is null and lastName is not null then
		return initCap(lastName);
	elsif firstName is not null and lastName is null then
		return initCap(firstName);
	else
		return concat(initCap(firstName),' ', initCap(lastName));
	end if;
end;
$$
language plpgsql;

select * from fnMakeCall('chandru', 'kalahalamath');
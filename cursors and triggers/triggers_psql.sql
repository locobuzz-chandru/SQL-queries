create function auditlogfunc() returns trigger as $example_table$
   begin
      insert into audit(emp_id, entry_date) values (new.id, current_timestamp);
      return new;
   end;
$example_table$ language plpgsql;

create trigger example_trigger after insert on company
for each row execute procedure auditlogfunc();

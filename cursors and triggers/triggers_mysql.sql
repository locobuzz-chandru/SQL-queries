create table student ( id int, name varchar(15), city varchar(10), marks int );
insert into student values (1, "A", "a", 538), (2, "B", "b", 385), (3, "C", "c", 578), (4, "D", "d", 455), (5, "E", "e", 440);
select * from student;

create trigger student_trigger
before insert
on student
for each row
set new.marks = new.marks + 100;

insert into student values (6, "F", "f", 300);

create table final_marks (total_marks int);

create trigger cal
after insert
on student 
for each row 
insert into final_marks values (new.marks);

insert into student values (7, "G", "g", 410);

select * from final_marks;

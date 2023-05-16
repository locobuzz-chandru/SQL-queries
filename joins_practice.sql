#JOIN: clause is used to combine rows from two or more tables, based on a related column between them.
#INNER JOIN: Returns records that have matching values in both tables
#LEFT JOIN: Returns all records from the left table, and the matched records from the right table
#RIGHT JOIN: Returns all records from the right table, and the matched records from the left table
#CROSS JOIN: Returns all records from both tables (The cross join combines each row from the first table with every row from the right table to make the result set)
#SELF JOIN: self join is a regular join, but the table is joined with itself.


CREATE TABLE city(
cid int not null auto_increment,
city_name varchar(50),
primary key (cid)
);

insert into city(city_name) values ("Delhi"), ("Hubli"), ("Mysore"), ("Chennai"), ("Mumbai");

CREATE TABLE course(
crid int not null auto_increment,
course varchar(20),
primary key (crid)
);

INSERT INTO course (course) VALUES ("MBA"), ("MCA"), ("Engineering");

CREATE TABLE persons (
    id int not null auto_increment,
    name varchar(255) not null,
    age int not null,
    city_id int,
    course_id int,
    primary key(id),
    foreign key (city_id) references city(cid),
    foreign key (course_id) references course(crid)
);

insert into persons(name, age, city_id, course_id) values("Ajay", 18, 1, 2), ("Chandru", 25, 2, 3), ("Akshay", 22, 3, 2), ("Manu", 21, 5, 2), ("Nikil", 25, 4, 1);
insert into persons(name, age, city_id) values ("Ravi", 20, 4), ("Ullas", 24, 2);
insert into persons(name, age, course_id) values ("Manju", 27, 1), ("Ram", 28, 3);

-- INNER JOIN
SELECT * FROM persons INNER JOIN city
ON persons.city_id = city.cid;

select p.id, p.name, c.city_name from persons p inner join city c
on p.city_id = c.cid;

SELECT * FROM persons INNER JOIN course
ON persons.course_id = course.crid;

select p.id, p.name, c.course from persons p inner join course c
on p.course_id = c.crid;

SELECT * FROM persons 
INNER JOIN city
ON persons.city_id = city.cid
INNER JOIN course
ON persons.course_id = course.crid;

SELECT persons.id, persons.name, persons.age, city.city_name, course.course FROM persons 
INNER JOIN city
ON persons.city_id = city.cid
INNER JOIN course
ON persons.course_id = course.crid;

-- VIEW
CREATE VIEW studentdata AS
SELECT id, name, age, city_name, course FROM persons 
INNER JOIN city
ON persons.city_id = city.cid
INNER JOIN course
ON persons.course_id = course.crid;

SELECT * FROM studentdata;

-- LEFT JOIN
SELECT persons.id, persons.name, persons.age, city.city_name FROM persons 
LEFT JOIN city
ON persons.city_id = city.cid;

SELECT persons.id, persons.name, persons.age, course.course FROM persons 
LEFT JOIN course
ON persons.course_id = course.crid;

-- RIGHT JOIN
SELECT persons.id, persons.name, persons.age, city.city_name FROM persons 
RIGHT JOIN city
ON persons.city_id = city.cid;

SELECT persons.id, persons.name, persons.age, course.course FROM persons 
RIGHT JOIN course
ON persons.course_id = course.crid;

-- CROSS JOIN
SELECT persons.id, persons.name, persons.age, city.city_name, course.course FROM persons 
CROSS JOIN city
CROSS JOIN course;

SELECT COUNT(*) FROM persons
CROSS JOIN city
CROSS JOIN course;

-- GROUP BY
SELECT 	city.city_name, COUNT(persons.city_id) FROM persons
INNER JOIN city
ON persons.city_id = city.cid
GROUP BY city_id;

-- HAVING
SELECT 	city.city_name, COUNT(persons.city_id) FROM persons
INNER JOIN city
ON persons.city_id = city.cid
GROUP BY city_id
HAVING COUNT(persons.city_id) >= 2;

-- EXISTS
SELECT name FROM persons
WHERE course_id = (SELECT crid from course WHERE course = "MCA");

SELECT name FROM persons
WHERE course_id IN (SELECT crid from course WHERE course IN ("MCA", "Engineering"));

SELECT name FROM persons
WHERE EXISTS (SELECT crid from course WHERE course IN ("MCA", "Engineering"));

SELECT name FROM persons
WHERE NOT EXISTS (SELECT crid from course WHERE course IN ("MCA", "Engineering"));

-- advantages of using subqueries:
-- make the queries in a structured form that allows us to isolate each part of a statement.
-- provide alternative ways to query the data from the table otherwise we need to use complex joins and unions.
-- more readable than complex join or union statements.

-- disadvantages
-- they cannot modify a table and select from the same table in the same SQL statement.
-- expensive task, so it's faster to use a join operation.

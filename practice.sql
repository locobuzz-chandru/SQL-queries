CREATE DATABASE practice;
USE practice;
-- Constraints are the rules that we can apply on the type of data in a table
-- Constraints are used to limit the type of data that can go into a table. This ensures the accuracy and reliability of the data in the table
-- NOT NULL - a column cannot have a NULL value
-- UNIQUE - all values in a column are different
-- CHECK - values in a column satisfies a specific condition
-- DEFAULT - sets a default value for a column if no value is specified
-- PRIMARY KEY - combination of NOT NULL and UNIQUE and uniquely identifies each row in a table
-- FOREIGN KEY - prevents actions that destroy links between tables

CREATE TABLE person(
	id INT NOT NULL UNIQUE,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL CHECK (age >= 18 ),
    gender VARCHAR(1),
    phone VARCHAR(10) NOT NULL UNIQUE,
    city VARCHAR(15) NOT NULL DEFAULT 'Bangalore'
);

INSERT INTO person VALUES(1, "Chandru", 25, "M", "9874563210", "Davangere");
INSERT INTO person VALUES(2, "Ravi", 22, "M", "9874567210", "Chennai");
INSERT INTO person VALUES(3, "Ajay", 21, "M", "9877563210", "Mangalore");
INSERT INTO person VALUES(4, "ABCD", 27, "F", "9974563210", "Mumbai");
INSERT INTO person (id, name, age, gender, phone) VALUES(5, "Akshay", 25, "M", "7744563210");
INSERT INTO person (id, name, age, gender, phone) VALUES(6, "Manu", 30, "F", "8564793210");
INSERT INTO person (id, name, age, phone) VALUES(7, "XYZ", 30, "8521473690");
INSERT INTO person VALUES(8, "Ram", 29, "M", "9574416210", "Mumbai");
INSERT INTO person VALUES(9, "John", 26, "M", "9574186210", "Davangere");
INSERT INTO person VALUES(10, "Nik", 26, "M", "8644563210", "Chennai");

SELECT * FROM person;
SELECT name, city FROM person WHERE name REGEXP "^ch" OR name REGEXP "y$";
SELECT name, city FROM person WHERE name REGEXP "^cha|av|cd$";
SELECT name, city, phone FROM person WHERE phone REGEXP "^[5-7]";
SELECT name, city FROM person WHERE name REGEXP "[a-h]j";
SELECT * FROM person WHERE age BETWEEN 23 AND 27;
SELECT * FROM person WHERE age NOT BETWEEN 25 AND 27;
SELECT * FROM person WHERE name LIKE "a%";
SELECT * FROM person WHERE name LIKE "__s%" OR name LIKE "_ha%";
SELECT * FROM person WHERE phone LIKE "%775%";
SELECT name, city FROM person WHERE city = "Bangalore" ORDER BY name DESC;
SELECT DISTINCT gender, name FROM person ORDER BY age DESC;
ALTER TABLE person MODIFY gender VARCHAR(1);
SELECT name, city FROM person WHERE gender IS NULL;
SELECT name, city FROM person WHERE gender IS NOT NULL;
SELECT DISTINCT city, name FROM person ORDER BY name LIMIT 2, 1;
SELECT * FROM person WHERE (city = "Bangalore" OR city = "Mumbai") AND gender = "F" AND NOT id = 4;
SELECT * FROM person WHERE (age >= 25 AND gender IS NOT NULL);
SELECT * FROM person WHERE city IN ("Bangalore", "Mumbai") AND id NOT IN (4, 7);
SELECT * FROM person WHERE gender IS NULL;
SELECT * FROM person WHERE gender IS NOT NULL;
SELECT name, age, city, IF (age > 25, "Yes", "No") AS Eligible FROM person;
UPDATE person SET age = 28 WHERE id IN (7, 5);

CREATE TABLE student(
	id INT NOT NULL UNIQUE,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL CHECK (age >= 18 ),
    gender VARCHAR(1),
    phone VARCHAR(10) NOT NULL UNIQUE,
    city VARCHAR(15) NOT NULL DEFAULT 'Bangalore'
);

INSERT INTO student VALUES(1, "Chandru", 25, "M", "9584712302", "Davangere");
INSERT INTO student VALUES(2, "Mack", 24, "M", "8574963210", "Chennai");
INSERT INTO student VALUES(3, "Ajay", 22, "M", "9586741230", "Mangalore");
INSERT INTO student VALUES(4, "Kee", 23, "F", "9856321470", "Mumbai");

SELECT name FROM person
UNION
SELECT name FROM student;

SELECT name FROM person
UNION ALL -- returns duplicate entry also
SELECT name FROM student;

CREATE TABLE students(
	id INT NOT NULL UNIQUE,
    name VARCHAR(50) NOT NULL,
    percentage INT NOT NULL
);

INSERT INTO students VALUES(1, "Chandru", 95);
INSERT INTO students VALUES(2, "Ram", 88);
INSERT INTO students VALUES(3, "Nik", 75);
INSERT INTO students VALUES(4, "John", 55);
INSERT INTO students VALUES(5, "Ravi", 30);
INSERT INTO students VALUES(6, "Milan", 32);
INSERT INTO students VALUES(7, "Man", 132);

SELECT name, percentage, IF (percentage > 35, "Pass", "Fail") AS Result FROM students;
SELECT name, percentage,
CASE
	WHEN percentage >= 90 AND percentage <= 100 THEN "Merit"
	WHEN percentage >= 60 AND percentage <= 89 THEN "1st"
	WHEN percentage >= 45 AND percentage <= 59 THEN "2st"
	WHEN percentage >= 35 AND percentage <= 44 THEN "1st"
	WHEN percentage < 35 THEN "Fail"
    ELSE "Not correct perscentage"
END AS Grade
FROM students;

UPDATE students SET
percentage = (CASE id
	WHEN 4 THEN 58
    WHEN 2 THEN 92
END)
WHERE id IN (2,4);

-- aggregate functions
SELECT MAX(age), name, age FROM person;
SELECT MIN(age), name, age FROM person;
SELECT AVG(age) FROM person;
SELECT COUNT(DISTINCT city) FROM person;
SELECT city, COUNT(city) FROM person GROUP BY city;
SELECT SUM(age) FROM person;
SELECT GROUP_CONCAT(age) FROM persons;
SELECT JSON_ARRAYAGG(age) FROM persons;
SELECT JSON_OBJECTAGG(name,age) FROM persons;
SELECT STD(age) FROM persons;

-- string functions
select id, UPPER(name) AS Name, percentage from students;
select id, UCASE(name) AS Name, percentage from students;
select id, LOWER(name) AS Name, percentage from students;
select id, LCASE(name) AS Name, percentage from students;
select id, character_length(name) AS Characters, Name from students;
select id, concat(name, "-", percentage) AS Name from students;
select concat_ws("-", "Chandru", "Kalahalamath", "Bangalore") AS Name;
select ltrim("     chandru     ") AS Name;
select rtrim("     chandru     ") AS Name;
select trim("     chandru     ") AS Name;
select position("lama" IN "chandru kalahalamath") AS Name;
select instr("chandru kalahalamath","dru") AS Name;
select locate("a","chandru kalahalamath") AS Name;
select locate("a","chandru kalahalamath", 11) AS Name;
select substr("chandru kalahalamath", 5) AS Name;
select substr("chandru kalahalamath", -12,5) AS Name;
select substring_index("www.chandrukalahalamath.com", ".", 2);
select left("abcdefgh", 2);
select right("abcdefgh", 2);
select rpad("abcd", 10, "-");
select lpad("abcd", 10, "-");
select reverse("abcd");
select replace("abcdefcd", "cd", "xy");
select strcmp("abcd", "abcd");
select field("a","b","y","a"); -- index of 1st word
select find_in_set("a", "b,c,r,a,k");
select format(123.456, 2);
select hex("abcd");

-- date functions
select current_date();
select sysdate();
select now();
select date("2023-03-29 09:53:20");
select month("2023-03-29 09:53:20");
select extract(MONTH FROM "2023-03-29 09:53:20");
select monthname("2023-03-29 09:53:20");
select year("2023-03-29 09:53:20");
select quarter("2023-03-29 09:53:20");
select dayname("2023-03-29 09:53:20");
select dayofyear("2023-03-29 09:53:20");
select dayofweek("2023-03-29 09:53:20");
select extract(WEEK FROM "2023-03-29 09:53:20");

select adddate("2023-03-29", INTERVAL 7 DAY) AS Date;
select adddate("2023-03-29", INTERVAL 1 YEAR) AS Date;
select subdate("2023-03-29", INTERVAL 1 DAY) AS Date;
select datediff("2023-03-29", "2023-02-10");
select date_format("2023-03-29 09:53:20", "%d/%c/%Y, %W, %h:%i");
select str_to_date("Mar 29 2023", "%M %d %Y");

-- time functions
select current_time();
select time("2023-03-29 09:53:20");
select timediff("04:53:29", "01:20:20");
select addtime("2023-03-29 09:53:20", "1:01:12");
select subtime("2023-03-29 09:53:20", "1:01:12");
select maketime(12,53,20);
select time_format("22:53:20", "%h:%i:%s %p");

select nullif(25, 25); -- returns null if equal
select IFNULL(NULL, "abcd");
select isnull("");
select isnull(null);
SELECT CEILING(25.75);
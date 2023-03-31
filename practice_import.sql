Load data Local infile 'E:/Projects/SQL-queries/personcsv.csv'
into table person
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines;

show global variables like 'local_infile';
SET GLOBAL local_infile=1;

SHOW GRANTS;

-- chnage coulm date format before import
LOAD DATA LOCAL INFILE 'E:/Projects/SQL-queries/info_csv.csv'
INTO TABLE information
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(title,@expired_date,amount)
SET expired_date = STR_TO_DATE(@expired_date, '%m/%d/%Y');

-- change column destination
Load data Local infile 'E:/Projects/SQL-queries/personcsv.csv'
into table person
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines
(id,@name,age,gender,phone,@city)
set name = @city, city=@name;

-- ingone any column with @dummy keyword
Load data Local infile 'E:/Projects/SQL-queries/persondummy_csv.csv'
into table person
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines
(id,name,@dummy,age,gender,phone,city);

SELECT * FROM person order by id;
truncate table person;

-- select specific columns
Load data Local infile 'E:/Projects/SQL-queries/oneinfocsv.csv'
into table oneinfo
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines
(@name, @gender,@city)
set name=@name;

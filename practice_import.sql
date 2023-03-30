Load data Local infile 'E:/Projects/SQL-queries/personcsv.csv'
into table person
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines;

show global variables like 'local_infile';
SET GLOBAL local_infile=1;

SHOW GRANTS;

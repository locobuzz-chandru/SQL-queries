select * from product;

Load data Local infile 'E:/Projects/sql/product_master.csv'
into table product
fields terminated by '|'
lines terminated by '\r\n'
ignore 1 lines;

select * from product into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/product1.csv'
fields terminated by '|'
lines terminated by '\r\n';

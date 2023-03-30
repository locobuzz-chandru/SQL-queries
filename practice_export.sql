select * from person into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/personcsv1.csv'
fields terminated by ','
lines terminated by '\n';

SHOW VARIABLES LIKE "secure_file_priv";
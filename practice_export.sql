select * from person into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/personcsv1.csv'
fields terminated by ','
lines terminated by '\r\n';

SHOW VARIABLES LIKE "secure_file_priv";

-- exporting specific columns
select name, city from person where city='Bangalore' 
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/personcsv2.csv'
fields terminated by ','
lines terminated by '\r\n';

-- exporting data to a CSV file whose filename contains timestamp
SET @TS = DATE_FORMAT(NOW(),'_%Y_%m_%d_%H_%i_%s');
SET @FOLDER = 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/';
SET @PREFIX = 'orders';
SET @EXT    = '.csv';
SET @CMD = CONCAT("SELECT * FROM orders INTO OUTFILE '",@FOLDER,@PREFIX,@TS,@EXT,
				   "' FIELDS ENCLOSED BY '\"' TERMINATED BY ';' ESCAPED BY '\"'",
				   "  LINES TERMINATED BY '\r\n';");
PREPARE statement FROM @CMD;
EXECUTE statement;

-- exporting data with column headings
SELECT 'Order Number', 'Order Date', 'Status'
UNION ALL
SELECT * from (SELECT orderNumber, orderDate, status
    FROM orders order by orderNumber) orders
    INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders_head.csv';
    
-- handling null values
SELECT 
    orderNumber, orderDate, IFNULL(shippedDate, 'N/A')
FROM
    orders INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders_null.csv' 
    FIELDS ENCLOSED BY '"' 
    TERMINATED BY ';' 
    ESCAPED BY '"' LINES 
    TERMINATED BY '\r\n';

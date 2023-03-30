import csv
import MySQLdb

with open('person.csv', 'r') as f:
    reader = csv.reader(f)

    connection = MySQLdb.connect(host="localhost", user="root", db="practice", password='Chandru@123')

    cursor = connection.cursor()

    for row in reader:
        cursor.execute("INSERT INTO details (name,gender,phone,city) VALUES (%s,%s,%s,%s)", row)

    connection.commit()

cursor.close()

connection.close()


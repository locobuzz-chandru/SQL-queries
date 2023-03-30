import pandas as pd
import mysql.connector as mysql

db = mysql.connect(
   host="localhost", user="root", port='3306', database="practice", password='Chandru@123')

cursor = db.cursor()

query = "select name, phone, city from person"
cursor.execute(query)

all_data = cursor.fetchall()

person_name = []
person_phone = []
person_city = []
for name, phone, city in all_data:
    person_name.append(name)
    person_phone.append(phone)
    person_city.append(city)

dic = {'name': person_name, 'phone': person_phone, 'city': person_city}

df = pd.DataFrame(dic)

df_csv = df.to_csv("E:/Projects/SQL-queries/person_csv.csv")

import numpy as np
import pandas as pd
df=pd.read_csv(r"C:\Users\Gayat\Downloads\Airline_Customerproject.csv")
print(df)


df.info()

print(df.head)

print(df.describe)

print(df.drop_duplicates)

print(df.__dataframe__)

print(df.columns)

from sqlalchemy import create_engine
username="root"
password="root"
host="localhost"
port="3306"
database="airline"

engine=create_engine(f"mysql+pymysql://root:root@localhost:3306/airline")
table_name="airlinesprint"
df.to_sql(table_name,engine,if_exists='replace',index=False)
 
print("frist 5 rowsof data")
print(df.head())

print("\ndata info:")
print(df.info)

print("\nMissing values in each column:")
print(df.isnull().sum())



filtered_loyal = df[(df['Customer_Type'] == 'Loyal Customer') & (df['Class'] == 'Business')]
print(filtered_loyal.head())
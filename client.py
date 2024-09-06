import mysql.connector as connector

# Task 1
connection = connector.connect(user="root", password="password", db="LittleLemonDB")

# Task 2
show_tables_query = "SHOW tables"
cursor = connection.cursor()
cursor.execute(show_tables_query)
results = cursor.fetchall()
for result in results:
    print(result)

# Task 3
query = """
SELECT c.CustomerID, c.FullName, o.Cost
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.Cost > 60
"""
cursor.execute(query)
results = cursor.fetchall()
cols = cursor.column_names
print(cols)
for result in results:
    print(result)

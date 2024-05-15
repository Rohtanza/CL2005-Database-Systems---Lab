#!/bin/bash

# Replace 'your_password' with your actual MySQL password

# Command for 5.1
echo "Disclaimer : I had a hard time solving this excercise So, I took some help from gpt and internet"

mysql -u root -ppassword THEMEPARKDATA -e "SELECT DISTINCT EMP_FNAME, EMP_LNAME FROM employee WHERE EMP_NUM IN (SELECT EMP_NUM FROM hours WHERE HOUR_RATE > (SELECT AVG(HOUR_RATE) FROM hours));"

# Command for 5.2
mysql -u root -ppassword THEMEPARKDATA -e "SELECT e.EMP_FNAME, e.EMP_LNAME, h.DATE_WORKED, (h.HOURS_PER_ATTRACT - avg_hours.AVERAGE) AS DIFFERENCE, avg_hours.AVERAGE AS AVERAGE FROM employee e JOIN hours h ON e.EMP_NUM = h.EMP_NUM JOIN ( SELECT ATTRACT_NO, AVG(HOURS_PER_ATTRACT) AS AVERAGE FROM hours GROUP BY ATTRACT_NO ) AS avg_hours ON h.ATTRACT_NO = avg_hours.ATTRACT_NO;"

# Command for 5.3
echo "there are no differences between the manual commands resutls and my database results"
mysql -u root -ppassword THEMEPARKDATA -e "SELECT TRANSACTION_NO, LINE_NO, LINE_QTY, LINE_PRICE FROM sales_line SL WHERE SL.LINE_QTY > (SELECT AVG(LINE_QTY) FROM sales_line SA WHERE SA. TRANSACTION_NO = SL. TRANSACTION_NO);"
mysql -u root -ppassword THEMEPARKDATA -e "SELECT PARK_CODE, PARK_NAME, PARK_COUNTRY FROM themepark WHERE EXISTS (SELECT PARK_CODE FROM sales WHERE sales.PARK_CODE = themepark.PARK_CODE);"

# Command for 5.4
mysql -u root -ppassword THEMEPARKDATA -e "SELECT t.PARK_CODE, t.PARK_NAME, t.PARK_COUNTRY FROM themepark t LEFT JOIN ( SELECT PARK_CODE FROM sales WHERE SALE_DATE >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH) ) s ON t.PARK_CODE = s.PARK_CODE WHERE s.PARK_CODE IS NULL;"

# Command for 5.5
mysql -u root -ppassword THEMEPARKDATA -e "SELECT ATTRACT_NO, ATTRACT_CAPACITY FROM attraction WHERE ATTRACT_CAPACITY <= ( SELECT AVG(ATTRACT_CAPACITY) FROM attraction );"

#!/bin/bash

# Define MySQL credentials
username="root"
password=""
database="THEMEPARKDATA"

# 4.10
echo "4.10"
mysql -u "$username" -p"$password" "$database" -e "SELECT s.SALE_DATE, sl.LINE_QTY, sl.LINE_PRICE FROM sales s JOIN sales_line sl ON s.TRANSACTION_NO = sl.TRANSACTION_NO WHERE s.SALE_DATE = '2007-05-18';"

# 4.9
echo "4.9"
mysql -u "$username" -p"$password" "$database" -e "SELECT tp.PARK_NAME, SUM(sl.LINE_QTY * t.TICKET_PRICE) AS total_sales FROM themepark tp JOIN sales s ON tp.PARK_CODE = s.PARK_CODE JOIN sales_line sl ON s.TRANSACTION_NO = sl.TRANSACTION_NO JOIN ticket t ON sl.TICKET_NO = t.TICKET_NO WHERE tp.PARK_COUNTRY IN ('UK', 'FR') GROUP BY tp.PARK_NAME;"

# 4.7
echo "4.7"
mysql -u "$username" -p"$password" "$database" -e "SELECT e.EMP_FNAME, e.EMP_LNAME, h.ATTRACT_NO, h.DATE_WORKED FROM employee e JOIN hours h ON e.EMP_NUM = h.EMP_NUM;"

# 4.8
echo "4.8"
mysql -u "$username" -p"$password" "$database" -e "SELECT e.EMP_FNAME, e.EMP_LNAME, a.ATTRACT_NAME, h.DATE_WORKED FROM employee e JOIN hours h ON e.EMP_NUM = h.EMP_NUM JOIN attraction a ON h.ATTRACT_NO = a.ATTRACT_NO;"

# 4.6
echo "4.6"
mysql -u "$username" -p"$password" "$database" -e "SELECT COUNT(*) FROM employee CROSS JOIN hours;"

# 4.5
echo "4.5"
mysql -u "$username" -p"$password" "$database" -e "SELECT EMP_NUM, ATTRACT_NO, AVG(HOURS_PER_ATTRACT) AS average_hours FROM hours GROUP BY EMP_NUM, ATTRACT_NO HAVING AVG(HOURS_PER_ATTRACT) >= 5;"

# 4.4
echo "4.4"
mysql -u "$username" -p"$password" "$database" -e "SELECT ATTRACT_NO, MIN(HOUR_RATE) AS min_hourly_rate, MAX(HOUR_RATE) AS max_hourly_rate FROM hours GROUP BY ATTRACT_NO;"

# 4.3
echo "4.3"
mysql -u "$username" -p"$password" "$database" -e "SELECT EMP_NUM, SUM(HOURS_PER_ATTRACT) AS total_hours_worked FROM hours GROUP BY EMP_NUM;"

# 4.1
echo "4.1"
mysql -u "$username" -p"$password" "$database" -e "SELECT AVG(HOUR_RATE) AS average_hourly_rate FROM hours;"

# 4.2
echo "4.2"
mysql -u "$username" -p"$password" "$database" -e "SELECT AVG(ATTRACT_AGE) AS average_attraction_age FROM attraction WHERE PARK_CODE = 'UK3452';"

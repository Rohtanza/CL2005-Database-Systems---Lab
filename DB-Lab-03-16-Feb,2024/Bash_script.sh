 #!/bin/bash

 # sir make it exicutable using chomd +x ./Bash_script.sh and then just enter your password


# Function to execute MySQL command and display output
execute_mysql_command() {
    echo "========================"
    echo "$1"
    echo "========================"
    mysql -u root -p<enterpasswordhere> themeparkdata -e "$1"
    echo
}

# Execute each MySQL command and display output
execute_mysql_command "SELECT PARK_CODE, TICKET_NO, TICKET_TYPE, TICKET_PRICE, TICKET_PRICE + ROUND((TICKET_PRICE *0.1),2) AS 'PRICE INCREASE' FROM ticket;"
execute_mysql_command "SELECT PARK_CODE, TICKET_TYPE, TICKET_PRICE FROM ticket WHERE TICKET_PRICE > 20;"
execute_mysql_command "SELECT PARK_CODE, TICKET_TYPE, TICKET_PRICE FROM ticket WHERE TICKET_PRICE < 30;"
execute_mysql_command "SELECT PARK_CODE, PARK_NAME, PARK_COUNTRY FROM themepark WHERE PARK_CODE < 'UK2262';"
execute_mysql_command "SELECT EMP_NUM, ATTRACT_NO, HOURS_PER_ATTRACT FROM hours WHERE HOURS_PER_ATTRACT BETWEEN 5 AND 10;"
execute_mysql_command "SELECT * FROM ticket WHERE TICKET_TYPE IN ('Child','Senior');"
execute_mysql_command "SELECT EMP_LNAME, EMP_FNAME, EMP_NUM FROM employee WHERE EMP_FNAME LIKE 'A%';"
execute_mysql_command "SELECT * FROM themepark WHERE PARK_NAME LIKE '%Land';"
execute_mysql_command "SELECT * FROM attraction WHERE ATTRACT_NAME IS NULL;"
execute_mysql_command "SELECT EMP_NUM, ATTRACT_NO FROM hours WHERE HOURS_PER_ATTRACT > 3 AND DATE_WORKED > '2007-05-18';"
execute_mysql_command "SELECT * FROM attraction WHERE ATTRACT_AGE <= 10 AND ATTRACT_CAPACITY < 100 AND ATTRACT_NAME IS NOT NULL;"
execute_mysql_command "SELECT * FROM attraction WHERE (PARK_CODE LIKE 'FR%' AND ATTRACT_CAPACITY < 50 ) OR (ATTRACT_CAPACITY > 100);"
execute_mysql_command "SELECT * FROM employee ORDER BY EMP_LNAME, EMP_FNAME;"
execute_mysql_command "SELECT TICKET_TYPE, PARK_CODE FROM ticket WHERE (TICKET_PRICE > 15 AND TICKET_TYPE = 'Child') ORDER BY TICKET_NO DESC;"
execute_mysql_command "SELECT * FROM themepark WHERE PARK_NAME NOT LIKE '%UK%';"
execute_mysql_command "SELECT * FROM sales WHERE SALE_DATE = '2007-05-18';"
execute_mysql_command "SELECT TICKET_PRICE FROM ticket WHERE TICKET_PRICE BETWEEN 20.00 AND 30.00;"
execute_mysql_command "SELECT * FROM attraction WHERE ATTRACT_CAPACITY > 60 AND PARK_CODE = 'FR1001';"
execute_mysql_command "SELECT h.ATTRACT_NO AS AttractionNumber, a.ATTRACT_NAME AS AttractionName, h.HOUR_RATE AS HourlyRate, h.HOUR_RATE * 1.20 AS HourlyRateIncrease FROM hours h JOIN attraction a ON h.ATTRACT_NO = a.ATTRACT_NO;"
execute_mysql_command "SELECT DISTINCT EMP_NUM FROM hours;"
execute_mysql_command "SELECT * FROM sales ORDER BY SALE_DATE DESC;"
execute_mysql_command "SELECT TRANSACTION_NO, LINE_PRICE FROM sales_line WHERE LINE_PRICE > 50.00;"
execute_mysql_command "SELECT EMP_NUM, EMP_FNAME FROM employee ORDER BY EMP_NUM DESC LIMIT 2;"


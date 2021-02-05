#!/usr/bin/python
import argparse
import csv
import getpass
# mysql-connector python module REQUIRED:
# sudo apt install python3-pip
# pip3 install mysql-connector
import mysql.connector
from mysql.connector import errorcode

########################
# Get script arguments #
########################

# Override default help argument 
# Only --help (and not -h)
parser = argparse.ArgumentParser(add_help=False)
parser.add_argument('--help',
    help=argparse._('show this help message and exit'),
    action='help', default=argparse.SUPPRESS)

# Data load options
parser.add_argument("csvfile", 
    help="CSV file with row data: dbname, user, pass, server")
parser.add_argument("-fr", "--firstrow", 
    help="CSV first row. Default: 2 (after header)",
    nargs='?', type=int, default=2)
parser.add_argument("-fc", "--firstcolumn", 
    help="CSV first column (dbname). Default: 1",
    nargs='?', type=int, default=1)
# SQL options
parser.add_argument("-d", "--drop", 
    help="Drop databases and users before creating", 
    action="store_true")
parser.add_argument("-c", "--create", 
    help="Create databases and users", 
    action="store_true")
parser.add_argument("-g", "--grant", 
    help="Grant users' permissions", 
    action="store_true")
parser.add_argument("-e", "--execute", 
    help="Execute SQL (otherwise prints SQL)", 
    action="store_true")
# Database connection
parser.add_argument("-h", "--host", 
    help="Database host. Default: localhost",
    nargs='?', default="localhost")
parser.add_argument("--port", 
    help="Database port. Default: 3306",
    nargs='?', type=int, default=3306)
parser.add_argument("-u", "--user", 
    help="Database user. Default: root",
    nargs='?', default="root")
parser.add_argument("-p",
    help="Set database user password as required",
    action="store_true")

args = parser.parse_args()

###############
# Prepare SQL #
###############

sql_cd  = """
CREATE DATABASE IF NOT EXISTS `{dbname}` CHARACTER SET `utf8mb4` COLLATE `utf8mb4_unicode_ci`;
"""
sql_dd = """
DROP DATABASE IF EXISTS `{dbname}`;
"""
sql_cu  = """
CREATE USER IF NOT EXISTS `{user}`@`{server}` IDENTIFIED by "{password}";
"""
sql_du = """
DROP USER IF EXISTS `{user}`@`{server}`;
"""
sql_gu  = """
GRANT ALL PRIVILEGES ON `{dbname}`.* TO `{user}`@`{server}`;
GRANT ALL PRIVILEGES ON `{dbname}\_%`.* TO `{user}`@`{server}`;
"""

sql = ""
dbc = {}
dbd = {}
count = 0

def replace_all(text, dic):
    for i, j in dic.iteritems():
        text = text.replace(i, j)
    return text

with open(args.csvfile) as csvDataFile:
    csvReader = csv.reader(csvDataFile)
    fr = args.firstrow-1
    fc = args.firstcolumn-1

    # skip rows
    skip = 0
    while skip < fr:
        next(csvReader)
        skip+=1

    # columns data
    for row in csvReader:
        dic = {
            "{dbname}":     row[fc],
            "{user}":       row[fc+1],
            "{password}":   row[fc+2],
            "{server}":     row[fc+3]
        }
        if args.drop:
            # Drop database once
            if not (dic["{dbname}"] in dbd):
                sql += replace_all(sql_dd, dic)
                dbd[dic["{dbname}"]] = True
            # Drop users
            sql += replace_all(sql_du, dic)
        if args.create:
            # Create database once
            if not (dic["{dbname}"] in dbc):
                sql += replace_all(sql_cd, dic)
                dbc[dic["{dbname}"]] = True
            # Create users
            sql += replace_all(sql_cu, dic)
        if args.grant:
            # Grant users permissions
            sql += replace_all(sql_gu, dic)
       
        count+=1

###############
# Execute SQL #
###############

if args.execute:
    # Get database user password
    if args.p:
        password = getpass.getpass("Enter user password: ")
    else:
        password = ""
    # Database connection
    cnx = None
    config = {
        "user":     args.user,
        "password": password,
        "host":     args.host,   
        "port":     args.port,
        "raise_on_warnings": True
    }
    try:
        # Open database connection
        cnx = mysql.connector.connect(**config)
    except mysql.connector.Error as err:
        # DB CONNECTION FAILED
        print("[CONNECTION ERROR]")
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Something is wrong with your user or password")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist")
        else:
            print(err)
    else:
        # DB CONNECTION SUCCESS
        try:
            # Prepare a cursor object
            cursor = cnx.cursor()
            # Execute the SQL sentences
            cursor.execute(sql, multi=True)
            # SQL EXECUTION SUCCESS
            print("[EXECUTION SUCCESS]")
            print("{0} sentences executed.".format(count))
            # Commit changes in the database
            cnx.commit()
        except mysql.connector.Error as err:
            # SQL EXECUTION FAILED
            print("[EXECUTION ERROR]")
            print(err.msg)
            # Rollback in case there is any error
            cnx.rollback()
        # ANY CASE
        # Disconnect from server
        cursor.close()
        cnx.close()
else:
    # Otherwise print SQL
    print(sql)
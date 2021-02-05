# 1asixdawm02-dbms-utilities
DBMS utilities

## create-mysql-users.py

Command options:

```console
foo@bar:~$ ./create-mysql-users.py --help
usage: create-mysql-users.py [--help] [-fr [FIRSTROW]] [-fc [FIRSTCOLUMN]]
                               [-d] [-c] [-g] [-e] [-h [HOST]] [--port [PORT]]
                               [-u [USER]] [-p]
                               csvfile

positional arguments:
  csvfile               CSV file with row data: dbname, user, pass, server

optional arguments:
  --help                show this help message and exit
  -fr [FIRSTROW], --firstrow [FIRSTROW]
                        CSV first row. Default: 2 (after header)
  -fc [FIRSTCOLUMN], --firstcolumn [FIRSTCOLUMN]
                        CSV first column (dbname). Default: 1
  -d, --drop            Drop databases and users before creating
  -c, --create          Create databases and users
  -g, --grant           Grant users' permissions
  -e, --execute         Execute SQL (otherwise prints SQL)
  -h [HOST], --host [HOST]
                        Database host. Default: localhost
  --port [PORT]         Database port. Default: 3306
  -u [USER], --user [USER]
                        Database user. Default: root
  -p                    Set database user password as required
```

Example 1:
Generate and save SQL as a file

```console
foo@bar:~$ ./create-mysql-users.py -fc 5 -d -c -g db-users.csv > db-users.sql
```

Example 2:
Generate and execute SQL on server

```console
foo@bar:~$ ./create-mysql-users.py -fc 5 -d -c -g db-users.csv -e -h mydbhost --port=3306 -u mydbuser -p
```
#!/usr/bin/env bash

# Migrate MySQL 5.7.x to MySQL 8.0.x
# https://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/
# https://tastethelinux.com/2020/09/14/upgrade-mysql-server-from-5-7-to-8-ubuntu-18-04/

# 0. Backup databases

mysqldump --lock-all-tables --all-databases -uroot -p > mysql-backup.sql

sudo cp /etc/mysql/my.cnf /etc/mysql/my.cnf_bkp

mysql --version

# 1. Stop the MySQL server

sudo systemctl stop mysql

# 2. Download the Repository and Install the Package

wget https://repo.mysql.com/mysql-apt-config_0.8.16-1_all.deb

sudo dpkg -i mysql-apt-config_0.8.16-1_all.deb

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Step 2.1 Select "MySQL Server & Cluster"                                                      #
# Step 2.2 Select "mysql-8.0"                                                                   #
# Step 2.3 Select "Ok"                                                                          #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# 3. Upgrade MySQL Server from 5.7 to 8 (Ubuntu)

sudo apt-get update

sudo apt-get install mysql-server

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Configuració del paquet «mysql-community-server»                                              #
#                                                                                               # 
# MySQL 8 uses a new authentication based on improved SHA256-based password methods. It is      # 
# recommended that all new MySQL Server installations use this method going forward. This new   # 
# authentication plugin requires new versions of connectors and clients, with support for this  # 
# new authentication method (caching_sha2_password). Currently MySQL 8 Connectors and           # 
# community drivers built with libmysqlclient21 support this new method. Clients built with     # 
# older versions of libmysqlclient may not be able to connect to the new server.                # 
#                                                                                               # 
# To retain compatibility with older client software, the default authentication plugin can be  # 
# set to the legacy value (mysql_native_password) This should only be done if required          # 
# third-party software has not been updated to work with the new authentication method. The     # 
# change will be written to the file /etc/mysql/mysql.conf.d/default-auth-override.cnf          # 
#                                                                                               # 
# After installation, the default can be changed by setting the default_authentication_plugin   # 
# server setting.    
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# 4. Check the Version of MySQL Server which is running after Upgrade

sudo apt policy mysql-server

sudo systemctl status mysql

mysql --version
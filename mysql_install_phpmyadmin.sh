#!/usr/bin/env bash

# install phpmyadmin
sudo apt-get install phpmyadmin

# configure apache2
sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
sudo a2enconf phpmyadmin
sudo sudo systemctl reload apache2

# open phpmyadmin
xdg-open http://localhost/phpmyadmin/
#Menginstall Package yang dibutuhkan
$ sudo apt-get update
$ sudo apt-get install apache2
$ sudo apt-get install mysql-server
$ sudo apt-get install libapache2-mod-php
$ sudo apt-get install php
$ sudo apt-get install php-mysql

#Mendownload package Dolibarr
$ wget -c https://sourceforge.net/projects/dolibarr/files/Dolibarr%20installer%20for%20Debian-Ubuntu%20%28DoliDeb%29/13.0.1/dolibarr_13.0.1-4_all.deb/download -O dolibarr_13.0.1-4_all.deb

#Mengekstrak file zip ke dalam folder webroot yang kita inginkan. (Pada kali ini digunakan path /var/www/html/dolibarr)
$ sudo unzip dolibarr_13.0.1-4_all.zip -d /var/www/html/dolibarr

#Membuat file php kosong untuk config dolibarr nya dan ubah kepemilikan ke user www-data
$ sudo touch /var/www/html/dolibarr/dolibarr-13.0.1/htdocs/conf/conf.php
$ sudo chown -R www-data:www-data /var/www/html/dolibarr

#Merestart Service Apache dan MySql
$ sudo service apache2 restart ; sudo service mysql restart

#Mengkonfigurasi Apache web server
$ sudo a2enmod rewrite
$ sudo touch /etc/apache2/sites-available/dolibarr.conf
$ sudo ln -s /etc/apache2/sites-available/dolibarr.conf /etc/apache2/sites-enabled/dolibarr.conf
$ sudo nano /etc/apache2/sites-available/dolibarr.conf

<VirtualHost *:80>
ServerAdmin admin@your-domain.com
DocumentRoot /var/www/html/dolibarr/
ServerName your-domain.com
ServerAlias www.your-domain.com
<Directory /var/www/html/dolibarr/>
Options FollowSymLinks
AllowOverride All
Order allow,deny
allow from all
</Directory>
ErrorLog /var/log/apache2/your-domain.com-error_log
CustomLog /var/log/apache2/your-domain.com-access_log common
</VirtualHost>

#Membuat Database baru dan User untuk database
$ sudo mysql -u root -p
    CREATE DATABASE db1;
    CREATE USER 'dolibarr1'@'localhost' IDENTIFIED BY 'dolibarrpassword';
    GRANT ALL PRIVILEGES ON `db1`.* TO 'dolibarr1'@'localhost';
    FLUSH PRIVILEGES;

#Restart service
$ sudo service apache2 restart ; sudo service mysql restart

#Open Dolibarr at 
localhost/dolibarr

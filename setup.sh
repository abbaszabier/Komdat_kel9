#Menginstall Package yang dibutuhkan
$ sudo apt-get update
$ sudo apt-get install apache2
$ sudo apt-get install mysql-server
$ sudo apt-get install libapache2-mod-php
$ sudo apt-get install php
$ sudo apt-get install php-mysql

#Mendownload package Dolibarr
$ wget -c https://sourceforge.net/projects/dolibarr/files/Dolibarr%20installer%20for%20Debian-Ubuntu%20%28DoliDeb%29/13.0.1/dolibarr_13.0.1-4_all.deb/download -O dolibarr_13.0.1-4_all.deb

#Menjalankan MySQL
$ sudo service mysql start

#Membuat Database baru dan User untuk database
$ sudo mysql -u root -p
    CREATE DATABASE db1;
    CREATE USER 'dolibarr1'@'localhost' IDENTIFIED BY 'dolibarrpassword';
    GRANT ALL PRIVILEGES ON `db1`.* TO 'dolibarr1'@'localhost';
    FLUSH PRIVILEGES;

#Install Dolibarr
$ sudo dpkg -i dolibarr_13.0.1-4_all.deb

#Jika ada gagal karena dependency, jalankan ini
$ sudo apt-get install -f

#Change Ownership
$ sudo chmod 777 /var/www

#Restart service
$ sudo service apache2 restart ; sudo service mysql restart


#Open Dolibarr at 
localhost/dolibarr

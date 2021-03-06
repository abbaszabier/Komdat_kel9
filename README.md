<h1 align="center"><img src="https://user-images.githubusercontent.com/60166781/110757375-e639c280-827d-11eb-839e-b344423b07be.png"></h1>

[Sekilas Info](#sekilas-info) | [Instalasi](#instalasi) | [Konfigurasi](#konfigurasi) | [Otomatisasi](#otomatisasi) | [Cara Pemakaian](#cara-pemakaian) | [Pembahasan](#pembahasan) | [Referensi](#referensi)
:---:|:---:|:---:|:---:|:---:|:---:|:---:

# Sekilas Info
**Dolibarr** merupakan software yang dibangun dengan penambahan modules, untuk mengelola perusahaan kecil atau menengah, freelancers atau yayasan. Dolibarr adalah project opensource berbasis pada server WAMP, MAMP atau LAMP. Dolibar berbasiskan web yang dapat dijalankan diberbagai operating system. Aplikasi ini dikembangkan dengan menggunakan bahasa pemrograman php dan database mysql. Aplikasi ini bersifat open source dan memiliki license GPL V.02.

# Instalasi
[`^ kembali ke atas ^`](#)

### Kebutuhan Sistem :
- Unix, Linux atau Windows (Khusus windows 7, Visual C++ Redistributable for Visual Studio 2012 Update 4 harus sudah terinstall).
- Apache Web server 1.3+.
- PHP 5.6.0+
- RAM minimal 64 Mb+
- MySQL 5.1+ (Jangan gunakan MySQL versi 5.5.40 atau 5.5.41, karena pada versi ini terdapat critical bugs seputar data loss).

Alternatif database selain MySQL yang bisa Anda gunakan adalah: MariaDB 5.1+, atau PostgreSQL 9.1.0+


### Proses Instalasi :
1. Menginstall terlebih dahulu package yang dibutuhkan
    ```
    $ sudo apt-get update
    $ sudo apt-get install apache2
    $ sudo apt-get install mysql-server
    $ sudo apt-get install libapache2-mod-php
    $ sudo apt-get install php
    $ sudo apt-get install php-mysql
    $ sudo apt-get install unzip
    ```
    
2.  Mengunduh **Dolibarr** 13.0.1-4 ke dalam direktori kita
    ```
    $ wget -c https://sourceforge.net/projects/dolibarr/files/Dolibarr%20ERP-CRM/13.0.1/dolibarr-13.0.1.zip/download -O dolibarr_13.0.1-4_all.zip
    ```
    ![doli1](https://user-images.githubusercontent.com/60166815/111343072-a6c00b80-86ad-11eb-8816-04784dbcff82.png)

3. Mengekstrak file zip ke dalam folder webroot yang kita inginkan. (Pada kali ini digunakan path /var/www/html/dolibarr)
    ```
    $ sudo unzip dolibarr_13.0.1-4_all.zip -d /var/www/html/dolibarr
    ```
    ![doli2a](https://user-images.githubusercontent.com/60166815/111343182-bfc8bc80-86ad-11eb-9af1-9d9cefd3c41f.png)
    ![doli2b](https://user-images.githubusercontent.com/60166815/111343211-c6573400-86ad-11eb-91a9-f4e98d58d851.png)

4. Membuat file php kosong untuk config dolibarr nya dan ubah kepemilikan ke user www-data
    ```
    $sudo touch /var/www/html/dolibarr/dolibarr-13.0.1/htdocs/conf/conf.php
    $ sudo chown -R www-data:www-data /var/www/html/dolibarr
    ```  
    ![doli3](https://user-images.githubusercontent.com/60166815/111346413-c60c6800-86b0-11eb-955f-9ee9355e4e0c.png)
    
5. Restart Service Apache dan MySql
    ```
    $ sudo service apache2 restart ; sudo service mysql restart
    ```
    ![doli4](https://user-images.githubusercontent.com/60166815/111344248-c9065900-86ae-11eb-8b7e-e1e64b12dc86.png)
    
6. Konfigurasi Apache web sever
    ```
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
    ```
    ![doli5a](https://user-images.githubusercontent.com/60166815/111343633-31a10600-86ae-11eb-8ae7-0d2e7af552e1.png)
    ![doli5b](https://user-images.githubusercontent.com/60166815/111343646-336ac980-86ae-11eb-8fbd-a171c06a1877.png)

7. Membuat database baru dan user untuk database
    ```
    $ sudo mysql -u root -p
    CREATE DATABASE db1;
    CREATE USER 'dolibarr1'@'localhost' IDENTIFIED BY 'dolibarrpassword';
    GRANT ALL PRIVILEGES ON `db1`.* TO 'dolibarr1'@'localhost';
    FLUSH PRIVILEGES;
    ```
    ![image](https://user-images.githubusercontent.com/60166815/111298081-f89e6c80-8680-11eb-9cbd-f2c9aae5b33f.png)
   
8. Merestart service Apache dan MySql kembali
    ```
    $ sudo service apache2 restart ; sudo service mysql restart
    ```
    ![doli7](https://user-images.githubusercontent.com/60166815/111344168-ba1fa680-86ae-11eb-8d1a-85fae7cbeaad.png)
    
 9. Kunjungi alamat IP web server untuk meneruskan instalasi. (localhost/dolibarr)
    - Buka folder htdocs
     ![doli9a](https://user-images.githubusercontent.com/60166815/111344605-17b3f300-86af-11eb-9163-c9996b6a689c.png)
    - Pilih bahasa yang akan digunakan
     ![image](https://user-images.githubusercontent.com/60166815/111298890-e53fd100-8681-11eb-95b5-6aa8c5960a28.png)
    - Cek Prerequisites yang diperlukan, apabila sudah terpenuhi semua bisa melanjutkan proses dengan menekan tombol **start**
     ![image](https://user-images.githubusercontent.com/60166815/111298307-2edbec00-8681-11eb-9329-747c6edd8f3f.png)
    - Konfigurasi web server dan database
     ![doli9b](https://user-images.githubusercontent.com/60166815/111346897-416e1980-86b1-11eb-975a-01aa383ba5ae.png)
    - Apabila telah berhasil, maka bisa melanjutkan proses dengan **next step**
     ![doli9c](https://user-images.githubusercontent.com/60166815/111348578-eb9a7100-86b2-11eb-9204-2a50b3c06b21.png)
    - Set user admin untuk login ke **Dolibarr**
     ![image](https://user-images.githubusercontent.com/60166815/111299164-30f27a80-8682-11eb-952c-3191d9207bfa.png)
    - Setelah berhasil konfigurasi maka bisa login untuk masuk ke Dolibarr
     ![image](https://user-images.githubusercontent.com/60166815/111299222-45367780-8682-11eb-8b01-42da809edba3.png)
    - Tampilan homepage
      ![image](https://user-images.githubusercontent.com/60166815/111299259-51bad000-8682-11eb-8a24-e3886ddeeacd.png)
    
# Konfigurasi
[`^ kembali ke atas ^`](#)
- Setelah menyelesaikan penginstalan awal, Anda harus mengkonfigurasi parameter di Dolibarr agar sesuai dengan kebutuhan Anda.

### Company / Organization
- Langkah pertama yang harus Anda lakukan adalah menentukan informasi perusahaan / organisasi Anda. Untuk melakukan ini, dari halaman muka, pilih menu "Home-> Setup-> Company / Organization" dan tambahkan informasi untuk perusahaan / organisasi Anda.

### Modules
<img src="https://wiki.dolibarr.org/images/thumb/c/c7/List_of_modules_en.png/529px-List_of_modules_en.png">

- Aktivasi modul adalah langkah wajib kedua. Modul mana yang akan Anda aktifkan bergantung pada apa yang ingin Anda lakukan dengan Dolibarr. Dalam kebanyakan kasus, Anda mungkin ingin menggunakan semua modul. Anda harus mengaktifkan setiap modul satu per satu. Misalnya, untuk mengelola perusahaan, Anda mungkin mengaktifkan setidaknya modul Pihak ketiga, Faktur, dan Produk, tetapi Anda juga bisa mengaktifkan lebih banyak lagi.
- Untuk mengaktifkan modul, masuk ke halaman "Home-> Setup-> Modules" dan klik tombol 'on / off' di kolom "Status" untuk mengaktifkannya.

- Modul sudah aktif jika tombol 'on / off' terlihat seperti ini:

    <img src="https://wiki.dolibarr.org/images/f/fd/On_off_button_on.png">
- Modul tidak aktif jika tombol 'on / off' terlihat seperti ini:

    ![Inactive Module](https://wiki.dolibarr.org/images/7/72/On_off_button_off.png)
- Jika Anda tidak yakin dengan fungsi suatu modul, Anda dapat mengaktifkannya dan melihat menu item baru apa yang muncul di Dolibarr (bilah horizontal). Dan setelah mengaktifkan modul, periksa apakah Anda mengizinkan fitur baru yang diaktifkan. Anda dapat mengaktifkan atau menonaktifkan modul kapan pun Anda mau.
- Setelah modul diaktifkan, boleh jadi modul tersebut memerlukan pengaturan lebih lanjut (klik ikon pengaturan yang muncul di sebelah kanan baris modul jika modul memang membutuhkan pengaturan).

### Display

<img src="https://wiki.dolibarr.org/images/thumb/5/54/Display_settings_EN.png/548px-Display_settings_EN.png">

- Di halaman 'Display', Anda dapat mengatur bahasa default aplikasi dan tampilan serta nuansa layar. Untuk penggunaan pertama, Anda dapat membiarkannya dan menggunakan pengaturan default.

'Bahasa'
- Di pengaturan bahasa, Anda dapat mengatur Bahasa Default. Secara default ini diatur ke "Deteksi Otomatis". Catatan: Mengaktifkan opsi multibahasa akan memungkinkan Anda untuk dapat mengatur bahasa yang disukai pelanggan, untuk mencetak Faktur / Proposal / Pesanan mereka dalam bahasa mereka sendiri. Terjemahan produk juga akan tersedia.

'Tema skin default'
- Di Dolibarr Anda memiliki dua skin berbeda:
- Eldy:
    ![Eldy](https://wiki.dolibarr.org/images/7/71/Eldy_Theme_thumb.png)
- Md:
    ![Md](https://wiki.dolibarr.org/images/4/43/Md_theme_thumb.png)

- Skin lain dapat diunduh di [dolistore](https://www.dolistore.com/4-skins)
Anda juga dapat mempersonalisasi warna skin, dan visual di pengaturan ini.

'Miscellanous'
- Di bagian ini, Anda memiliki semua nilai default fitur seperti, fungsi javascript, panjang list, hari pertama dalam seminggu, dll.
Anda juga dapat meletakkan fitur "Message of the Day" yang akan ditampilkan untuk semua pengguna.

'Login Page'
- Di bagian ini, Anda dapat menyesuaikan halaman login termasuk pesan login dan gambar latar belakang.

### Menus
<img src="https://wiki.dolibarr.org/images/thumb/1/1b/Menu_Setup.png/800px-Menu_Setup.png">

- Di sini Anda dapat memilih menu manager yang ingin Anda gunakan untuk internal user dan eksternal user, serta untuk pengguna komputer atau smartphone. Menu manager akan mengubah tampilan label, order, dan organisasi pada menu kiri dan atas.

'Menu Handlers'
- Perangkat lunak ini dilengkapi dengan dua menu handlers yang berbeda:
- Eldy: Ini adalah menu default, entri menu dipusatkan dan diberi hardcode. Anda dapat menambahkan entri pada menu ini tetapi tidak dapat mengubah entri menu default.
- Auguria: Ini adalah menu manager database. Menu ini dapat disesuaikan sepenuhnya dengan kebutuhan Anda.
- Catatan: Di tab Menu handlers, Anda dapat memilih menu untuk pengguna internal dan eksternal dan untuk komputer atau smartphone.

'Menu Editor'
Pada tab ini, Anda dapat menyesuaikan setiap entri menu dari menu auguria, atau entri tambahan dari menu eldy, dan membuat entri baru

'Miscellaneous'
Di tab ini, Anda dapat memilih behavior entri menu yang tidak sah. Secara default, entri menu yang tidak sah berwarna abu-abu, tetapi dapat disembunyikan.

### Users
- Langkah terakhir adalah membuat dan menetapkan izin pengguna. Hampir semua modul yang diaktifkan sebelumnya, tidak dapat diakses jika Anda tidak memberikan izin. Untuk melakukan ini, Anda dapat pergi ke menu Home -> Users & Groups untuk menentukan pengguna dan hak mereka. 
- Perhatian, Anda harus mempertimbangkan untuk memeriksa dan mengatur ulang hak pengguna saat Anda mengaktifkan modul baru. Daftar hak yang tersedia bergantung pada modul yang diaktifkan. 
- Direkomendasikan untuk mengonfigurasi izin setelah mengaktifkan modul yang ingin Anda gunakan. Untuk tindakan tertentu, jika Anda tidak memiliki hak untuk melakukan suatu tindakan, Dolibarr tidak akan menampilkan tindakan tersebut kepada Anda. Anda mungkin melewatkan beberapa fitur yang berguna atau penting. 
- Untuk memberikan hak kepada pengguna atau diri Anda sendiri, jika Anda adalah administrator, buka Home -> Users & Groups, pilih pengguna yang diinginkan, lalu klik tab 'Permission'.
- Anda dapat menghindari langkah-langkah konfigurasi ini untuk setiap pengguna yang baru dibuat, dengan mengkonfigurasi hak default (memberi hak secara otomatis setiap kali pengguna baru dibuat) dengan mengkonfigurasi izin default pada menu Advanced > Setup Security.


# Maintenance
[`^ kembali ke atas ^`](#)

## Mass Import

- Saat Dolibarr baru diinstal, database akan kosong. Dan Anda mungkin ingin mengimpor data yang sudah Anda punya daripada memasukkan data secara manual. 
- Catatan: Mengimpor data lama kemungkinan akan membutuhkan banyak upaya / modifikasi dari file sumber untuk menghasilkan impor yang berhasil. Direkomendasikan untuk menggunakan LibreOffice / OpenOffice untuk "membuild" spreadsheet sumber tunggal (.ods) dan berulang kali Simpan file Sebagai CSV untuk setiap modifikasi / koreksi, karena set karakter penanganan / definisi struktur csv jauh lebih unggul daripada Excel untuk multibyte (beraksen) string teks.

- Ada beberapa metode untuk mengimpor data ke Dolibarr, seperti dengan menggunakan OpenOffice atau menulis script import Anda sendiri, akan tetapi metode yang disarankan adalah dengan menggunakan Dolibarr Import Module.

'Dolibarr Import Module'
- Metode yang disarankan untuk mengimpor data adalah dengan menggunakan Modul Impor Dolibarr. Akan ada wizard yang akan memandu Anda langkah demi langkah dalam mengimpor data.

Untuk mengimpor file:

- Buka menu Tools - New Import.
- Langkah 1: Pilih salah satu set data yang telah ditentukan untuk mencocokkan data Anda.
- Langkah 2: Pilih format file CSV / Excel (.xlsx). 
- Langkah 3: Jelajahi dan Pilih file yang akan diunggah dari komputer Anda ke server Dolibarr. 
- Langkah 4: Petakan kolom file ke kolom dataset. Kolom kiri mencantumkan bidang yang ditemukan di file yang diunggah. Kolom kanan mencantumkan bidang yang tersedia di Dolibarr. Anda dapat memindahkan bidang di kolom kiri ke atas atau ke bawah dengan drag and drop dari panah, untuk menyelaraskan setiap bidang file dengan bidang Dolibarr yang benar. Jika bidang dalam file masukan akan diabaikan / tidak diimpor, pindahkan ke bagian bawah yang bertuliskan "File sumber bidang tidak diimpor."
- Langkah 5: Jalankan simulasi impor. Periksa field separator dan string separator yang cocok dengan tata letak file Anda. Jika file memiliki column headers, ini harus diabaikan dengan menggunakan "Spanning Boundaries".
- Langkah 6: Klik "Jalankan Simulasi Impor" untuk memulai. Simulasi akan memeriksa nilai di field dan menampilkan laporan kesalahan. Jika tidak ada kesalahan, Anda dapat mengklik "Start final import" untuk memasukkan data. Data yang diimpor akan ditambahkan ke data yang sudah ada.

Semua data diimpor ke Dolibarr dengan tambahan "import_key" yang sesuai dengan tanggal impor untuk membantu menyelesaikan masalah yang terkait dengan impor tertentu. Dengan editor SQL akan relatif mudah untuk menemukan baris impor yang dimaksud.

## Mass Export

Anda juga dapat mengekspor data dari Dolibarr menggunakan Export Module.

- Langkah 1: Buka Menu -> Tools -> New Export dan pilih kumpulan data yang telah ditentukan sebelumnya.
- Langkah 2: Pilih profil ekspor yang telah ditentukan sebelumnya (oleh Anda) atau pilih secara manual field yang ingin Anda sertakan dalam file ekspor.
- Langkah 3: Tambahkan filter apa pun yang mungkin ingin Anda tempatkan pada nilai bidang tersebut.
- Langkah 4: Ubah posisi / kolom bidang di file ekspor. Anda dapat menyimpan pilihan yang telah Anda buat sebagai profil / template ekspor untuk digunakan di masa mendatang.
- Langkah 5: Pilih format untuk file ekspor dari daftar dropdown. Format yang memungkinkan adalah CSV / TSV (File teks) atau XLS 2007/95 (file Excel asli). Klik Hasilkan.
- Setelah beberapa detik, tautan ke file akan ditampilkan untuk diunduh.

# Otomatisasi
[`^ kembali ke atas ^`](#)

Apabila masih mengalami kesulitan dalam proses instalasi **Dolibarr**, ada cara alternatif yang lebih mudah. Cara pertama yaitu menggunakan `script shell` yang otomatis akan menjalankan semua perintah instalasi pada terminal. Contoh `script shell` yang dapat kita gunakan adalah [setup.sh](https://github.com/abbaszabier/Komdat_kel9/blob/main/setup.sh)

Cara kedua yaitu dengan menggunakan layanan yang tersedia pada *web-hosting provider*. Dengan layanan tersebut kita hanya perlu satu kali klik untuk meng-install **Dolibarr**. Berikut langkah-lankah untuk melakukannya :
1. Kita bisa mengunjungi *web-hosting provider* yang menyediakan *script* instalasi **Dolibarr** otomatis, seperti [Installatron](https://installatron.com/apps?q=dolibarr) atau [Softaculous](http://www.softaculous.com/apps/erp/Dolibarr).
2. Apabila kita ingin menggunakan layanan dari [Installatron](https://installatron.com/apps?q=dolibarr). Maka, kita hanya perlu mengunjungi link tersebut lalu klik tombol **Install this Application**.

    ![Installatron](https://user-images.githubusercontent.com/60084300/111055898-fa173b80-84ac-11eb-80a4-f377dd81a222.png)

3. Setelah itu isi semua informasi yang dibutuhkan, lalu klik tombol **Install**.

    ![form](https://user-images.githubusercontent.com/60084300/111055853-7eb58a00-84ac-11eb-9948-8fa2309d5c7b.png)
    
4. Tunggu hingga proses instalasi selesai

# Cara Pemakaian

### Jalankan Aplikasi Dolibarr
- Untuk memulai, luncurkan aplikasi, baik dengan mengklik ikon aplikasi Dolibarr yang telah diinstal pada desktop Anda atau dengan mengetik URL yang sesuai di browser web Anda (URL yakni https:// localhost/dolibarr/ untuk instalasi lokal tetapi dapat berbeda dalam kasus penginstalan manual, dalam hal ini akan tergantung pada konfigurasi server Web Anda).
- Setelah meluncurkan aplikasi, Anda akan melihat halaman login dengan setidaknya 2 field berikut:

- Login: login pengguna untuk terhubung. Jika ini adalah penggunaan pertama, Anda dapat menggunakan nama yang Anda setting pada langkah terakhir instalasi (mis. Admin). Field ini juga bisa diisi dengan email pengguna.
- Password: kata sandi pengguna untuk terhubung. Jika ini adalah penggunaan pertama, ini adalah kata sandi yang dimasukkan pada langkah terakhir instalasi (mis. Changeme)
<img src="https://wiki.dolibarr.org/images/thumb/e/ea/Identification.jpg/800px-Identification.jpg">

### Homepage
- Setelah masuk, Anda akan melihat halaman beranda. Tampilan ini berisi bilah menu (satu bilah horizontal dan satu bilah vertikal) dan lebih banyak informasi di tengah:
- Sebuah kotak yang mengingatkan akun login Anda dan tanggal akses terakhir.
- Kotak statistik yang terkait dengan semua modul yang diaktifkan.
- Sebuah kotak yang memperlihatkan tabel 'tugas' (tabel yang berisi informasi tentang tugas yang harus diselesaikan dan tugas di belakang jadwal). Ringkasan.
- Di bagian bawah mungkin ada kotak informasi lain. Daftar ini tergantung pada kotak yang Anda aktifkan melalui menu Home-> Setup-> Boxes.

<img src="https://wiki.dolibarr.org/images/thumb/9/90/Dolibarr_Homepage_En.png/800px-Dolibarr_Homepage_En.png">

### Menggunakan Menus 
- Setiap menu di bilah horizontal terkait dengan satu modul. Ketika modul diaktifkan, menu terkaitnya muncul di bilah menu horizontal. Entri menu modul tidak muncul di menu sampai modul tersebut diaktifkan.
- Untuk menggunakan modul, klik menu yang terkait dengan modul, menu muncul di bilah vertikal untuk melakukan berbagai tugas yang terkait dengan modul itu.
- Misalnya, untuk membuat daftar produk dalam stok (fungsi disediakan oleh modul Produk dan Stok), klik pada menu Produk / Layanan:

<img src="https://wiki.dolibarr.org/images/thumb/5/58/Access_to_product_module_en.png/800px-Access_to_product_module_en.png">

- Setelah menu atas dipilih, menu kiri muncul dengan berbagai tugas yang berkaitan dengan modul yang diaktifkan.
- Misalnya, menu yang dapat Anda lihat setelah menu atas Produk / Layanan telah dipilih:

<img src="https://wiki.dolibarr.org/images/0/0c/Product_module_lateral_menu_EN.png">

- Perhatikan bahwa organisasi menu tergantung pada pilihan menu manager yang dikonfigurasi di Home-> Setup-> Menus.

### Objects
- Objek adalah istilah umum tentang catatan yang dikelola oleh aplikasi. Contoh: pelanggan, pemasok, faktur, pesanan, proposal, acara agenda, pengguna, dsb..
- Setiap objek dikelola oleh modul Dolibarr. Bergantung pada modul yang Anda aktifkan, beberapa objek mungkin muncul dalam aplikasi. Kebijakan Dolibarr adalah menggunakan cara kerja umum untuk setiap modul atau objek yang dikelola. Jadi, untuk setiap objek, Anda akan menemukan entri menu untuk Buat ("Objek Baru") dan entri menu untuk melihat list semua objek (menu ini disebut "Daftar"). Kemudian mengklik objek yang ditemukan dalam daftar, Anda dapat membaca semua properti objek yang diatur dalam beberapa tab. Tombol "Ubah" terlihat oleh pengguna yang memiliki hak untuk mengedit objek.
- Misalnya, ini adalah tampilan menu kiri untuk mengelola third party dan third party cards yang dipilih:

<img src="https://wiki.dolibarr.org/images/thumb/6/63/Third_party_card_en.png/800px-Third_party_card_en.png">

- Selain itu, dalam tampilan daftar (mengklik menu "Daftar" di menu vertikal), simbol / tanda status akan muncul di kolom terakhir daftar objek. Simbol / papan nama bervariasi sesuai dengan status objek dalam alur kerja. Simbol / tanda status bergantung pada objek dan opsinya ditentukan dalam penyetelan modul yang didedikasikan untuk manajemen objek. Definisi default untuk tema Eldy adalah:

- <img src="https://wiki.dolibarr.org/images/2/2f/Statut0.png"> Status Draf - Objek belum divalidasi (Warna putih, tidak ada tindakan yang dapat dilakukan pada objek)

- <img src="https://wiki.dolibarr.org/images/5/59/Statut1.png"> Status Tervalidasi - Objek divalidasi dan beberapa tindakan sekarang diharapkan pada objek (warna kuning).

- <img src="https://wiki.dolibarr.org/images/4/45/Statut3.png"> Status yang lebih maju daripada Divalidasi - Beberapa tindakan telah dilakukan pada objek, tetapi masih ada beberapa tindakan yang diharapkan padanya (Warna sebagian kuning)

- <img src="https://wiki.dolibarr.org/images/7/77/Statut4.png"> Diproses, Status Aktif atau Diaktifkan - Tidak ada tindakan khusus yang diharapkan untuk objek lagi, meskipun beberapa peristiwa mungkin masih terjadi (Warna hijau, berarti semuanya baik-baik saja saat ini)

- <img src="https://wiki.dolibarr.org/images/9/98/Statut5.png"> Status Dibatalkan - Tidak ada tindakan khusus yang dapat dilakukan untuk objek ini (Warna putih dengan Salib, putih berarti "tidak ada tindakan yang dapat dilakukan" dan tanda silang berarti "lagi")

- <img src="https://wiki.dolibarr.org/images/b/b4/Statut8.png"> Status Kesalahan - Status ini berarti ada masalah kritis yang harus diperbaiki untuk objek (warna merah berarti kesalahan)


# Pembahasan
[`^ kembali ke atas ^`](#)

**Dolibarr** adalah project opensource berbasis pada server WAMP, MAMP atau LAMP. Dolibar berbasiskan web yang dapat dijalankan diberbagai operating system. Aplikasi ini dikembangkan dengan menggunakan bahasa pemrograman php dan database mysql.
Dalam aplikasi Dolibarr ini memiliki beberapa modul utama yaitu:
1. Direktori untuk Customers, Suppliersatau Prospects
2. Katalog Produk dan Services
3. Manajemen Stok
4. Manajemen Akun Bank
5. Commercial Actions Management
6. Commercial Proposals Management
7. Manajemen Pemesanan
8. Manajemen Kontrak
9. Invoices Management
10. Payments Management
11. Standing Orders Management
12. Shipping Management
13. Electronic Document Management (EDM)
14. Foundations Member Management
15. Employee???s Holidays Management
16. Realize Surveys
17. Donations Management
18. PDF Generation of all elements
19. Import and export toolsdan lain lain.


# Referensi
1. [About Dolibarr](https://www.dolibarr.org/) - Dolibarr
2. [Prerequisite](https://wiki.dolibarr.org/index.php?title=Prerequisite) - Requirements
3. [Installation](https://wiki.dolibarr.org/index.php?title=Installation_-_Upgrade) - Instalasi
4. [Install using Installatron](https://installatron.com/apps?q=dolibarr) - Instalasi via Installatron
5. [Install using Softaculous](http://www.softaculous.com/apps/erp/Dolibarr) - Instalasi via Softaculous
6. [Mass Import](https://wiki.dolibarr.org/index.php?title=Mass_imports) - Importing Data
7. [Mass Export](https://wiki.dolibarr.org/index.php?title=Module_Exports_En) - Exporting Data
8. [First Setup](https://wiki.dolibarr.org/index.php?title=First_setup) - Konfigurasi
9. [General Information on Usage](https://wiki.dolibarr.org/index.php?title=General_information_on_usage) - Cara Penggunaan



[`^ kembali ke atas ^`](#)

<h1 align="center"><img src="https://user-images.githubusercontent.com/60166781/110757375-e639c280-827d-11eb-839e-b344423b07be.png"></h1>

[Sekilas Info](#sekilas-info) | [Instalasi](#instalasi) | [Konfigurasi](#konfigurasi) | [Otomatisasi](#otomatisasi) | [Cara Pemakaian](#cara-pemakaian) | [Pembahasan](#pembahasan) | [Referensi](#referensi)
:---:|:---:|:---:|:---:|:---:|:---:|:---:

# Sekilas Info
**Dolibarr** merupakan software yang dibangun dengan penambahan modules, untuk mengelola perusahaan kecil atau menengah, freelancers atau yayasan. Dolibarr adalah project opensource berbasis pada server WAMP, MAMP atau LAMP. Dolibar berbasiskan web yang dapat dijalankan diberbagai operating system. Aplikasi ini dikembangkan dengan menggunakan bahasa pemrograman php dan database mysql. Aplikasi ini bersifat open source dan memiliki license GPL V.02.
# Instalasi

# Konfigurasi
[`^ kembali ke atas ^`](#)
- Setelah menyelesaikan penginstalan awal, Anda harus mengkonfigurasi parameter di Dolibarr agar sesuai dengan kebutuhan Anda.

## Company / Organization
- Langkah pertama yang harus Anda lakukan adalah menentukan informasi perusahaan / organisasi Anda. Untuk melakukan ini, dari halaman muka, pilih menu "Home-> Setup-> Company / Organization" dan tambahkan informasi untuk perusahaan / organisasi Anda.

## Modules

<img src="https://wiki.dolibarr.org/images/thumb/c/c7/List_of_modules_en.png/300px-List_of_modules_en.png">

- Aktivasi modul adalah langkah wajib kedua. Modul mana yang akan Anda aktifkan bergantung pada apa yang ingin Anda lakukan dengan Dolibarr. Dalam kebanyakan kasus, Anda mungkin ingin menggunakan semua modul. Anda harus mengaktifkan setiap modul satu per satu. Misalnya, untuk mengelola perusahaan, Anda mungkin mengaktifkan setidaknya modul Pihak ketiga, Faktur, dan Produk, tetapi Anda juga bisa mengaktifkan lebih banyak lagi.
- Untuk mengaktifkan modul, masuk ke halaman "Home-> Setup-> Modules" dan klik tombol 'on / off' di kolom "Status" untuk mengaktifkannya.
- Modul sudah aktif jika tombol 'on / off' terlihat seperti ini:

    <img src="https://wiki.dolibarr.org/images/f/fd/On_off_button_on.png">

- Modul tidak aktif jika tombol 'on / off' terlihat seperti ini:

    ![Inactive Module](https://wiki.dolibarr.org/images/7/72/On_off_button_off.png)

- Jika Anda tidak yakin dengan fungsi suatu modul, Anda dapat mengaktifkannya dan melihat menu item baru apa yang muncul di Dolibarr (bilah horizontal). Dan setelah mengaktifkan modul, periksa apakah Anda mengizinkan fitur baru yang diaktifkan. Anda dapat mengaktifkan atau menonaktifkan modul kapan pun Anda mau.
- Setelah modul diaktifkan, boleh jadi modul tersebut memerlukan pengaturan lebih lanjut (klik ikon pengaturan yang muncul di sebelah kanan baris modul jika modul memang membutuhkan pengaturan).

## Display

<img src="https://wiki.dolibarr.org/images/thumb/5/54/Display_settings_EN.png/300px-Display_settings_EN.png">

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
Anda juga dapat mempersonalisasi warna skin, dan visual di pengaturan ini

'Miscellanous'

- Di bagian ini, Anda memiliki semua nilai default fitur seperti, fungsi javascript, panjang list, hari pertama dalam seminggu, dll.
Anda juga dapat meletakkan fitur "Message of the Day" yang akan ditampilkan untuk semua pengguna.

'Login Page'

- Di bagian ini, Anda dapat menyesuaikan halaman login termasuk pesan login dan gambar latar belakang.

## Menus

<img src="https://wiki.dolibarr.org/images/thumb/1/1b/Menu_Setup.png/300px-Menu_Setup.png">

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

## Users

- Langkah terakhir adalah membuat dan menetapkan izin pengguna. Hampir semua modul yang diaktifkan sebelumnya, tidak dapat diakses jika Anda tidak memberikan izin. Untuk melakukan ini, Anda dapat pergi ke menu Home -> Users & Groups untuk menentukan pengguna dan hak mereka. 
- Perhatian, Anda harus mempertimbangkan untuk memeriksa dan mengatur ulang hak pengguna saat Anda mengaktifkan modul baru. Daftar hak yang tersedia bergantung pada modul yang diaktifkan. 
- Direkomendasikan untuk mengonfigurasi izin setelah mengaktifkan modul yang ingin Anda gunakan. Untuk tindakan tertentu, jika Anda tidak memiliki hak untuk melakukan suatu tindakan, Dolibarr tidak akan menampilkan tindakan tersebut kepada Anda. Anda mungkin melewatkan beberapa fitur yang berguna atau penting. 
- Untuk memberikan hak kepada pengguna atau diri Anda sendiri, jika Anda adalah administrator, buka Home -> Users & Groups, pilih pengguna yang diinginkan, lalu klik tab 'Permission'.

- Anda dapat menghindari langkah-langkah konfigurasi ini untuk setiap pengguna yang baru dibuat, dengan mengkonfigurasi hak default (memberi hak secara otomatis setiap kali pengguna baru dibuat) dengan mengkonfigurasi izin default pada menu Advanced > Setup Security.

# Maintenance

# Otomatisasi

# Cara Pemakaian

# Pembahasan

# Referensi
[About Dolibarr](https://www.dolibarr.org/) - Dolibarr

[`^ kembali ke atas ^`](#)

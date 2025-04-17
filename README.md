# Odoo Docker Compose

Docker compose untuk odoo dengan postgresql sebagai databasenya.

## Cara Penggunaan

1. Clone repository ini
2. Buat file `.env` dengan mengcopy dari `.env.example` dan isi dengan konfigurasi yang diinginkan
3. Jalankan `docker-compose up -d` untuk menjalankan container
4. Buka browser dan akses `http://localhost:8069`

## Konfigurasi

Konfigurasi odoo dan postgresql dapat diubah di file `.env`. Berikut adalah contoh konfigurasi yang tersedia:

* `HOST`: host yang digunakan untuk akses odoo
* `USER`: username yang digunakan untuk akses odoo
* `PASSWORD`: password yang digunakan untuk akses odoo
* `POSTGRES_DB`: nama database postgresql yang digunakan oleh odoo
* `POSTGRES_PASSWORD`: password yang digunakan untuk akses postgresql
* `POSTGRES_USER`: username yang digunakan untuk akses postgresql
* `PGDATA`: lokasi data postgresql

## Lisensi

Docker compose ini dibuat oleh [Ady Shaputra](https://github.com/adysaputra) dan berlisensi [MIT License](https://github.com/adysaputra/odoo-docker-compose/blob/master/LICENSE)

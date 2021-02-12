# (Motorbike) Repair Shop

This project is intended for deeper learning in computerizing manual work in a motorbike repair shop.

## What is our case study?

...

Previews:

- Login

  ![Login](/repair-shop/screenshots/login.png)

- Dashboard

  ![Dashboard](/repair-shop/screenshots/dashboard.png)

- Customer registration

  ![Transaction details](/repair-shop/screenshots/transaction-details0.png)

- Transaction details

  ![Transaction details](/repair-shop/screenshots/transaction-details2.png)

  ![Transaction details](/repair-shop/screenshots/transaction-details4.png)

<!-- Features:

- TODO: Transaction cancellation
- TODO: Backup old records
- TODO: Super admin role
- TODO: Secure user password field
- TODO: Transaction discount
- TODO: Oil change notification (every 2 months or 2.000 km)
- TODO: Send receipt to customers' email
- TODO: Trade-ins spare parts -->

References:

- [Aplikasi Pengolahan Data Transaksi Bengkel Motor Dengan Menerapkan Protokol Two Phase Locking](https://repository.usd.ac.id/9270/2/105314092_full.pdf)
- [Harga Jasa Service Motor Honda Bengkes Ahass](https://www.anisanagamasmotor.com/p/daftar-harga-jasa-service-motor-honda.html)
- [Struktur Organisasi Bengkel](https://ahassmotor.wordpress.com/2010/12/23/struktur-organisasi/)

## How to run the app?

Using `docker`, we need an internet connection to setup this demo. **To setup and run**, simply execute the commands below within your terminal:

```bash
docker-compose build app

# For the first run, it's recommended to
# run `docker-compose up` instead
docker-compose up -d
```

Please wait until the application is ready, eg. by checking the output of `docker-compose logs`, for the database may take some time to initialise. Then, install all the required packages:

```bash
docker-compose exec app composer install
```

Afterwards, **you can access** the application using your favorite browser at:

```text
http://localhost:8000
```

**To testing purposes**, you can import our testing data:

```bash
docker-compose exec db bash
mysql -unoname -pnopassword bengkel_motor < /test/dump_db1.sql
mysql -unoname -pnopassword bengkel_motor < /test/dump_db2.sql
exit
```

**To stop/remove**, just run:

```bash
# To stop
docker-compose stop

# To remove
docker-compose down
docker rmi $(docker images --format '{{.Repository}}:{{.Tag}}' | grep 'repair-shop')
```

## What technology stack is used?

The application has built using:

- CodeIgniter version 4.0.4
- PHP version 7.4.14
- MySQL version 8.0.23
- Nginx version 1.19

and has been successfully deployed locally on:

- Fedora 33 Workstation
- Linux kernel 5.10.10-200.fc33.x86_64
- Docker version 19.03.13 build 4484c46
- Docker Compose version 1.27.4

## Developer notes

This application uses the Indonesian language as it was first developed using local case studies.

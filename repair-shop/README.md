# (Motorbike) Repair Shop

This project is intended for deeper learning in computerizing manual work in a motorbike repair shop.

## What is our case study?

...

Previews:

- Dashboard

  ![Dashboard](/repair-shop/screenshots/dashboard.png)

- Transaction details

  ![Transaction details](/repair-shop/screenshots/transaction-details.png)

Features:

- TODO: Transaction discount
- TODO: Oil change notification (every 2 months or 2.000 km)
- TODO: Send receipt to customers' email
- TODO: Trade-ins spare parts

References:

- [APLIKASI PENGOLAHAN DATA TRANSAKSI BENGKEL MOTOR DENGAN MENERAPKAN PROTOKOL TWO PHASE LOCKING](https://repository.usd.ac.id/9270/2/105314092_full.pdf)
- [HARGA JASA SERVICE MOTOR HONDA BENGKES AHASS](https://www.anisanagamasmotor.com/p/daftar-harga-jasa-service-motor-honda.html)

## How to run the app?

Using `docker`, we need an internet connection to setup this demo. **To setup and run**, simply execute the commands below within your terminal:

```bash
docker-compose build app
docker-compose up -d
```

Please wait until the application is ready and then do not forget to install all the required packages:

```bash
docker-compose exec app composer install
```

Afterwards, **you can access** the application using your favorite browser at:

```text
http://localhost:8000
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

- This application uses the Indonesian language as it was first developed using local case studies.
- The `kata_sandi` (aka `passwod`) column in `pengguna` (aka `users`) table in the database is not hashed for convenience only.
  - To login as admin, please use `A001` for the ID and `admin01` for the password.
  - To login as cashier, please use `K001` for the ID and `kasir01` for the password.

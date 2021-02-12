<?php namespace App\Models;

use CodeIgniter\Model;

class Transactions extends Model
{
    protected $table = 'transaksi';

    protected $primaryKey = 'kode_transaksi';

    protected $allowedFields = ['kode_kasir',
                                'kode_pelanggan',
                                'status',
                                'tgl_keluar'];

    public function getTransactions(int $transactionId = null)
    {
        if (!$transactionId)
        {
            // Assume that the user is an `admin`
            // TODO: add `tipe_transaksi` column
            // TODO: apply column filter
            return $this->findAll();
        }

        return $this->where('kode_transaksi', $transactionId)
                    ->get()->getRowArray();
    }

    public function getReparations(string $employeeId)
    {
        return $this->query("
            SELECT
                C.kode_transaksi,
                tgl_masuk,
                tgl_keluar,
                status,
                no_polisi,
                keluhan,
                (harga_total_suku_cadang + IFNULL(harga_total_jasa, 0)) AS harga_total
            FROM (
                SELECT
                    A.*,
                    IFNULL(harga_total_suku_cadang, 0) AS harga_total_suku_cadang
                FROM (
                    SELECT
                        transaksi.kode_transaksi,
                        tgl_masuk,
                        tgl_keluar,
                        status,
                        no_polisi,
                        keluhan
                    FROM
                        transaksi,
                        pengguna,
                        pelanggan
                    WHERE
                        tgl_keluar >= ? AND
                        transaksi.kode_pelanggan <> 1 AND
                        transaksi.kode_pelanggan = pelanggan.kode_pelanggan AND
                        transaksi.kode_kasir = pengguna.kode_pengguna AND
                        no_pegawai = ?) AS A
                LEFT JOIN (
                    SELECT
                        transaksi.kode_transaksi,
                        SUM(harga_total) AS harga_total_suku_cadang
                    FROM
                        transaksi,
                        transaksi_suku_cadang,
                        suku_cadang
                    WHERE
                        transaksi.kode_transaksi = transaksi_suku_cadang.kode_transaksi AND
                        transaksi_suku_cadang.kode_suku_cadang = suku_cadang.kode_suku_cadang
                    GROUP BY
                        transaksi.kode_transaksi) AS B
                ON
                    A.kode_transaksi = B.kode_transaksi) AS C
            LEFT JOIN (
                SELECT
                    transaksi.kode_transaksi,
                    SUM(ongkos) AS harga_total_jasa
                FROM
                    transaksi,
                    transaksi_jasa
                WHERE
                    transaksi.kode_transaksi = transaksi_jasa.kode_transaksi
                GROUP BY
                    transaksi.kode_transaksi) AS D
            ON
                C.kode_transaksi = D.kode_transaksi;
            ", [date('Y-m-d'), $employeeId]
        )->getResultArray();
    }

    public function getSales(string $employeeId)
    {
        return $this->query("
            SELECT
                A.*,
                B.harga_total,
                B.daftar_suku_cadang
            FROM (
                SELECT
                    transaksi.kode_transaksi,
                    tgl_masuk,
                    tgl_keluar,
                    status
                FROM
                    transaksi,
                    pengguna
                WHERE
                    tgl_keluar >= ? AND
                    transaksi.kode_pelanggan = 1 AND
                    transaksi.kode_kasir = pengguna.kode_pengguna AND
                    no_pegawai = ?) AS A
            LEFT JOIN (
                SELECT
                    transaksi.kode_transaksi,
                    SUM(harga_total) AS harga_total,
                    GROUP_CONCAT(nama_suku_cadang SEPARATOR ', ') AS daftar_suku_cadang
                FROM
                    transaksi,
                    transaksi_suku_cadang,
                    suku_cadang
                WHERE
                    transaksi.kode_transaksi = transaksi_suku_cadang.kode_transaksi AND
                    transaksi_suku_cadang.kode_suku_cadang = suku_cadang.kode_suku_cadang
                GROUP BY
                    transaksi.kode_transaksi) AS B
            ON
                A.kode_transaksi = B.kode_transaksi;
            ", [date('Y-m-d'), $employeeId]
        )->getResultArray();
    }

    public function initSale(int $userId)
    {
        $data = [
            'kode_kasir' => $userId
        ];
        $this->insert($data);

        return $this->select('kode_transaksi')
                    ->where('kode_kasir', $userId)
                    ->orderBy('kode_transaksi DESC')
                    ->get()->getRowArray();
    }

    public function initReparation(int $userId,
                                   int $customerId)
    {
        $data = [
            'kode_kasir' => $userId,
            'kode_pelanggan' => $customerId
        ];
        $this->insert($data);

        return $this->select('kode_transaksi')
                    ->where('kode_kasir', $userId)
                    ->orderBy('kode_transaksi DESC')
                    ->get()->getRowArray();
    }

    public function closeTransaction(int $transactionId)
    {
        $data = [
            'status' => 'selesai',
            'tgl_keluar' => date('Y-m-d H:i:s')
        ];
        $this->update($transactionId, $data);

        return $this->where('kode_transaksi', $transactionId)
                    ->get()->getRowArray();
    }
}

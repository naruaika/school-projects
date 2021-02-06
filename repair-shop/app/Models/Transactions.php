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

    public function getReparations(string $employeeId = null,
                                   string $status = 'sedang')
    {
        if (!$employeeId)
        {
            // Assume that the user is an `admin`
            // TODO: add pagination function
            // TODO: apply column filter
            return $this->findAll();
        }

        // TODO: return total cost
        return $this->select('kode_transaksi,
                              no_polisi,
                              nama_pelanggan,
                              kontak,
                              alamat,
                              no_rangka,
                              no_mesin,
                              tgl_masuk,
                              tgl_keluar,
                              status')
                    ->from('pelanggan, pengguna')
                    ->where('status', $this->escapeString($status))
                    ->where('transaksi.kode_pelanggan = pelanggan.kode_pelanggan')
                    ->where('transaksi.kode_kasir = pengguna.kode_pengguna')
                    ->where('transaksi.kode_pelanggan <> 1')
                    ->where('no_pegawai', $this->escapeString($employeeId))
                    ->orderBy('kode_transaksi DESC')
                    ->get()->getResultArray();


    }

    public function getSales(string $employeeId = null,
                             string $status = 'sedang')
    {
        if (!$employeeId)
        {
            // Assume that the user is an `admin`
            // TODO: add pagination function
            // TODO: apply column filter
            return $this->findAll();
        }

        return $this->query("
            SELECT
                transaksi.kode_transaksi,
                tgl_masuk,
                tgl_keluar,
                status,
                SUM(harga_total) AS harga_total,
                GROUP_CONCAT(nama_suku_cadang SEPARATOR ', ') AS daftar_suku_cadang
            FROM
                transaksi,
                pengguna,
                transaksi_suku_cadang,
                suku_cadang
            WHERE (
                    status = ? OR
                    tgl_keluar >= ?) AND
                transaksi.kode_pelanggan = 1 AND
                transaksi.kode_transaksi = transaksi_suku_cadang.kode_transaksi AND
                transaksi.kode_kasir = pengguna.kode_pengguna AND
                transaksi_suku_cadang.kode_suku_cadang = suku_cadang.kode_suku_cadang AND
                no_pegawai = ?
            GROUP BY
                transaksi.kode_transaksi;
            ", [$status, date('Y-m-d'), $employeeId]
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

<?php namespace App\Models;

use CodeIgniter\Model;

class RepairTransactions extends Model
{
    protected $table = 'transaksi_jasa';

    protected $allowedFields = ['kode_transaksi', 'kode_jasa', 'kode_mekanik', 'ongkos'];

    public function getItems(int $transactionId,
                             int $serviceId = null)
    {
        $this->select('deskripsi_jasa,
                       ongkos,
                       nama_mekanik')
             ->from('jasa, mekanik')
             ->where('transaksi_jasa.kode_jasa = jasa.kode_jasa')
             ->where('transaksi_jasa.kode_mekanik = mekanik.kode_mekanik')
             ->where('kode_transaksi', $transactionId);

        if (!$serviceId)
        {
            return $this->get()->getResultArray();
        }

        return $this->where('jasa.kode_jasa', $serviceId)
                    ->get()->getRowArray();
    }

    public function addService(int $transactionId,
                               int $serviceId,
                               int $mechanicId,
                               int $price)
    {
        $data = [
            'kode_transaksi' => $transactionId,
            'kode_jasa' => $serviceId,
            'kode_mekanik' => $mechanicId,
            'ongkos' => $price
        ];
        $this->insert($data);

        return $this->select('kode_transaksi_jasa')
                    ->where('kode_transaksi', $transactionId)
                    ->orderBy('kode_transaksi_jasa DESC')
                    ->get()->getRowArray();
    }
}

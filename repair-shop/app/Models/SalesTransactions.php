<?php namespace App\Models;

use CodeIgniter\Model;

class SalesTransactions extends Model
{
    protected $table = 'transaksi_suku_cadang';

    protected $allowedFields = ['qty', 'harga_total'];

    public function getItems(int $transactionId,
                             int $sparePartId = null)
    {
        $this->select('nomor_suku_cadang,
                       nama_suku_cadang,
                       het,
                       qty,
                       harga_total')
             ->from('suku_cadang')
             ->where('transaksi_suku_cadang.kode_suku_cadang = suku_cadang.kode_suku_cadang')
             ->where('kode_transaksi', $transactionId);

        if (!$sparePartId)
        {
            return $this->get()->getResultArray();
        }

        return $this->where('suku_cadang.kode_suku_cadang', $sparePartId)
                    ->get()->getRowArray();
    }

    public function addItem(int $transactionId,
                            int $sparePartId,
                            int $qty,
                            int $het)
    {
        $data = [
            'kode_transaksi' => $transactionId,
            'kode_suku_cadang' => $sparePartId,
            'qty' => $qty,
            'harga_total' => $qty * $het
        ];
        $this->replace($data);

        return $this->select('kode_transaksi_suku_cadang')
                    ->orderBy('kode_transaksi_suku_cadang DESC')
                    ->get()->getRowArray();
    }
}

<?php namespace App\Models;

use CodeIgniter\Model;

class Parts extends Model
{
    protected $table = 'suku_cadang';

    protected $primaryKey = 'kode_suku_cadang';

    protected $allowedFields = ['stok'];

    public function getSparePart(int $sparePartId)
    {
        return $this->where('kode_suku_cadang', $sparePartId)
                    ->get()->getRowArray();
    }

    public function findSpareParts(string $query,
                                   string $context = 'nama_suku_cadang',
                                   string $match = 'both',
                                   int $limit = 10)
    {
        return $this->like($this->escapeString($context),
                           $this->escapeLikeString($query),
                           $this->escapeString($match))
                    ->limit($limit)
                    ->get()->getResultArray();
    }

    public function updateStock(int $sparePartId,
                                int $takenQty = 0)
    {
        $currentStock = $this->select('stok')
                             ->where('kode_suku_cadang', $sparePartId)
                             ->get()->getRowArray()['stok'];
        $newStock = $currentStock - $takenQty;

        $data = [
            'stok' => $newStock
        ];
        $this->update($sparePartId, $data);
    }

}

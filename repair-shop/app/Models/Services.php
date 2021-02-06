<?php namespace App\Models;

use CodeIgniter\Model;

class Services extends Model
{
    protected $table = 'jasa';

    public function findServices(string $query,
                                 int $limit = 6)
    {
        return $this->like($this->escapeString('deskripsi_jasa'),
                           $this->escapeLikeString($query))
                    ->limit($limit)
                    ->get()->getResultArray();
    }

}

<?php namespace App\Controllers;

use CodeIgniter\API\ResponseTrait;
use App\Models\Parts;

class SpareParts extends BaseController
{
    use ResponseTrait;

    public function search()
    {
        if ($_GET && $this->validate([
                'query' => 'required|min_length[3]'
            ]))
		{
            $parts = new Parts();

            // TODO: handle all possible search cases
            $result = $parts->findSpareParts($_GET['query'], // query
                                             'nomor_suku_cadang', // context
                                             'after'); // match
            if ($result) {
                return $this->respond($result, 200);
            }

            $result = $parts->findSpareParts($_GET['query']);
            if ($result) {
                return $this->respond($result, 200);
            }

            return $this->respondNoContent('Suku cadang tidak ditemukan.');
        }

        return $this->respondNoContent('Kueri terlalu pendek.');
    }
}

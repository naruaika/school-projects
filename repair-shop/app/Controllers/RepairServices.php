<?php namespace App\Controllers;

use CodeIgniter\API\ResponseTrait;
use App\Models\Services;
use App\Models\Mechanics;

class RepairServices extends BaseController
{
    use ResponseTrait;

    public function search()
    {
        if ($_GET && $this->validate([
                'query' => 'required|min_length[3]'
            ]))
		{
            $services = new Services();

            // TODO: handle all possible search cases
            $result['services'] = $services->findServices($_GET['query']);
            if ($result['services']) {
                $mechanics = new Mechanics();
                $result['mechanics'] = $mechanics->getMechanics();

                return $this->respond($result, 200);
            }

            return $this->respondNoContent('Jasa servis tidak ditemukan.');
        }

        return $this->respondNoContent('Kueri terlalu pendek.');
    }
}

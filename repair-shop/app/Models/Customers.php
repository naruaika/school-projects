<?php namespace App\Models;

use CodeIgniter\Model;

class Customers extends Model
{
    protected $table = 'pelanggan';

    protected $allowedFields = ['nama_pelanggan',
                                'no_polisi',
                                'no_rangka',
                                'no_mesin',
                                'kontak',
                                'alamat',
                                'keluhan'];

    public function getCustomers(string $customerId)
    {
        if (!$customerId) {
            // Assume that the user is an `admin`
            return $this->findAll();
        }

        return $this->where('kode_pelanggan', $this->escapeString($customerId))
                    ->get()->getRowArray();
    }

    public function addCustomer(string $customerName,
                                string $policeNumber,
                                string $chassisNumber,
                                string $machineNumber,
                                string $contact,
                                string $address,
                                string $complaint)
    {
        // FIXME: escape the parameters
        $data = [
            'nama_pelanggan' => $customerName,
            'no_polisi' => $policeNumber,
            'no_rangka' => $machineNumber,
            'no_mesin' => $machineNumber,
            'kontak' => $contact,
            'alamat' => $address,
            'keluhan' => $complaint,
        ];
        $this->insert($data);

        return $this->select('kode_pelanggan')
                    ->where('no_polisi', $policeNumber)
                    ->orderBy('kode_pelanggan DESC')
                    ->get()->getRowArray();
    }

}

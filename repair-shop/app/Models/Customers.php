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

    public function addCustomer(string $customerName = null,
                                string $policeNumber,
                                string $chassisNumber = null,
                                string $machineNumber = null,
                                string $contact = null,
                                string $address = null,
                                string $complaint)
    {
        $data = [
            'nama_pelanggan' => $this->escapeString($customerName),
            'no_polisi' => $this->escapeString($policeNumber),
            'no_rangka' => $this->escapeString($machineNumber),
            'no_mesin' => $this->escapeString($machineNumber),
            'kontak' => $this->escapeString($contact),
            'alamat' => $this->escapeString($address),
            'keluhan' => $this->escapeString($complaint),
        ];
        $this->insert($data);

        return $this->select('kode_pelanggan')
                    ->where('no_polisi', $policeNumber)
                    ->orderBy('kode_pelanggan DESC')
                    ->get()->getRowArray();
    }

}

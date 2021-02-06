<?php namespace App\Models;

use CodeIgniter\Model;

class Users extends Model
{
    protected $table = 'pengguna';

    public function getUsers(string $employeeId,
                             string $password)
    {
        if (!$employeeId && !$password) {
            // Assume that the user is an `admin`
            return $this->findAll();
        }

        return $this->where('no_pegawai', $this->escapeString($employeeId))
                    ->where('kata_sandi', $this->escapeString($password))
                    ->get()->getRowArray();
    }

    public function getUserId(string $employeeId)
    {
        return $this->select('kode_pengguna')
                    ->where('no_pegawai', $this->escapeString($employeeId))
                    ->get()->getRowArray()['kode_pengguna'];
    }

}

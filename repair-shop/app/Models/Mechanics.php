<?php namespace App\Models;

use CodeIgniter\Model;

class Mechanics extends Model
{
    protected $table = 'mekanik';

    public function getMechanics()
    {
        return $this->get()->getResultArray();
    }

}

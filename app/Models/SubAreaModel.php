<?php

namespace App\Models;

use CodeIgniter\Model;

class SubAreaModel extends Model
{
    protected $table      = 'subareas';
    protected $primaryKey = 'idSubArea';

    protected $useAutoIncrement = true;

    protected $returnType     = 'array';
    protected $useSoftDeletes = true;

    protected $allowedFields = ['descSubArea'];

    protected $useTimestamps = false;

    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation     = false;
}
?>
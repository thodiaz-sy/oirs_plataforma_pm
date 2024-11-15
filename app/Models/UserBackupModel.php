<?php

namespace App\Models;

use CodeIgniter\Model;

class UserBackupModel extends Model
{
    protected $table      = 'users_backups';
    protected $primaryKey = 'id';

    protected $useAutoIncrement = true;

    protected $returnType     = 'array';
    protected $useSoftDeletes = false;

    protected $allowedFields = ['user_id','user_bkp'];

    protected $useTimestamps = false;

    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation     = false;
}
?>
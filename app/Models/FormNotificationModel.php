<?php

namespace App\Models;

use CodeIgniter\Model;

class FormNotificationModel extends Model
{
    protected $table      = 'forms_notifications';
    protected $primaryKey = 'id';

    protected $useAutoIncrement = true;

    protected $returnType     = 'array';
    protected $useSoftDeletes = true;

    protected $allowedFields = ['form_id','user_id','notification','created_at','is_read','class','icon','deleted_at'];

    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $deletedField  = 'deleted_at';

    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation     = false;
}
?>
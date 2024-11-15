<?php

namespace App\Models;

use CodeIgniter\Model;

class StatusWorkflowModel extends Model
{
    protected $table      = 'status_workflow';
    protected $primaryKey = 'id';

    protected $useAutoIncrement = true;

    protected $returnType     = 'array';
    protected $useSoftDeletes = true;

    protected $allowedFields = ['status_current','status_next','assign_profile_id','status_rejection','assign_area','deleted_at','flow_type'];

    protected $useTimestamps = false;
    protected $deletedField  = 'deleted_at';

    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation     = false;
}
?>
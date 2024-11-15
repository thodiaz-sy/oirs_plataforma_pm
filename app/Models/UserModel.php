<?php

namespace App\Models;

use CodeIgniter\Model;

class UserModel extends Model
{
    protected $table      = 'users';
    protected $primaryKey = 'id';

    protected $useAutoIncrement = true;

    protected $returnType     = 'array';
    protected $useSoftDeletes = true;

    protected $allowedFields = ['name','lastname','email','username',
    'password','profile_id','login_at','logout_at','blocked_at',
    'blocked_attempts','created','updated_at', 'deleted_at',
    'updated_password','token_forgot_password', 'token_forgot_password_expiration',
    'assignment_process', 'signature', 'branch_id', 'area_id','contrasena'];

    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';

    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation     = false;
}
?>
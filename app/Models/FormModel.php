<?php

namespace App\Models;

use CodeIgniter\Model;

class FormModel extends Model
{
    protected $table      = 'forms';
    protected $primaryKey = 'id';

    protected $useAutoIncrement = true;

    protected $returnType     = 'array';
    protected $useSoftDeletes = false;

    protected $allowedFields = ['invoice_channel', 'invoice','form_type_id', 'intern_invoice',
                                'pacient_names','pacient_social_name','pacient_lastname','pacient_mlastname','pacient_rut','pacient_gender_id','pacient_phone','pacient_address','pacient_region_id','pacient_district_id','pacient_email',
                                'attention_date', 'attention_place', 'form_branch_id', 'is_pacient',
                                'claimant_names','claimant_social_name','claimant_lastname','claimant_mlastname','claimant_rut','claimant_gender_id','claimant_phone','claimant_address','claimant_region_id','claimant_district_id','claimant_email',
                                'form_sign', 'form_subarea_id', 'form_area_id', 'form_channel_id', 'form_resume', 'form_solution', 'form_comments', 'form_subject_claim', 'form_ot', 'form_date_received', 'form_management', 'form_improve','form_channel_entry_id', 'form_is_priority',
                                'status_id','user_current','user_entry','user_manager','user_director', 'form_date_entry_assign', 'form_date_entry', 'form_date_manager_assign','form_date_manager', 'form_date_director_assign', 'form_date_director', 'form_date_closed',
                                'created_at', 'updated_at', 'deleted_at','profile_current'];

    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation     = false;
}
?>
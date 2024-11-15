<?php
namespace App\Libraries;

use App\Libraries\Classes\Response;
use App\Models\TypeModel;
use App\Models\StatusModel;
use App\Models\FormModel;
use App\Models\FormDocModel;
use App\Models\FormHistoryModel;
use App\Models\BranchModel;
use App\Models\AreaModel;
use App\Models\SubAreaModel;
use App\Models\ChannelModel;
use App\Models\ChannelEntryModel;
use App\Models\GenderModel;
use App\Models\DistrictModel;
use App\Models\RegionModel;
use App\Models\StatusWorkflowModel;
use App\Models\UserModel;
use App\Models\FormNotificationModel;
use Dompdf\Dompdf;
use Dompdf\Options;
use CodeIgniter\I18n\Time;

class InboxLibrary
{
    public function getTypes()
    {   
        $response = new Response();
        $db = null;
        try {
            //Obtiene tipos de formulario
            $db = db_connect();
            $objModel = new TypeModel($db);
            $list = $objModel->orderBy('order_by', 'asc')->findAll();
            //Prepara respuesta
            $response->error = false;
            $response->values = $list;
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }

    public function getStatusFilter()
    {   
        $response = new Response();
        $db = null;
        try {
            //Obtiene usuario de la sesion
            $session = \Config\Services::session();
            $user = $session->get('user');
            if(isset($user) && isset($user->profile_id)){
                // $user->profile_id == 5 ? $usuario = 3 : $usuario = $user->profile_id;
                $page_id = 3;
                //Obtiene estados de formulario
                $db = db_connect();
                //Obtiene estados
                $builder = $db->table('pages_actions');
                $builder->select("pages_actions.status_id as id, status.status");
                $builder->join('status', 'status.id = pages_actions.status_id');
                $builder->where('pages_actions.page_id', $page_id);
                $builder->where('pages_actions.profile_id', $user->profile_id);
                //Prepara respuesta
                $response->error = false;
                $response->values = $builder->get()->getResultArray();
                
            }
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }

    public function getPermissionPage()
    {   
        $response = new Response();
        $db = null;
        $detail = "";
        try {
            //Obtiene usuario de la sesion
            $session = \Config\Services::session();
            $user = $session->get('user');
            if(isset($user) && isset($user->profile_id)){   
                $page_id = 3;
                //Obtiene acciones de formulario
                $db = db_connect();
                //Obtiene acciones
                $builder = $db->table('pages_actions');
                $builder->select("pages_actions.actions");
                $builder->where('pages_actions.page_id', $page_id);
                $builder->where('pages_actions.profile_id', $user->profile_id);
                $builder->orderby('pages_actions.actions', 'asc');
                $actions = $builder->get()->getResultArray();
                $joinActions = [];
                if($actions && count($actions) > 0){
                    foreach($actions as $action){ 
                        $tmpAction = explode(',',$action["actions"]);
						$joinActions = array_merge($joinActions,$tmpAction);
					}
                    // $joinActions = ltrim($joinActions, ',');
                }
                
                //Obtiene detalle de acciones
                $builder = $db->table('actions');
                $builder->select("actions.action, actions.icon, actions.class, actions.description, actions.href, actions.data");
                // $builder->where('actions.action IN ('.$joinActions.')');
                $builder->whereIn('actions.action',$joinActions);
                $detail =  $builder->get()->getResultArray();
                //Guarda permisos en sesión
                $session = \Config\Services::session();
                $user = $session->get('user');
                $user->permission = $detail;
                $session->set('user',$user);
                //Prepara respuesta
                $response->error = false;
                $response->values = $detail;
            }
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }

    public function getPermissionPageStatus($status)
    {   
        $response = new Response();
        $db = null;
        $detail = "";
        try {
            //Obtiene usuario de la sesion
            $session = \Config\Services::session();
            $user = $session->get('user');
            if(isset($user) && isset($user->profile_id)){   
                $page_id = 3;
                //Obtiene acciones de formulario
                $db = db_connect();
                //Obtiene acciones
                $builder = $db->table('pages_actions');
                $builder->select("pages_actions.actions");
                $builder->where('pages_actions.page_id', $page_id);
                $builder->where('pages_actions.status_id', $status);                
                $builder->where('pages_actions.profile_id', $user->profile_id);
                $actions = $builder->get()->getResultArray();
                $joinActions = [];
                if($actions && count($actions) > 0){
                    foreach($actions as $action){ 
                        $tmpAction = explode(',',$action["actions"]);
						$joinActions = array_merge($joinActions,$tmpAction);
					}
                    // $joinActions = ltrim($joinActions, ',');
                }
                
                //Obtiene detalle de acciones
                $builder = $db->table('actions');
                $builder->select("actions.action, actions.icon, actions.class, actions.description, actions.href, actions.data");
                // $builder->where('actions.action IN ('.$joinActions.')');
                $builder->whereIn('actions.action',$joinActions);
                $detail =  $builder->get()->getResultArray();
                //Guarda permisos en sesión
                $session = \Config\Services::session();
                $user = $session->get('user');
                $user->permission = $detail;
                $session->set('user',$user);
                //Prepara respuesta
                $response->error = false;
                $response->values = $detail;
            }
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }

    public function getForms($status, $invoice, $rut, $date_init, $date_end,  $type, $filter)
    {   
        $response = new Response();
        $db = null;
        $total = 0;
        try {
            //Conecta BD
            $db = db_connect();
            //Cuenta total formularios por estado
            $formModel = new FormModel($db);
            // $status_in = explode(',',$status);
            $total = $formModel->where('status_id', $status)->where('deleted_at', null)->countAllResults();
            //Obtiene usuario de la sesion
            $session = \Config\Services::session();
            $user = $session->get('user');
            $forms = [];     
            //Select general
            $applyFilter = false;
            if(isset($user) && isset($user->profile_id)){            			
                $builder = $db->table('forms');
                $page_id = 3;
                $permissionQuery = "(SELECT pages_actions.actions FROM pages_actions WHERE pages_actions.page_id=".$page_id." AND pages_actions.profile_id=".$user->profile_id." AND pages_actions.status_id = forms.status_id AND pages_actions.deleted_at is null)";
                $builder->select("forms.id, branchs.branch, types.type, areas.area, forms.form_type_id, forms.status_id, forms.invoice, forms.pacient_names + ' ' + forms.pacient_lastname + ' ' + forms.pacient_mlastname name, forms.pacient_rut, FORMAT(forms.form_date_received,'dd/MM/yyyy HH:mm:ss') form_date_received, ISNULL(FORMAT(forms.form_date_entry,'dd/MM/yyyy HH:mm:ss'),'Sin información') form_date_entry, status.status + CASE WHEN forms.user_current <> ".$user->id." THEN '' ELSE '' END status, ".$permissionQuery." as permissions");
                $builder->join('status', 'status.id = forms.status_id');
                $builder->join('types', 'types.id = forms.form_type_id');
                $builder->join('areas', 'areas.id = forms.form_area_id');
                $builder->join('branchs', 'branchs.id = forms.form_branch_id');
                $builder->where('status.id', $status); //Filtra por la vista
                $builder->where('forms.deleted_at', null); //Filtra por formularios eliminados  
                $applyFilter = true;              
                //Verifica si es admin o lector, si no filtra formularios por ingreso
                if($user->profile_id != 1 && $user->profile_id != 2 && $user->profile_id != 5){

                    $applyFilter = true;
                    
                    if(isset($user->branch_id) && $user->branch_id != 0){ 
                        $builder->where('forms.form_branch_id', $user->branch_id);
                    }
                    
                    if(isset($user->area_id) && $user->area_id != 0){ 
                        $builder->where('forms.form_area_id', $user->area_id);
                    }

                    $where = '(';
                    if($user->profile_id == 5 || $user->profile_id == 6){ // Director y Subrogante
                        $where = $where.'forms.profile_current = 5';
                    }
                    else{
                        $where = $where.'forms.profile_current = '.$user->profile_id;
                    }
                    $where = $where." OR forms.user_entry=".$user->id." OR forms.user_manager=".$user->id." OR forms.user_director=".$user->id." )";
                    $builder->where($where);
                    
                }else{
                    //Filtra por sucursal si usuario está asociado
                    if(isset($user->branch_id) && $user->branch_id != 0){ 
                        $applyFilter = true;
                        $builder->where('forms.form_branch_id', $user->branch_id);
                    }
                }
                //Filtros                
                if($invoice != null && strlen($invoice) > 0){
                    $applyFilter = true;
                    $builder->like('forms.invoice', $invoice);
                }
                if($rut != null && strlen($rut) > 0){
                    $applyFilter = true;
                    $where = "(forms.pacient_rut LIKE '%".$rut."%' OR forms.claimant_rut LIKE '%".$rut."%')";
                    $builder->where($where);
                }
                if($date_init != null && strlen($date_init) > 0 && $date_end != null && strlen($date_end) > 0){
                    $applyFilter = true;
                    $where = "(forms.form_date_received BETWEEN '".$date_init."' AND '".$date_end."' OR forms.form_date_entry BETWEEN '".$date_init."' AND '".$date_end."' OR forms.form_date_manager BETWEEN '".$date_init."' AND '".$date_end."' OR forms.form_date_director BETWEEN '".$date_init."' AND '".$date_end."')";
                    $builder->where($where);
                }
                if($type != null && strlen($type) > 0){
                    $applyFilter = true;
                    $builder->where('forms.form_type_id', $type);
                }
                //Ordena por columna seleccionada
                switch ($filter->column) {
                    case 0:
                        $builder->orderBy('forms.invoice', $filter->direction);
                        break;
                    case 1:
                        $builder->orderBy('forms.pacient_name', $filter->direction);
                        break;
                    case 2:
                        $builder->orderBy('forms.pacient_rut', $filter->direction);
                        break;
                    case 3:
                        $builder->orderBy('forms.form_date_received', $filter->direction);
                        break;
                    case 4:
                        $builder->orderBy('forms.form_date_entry', $filter->direction); 
                        break;
                    case 5:
                        $builder->orderBy('type.type', $filter->direction);
                        break;
                }
                //Paginación
                $forms = $builder->get($filter->length, $filter->start)->getResultArray();
                // $forms = $builder->getCompiledSelect();  
            }          
            //Prepara respuesta
            $response->error = false;
            $response->values = array($total,$forms,$applyFilter);            
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = array(0,null);
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }

    //#region Read

    public function getFormID($invoice)
    {   
        $response = new Response();
        $db = null;
        try {
            //Obtiene usuario de la sesion
            $session = \Config\Services::session();
            $user = $session->get('user');
            if(isset($user) && isset($user->profile_id)){   
                $page_id = 3;
                //Obtiene estados de formulario
                $db = db_connect();
                //Obtiene estados
                $builder = $db->table('forms');
                $builder->select("forms.id, forms.invoice, forms.intern_invoice, forms.status_id, status.status, forms.form_type_id, types.type, forms.pacient_names, forms.pacient_social_name, forms.pacient_lastname, forms.pacient_mlastname, forms.pacient_rut, forms.pacient_gender_id, g_pacient.gender pacient_gender, forms.pacient_phone, forms.pacient_address, forms.pacient_region_id, r_pacient.region as pacient_region, forms.pacient_district_id, d_pacient.district as pacient_district, forms.pacient_email");
                $builder->select(", FORMAT(forms.attention_date,'dd/MM/yyyy') attention_date, FORMAT(forms.created_at,'dd/MM/yyyy') created_at, forms.attention_place, forms.is_pacient, forms.form_sign, forms.form_branch_id, branchs.branch, forms.form_area_id, areas.area,forms.form_subarea_id, subareas.descSubArea, forms.form_channel_id, channels.channel, forms.form_resume, forms.form_solution, forms.form_comments ");
                $builder->select(", forms.claimant_names, forms.claimant_social_name, forms.claimant_lastname, forms.claimant_mlastname, forms.claimant_phone, forms.claimant_address, forms.claimant_rut, forms.claimant_gender_id, g_claimant.gender claimant_gender, forms.claimant_region_id, r_claimant.region as claimant_region, forms.claimant_district_id, d_claimant.district as claimant_district, forms.claimant_email");
                $builder->select(", channels_entry.entry_channel, forms.form_resume, forms.form_solution, forms.form_subject_claim, forms.form_ot, FORMAT(forms.form_date_received,'dd/MM/yyyy') form_date_received, forms.form_management, forms.form_improve, forms.form_channel_entry_id, forms.form_is_priority");
                $builder->join('status', 'status.id = forms.status_id');
                $builder->join('types', 'types.id = forms.form_type_id');
                $builder->join('genders as g_pacient', 'g_pacient.id = forms.pacient_gender_id', 'left');
                $builder->join('genders as g_claimant', 'g_claimant.id = forms.claimant_gender_id', 'left');
                $builder->join('regions as r_pacient', 'r_pacient.id = forms.pacient_region_id', 'left');
                $builder->join('districts as d_pacient', 'd_pacient.id = forms.pacient_district_id', 'left');
                $builder->join('regions as r_claimant', 'r_claimant.id = forms.claimant_region_id', 'left');
                $builder->join('districts as d_claimant', 'd_claimant.id = forms.claimant_district_id', 'left');
                $builder->join('branchs', 'branchs.id = forms.form_branch_id');
                $builder->join('areas', 'areas.id = forms.form_area_id');
                $builder->join('subareas', 'subareas.idSubArea = forms.form_subarea_id');
                $builder->join('channels', 'channels.id = forms.form_channel_id');
                $builder->join('channels_entry', 'channels_entry.id = forms.form_channel_entry_id');
                $builder->where('forms.invoice', $invoice);
                $form = $builder->get()->getFirstRow();
                //$form = $builder->getCompiledSelect();  
                if(isset($form)){
                    //Obtiene permisos según usuario y estado
                    $page_id = 3;
                    $builder = $db->table('pages_actions');
                    $builder->select("pages_actions.actions");
                    $builder->where("pages_actions.page_id",$page_id);
                    $builder->where("pages_actions.profile_id",$user->profile_id);
                    $builder->where("pages_actions.status_id",$form->status_id);
                    $builder->where("pages_actions.deleted_at",null);
                    $permission = $builder->get()->getFirstRow();
                    // $permission = null;
                    //Obtiene b64 de firma si aplica.
                    if(strlen($form->form_sign) > 0){
                        $path = WRITEPATH .'uploads/sign_forms/'.$form->form_sign;
                        $type = pathinfo($path, PATHINFO_EXTENSION);
                        $data = file_get_contents($path);
                        $base64 = 'data:image/' . $type . ';base64,' . base64_encode($data);
                        $form->previewSign = $base64;  
                    }                  
                    //Prepara respuesta
                    $response->error = false;
                    $response->values = array($form, $permission);
                }else{
                    $response->error = true;
                    $response->values = null;
                    $response->message = 'No se encontraron datos del formulario';
                }
            }
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }

    public function getFormDocuments($form_id)
    {   
        $response = new Response();   
        $docs = null;     
        try {
            //Obtiene usuario de la sesion
            $session = \Config\Services::session();
            $user = $session->get('user');
            if(isset($user) && isset($user->profile_id)){         
                //Sube documento a BD
                $db = null;
                try {
                    //Conecta BD
                    $db = db_connect();
                    //Obtiene documentos 
                    $builder = $db->table("forms_documents");
                    $builder->select("forms_documents.id, forms_documents.doc_desc, forms_documents.original_name, forms_documents.path, forms_documents.upload_name, forms_documents.user_id, (CASE WHEN forms_documents.user_id = 0 THEN 'Sistema' ELSE ISNULL(users.name + ' ' + users.lastname, 'Usuario eliminado') END) as full_name, FORMAT(forms_documents.created_at,'dd/MM/yyyy HH:mm:ss') as created_at, (CASE WHEN ".$user->profile_id." = 1 THEN 1 ELSE 0 END) as is_admin, ".$user->id." as user_logged, forms_documents.system, forms_documents.type");
                    $builder->join('users', 'users.id = forms_documents.user_id', 'left');
                    $builder->where("forms_documents.form_id",$form_id);
                    $builder->where("forms_documents.deleted_at",null);
                    $docs = $builder->get()->getResultArray();               
                    //Prepara respuesta
                    $response->error = false;
                    $response->values = $docs; 
                    $response->message = ""; 
                } catch (\Exception $e) {
                    $response->error = true;
                    $response->values = null;
                    $response->message = $e;   
                }
                if($db != null){$db->close();}  
            }      
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        return $response;
    }
    
    public function uploadFormDocument($file, $form_id)
    {   
        $response = new Response();       
        try {
            //Obtiene usuario de la sesion
            $session = \Config\Services::session();
            $user = $session->get('user');
            if(isset($user) && isset($user->profile_id)){   
                // Obtiene nombre original
                $name = $file->getName();
                // Obtiene nombre aleatorio
                $newName = $file->getRandomName();
                $path = 'forms_docs';
                //Sube archivo
                $file->move(WRITEPATH . 'uploads/'.$path.'/', $newName);            
                //Sube documento a BD
                $db = null;
                try {
                    //Conecta BD
                    $db = db_connect();
                    //Prepara para insertar doc
                    $data = [
                        'form_id' => $form_id,
                        'user_id' => $user->id,
                        'doc_desc' => $name,
                        'original_name' => $name,
                        'upload_name' => $newName,
                        'path' => $path
                    ];                 
                    $db->query("set language 'us_english'");    
                    $formDocModel = new FormDocModel($db);   
                    $formDocModel->insert($data);                                  
                    //Prepara respuesta
                    $response->error = false;
                    $response->values = null;  
                } catch (\Exception $e) {
                    $response->error = true;
                    $response->values = $e;   
                }
                if($db != null){$db->close();}  
            }      
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        return $response;
    }

    public function saveFormDocument($doc_desc, $upload_name, $form_id, $path = '')
    {   
        $response = new Response();       
        try {
            //Obtiene usuario de la sesion
            $session = \Config\Services::session();
            $user = $session->get('user');
            if(isset($user) && isset($user->profile_id)){
                //Sube documento a BD
                $db = null;
                try {
                    //Conecta BD
                    $db = db_connect();
                    //Prepara para insertar doc
                    $data = [
                        'form_id' => $form_id,
                        'user_id' => $user->id,
                        'doc_desc' => $doc_desc,
                        'original_name' => $doc_desc,
                        'upload_name' => $upload_name,
                        'path' => $path
                    ];                 
                    $db->query("set language 'us_english'");    
                    $formDocModel = new FormDocModel($db);   
                    $formDocModel->insert($data); 
                    // $lib = new InboxLibrary();
                    // $lib->saveHistory($form_id, 'Ha cargado el documento: '.$doc_desc);
                    //Prepara respuesta
                    $response->error = false;
                    $response->values = null;  
                } catch (\Exception $e) {
                    $response->error = true;
                    $response->values = $e;   
                }
                if($db != null){$db->close();}  
            }      
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        return $response;
    }
    
    public function uploadFormDocumentTemp($file)
    {   
        $response = new Response();       
        try {
            //Obtiene usuario de la sesion
            $session = \Config\Services::session();
            $user = $session->get('user');
            if(isset($user) && isset($user->profile_id)){   
                // Obtiene nombre original
                $name = $file->getName();
                // Obtiene nombre aleatorio
                $newName = $file->getRandomName();
                $path = 'forms_docs';
                //Sube archivo
                $file->move(WRITEPATH . 'uploads/'.$path.'/', $newName);  
                try {
                    //Prepara para insertar doc
                    $data = [
                        'doc_desc' => $name,
                        'original_name' => $name,
                        'upload_name' => $newName,
                        'path' => $path
                    ];                                                  
                    //Prepara respuesta
                    $response->error = false;
                    $response->values = $data;  
                } catch (\Exception $e) {
                    $response->error = true;
                    $response->values = $e;   
                }
            }      
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        return $response;
    }

    public function deleteFormDocument($doc_id)
    {   
        $response = new Response();        
        try {
            //Elimina documento a BD
            $db = null;
            try {
                //Conecta BD
                $db = db_connect();   
                $formDocModel = new FormDocModel($db);   
                $formDocModel->delete($doc_id);
            } catch (\Exception $e) {
                $response->error = true;
                $response->values = $e;   
            }
            if($db != null){$db->close();}

            //Prepara respuesta
            $response->error = false;
            $response->values = null;          
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        return $response;
    }

    public function getFormHistory($form_id)
    {   
        $response = new Response();   
        $history = null;     
        try {
            //Obtiene usuario de la sesion
            $session = \Config\Services::session();
            $user = $session->get('user');
            if(isset($user) && isset($user->profile_id)){         
                //Sube documento a BD
                $db = null;
                try {
                    //Conecta BD
                    $db = db_connect();
                    //Obtiene historial
                    $builder = $db->table('forms_history');
                    $builder->select("forms_history.id, forms_history.user_id, (CASE WHEN forms_history.user_id = 0 THEN 'Sistema' ELSE ISNULL(users.name + ' ' + users.lastname, 'Usuario eliminado') END) as full_name, forms_history.message, FORMAT(forms_history.created_at,'dd/MM/yyyy HH:mm:ss') as created_at, (CASE WHEN ".$user->profile_id." = 1 THEN 1 ELSE 0 END) as is_admin, ".$user->id." as user_logged, forms_history.system");
                    $builder->join('users', 'users.id = forms_history.user_id', 'left');
                    $builder->where("forms_history.form_id",$form_id);
                    $builder->where("forms_history.deleted_at",null);
                    $history = $builder->get()->getResultArray();             
                    //Prepara respuesta
                    $response->error = false;
                    $response->values = $history; 
                    $response->message = ""; 
                } catch (\Exception $e) {
                    $response->error = true;
                    $response->values = null;
                    $response->message = $e;   
                }
                if($db != null){$db->close();}  
            }      
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        return $response;
    }

    public function saveHistory($form_id, $comment, $system = 0)
    {   
        $response = new Response();
        $db = null;
        try {
            //Obtiene usuario de la sesion
            $session = \Config\Services::session();
            $user = $session->get('user');
            $userID = isset($user) ? $user->id : 0;
            $db = db_connect();
           //Inserta bitacora
            $formHistoryModel = new FormHistoryModel($db);
            $data = [
                'form_id' => $form_id,
                'user_id' => $userID,
                'message' => $comment,
                'system' => $system
            ];            
            $db->query("set language 'us_english'");  
            $formHistoryModel->insert($data);     
            
            //Prepara respuesta
            $response->error = false;
            $response->values = null; 

        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }

    public function deleteHistory($form_id, $historyID)
    {   
        $response = new Response();
        $db = null;
        try {
            //Obtiene usuario de la sesion
            $session = \Config\Services::session();
            $user = $session->get('user');
            $userID = isset($user) ? $user->id : 0;
            $db = db_connect();
            //Elimina bitacora
            $formHistoryModel = new FormHistoryModel($db);                      
            $formHistoryModel->delete($historyID);     
            //Prepara respuesta
            $response->error = false;
            $response->values = null;  
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }

    //#endregion

    //#region Save

    public function getBranchs()
    {   
        $response = new Response();
        $db = null;
        try {
            //Obtiene sucursales
            $db = db_connect();
            $objModel = new BranchModel($db);
            $list = $objModel->orderBy('branch', 'asc')->findAll();
            //Prepara respuesta
            $response->error = false;
            $response->values = $list;
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }

    public function getAreas()
    {   
        $response = new Response();
        $db = null;
        try {
            //Obtiene areas
            $db = db_connect();
            $objModel = new AreaModel($db);
            $list = $objModel->orderBy('area', 'asc')->findAll();
            //Prepara respuesta
            $response->error = false;
            $response->values = $list;
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }

    public function getSubAreas()
    {   
        $response = new Response();
        $db = null;
        try {
            //Obtiene areas
            $db = db_connect();
            $objModel = new SubAreaModel($db);
            $list = $objModel->orderBy('idSubArea', 'asc')->findAll();
            //Prepara respuesta
            $response->error = false;
            $response->values = $list;
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }

    public function getChannels()
    {   
        $response = new Response();
        $db = null;
        try {
            //Obtiene via de respuesta
            $db = db_connect();
            $objModel = new ChannelModel($db);
            $list = $objModel->orderBy('channel', 'asc')->findAll();
            //Prepara respuesta
            $response->error = false;
            $response->values = $list;
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }

    public function getChannelsEntry()
    {   
        $response = new Response();
        $db = null;
        try {
            //Obtiene via de respuesta
            $db = db_connect();
            $objModel = new ChannelEntryModel($db);
            $list = $objModel->orderBy('entry_channel', 'asc')->findAll();
            //Prepara respuesta
            $response->error = false;
            $response->values = $list;
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }

    public function getGenders()
    {   
        $response = new Response();
        $db = null;
        try {
            //Obtiene via de respuesta
            $db = db_connect();
            $objModel = new GenderModel($db);
            $list = $objModel->orderBy('gender', 'asc')->findAll();
            //Prepara respuesta
            $response->error = false;
            $response->values = $list;
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }

    public function getRegions()
    {   
        $response = new Response();
        $db = null;
        try {
            //Obtiene regiones
            $db = db_connect();
            $objModel = new RegionModel($db);
            $list = $objModel->orderBy('region', 'asc')->findAll();
            //Prepara respuesta
            $response->error = false;
            $response->values = $list;
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }

    public function getDistrictsByRegion($region_id)
    {   
        $response = new Response();
        $db = null;
        try {
            //Obtiene comunas por region
            $db = db_connect();
            $objModel = new DistrictModel($db);
            $list = $objModel->where("region_id",$region_id)->orderBy('district', 'asc')->findAll();
            //Prepara respuesta
            $response->error = false;
            $response->values = $list;
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }

    public function saveForm($form)
    {      
        $db = null;
        $response = new Response();
        try {        
            //Obtiene usuario de la sesion
            $session = \Config\Services::session();
            $user = $session->get('user');
            if(isset($user) && isset($user->profile_id)){     
                $db = db_connect();
                if(isset($form)){
                    $lib = new InboxLibrary();
                    //Sube archivo
                    $pathSign = '';
                    if(strlen($form->form_sign_64) > 0){                    
                        $pathSignResponse = $lib->uploadSign($form->form_sign_64);                 
                        if(!$pathSignResponse->error && isset($pathSignResponse->values)){
                            $pathSign = $pathSignResponse->values;
                        }
                    }else{
                        $pathSign = $form->form_sign;
                    }             
                    //Establece formato
                    $db->query("set language 'us_english'");                
                    $data = [
                        'id'=>$form->id,
                        'pacient_names'=>$form->pacient_names,
                        'pacient_social_name'=>$form->pacient_social_name,
                        'pacient_lastname'=>$form->pacient_lastname,
                        'pacient_mlastname'=>$form->pacient_mlastname,
                        'pacient_rut'=>$form->pacient_rut,
                        'pacient_gender_id'=>$form->pacient_gender_id,
                        'pacient_phone'=>$form->pacient_phone,
                        'pacient_address'=>$form->pacient_address,
                        'pacient_region_id'=>$form->pacient_region_id,
                        'pacient_district_id'=>$form->pacient_district_id,
                        'pacient_email'=>$form->pacient_email,
                        'attention_date'=>$form->attention_date, 
                        'attention_place'=>$form->attention_place, 
                        'is_pacient'=>$form->is_pacient,
                        'claimant_names'=>$form->claimant_names,
                        'claimant_social_name'=>$form->claimant_social_name,
                        'claimant_lastname'=>$form->claimant_lastname,
                        'claimant_mlastname'=>$form->claimant_mlastname,
                        'claimant_rut'=>$form->claimant_rut,
                        'claimant_gender_id'=>$form->claimant_gender_id,
                        'claimant_phone'=>$form->claimant_phone,
                        'claimant_address'=>$form->claimant_address,
                        'claimant_region_id'=>$form->claimant_region_id,
                        'claimant_district_id'=>$form->claimant_district_id,
                        'claimant_email'=>$form->claimant_email,
                        'form_sign'=>$pathSign, 
                        'form_type_id'=>$form->form_type_id,
                        'form_branch_id'=>$form->form_branch_id,
                        'form_area_id'=>$form->form_area_id, 
                        'form_subarea_id'=>$form->form_subarea_id,
                        'form_channel_id'=>$form->form_channel_id, 
                        'form_channel_entry_id'=>$form->form_channel_entry_id, 
                        'form_is_priority'=>$form->form_is_priority, 
                        'form_resume'=>$form->form_resume, 
                        'form_solution'=>$form->form_solution,                    
                        'form_subject_claim'=>$form->form_subject_claim, 
                        'form_ot'=>$form->form_ot, 
                        'form_date_received'=>$form->form_date_received, 
                        'form_management'=>$form->form_management, 
                        'form_improve'=>$form->form_improve, 
                        'form_comments'=>$form->form_comments,
                        'intern_invoice'=>$form->intern_invoice                            
                    ];
                    //Guardar formulario
                    $formModel = new FormModel($db);                        
                    $formModel->save($data);
                    $formID = '';
                    $id = 0;
                    if($form->id == 0){
                        $id = $formModel->insertID;
                        //Formulario de ingreso
                        $invoiceCode = getenv('invoiceCode');
                        $formID = $invoiceCode.str_pad($id, 5, "0", STR_PAD_LEFT);   
                        //Añade folio de formulario, usuario de acceso y fecha
                        $formModel->where('id',$id)->set(['invoice_channel'=>$invoiceCode, 'invoice' => $formID, 'user_entry'=>$user->id, 'form_date_entry_assign'=>date('Y-m-d H:i:s'),'form_date_entry'=>date('Y-m-d H:i:s'), 'status_id'=>1])->update();  
                        //Inserta bitacora inicial
                        $lib->saveHistory($id, 'Se ha creado el formulario',1);                    
                    }else{ 
                        $id = $form->id;
                        $formID = $form->invoice; 
                        //Inserta bitacora modificación
                        $lib->saveHistory($id, 'Se ha modificado el formulario',1);
                    }

                    //Historico
                    foreach ($form->history as $his){
                        if($his->action == "add"){
                            $lib->saveHistory($id, $his->message);
                        }else{
                            $lib->deleteHistory($id, $his->id);
                        }
                    }

                    //Documentos
                    foreach ($form->docs as $doc){
                        if($doc->action == "add"){
                            $lib->saveFormDocument($doc->doc_desc, $doc->upload_name, $id, 'forms_docs');
                        }else{
                            try {
                                if($doc->id != 0){
                                    $lib->deleteFormDocument($doc->id);
                                }
                                helper('filesystem');
                                $upload_name = $doc->upload_name;                                
                                unlink(WRITEPATH.'uploads/forms_docs/'.$upload_name);
                            } catch (\Exception $e) {
                            }
                        }
                    }
                    
                    if($form->id == 0){
                    //Prepara parametros para el correo
                    $email_id = 0; //ID Correo ingreso formulario
                    if($form->form_type_id == 1){ $email_id = 2; } else { $email_id = 3; } // 2 es para reclamos y 3 para sugerencias y felicitaciones
                    if($form->is_pacient == 1){
                        $user_name = $form->pacient_names.' '.$form->pacient_lastname.' '.$form->pacient_mlastname;
                    }else{
                        $user_name = $form->claimant_names.' '.$form->claimant_lastname.' '.$form->claimant_mlastname;
                    }
                    if($form->form_type_id == 1){
                        $objParameters = [
                            [
                                'key' => '{name}',
                                'value' => $user_name,
                            ],
                            [
                                'key' => '{formID}',
                                'value' => $formID,
                            ],
                            [
                                'key' => '{type_desc}',
                                'value' => $form->form_type_desc,
                            ],
                            [
                                'key' => '{form_area_desc}',
                                'value' => $form->form_area_desc,
                            ],
                            [
                                'key' => '{form_channel_desc}',
                                'value' => $form->form_channel_desc,
                            ],
                            [
                                'key' => '{form_description}',
                                'value' => $form->form_resume,
                            ],
                            [
                                'key' => '{form_solution}',
                                'value' => $form->form_solution,
                            ]
                        ];                  
                        $parameters = json_encode($objParameters);
                        //Prepara adjunto
                        $doc = $lib->makeReceiptDocument($parameters);
                        $response->message = $doc;
    
                        if($doc->error == false && count($doc->values)>0){ 
                            //Añade documento a formulario
                            $lib->saveFormDocument($doc->values[0],$doc->values[0],$id,$doc->values[2]);
                            $docParameters = [
                                [
                                    'attachment_name' => $doc->values[0],
                                    'attachment_type' => 'GET',
                                    'attachment_path' => $doc->values[2],
                                    'attachment_temp' =>  1
                                ]                        
                            ];                  
                            $attch = json_encode($docParameters);
                            
                        }else{$attch = null;}
                    }
                    else{
                        $attch = null;
                    }

                    //Prepara parametros para el correo
                    $objParametersMail =  array('{name}' => $user_name, '{formID}' => $formID, '{type_desc}' => $form->type_desc, '{form_area_desc}' => $form->form_area_desc,
                    '{form_channel_desc}' => $form->form_channel_desc, '{form_description}' => $form->form_resume, '{form_solution}' => $form->form_solution);
                    $parametersMail = json_encode($objParametersMail);
                    //Enviar correo
                    $libEmail = new EmailLibrary();   
                    $send = $libEmail->send($form->pacient_email,$form->claimant_email,$email_id,$parametersMail,$attch);    
                    $response->message = $send;

                    }

                    //Prepara respuesta
                    $response->error = false;
                    $response->values = $formID;
                                    
                }else{
                    //Prepara respuesta
                    $response->error = true;
                    $response->message = 'Ocurrió un error inesperado, contacte al administrador del sitio.';
                }
            }else{
                //Prepara respuesta
                $response->error = true;
                $response->message = 'Ocurrió un error inesperado, contacte al administrador del sitio.';
            }            
        } catch (\Exception $e) {
            //Prepara respuesta
            $response->error = true;
            $response->message = 'Ocurrió un error inesperado, contacte al administrador del sitio. '.$e->getMessage();
        }
        if($db != null){$db->close();}
        
        return $response;
    }

    public function uploadSign($fileb64)
    {   
        $response = new Response();        
        try {
            // define(WRITEPATH, 'uploads/sign_forms');            
            $tmp = explode("base64,",$fileb64);
            if(count($tmp)==2){
                $type = $tmp[0];
                //Obtiene extensión
                $ext = "";
                if($type == "data:image/png;"){
                    $ext = "png";
                }else{
                    if($type == "data:image/jpg;" || $type == "data:image/jpeg;"){
                        $ext = "jpg";
                    }
                    else{
                        $ext = "jpg";
                    }
                }
                //Obtiene Archivo de B64
                $b64 = $tmp[1];
                $data = base64_decode($b64);
                //Crea carpeta de firmas si no existe
                $dirname = WRITEPATH .'uploads/sign_forms/';
                if (!is_dir($dirname)) {
                    mkdir($dirname);
                }
                //Genera un nombre al archivo
                $lib = new InboxLibrary();
                $newName = $lib->random_filename(50, $dirname, $ext);
                $file = $dirname.$newName;                
                //Sube archivo
                $success = file_put_contents($file, $data);                
                //Prepara respuesta
                $response->error = false;
                $response->values = $newName;          
            }else{
                $response->error = true;
                $response->values = null;
                $response->message = 'Error al seprarar b64';
            }
            
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        return $response;
    }

    function random_filename($length, $directory = '', $extension = '')
    {
        // default to this files directory if empty...
        $dir = !empty($directory) && is_dir($directory) ? $directory : dirname(__FILE__);

        do {
            $key = '';
            $keys = array_merge(range(0, 9), range('a', 'z'));

            for ($i = 0; $i < $length; $i++) {
                $key .= $keys[array_rand($keys)];
            }
        } while (file_exists($dir . '/' . $key . (!empty($extension) ? '.' . $extension : '')));

        return $key . (!empty($extension) ? '.' . $extension : '');
    }

    public function makeReceiptDocument($json_params){
        $response = new Response();    
        try {
            $path = 'receipt_forms';
            $dirname = WRITEPATH .'uploads/'.$path.'/';
            $fileName = 'ReciboReclamo_{formID}.pdf';
            //Obtiene HTML         
            $html = file_get_contents($dirname."template/create-form.html"); 
            //Reemplaza valores dinamicos en documento
            if(isset($json_params)){
                $params_list = json_decode($json_params);
                if(isset($params_list) && count($params_list) > 0){
                    foreach($params_list as $param){ 
                        $html = str_replace($param->key, $param->value, $html);
                        $fileName = str_replace($param->key, $param->value, $fileName);
                    }
                }                    
            } 
            $filePath = $dirname.$fileName;
            $dompdf= new Dompdf();
            $dompdf->loadHtml($html);
            $dompdf->render();            
            $output = $dompdf->output();            
           
            file_put_contents($filePath, $output);

            $response->error = false;
            $response->values = array($fileName,$filePath,$path);
            $response->message = "";

        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        return $response;
    }
    
    //#endregion

    //#region Actions

    public function discardForm($form_id)
    {   
        $response = new Response();        
        try {
            //Descartado
            $db = null;
            try {
                //Conecta BD
                $db = db_connect();   
                $formModel = new FormModel($db);   
                $formModel->set(["status_id"=>"8"])->update($form_id);
                //Inserta en historial
                $lib = new InboxLibrary();
                $lib->saveHistory($form_id, 'El formulario fue descartado.',1);
            } catch (\Exception $e) {
                $response->error = true;
                $response->values = $e;   
            }
            if($db != null){$db->close();}

            //Prepara respuesta
            $response->error = false;
            $response->values = null;          
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        return $response;
    }
    
    public function recoveryForm($form_id)
    {   
        $response = new Response();        
        try {
            //Descartado
            $db = null;
            try {
                //Conecta BD
                $db = db_connect();   
                $formModel = new FormModel($db);   
                $formModel->set(["status_id"=>"1"])->update($form_id);
                //Inserta en historial
                $lib = new InboxLibrary();
                $lib->saveHistory($form_id, 'El formulario fue recuperado.',1);
            } catch (\Exception $e) {
                $response->error = true;
                $response->values = $e;   
            }
            if($db != null){$db->close();}

            //Prepara respuesta
            $response->error = false;
            $response->values = null;          
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        return $response;
    }

    public function deleteForm($form_id)
    {   
        $response = new Response();        
        try {
            //Elimina documento a BD
            $db = null;
            try {
                //Conecta BD
                $db = db_connect();   
                //Elimina historial
                $hisModel = new FormHistoryModel($db);   
                $hisModel->where("form_id",$form_id)->delete();
                //Elimina documentos
                $docModel = new FormDocModel($db);   
                $docModel->where("form_id",$form_id)->delete();
                //Elimina formulario
                $formModel = new FormModel($db);   
                $formModel->delete($form_id);
            } catch (\Exception $e) {
                $response->error = true;
                $response->values = $e->getMessage();   
            }
            if($db != null){$db->close();}

            //Prepara respuesta
            $response->error = false;
            $response->values = null;          
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        return $response;
    }

    public function getReasignProfiles($form_id)
    {   
        $response = new Response();        
        try {
            $db = null;
            try {
                //Conecta BD
                $db = db_connect();   
                //Obtiene usuarios
                $userModel = new UserModel($db);   
                $entry = $userModel->where("profile_id","3")->select('id, name, lastname')->orderBy('name', 'asc')->findAll(); //Perfil Ingreso
                $management = $userModel->where("profile_id","4")->select('id, name, lastname')->orderBy('name', 'asc')->findAll(); //Perfil Gestión
                $director = $userModel->where("profile_id","5")->select('id, name, lastname')->orderBy('name', 'asc')->findAll(); //Perfil Director
                //Obtiene usuarios del formulario
                $formModel = new FormModel($db);   
                $userForm = $formModel->where("id",$form_id)->select('user_entry, user_manager, user_director')->findAll();                
                //Prepara respuesta
                $response->error = false;
                $response->values = array($userForm, $entry, $management, $director);    
            } catch (\Exception $e) {
                $response->error = true;
                $response->values = $e->getMessage();   
            }
            if($db != null){$db->close();}
      
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        return $response;
    }

    public function reasignProfiles($form_id, $user_entry_id, $user_entry, $user_manager_id, $user_manager, $user_director_id, $user_director)
    {   
        $response = new Response();        
        try {
            //Asigna en BD
            $db = null;
            try {
                //Conecta BD
                $db = db_connect();   
                $formModel = new FormModel($db);   
                $formModel->set(["user_entry"=>$user_entry_id, "user_manager"=>$user_manager_id, "user_director"=>$user_director_id])->update($form_id);
                //Inserta en historial
                $lib = new InboxLibrary();
                $lib->saveHistory($form_id, 'El formulario fue reasignado: Perfil Ingreso: '.$user_entry.' - Perfil Gestión: '.$user_manager.' - Perfil Director: '.$user_director,1);
            } catch (\Exception $e) {
                $response->error = true;
                $response->values = $e->getMessage();   
            }
            if($db != null){$db->close();}

            //Prepara respuesta
            $response->error = false;
            $response->values = null;          
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        return $response;
    }
    
    public function sendForm($form_id, $comment, $rejection = 0)
    {   
        $response = new Response();    
        $lib = new InboxLibrary();    
        try {
            //Obtiene usuario de la sesion
            $session = \Config\Services::session();
            $user = $session->get('user');
            if(isset($user) && isset($user->id)){
                $db = null;
                $response->message = array();
                try {
                    //Conecta BD
                    $db = db_connect();   
                    $formModel = new FormModel($db);   
                    $form = $formModel->select('forms.invoice, forms.form_type_id, forms.status_id, forms.form_branch_id, forms.form_area_id, forms.user_entry, forms.user_manager, forms.user_director, ') //Datos proceso
                                    ->select('forms.pacient_names+\' \'+forms.pacient_lastname+\' \'+forms.pacient_mlastname as pacient, forms.claimant_names+\' \'+forms.claimant_lastname+\' \'+forms.claimant_mlastname as claimant, forms.is_pacient, forms.pacient_email, forms.claimant_email, FORMAT(forms.form_date_received,\'dd/MM/yyyy\') as entry_date, forms.form_subject_claim, forms.form_improve, users.email, users.name +\' \'+ users.lastname director, users.signature director_sign ') //Datos cierre
                                    ->select('forms.form_channel_id, channels.send_email') //Datos cierre
                                    ->join('users', 'users.id = '.$user->id, 'left')
                                    ->join('channels', 'channels.id = forms.form_channel_id', 'left')
                                    ->where("forms.id",$form_id)->first();
                    if(isset($form)){   
                        
                        if(strlen($comment) > 0){
                            //Inserta comentario en historial
                            $lib->saveHistory($form_id, $comment,1);
                        }   
                        //Asigna
                        $assing = $lib->assignmentProcess($form_id, $form["status_id"], $form["form_branch_id"], $form["form_area_id"], $form["invoice"], $form["user_entry"], $form["user_manager"], $form["user_director"], $form["form_type_id"], $rejection, $comment);   
                        array_push($response->message,$assing);
                        if($assing->error == true){
                            $response = $assing;
                        }else{
                            //Reabierto?
                            if($form["status_id"] == 7){
                                $formModel->where("id",$form_id)->set(["form_date_received" => date('Y-m-d H:i:s')])->update();
                            }
                            //Cierre?
                            if(isset($assing->values) && $assing->values == 6){
                                if($form["form_type_id"] == 1){
                                    $objParameters = [
                                        [
                                            'key' => '{closed_date}',
                                            'value' => $assing->message,
                                        ],
                                        [
                                            'key' => '{name}',
                                            'value' => ($form["is_pacient"] == 1 ? $form["pacient"] : $form["claimant"]),
                                        ],
                                        [
                                            'key' => '{email}',
                                            'value' => ($form["is_pacient"] == 1 ? $form["pacient_email"] : $form["claimant_email"]),
                                        ],
                                        [
                                            'key' => '{entry_date}',
                                            'value' => $form["entry_date"],
                                        ],
                                        [
                                            'key' => '{formID}',
                                            'value' => $form["invoice"],
                                        ],
                                        [
                                            'key' => '{form_resume}',
                                            'value' => $form["form_subject_claim"],
                                        ],
                                        [
                                            'key' => '{form_improve}',
                                            'value' => $form["form_improve"],
                                        ],
                                        [
                                            'key' => '{director}',
                                            'value' => $form["director"],
                                        ]
                                    ];                  
                                    $parameters = json_encode($objParameters);
                                    //Prepara adjunto
                                    $doc = $lib->makeResolutionDocument($parameters, $form["director_sign"]);
                                    array_push($response->message,$doc); 
                                    
                                    if($doc->error == false && count($doc->values)>0){ 
                                        //Añade documento a formulario
                                        $lib->saveFormDocument($doc->values[0],$doc->values[0],$form_id,$doc->values[2]);
                                        if($form["send_email"] == 1){
                                            //Envia correo?
                                            $docParameters = [
                                                [
                                                    'attachment_name' => $doc->values[0],
                                                    'attachment_type' => 'GET',
                                                    'attachment_path' => $doc->values[2],
                                                    'attachment_temp' =>  1
                                                ]                        
                                            ];                  
                                            $attch = json_encode($docParameters);
                                            //Envia correo?
                                            $docParameters = [
                                                [
                                                    'attachment_name' => $doc->values[0],
                                                    'attachment_type' => 'GET',
                                                    'attachment_path' => $doc->values[2],
                                                    'attachment_temp' =>  1
                                                ]                        
                                            ];                  
                                            $attch = json_encode($docParameters);
                                            //Prepara parametros para el correo
                                            $objParametersMail =  array('{closed_date}' => $assing->message, '{name}' => ($form["is_pacient"] == 1 ? $form["pacient"] : $form["claimant"]), 
                                            '{email}' => ($form["is_pacient"] == 1 ? $form["pacient_email"] : $form["claimant_email"]), '{entry_date}' => $form["entry_date"],
                                            '{formID}' => $form["invoice"], '{form_resume}' => $form["form_subject_claim"], '{form_improve}' => $form["form_improve"],
                                            '{director}' => $form["director"]);
                                            $parametersMail = json_encode($objParametersMail);
                                            //Enviar correo
                                            // $userModel = new UserModel($db);   
                                            // $datosDoc = $userModel->join('forms', 'forms.user_director = users.id')
                                            //             ->where('forms.invoice', $form["invoice"])
                                            //             ->select('users.email')
                                            //             ->first();
                                            $libEmail = new EmailLibrary();   
                                            $email_id = 5;
                                            $send = $libEmail->send($form["pacient_email"],$form["email"],$email_id,$parametersMail,$attch); 
                                            array_push($response->message,$send); 
                                            
                                        }                               
                                    }else{ $attch = null;}
                                }
                            }
                            //Prepara respuesta
                            $response->error = false;
                            $response->values = null; 
                        }        
                    }
                    else{
                        $response->error = true;
                        $response->values = "No se encontró datos del formulario.";
                        $response->message = "No se encontró datos del formulario.";   
                    }
                } catch (\Exception $e) {
                    $response->error = true;
                    $response->values = "Ocurrió un error inesperado, inténtelo mas tarde.";
                    $response->message = $e;   
                }
                if($db != null){$db->close();}
            }
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = "Ocurrió un error inesperado, inténtelo mas tarde.";
            $response->message = $e->getMessage();
        }
        return $response;
    }
    
    public function assignmentProcess($form_id, $status_id, $form_branch_id, $form_area_id, $form_invoice, $user_entry_id, $user_manager_id, $user_director_id, $form_type, $rejection = 0, $comment = 'Sin comentarios'){
        $response = new Response();
        $db = null;
        try {
            //Obtiene usuario de la sesion
            $session = \Config\Services::session();
            $user = $session->get('user');
            if(isset($user) && isset($user->profile_id)){   
                //Obtiene flujo de estados
                $db = db_connect();
                $statusobjModel = new StatusWorkflowModel($db);
                $status = $statusobjModel->where("flow_type",$form_type)->where("status_current",$status_id)->where("status_rejection",$rejection)->join('status', 'status.id = status_workflow.status_next')->join('profiles', 'profiles.id = status_workflow.assign_profile_id','left')->first();
                if(isset($status) && $status["assign_profile_id"] != 0){
                    // echo 'aca';
                    // exit;
                    $haveUser = false;
                    $user_current = $user->id;
                    $user_id = 0; $user_name = ''; $user_email = ''; $user_field = ''; $date_field_assign = ''; $date_field = '';
                    //Perfil usuario actual
                    switch ($user->profile_id) {
                        case 3:
                            $date_field = 'form_date_entry';
                            $profile_field = 'user_entry';
                            break;
                        case 4:
                            $date_field = 'form_date_manager';
                            $profile_field = 'user_manager';
                            break;
                        case 5 || 6:
                            $date_field = 'form_date_director';
                            $profile_field = 'user_director';
                            break;
                    }
                    //Perfil requerido
                    switch ($status["assign_profile_id"]) {
                        case 3:
                            $user_field = 'user_entry';
                            $date_field_assign = 'form_date_entry_assign';                           
                            break;
                        case 4:
                            $user_field = 'user_manager';
                            $date_field_assign = 'form_date_manager_assign';                            
                            break;
                        case 5:
                            $user_field = 'user_director';
                            $date_field_assign = 'form_date_director_assign';
                            break;
                    }
                    //Obtiene usuarios para asignar
                    $userobjModel = new UserModel($db);
                    $users = [];

                    $userobjModel->select("id,name,lastname,email")->where("blocked_at",null)->where("branch_id",$form_branch_id);
                    if($status["assign_area"] != 0){
                        $userobjModel->where("area_id",$form_area_id);
                    }

                    if($status["assign_profile_id"] == 5){
                        $userobjModel->where("(profile_id = 5 OR profile_id = 6)");
                    }else{
                        $userobjModel->where("profile_id",$status["assign_profile_id"]);
                    }
                       
                    $users = $userobjModel->get()->getResultArray();     
                                
                    if(isset($users) && count($users) > 0){
                        $haveUser = true;
                        $user_id = 0;                        
                        $user_name = '';  
                        foreach($users as $userAssign) {
                            $user_email = $user_email.';'.$userAssign["email"];
                        }  
                        $user_email = ltrim($user_email, ';');    
                    }else{
                        $response->error = true;
                        $response->values = null;
                        $response->message = 'Workflow sin usuarios';
                    }                   
                    if($haveUser){
                        $db->query("set language 'us_english'");        
                        $formobjModel = new FormModel($db);
                        //Asigna estado
                        $statusRequired = $status["status_next"];
                        $formobjModel->where("id",$form_id)->set(['status_id' => $statusRequired, 'user_current' => $user_id, $user_field => $user_id, $date_field => date('Y-m-d H:i:s'), $date_field_assign => date('Y-m-d H:i:s'), 'profile_current' => $status["assign_profile_id"], $profile_field => $user_current])->update();
                        //Inserta en bitacora
                        $lib = new InboxLibrary();
                        $lib->saveHistory($form_id, 'Se ha asignado el formulario al perfil: '.$status["profile"].', con el estado: '.$status["status"].'.',1);
                        //Notificacion
                        $db->query("set language 'us_english'");
                        $notificationobjModel = new FormNotificationModel($db);
                        foreach($users as $userAssign) {
                            $data = ['form_id' =>$form_id, 'user_id' => $userAssign["id"], 'class' => 'bg-info', 'icon' => 'fas fa-ticket-alt', 'notification' => 'Se ha asignado el formulario: '.$form_invoice.' para su gestión con el estado: '.$status["status"].'.', 'created_at'=> date('Y-m-d H:i:s') ];
                            $notificationobjModel->insert($data);
                        }
                        //Prepara parametros para el correo de asignación
                        $email_id = 4; //ID Correo asignación de formulario
                        $objParametersMail =  array('{name}' => $user_name, '{formID}' => $form_invoice, '{status}' => $status["status"], '{comment}' => (strlen($comment) == 0 ? 'Sin comentarios' : $comment));
                        $parameters = json_encode($objParametersMail);
                        $lib = new EmailLibrary();                
                        //Enviar correo
                        $send = $lib->send($user_email,'',$email_id,$parameters,"");   
                        //Prepara respuesta
                        $response->error = false;
                        $response->values = $statusRequired;
                        $response->message = $send;
                    }else{
                        $response->error = true;
                        $response->values = 'Workflow sin usuario';
                        $response->message = 'Workflow sin usuario';
                    }                    
                }else{
                    // echo 'else';
                    // exit;
                    if(isset($status) && $status["assign_profile_id"] == 0 && $status["status_next"] != 0){
                        $db->query("set language 'us_english'");
                        $formobjModel = new FormModel($db);
                        //Asigna estado
                        $statusRequired = $status["status_next"];
                        $dateClosed = null; $dateClosedFormat = null; $date_field = ''; $profile_field = '';
                        if($statusRequired == 6) {$dateClosed = date('Y-m-d H:i:s');  $dateClosedFormat = date('d-m-Y H:i:s');
                            $date_field = 'form_date_director';
                            $profile_field = 'user_director';
                            //cierre?
                            $formobjModel->where("id",$form_id)->set(['status_id' => $statusRequired, 'form_date_closed' => $dateClosed, $date_field => $dateClosed, $profile_field = $user->id])->update();
                        }//Inserta en bitacora
                        $lib = new InboxLibrary();
                        $lib->saveHistory($form_id, 'Se ha asignado el formulario al estado: '.$status["status"].'.',1);
                        $response->error = false;
                        $response->values = $statusRequired;
                        $response->message = $dateClosedFormat;
                    }else{
                        $response->error = true;
                        $response->values = 'Estado sin Workflow';
                        $response->message = 'Estado sin Workflow';
                    }
                }
            }else{
                $response->error = true;
                $response->values = 'Sin usuario logueado';
                $response->message = 'Sin usuario logueado';
            }
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = "Ocurrió un error inesperado, inténtelo mas tarde.";
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }

    public function insistForm($form_id, $comment)
    {   
        $response = new Response();    
        $lib = new InboxLibrary();    
        try {
            $db = null;
            try {
                //Obtiene usuario de la sesion
                $session = \Config\Services::session();
                $user = $session->get('user');
                if(isset($user) && isset($user->profile_id)){
                    //Conecta BD
                    $db = db_connect();   
                    $formModel = new FormModel($db);   
                    $form = $formModel->select("invoice, status_id, form_branch_id, form_area_id, forms.profile_current, profiles.need_branch, profiles.need_area")->where("forms.id",$form_id)->join('profiles','forms.profile_current = profiles.id')->first();
                    if(isset($form)){  
                        //Inserta comentario en historial
                        $lib->saveHistory($form_id, 'Se realizó insistencia: '.$comment,1);   
                        //Obtiene usuarios para asignar
                        $userobjModel = new UserModel($db);
                        $userobjModel->select("id,name,lastname,email")->where("blocked_at",null);
                        if($form["profile_current"] == 5){
                            $userobjModel->where("(profile_id = 5 OR profile_id = 6)");
                        }else{
                            $userobjModel->where("profile_id", $form["profile_current"]);
                        }
                        if($form["need_branch"]>0){
                            $userobjModel->where("branch_id", $form["form_branch_id"]);
                        }
                        if($form["need_area"]>0){
                            $userobjModel->where("area_id", $form["form_area_id"]);
                        }
                        $users = $userobjModel->get()->getResultArray();
                        //Registra notificacion
                        $db->query("set language 'us_english'");
                        $notificationobjModel = new FormNotificationModel($db);
                        foreach($users as $userAssign) {
                            $data = ['form_id' =>$form_id, 'user_id' => $userAssign["id"], 'class' => 'bg-warning', 'icon' => 'fas fa-stopwatch', 'notification' => 'Se ha realizado una insistencia en el formulario: '.$form["invoice"].', para recordar su gestión', 'created_at'=> date('Y-m-d H:i:s') ];
                            $notificationobjModel->insert($data);                            
                        }                        
                        //Envia correo
                        //Prepara parametros para el correo de asignación
                        $email_id = 6; //ID Correo asignación de formulario 
                        $objParametersMail =  array('{name}' => '', '{formID}' => $form["invoice"], '{user}' => $user->name.' '.$user->lastname, '{comment}' => (strlen($comment) == 0 ? 'Sin comentarios' : $comment));
                        $parameters = json_encode($objParametersMail);    
                        $lib = new EmailLibrary();                
                        //Enviar correo
                        $user_email = '';  
                        foreach($users as $userAssign) {
                            $user_email = $user_email.';'.$userAssign["email"];
                        }  
                        $user_email = ltrim($user_email, ';');
                        $send = $lib->send($user_email,'',$email_id,$parameters,""); 
                        //Prepara respuesta
                        $response->error = false;
                        $response->values = null;        
                    }
                    else{
                        $response->error = true;
                        $response->values = "No se encontró datos del formulario.";   
                    }
                }else{
                    $response->error = true;
                    $response->values = "Usuario no logueado.";   
                }
            } catch (\Exception $e) {
                $response->error = true;
                $response->values = $e;   
            }
            if($db != null){$db->close();}
         
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        return $response;
    }

    public function makeResolutionDocument($json_params, $director_sign){
        $response = new Response();    
        try {
            $path = 'resolution_forms';
            $dirname = WRITEPATH .'uploads/'.$path.'/';
            $fileName = 'ResolucionReclamo_{formID}.pdf';
            //Obtiene HTML         
            $html = file_get_contents($dirname."template/close-form2.html"); 
            //Reemplaza valores dinamicos en documento
            if(isset($json_params)){
                $params_list = json_decode($json_params);
                if(isset($params_list) && count($params_list) > 0){
                    foreach($params_list as $param){ 
                        $html = str_replace($param->key, $param->value, $html);
                        $fileName = str_replace($param->key, $param->value, $fileName);
                    }
                }                    
            } 

            //Carga imagen de firma del director.
            if(strlen($director_sign) > 0){
                try{ 
                    $pathsign = WRITEPATH .'uploads/sign_users/'.$director_sign;
                    $typesign = pathinfo($pathsign, PATHINFO_EXTENSION);
                    $datasign = file_get_contents($pathsign);
                    $base64sign = 'data:image/' . $typesign . ';base64,' . base64_encode($datasign);
                    $html = str_replace('{director_sign}', $base64sign, $html);
                }  catch (\Exception $e) {
                    $html = str_replace('{director_sign}', '', $html);
                }
            }

            $filePath = $dirname.$fileName;
            $dompdf= new Dompdf();
            $dompdf->loadHtml($html);
            $dompdf->render();            
            $output = $dompdf->output();            
           
            file_put_contents($filePath, $output);

            $response->error = false;
            $response->values = array($fileName,$filePath,$path);
            $response->message = "";

        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        return $response;
    }
    //#endregion
}
?>
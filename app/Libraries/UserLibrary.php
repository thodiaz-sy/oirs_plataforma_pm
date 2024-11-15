<?php
namespace App\Libraries;

use App\Models\UserModel;
use App\Models\ProfileModel;
use App\Models\UserProfileModel;
use App\Libraries\Classes\Response;
use App\Models\ProfileGeneralModel;
use App\Models\FormNotificationModel;
use App\Models\BranchModel;
use App\Models\AreaModel;
use App\Models\FormModel;
use App\Models\UserBackupModel;
use CodeIgniter\I18n\Time;

class UserLibrary
{
    public function getProfiles()
    {   
        $response = new Response();
        $db = null;
        try {
            //Obtiene perfiles
            $db = db_connect();
            $profileModel = new ProfileModel($db);
            $profiles = $profileModel->orderBy('profile', 'asc')->findAll();
            //Prepara respuesta
            $response->error = false;
            $response->values = array($profiles);
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }

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

    public function getUsersSelect()
    {   
        $response = new Response();
        $db = null;
        try {
            //Obtiene usuarios
            $db = db_connect();
            $userModel = new UserModel($db);
            $users = $userModel->orderBy('name', 'asc')->orderBy('lastname', 'asc')->findAll();
            //Prepara respuesta
            $response->error = false;
            $response->values = $users;
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }

    public function getUsersBackups($profile_id, $user_id)
    {   
        $response = new Response();
        $db = null;
        try {
            //Obtiene usuarios
            $db = db_connect();
            $userModel = new UserModel($db);
            if($user_id != "0"){
                $users = $userModel->where('profile_id',$profile_id)->where('id <>',$user_id)->orderBy('name', 'asc')->orderBy('lastname', 'asc')->findAll();
            }
            else{
                $users = $userModel->where('profile_id',$profile_id)->orderBy('name', 'asc')->orderBy('lastname', 'asc')->findAll();
            }
            //Prepara respuesta
            $response->error = false;
            $response->values = $users;
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }

    public function getUsers($id, $username, $profile, $blocked, $filter, $disabled)
    {   
        $response = new Response();
        $db = null;
        $total = 0;
        try {
            //Conecta BD
            $db = db_connect();
            //Cuenta total usuarios activados o desactivados
            $userModel = new UserModel($db);
            if($disabled == 0){
                $total = $userModel->countAllResults();
            }else{
                $total = $userModel->onlyDeleted()->countAllResults();
            }
            
            $users = [];            
            //Select general
            $applyFilter = false;
            $builder = $db->table('users');
            $builder->select("users.id, users.username, users.name + ' ' + users.lastname as fullname, users.profile_id, profiles.profile, users.email, FORMAT(users.blocked_at,'dd/MM/yyyy') as blocked_at,  FORMAT(users.deleted_at,'dd/MM/yyyy') as deleted_at");
            $builder->join("profiles","profiles.id = users.profile_id");
            //Solo obtiene activados o desactivados
            if($disabled == 0){
                $builder->where("users.deleted_at",null);
            }else{
                $builder->where("users.deleted_at !=",null);
            }
            //Filtros
            if($id != null && strlen($id) > 0){
                $applyFilter = true;
                $builder->like('users.id', $id);
            }
            if($username != null && strlen($username) > 0){
                $applyFilter = true;
                $builder->like('users.username', $username);
            }
            if($profile != null && $profile != "0"){
                $applyFilter = true;
                $builder->where('users.profile_id', $profile);
            }
            if($blocked != null && $blocked != "0"){
                $applyFilter = true;
                if($blocked == "1"){
                    $builder->where("users.blocked_at !=",null);
                }
                if($blocked == "2"){
                    $builder->where("users.blocked_at",null);
                }
            }            
            //Ordena por columna seleccionada
            switch ($filter->column) {
                case 0:
                    $builder->orderBy('users.id', $filter->direction);
                    break;
                case 1:
                    $builder->orderBy('users.username', $filter->direction);
                    break;
                case 2:
                    $builder->orderBy('fullname', $filter->direction);
                    break;
                case 3:
                    if($disabled == 0){ //Tabla usuarios activos
                        $builder->orderBy('users.profile_id', $filter->direction);
                    }else{ //Tabla usuarios desactivados
                        $builder->orderBy('users.email', $filter->direction);
                    }                    
                    break;
                case 4:   
                    if($disabled == 0){ //Tabla usuarios activos
                        $builder->orderBy('users.email', $filter->direction);
                    }else{ //Tabla usuarios desactivados
                        $builder->orderBy('users.deleted_at', $filter->direction); 
                    }                 
                    break;
            }
            //Paginación
            $users = $builder->get($filter->length, $filter->start)->getResultArray();            
            
            //Prepara respuesta
            $response->error = false;
            $response->values = array($total, $users, $applyFilter);            
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = array(0,null);
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }

    public function getUserByID($userID)
    {   
        $response = new Response();
        $db = null;
        try {
            $db = db_connect();
            //Obtiene datos generales
            $builder = $db->table('users');
            $builder->select("users.id, users.username, users.name, users.lastname, users.email, users.profile_id, users.branch_id, users.area_id,users.contrasena");
            $builder->where('users.id', $userID);
            $user = $builder->get()->getFirstRow(); 
            //Obtiene Backups
            $backupModel = new UserBackupModel($db);
            $backups = $backupModel->select("user_bkp")->where('user_id',$userID)->findAll();
            //Prepara respuesta
            $response->error = false;
            $response->values = array($user, $backups);            
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }

    public function saveUser($user)
    {   
        $response = new Response();
        $db = null;
        try {
            //Conecta BD
            $db = db_connect();
            $userModel = new UserModel($db);
            $checkUsername = $userModel->where('username', $user->username)->where('id !=', $user->id)->countAllResults();
            if($checkUsername > 0){
                //Username duplicado
                $response->error = true;
                $response->values = "ERRUSR";
                $response->message = "El nombre de usuario ya se encuentra registrado.";
            }else{
                $data = [];
                //Verifica si tiene que actualizar la contraseña
                if(strlen($user->password) > 0){
                    //Encripta
                    $password = password_hash($user->password, PASSWORD_DEFAULT); //algoritmo bcrypt (predeterminado a partir de PHP 5.5.0)
                    $dateTime = new Time("now");
                    $expiration = $dateTime->format('Y-m-d H:i:s');
                    if($user->profile_id < 5){
                        $data = [
                            'username' => $user->username,
                            'password' => $password,
                            'name' => $user->name,
                            'lastname' => $user->lastname,
                            'email' => $user->email,
                            'profile_id' => $user->profile_id,
                            'branch_id' => $user->branch_id,
                            'area_id' => $user->area_id,
                            'updated_password' => $expiration,
                            'contrasena'=> null
                        ];
                    } else {
                        $data = [
                            'username' => $user->username,
                            'password' => $password,
                            'name' => $user->name,
                            'lastname' => $user->lastname,
                            'email' => $user->email,
                            'profile_id' => $user->profile_id,
                            'branch_id' => $user->branch_id,
                            'area_id' => $user->area_id,
                            'updated_password' => $expiration,
                            'contrasena'=>$user->contrasena
                        ];
                    }
                }else{
                    if($user->profile_id < 5){
                        $data = [
                            'username' => $user->username,
                            'name' => $user->name,
                            'lastname' => $user->lastname,
                            'email' => $user->email,
                            'profile_id' => $user->profile_id,
                            'branch_id' => $user->branch_id,
                            'area_id' => $user->area_id,
                            'contrasena'=> null
                        ];
                    } else {
                        $data = [
                            'username' => $user->username,
                            'name' => $user->name,
                            'lastname' => $user->lastname,
                            'email' => $user->email,
                            'profile_id' => $user->profile_id,
                            'branch_id' => $user->branch_id,
                            'area_id' => $user->area_id,
                            'contrasena'=>$user->contrasena
                        ];
                    }
                }    
                $userID = 0;    
                //Establece formato
                $db->query("set language 'us_english'");
                if($user->id == '0'){
                    //Inserta usuario                        
                    $userModel->insert($data);
                    $userID = $userModel->insertID;
                    $response->message = 'Inserta usuario '.$userID; 
                }else{
                    $response->message = 'Actualiza usuario';  
                    $userID = $user->id;   
                    //Actualiza                    
                    $userModel->update($userID, $data);
                }
                //Inserta Backups
                $backupModel = new UserBackupModel($db);
                $backupModel->where('user_id',$userID)->delete();
                if(count($user->backups) > 0){
                    foreach($user->backups as $backup){
                        //Inserta
                        $data = [
                            'user_id' => $userID,
                            'user_bkp' => $backup
                        ];
                        $backupModel->insert($data);
                    }
                }
                //Prepara respuesta
                $response->error = false;
                $response->values = null;  
            }
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }

    public function saveProfiles($userID, $user){
        $response = true;
        $db = null;
        try {
            //Conecta BD
            $db = db_connect();
            //Elimina si existe
            $userModel = new UserProfileModel($db);   
            $exist = $userModel->where('user_id',$userID)->countAllResults();
            if($exist > 0){
                $userModel->where('user_id',$userID)->delete();
            }
            //Prepara para insertar datos de perfiles            
            foreach($user->profiles as $profile){                
                //Inserta
                $data = [
                    'user_id' => $userID,
                    'profile_id' => $profile
                ];
                $userModel->insert($data);
            }

        } catch (\Exception $e) {
            $response = false;
        }
        if($db != null){$db->close();}
        return $response;
    }

    public function disableUser($userID)
    {   
        $response = new Response();
        $db = null;
        try {
            //Conecta BD
            $db = db_connect();
            //Desactiva usuario
            $userModel = new UserModel($db);
            $userModel->delete($userID,false);
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

    public function enableUser($userID)
    {   
        $response = new Response();
        $db = null;
        try {
            //Conecta BD
            $db = db_connect();
            //Activa usuario
            $userModel = new UserModel($db);
            $userModel->where('id', $userID)->set(['deleted_at' => null])->update();
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

    public function deleteUser($userID)
    {   
        $response = new Response();
        $db = null;
        try {
            //Conecta BD
            $db = db_connect();
            //Elimina permanentemente perfiles
            $userProfileModel = new UserProfileModel($db);
            $userProfileModel->where('user_id',$userID)->delete();
            //Elimina permanentemente usuario
            $userModel = new UserModel($db);
            $userModel->delete($userID,true);
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

    public function changeStatusUser($userID, $status)
    {   
        $response = new Response();
        $db = null;
        try {
            //Conecta BD
            $db = db_connect();
            //Bloquea/Desbloquea usuario   
            $userModel = new UserModel($db);
            $data = [
                'blocked_at' => $status ? date('Y-m-d') : null
            ];
            //Actualiza      
            $db->query("set language 'us_english'");                
            $userModel->update($userID, $data);
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
    
    public function updateUserInfo($user)
    {   
        $response = new Response();
        $db = null;
        try {
            //Si tiene firma sube archivo
            $pathSign = '';
            if(strlen($user->signatureb64) > 0){       
                $lib = new UserLibrary();             
                $pathSignResponse = $lib->uploadSignProfile($user->signatureb64);                 
                if(!$pathSignResponse->error && isset($pathSignResponse->values)){
                    $pathSign = $pathSignResponse->values;
                }
            }else{
                $pathSign = $user->signature;
            }
            //Conecta BD
            $db = db_connect();
            $userModel = new UserModel($db);            
            $data = [
                'name' => $user->name,
                'lastname' => $user->lastname,
                'email' => $user->email,
                'signature' => $pathSign
            ];            
            $userID = $user->id;   
            //Actualiza                    
            $userModel->update($userID, $data);
            //Obtiene b64 de firma si aplica.
            if(strlen($user->signatureb64) > 0){
                $path = WRITEPATH .'uploads/sign_users/'.$pathSign;
                $type = pathinfo($path, PATHINFO_EXTENSION);
                $data = file_get_contents($path);
                $base64 = 'data:image/' . $type . ';base64,' . base64_encode($data);
                $user->previewSign = $base64;  
            }
            //Prepara respuesta
            $response->error = false;
            $response->values = $user;  
            $response->message = 'Actualiza usuario';  
            
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }

    public function uploadSignProfile($fileb64)
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
                $dirname = WRITEPATH .'uploads/sign_users/';
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

    public function updateUserPassword($user)
    {   
        $response = new Response();
        $db = null;
        try {
            //Conecta BD
            $db = db_connect();
            $userModel = new UserModel($db);  
            $userPass = $userModel->find($user->id);
            if(isset($userPass)){
                $isPassword = password_verify($user->current, $userPass['password']);
                if($isPassword){
                    $password = password_hash($user->new, PASSWORD_DEFAULT); //algoritmo bcrypt (predeterminado a partir de PHP 5.5.0)
                    $dateTime = new Time("now");
                    $expiration = $dateTime->format('Y-m-d H:i:s');
                    $data = [
                        'password' => $password,
                        'updated_password' => $expiration
                    ];                     
                    $userID = $user->id;  
                    //Establece formato
                    $db->query("set language 'us_english'"); 
                    //Actualiza                    
                    $userModel->update($userID, $data);
        
                    //Prepara respuesta
                    $response->error = false;
                    $response->values = null;  
                    $response->message = 'Actualiza usuario';                     
                }else{
                    //Prepara respuesta
                    $response->error = true;
                    $response->values = 'ERRPWD'; 
                    $response->message = 'verify '.$isPassword;                   
                }
            }else{
                //Prepara respuesta
                $response->error = true;
                $response->values = null;  
            }

        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }

    public function getNotifications()
    {   
        $response = new Response();
        $db = null;
        try {
            //Obtiene usuario de la sesion
            $session = \Config\Services::session();
                $user = $session->get('user');
                if(isset($user) && isset($user->id)){   
                //Obtiene tipos de formulario
                $db = db_connect();
                $objModel = new FormNotificationModel($db);
                $list = $objModel->select("id, class, icon, notification, FORMAT(created_at,'dd/MM/yyyy HH:mm:ss') created_at")->where("user_id",$user->id)->where("is_read",0)->orderBy('created_at', 'desc')->findAll();
                //Prepara respuesta
                $response->error = false;
                $response->values = $list;
            }else{
                $response->error = true;
                $response->values = null;
                $response->message = 'Sin usuario';
            }
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }

    public function setReadNotification($id)
    {   
        $response = new Response();
        $db = null;
        try {
            $db = db_connect();
            $objModel = new FormNotificationModel($db);
            $objModel->where("id",$id)->set(["is_read"=>1])->update();
            $not = $objModel->where("id",$id)->first();            
            $formobjModel = new FormModel($db);
            $list = $formobjModel->select("invoice")->where("id",$not["form_id"])->first();
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

    public function setReadAllNotifications()
    {   
        $response = new Response();
        $db = null;
        try {
            //Obtiene usuario de la sesion
            $session = \Config\Services::session();
            $user = $session->get('user');
            if(isset($user) && isset($user->id)){ 
                $db = db_connect();
                $objModel = new FormNotificationModel($db);
                $objModel->where("user_id",$user->id)->set(["is_read"=>1])->update();
                //Prepara respuesta
                $response->error = false;
                $response->values = '';
            }
            else{
                $response->error = true;
                $response->values = null;
                $response->message = 'Sin usuario';
            }            
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        if($db != null){$db->close();}
        return $response;
    }
}
?>
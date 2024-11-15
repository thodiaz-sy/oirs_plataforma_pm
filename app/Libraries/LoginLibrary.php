<?php
namespace App\Libraries;

use App\Models\MenuModel;
use App\Models\UserModel;
use CodeIgniter\I18n\Time;

class LoginLibrary
{
    public function login($username, $password)
    {   
        //Obtiene datos usuario
        $db = null;
        $user = null;
        $msg = "";
        try {
            //Inicia sesión
            $db = db_connect();
            $userModel = new UserModel($db);
            $data = $userModel->where('username', $username)->first();
            if($data){
                $user_blocked_at =  $data['blocked_at'];
                if($user_blocked_at == null){
                    $id = $data['id'];
                    $pass = $data['password'];
                    $authenticatePassword = password_verify($password, $pass);                    
                    if($authenticatePassword){
                        $db->query("set language 'us_english'");
                        $dateTime = new Time("now");
                        $login_at = $dateTime->format('Y-m-d H:i:s');
                        //Quita intentos de bloqueos y añade fecha inicio sesión
                        $userModel->where('id', $id)->set(['blocked_attempts' => 0, 'blocked_at' => null, 'login_at' => $login_at])->update();
                        //Obtiene datos generales
                        $builder = $db->table('users');
                        $builder->select("users.id, users.username, users.profile_id, profiles.profile, users.name, users.lastname, users.email, FORMAT(users.updated_password,'dd/MM/yyyy HH:mm:ss') as updated_password, signature, users.branch_id, users.area_id");
                        $builder->join('profiles', 'users.profile_id = profiles.id');
                        $builder->where('users.id', $id); //Trae usuario
                        //Establece formato
                        $db->query("set language 'us_english'");
                        $user = $builder->get()->getFirstRow();
                        if($user != null){
                            //Obtiene b64 de firma si aplica.
                            if(strlen($user->signature) > 0){
                                $path = WRITEPATH .'uploads/sign_users/'.$user->signature;
                                $type = pathinfo($path, PATHINFO_EXTENSION);
                                $data = file_get_contents($path);
                                $base64 = 'data:image/' . $type . ';base64,' . base64_encode($data);
                                $user->previewSign = $base64;  
                            }
                            $userID = $user->id;
                            $profileID = $user->profile_id;    
                            //Obtiene perfiles       
                            // $selectProfile = $db->table('users_profiles');
                            // $selectProfile->select("users_profiles.profile_id, profiles.profile");
                            // $selectProfile->join('profiles', 'users_profiles.profile_id = profiles.id');
                            // $selectProfile->where('user_id', $userID);                
                            // $profiles = $selectProfile->get()->getResultArray();
                            // $user->profiles = $profiles; 
                            //Obtiene menu
                            $builder = $db->table('menus');
                            $builder->select('pages.id, pages.controller, pages.description, pages.icon, pages.parent_id, pages.is_parent, pages.section, pages.order_parent, pages.order_child');
                            $builder->join('pages', 'pages.id = menus.page_id'); 
                            // $subQuery = $db->table('users_profiles')->select('profile_id', false)->where('user_id', $userID);
                            // $builder->whereIn('menus.profile_id', $subQuery);
                            $builder->where('menus.profile_id', $profileID);
                            $builder->where('menus.deleted_at', null);
                            $builder->where('pages.deleted_at', null);
                            $builder->orderBy('pages.order_parent', 'ASC');
                            $builder->distinct();
                            $query = $builder->get();
                            $user->menu = $query->getResultArray();   
                            if(count($user->menu) == 0){
                                $user = null; 
                                $msg = 'El usuario no tiene un menú asociado. Contacte al administrador del sitio para revisión de su cuenta.';
                            }  
                        } else { $user = null; }
                    } else { 
                        $user = null;
                        //Contraseña incorrecta
                        $attemps = $data['blocked_attempts'];
                        if(!$attemps){ $attemps = 0;}
                        $attemps +=1;
                        $blockAttemps = getenv('blockAttemps'); 
                        if($attemps>=$blockAttemps){
                            //Establece formato
                            $db->query("set language 'us_english'");
                            $dateTime = new Time("now");
                            $blocked_at = $dateTime->format('Y-m-d H:i:s');
                            $userModel->where('id', $id)->set(['blocked_at' => $blocked_at])->update();
                            $msg = 'El usuario ha sido bloqueado.';
                        }else{
                            $rest = $blockAttemps - $attemps;
                            $userModel->where('id', $id)->set(['blocked_attempts' => $attemps])->update();
                            $msg = 'El usuario será bloqueado si falla '.$rest.' intento(s) más.';
                        }
                    }
                }else{
                    $msg = 'El usuario ha sido bloqueado. Contacte al administrador del sitio para revisión de su cuenta.';
                }                
            }
            
        } catch (\Exception $e) {
            $msg = 'Ocurrió un error inesperado al iniciar sesión. Inténtelo nuevamente. '.$e->getMessage();
        }
        if($db != null){$db->close();}
        //Prepara retorno
        $return = null;
        if(isset($user)){
            $return = $user;            
        }else{
            if($msg != ''){
                $return = $msg;
            } 
        }
        return $return;
    }

    public function logout($id) {
        //Elimina token expirado / cierra sesion
        $db = null;
        $ret = false;
        try {
            $db = db_connect();
            $userModel = new UserModel($db);
            $dateTime = new Time("now");
            $logout_at = $dateTime->format('Y-m-d H:i:s');
            //Añade fecha cierre sesión
            $userModel->where('id', $id)->set(['logout_at' => $logout_at])->update();                        
            $ret = true;
        } catch (\Exception $e) {
        }
        if($db != null){$db->close();}
        
        return $ret;        
    }
}
?>
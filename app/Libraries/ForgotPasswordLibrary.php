<?php
namespace App\Libraries;

use App\Libraries\Classes\Response;
use App\Libraries\EmailLibrary;
use App\Models\UserModel;
use CodeIgniter\I18n\Time;

class ForgotPasswordLibrary
{
    public function recoveryPassword($username)
    {      
        $db = null;
        $response = new Response();
        try {
             //Obtiene datos usuario a traves de token            
            $db = db_connect();
            $userModel = new UserModel($db);
            $data = $userModel->where('username', $username)->first();
            if(isset($data)){
                $user_blocked_at =  $data['blocked_at'];
                if($user_blocked_at == null){
                    $id = $data['id'];
                    //Genera Token para registrar inicio de sesión
                    $token = openssl_random_pseudo_bytes(16);
                    //Convierte data a texto.
                    $token = bin2hex($token);
                    //Obtiene salt para token
                    $tokenSalt = getenv('tokenSaltForgotPassword');
                    //Prepara token + id de usuario
                    $token = $tokenSalt.$token.$id;
                    //Prepara hash para registrar token
                    $token = password_hash($token, PASSWORD_DEFAULT);
                    //Elimina caracter conflicto en URL "/"
                    $token = str_replace("/", "", $token);
                    //Genera expiración de token por configuracion
                    $minutesToAdd = getenv('tokenExpirationForgotPassword');
                    $dateTime = new Time("+{$minutesToAdd} minutes");
                    $expiration = $dateTime->format('Y-m-d H:i:s');
                    $update = [
                        'token_forgot_password' => $token,
                        'token_forgot_password_expiration' => $expiration
                    ];
                    //Guarda token
                    $userModelupdate = new UserModel($db);
                    //Establece formato
                    $db->query("set language 'us_english'");
                    $userModelupdate->where('id', $id)->set($update)->update();        
                    //Enviar correo
                    $user_email =  $data['email'];
                    $user_name =  $data['name'].' '.$data['lastname'];
                    $url = base_url().'/index.php/RecoveryPassword/Index/'.$token;
                    //Prepara parametros para el correo
                    $email_id = 1; //ID Correo olvidé contraseña
                    $objPatameters = array('{nombre}' => $user_name, '{url}' => $url);
                    $parameters = json_encode($objPatameters);
                    $lib = new EmailLibrary();
                    $send = $lib->send($user_email,"",$email_id,$parameters,"");            
                    //Prepara respuesta
                    $response->error = false;
                    $response->message = 'OK';
                }else{
                    //Prepara respuesta
                    $response->error = true;
                    $response->message = 'El usuario ha sido bloqueado. Contacte al administrador del sitio para revisión de su cuenta.';
                }                
            }else{
                //Prepara respuesta
                $response->error = true;
                $response->message = 'Ingrese su nombre de usuario, de lo contrario contacte al administrador del sitio para revisión de su cuenta.';
            }
            
        } catch (\Exception $e) {
            //Prepara respuesta
            $response->error = true;
            $response->message = 'Ocurrió un error inesperado, contacte al administrador del sitio para revisión de su cuenta. '.$e->getMessage();
        }
        if($db != null){$db->close();}
        
        return $response;
    }

    public function validateToken($token)
    {      
        $db = null;
        $response = new Response();
        try {
             //Obtiene datos usuario a traves de token            
            $db = db_connect();
            //Obtiene datos generales
            $builder = $db->table('users');
            $builder->select("users.id, users.username");
            $builder->where('users.token_forgot_password', $token); //Valida token
            $dateTime = new Time("now");
            $now = $dateTime->format('Y-m-d H:i:s');
            $builder->where('users.token_forgot_password_expiration >=',$now); //Valida Expiracion
            //Establece formato
            $db->query("set language 'us_english'");
            $user = $builder->get()->getFirstRow();
            if(isset($user)){
                //Prepara respuesta
                $response->error = false;
                $response->message = '';         
            }else{
                //Prepara respuesta
                $response->error = true;
                $response->message = '404';
            }
            
        } catch (\Exception $e) {
            //Prepara respuesta
            $response->error = true;
            $response->message = 'Ocurrió un error inesperado, contacte al administrador del sitio para revisión de su cuenta. '.$e->getMessage();
        }
        if($db != null){$db->close();}
        
        return $response;
    }

    public function setNewPassword($token, $password)
    {      
        $db = null;
        $response = new Response();
        try {
             //Obtiene datos usuario a traves de token            
            $db = db_connect();
            $userModel = new UserModel($db);
            $data = $userModel->where('token_forgot_password', $token)->first();
            if(isset($data)){
                $id = $data['id'];
                $password_hash = password_hash($password, PASSWORD_DEFAULT);
                $update = [
                    'password' => $password_hash,
                    'token_forgot_password' => '',
                    'token_forgot_password_expiration' => null
                ];
                //Actualiza
                $userModelupdate = new UserModel($db);
                $userModelupdate->where('id', $id)->set($update)->update(); 
                //Prepara respuesta
                $response->error = false;
                $response->message = '';           
            }else{
                //Prepara respuesta
                $response->error = true;
                $response->message = 'Ocurrió un error inesperado al reestablecer su contraseña, contacte al administrador del sitio para revisión de su cuenta.';
            }
            
            
        } catch (\Exception $e) {
            //Prepara respuesta
            $response->error = true;
            $response->message = 'Ocurrió un error inesperado al reestablecer su contraseña, contacte al administrador del sitio para revisión de su cuenta. '.$e->getMessage();
        }
        if($db != null){$db->close();}
        
        return $response;
    }
}
?>
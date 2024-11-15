<?php

namespace App\Controllers;

use App\Libraries\UserLibrary;

class Master extends BaseController
{
    public function index()
    {        
        return view('Home/Index');
    }

    public function updateUserInfo()
    {        
        if ($this->request->isAJAX()) {
            $user = $this->request->getJsonVar('user');
            $session = session();
            $userSession = $session->get('user');
            $user->id = $userSession->id;
            $lib = new UserLibrary(); // Actualiza datos del usuario        
            $status = $lib->updateUserInfo($user);  
            if(!$status->error){
                //Actualiza en sesion                
                $userSession->name = $user->name;
                $userSession->lastname = $user->lastname;
                $userSession->email = $user->email;
                if(strlen($user->signatureb64) > 0){
                    $userSession->previewSign = $user->previewSign;
                }
                $session->set('user', $userSession);
            }             
            return json_encode($status); 
        }else{
            return null;  
        }           
    }

    public function updateUserPassword(){
        if ($this->request->isAJAX()) {
            $user = $this->request->getJsonVar('user');
            $session = session();
            $userSession = $session->get('user');
            $user->id = $userSession->id;
            $lib = new UserLibrary(); // Actualiza password del usuario        
            $status = $lib->updateUserPassword($user);             
            return json_encode($status); 
        }else{
            return null;  
        } 
    }

    public function getNotifications(){
        if ($this->request->isAJAX()) {
            $lib = new UserLibrary(); // Obtiene notificaciones del usuario        
            $not = $lib->getNotifications();             
            return json_encode($not); 
        }else{
            return null;  
        } 
    }

    public function setReadNotification(){
        if ($this->request->isAJAX()) {
            $id = $this->request->getJsonVar('id');
            $lib = new UserLibrary(); // Marcar lectura notificaciones del usuario        
            $not = $lib->setReadNotification($id);             
            return json_encode($not); 
        }else{
            return null;  
        } 
    }
    
    public function setReadAllNotifications(){
        if ($this->request->isAJAX()) {
            $lib = new UserLibrary(); // Marcar lectura notificaciones del usuario        
            $not = $lib->setReadAllNotifications();             
            return json_encode($not); 
        }else{
            return null;  
        } 
    }
}

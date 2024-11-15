<?php

namespace App\Controllers;

use App\Libraries\ForgotPasswordLibrary;

class RecoveryPassword extends BaseController
{
    public function index($token)
    {   
        $session = session();
        $session->setFlashdata('msg', '');
        //Valida token
        $lib = new ForgotPasswordLibrary();     
        $response = $lib->validateToken($token);  
        if($response->error){
            return view('RecoveryPassword/ValidaToken');
        }else{
            return view('RecoveryPassword/Index');            
        }
    }

    public function setNewPassword()
    {        
        $token = $this->request->getVar('token');
        $password = $this->request->getVar('passwordNew');
        try {
            $lib = new ForgotPasswordLibrary(); // Recuperar contraseña      
            $response = $lib->setNewPassword($token, $password);     
            if($response->error){
                //Error al recuperar contraseña
                $session = session();
                $session->setFlashdata('msg', $response->message);
                return view('RecoveryPassword/Index');
            }else{
                $session = session();
                $session->setFlashdata('msg', 'Operación exitosa, ingrese con su nueva contraseña.');
                return view('Login/Index');
            }
        } catch (\Exception $e) {
            $session = session();
            $session->setFlashdata('msg', 'Error inesperado: '.$e->getMessage());
            return view('RecoveryPassword/Index');
        }      
    }
    
}

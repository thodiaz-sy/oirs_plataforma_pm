<?php

namespace App\Controllers;

use App\Libraries\ForgotPasswordLibrary;

class ForgotPassword extends BaseController
{
    public function index()
    {   
        $session = session();
        $session->setFlashdata('msg', '');
        return view('ForgotPassword/Index');
    }

    public function recoveryPassword()
    {        
        $username = $this->request->getVar('username');
        try {
            //Inicia sesión
            $lib = new ForgotPasswordLibrary(); // Recuperar contraseña      
            $response = $lib->recoveryPassword($username);     
            if($response->error){
                //Error al recuperar contraseña
                $session = session();
                $session->setFlashdata('msg', $response->message);
                return view('ForgotPassword/Index');
            }else{
                $session = session();
                $session->setFlashdata('msg', 'Revise su correo coorporativo para recuperar su contraseña.');
                return view('Login/Index');
            }
        } catch (\Exception $e) {
            $session = session();
            $session->setFlashdata('msg', 'Error inesperado: '.$e->getMessage());
            return view('ForgotPassword/Index');
        }      
    }
    
}

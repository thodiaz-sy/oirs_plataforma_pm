<?php

namespace App\Controllers;

use App\Libraries\LoginLibrary;

class Login extends BaseController
{
    public function index()
    {        
        $isOk = false;
        //Verifica sesión
        try{
            $session = session();
            $user =  $session->get('user');
            if(isset($user)){
                return redirect()->to(base_url('index.php/Home/Index'));
            }
        } catch (\Exception $e) {
            $isOk = false;
        }
        if(!$isOk){
            $session = session();
            $session->setFlashdata('msg', '');
            return view('Login/Index');
        }
    }

    public function init()
    {        
        $username = $this->request->getVar('username');
        $password = $this->request->getVar('password');

        try {
            //Inicia sesión
            $lib = new LoginLibrary(); // Datos del usuario        
            $data = $lib->login($username, $password);     
            if(isset($data)){
                if(is_string($data)){ //Hay mensaje de error
                    $session = session();
                    $session->setFlashdata('msg', $data);
                    return view('Login/Index');
                }else{
                    //Sesión OK
                    $session = session();
                    $session->set('user',$data);
                    return redirect()->to(base_url('index.php/Home/Index'));
                }
            }else{
                $session = session();
                $session->setFlashdata('msg', 'El Usuario y/o Contraseña incorrecta.');
                return view('Login/Index');
            }
            } catch (\Exception $e) {
                $session = session();
                $session->setFlashdata('msg', 'Error inesperado: '.$e->getMessage());
                return view('Login/Index');
            }      
    }

    public function logout(){
        $session = session();
        $user = $session->get('user');
        $userID = 0;
        if(isset($user)){
            $userID = $user->id;            
            //Cierra sesion
            $lib = new LoginLibrary();
            $logout = $lib->logout($userID);
        }
        //Limpia sesión
        $session = \Config\Services::session();
        $session->remove('user');
        //Deriva a formulario login
        $session = session();
        $session->setFlashdata('msg', 'Su sesión se ha cerrado.');
        return view('Login/Index');
    }
}

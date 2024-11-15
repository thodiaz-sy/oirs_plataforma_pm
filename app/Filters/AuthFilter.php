<?php

namespace App\Filters;

use App\Libraries\LoginLibrary;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use CodeIgniter\Filters\FilterInterface;

class AuthFilter implements FilterInterface
{
    public function before(RequestInterface $request, $arguments = null)
    {
        $router = service('router');
        $controller  = $router->controllerName();
        if (!strpos(strtolower($controller), 'login') && !strpos(strtolower($controller), 'forgotpassword') && !strpos(strtolower($controller), 'recoverypassword') && !strpos(strtolower($controller), 'error') && !strpos(strtolower($controller), 'download')) {
            $valid = true;
            $userID  = 0;
            try{
                $user = session('user');
                if(isset($user)){ }
                else{ 
                    $valid = false;                 
                }           
            } catch (\Exception $e) {
                echo $e->getMessage();
                $valid = false; 
            }            
            
            if(!$valid){
                //Deriva a logout
                return redirect()->to(base_url('Login/Logout'));
            }
        }
    }

    public function after(RequestInterface $request, ResponseInterface $response, $arguments = null)
    {
        // Do something here
    }
}

?>
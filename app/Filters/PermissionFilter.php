<?php

namespace App\Filters;

use App\Libraries\LoginLibrary;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use CodeIgniter\Filters\FilterInterface;

class PermissionFilter implements FilterInterface
{
    public function before(RequestInterface $request, $arguments = null)
    {
        $router = service('router');
        $controller  = $router->controllerName();
        $method = $router->methodName();  
        $firstPage = '';
        $haveAccess = false;
        if(!strpos(strtolower($controller), 'home') && !strpos(strtolower($controller), 'login') && !strpos(strtolower($controller), 'forgotpassword') && !strpos(strtolower($controller), 'recoverypassword') && !strpos(strtolower($controller), 'master') && !strpos(strtolower($controller), 'error') && !strpos(strtolower($controller), 'download')) { //Solo evalua cuando se carga la pagina y no es Home ni Login ni Master         
            try{
                $user = session('user');
                if(isset($user)){
                    $i = 0;
                    $userID = $user->id;
                    $menu = $user->menu; //Obtiene paginas asociadas al usuario                 
                    if(isset($userID) && isset($menu)){
                        $current  = strtolower($router->controllerName().'/'.'index');
                        foreach($menu as $page){ 
                            if($i == 0){ $firstPage = base_url($page['controller']); }
                            if(strpos($current, strtolower($page['controller']))) { $haveAccess = true; break;}
                            $i += 1;
                        }                    
                    }
                }   
            } catch (\Exception $e) {
                
            }  
            
            if(!$haveAccess){ //No tiene acceso?
                if(strtolower($method) == 'index') { //Si es una llamada a cargar la página
                    if($firstPage!=''){ return redirect()->to($firstPage); }  //Redirige a primera pagina permitida
                    else{ return redirect()->to(base_url('index.php/Home/Index'));  } //Redirige a Home
                }else{
                    die();
                }
            }
        }
    }

    public function after(RequestInterface $request, ResponseInterface $response, $arguments = null)
    {
        // Do something here
    }
}

?>
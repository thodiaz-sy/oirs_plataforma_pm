<?php

namespace App\Controllers;

use App\Libraries\Classes\FilterDatatable;
use App\Libraries\Classes\ResponseDatatable;
use App\Libraries\Classes\Response;
use App\Libraries\UserLibrary;

class User extends BaseController
{
    public function index()
    {        
        return view('User/Index');
    }

    public function getProfiles()
    {
        $lib = new UserLibrary(); // Obtiene perfiles para selects        
        $profiles = $lib->getProfiles();         
        return json_encode($profiles); 
    }

    public function getBranchs()
    {
        $lib = new UserLibrary(); // Obtiene sucursales para selects        
        $branch = $lib->getBranchs();         
        return json_encode($branch); 
    }

    public function getAreas()
    {
        $lib = new UserLibrary(); // Obtiene areas para selects        
        $areas = $lib->getAreas();         
        return json_encode($areas); 
    }

    public function getUsersBackups()
    {
        if ($this->request->isAJAX()) {
            $profile_id = $this->request->getJsonVar('profile_id');
            $user_id = $this->request->getJsonVar('user_id');
            $lib = new UserLibrary(); // Obtiene uuarios para selects        
            $users = $lib->getUsersBackups($profile_id, $user_id);         
            return json_encode($users); 
        }else{
            return null;  
        }
    }

    public function getUsers(){     
        $total = 0;  
        $data = [];  
        $draw = $this->request->getPost('draw');
        if ($this->request->isAJAX()) {
            //Opciones de datatable
            $filter = new FilterDatatable();
            $filter->draw = $draw;
            $filter->start = $this->request->getPost('start');
            $filter->length = $this->request->getPost('length');
            $order = $this->request->getPost('order');
            $filter->column = $order[0]["column"]; 
            $filter->direction = $order[0]["dir"]; 
            
            //Filtros
            $id = $this->request->getPost('id');
            $username = $this->request->getPost('username');
            $profile = $this->request->getPost('profile');
            $blocked = $this->request->getPost('blocked'); 

            // Obtiene usuarios para table
            $lib = new UserLibrary();         
            $ret = $lib->getUsers($id, $username, $profile, $blocked, $filter, 0); //Obtiene usuarios activos
            if(!$ret->error){
                $total = $ret->values[0];
                $data = $ret->values[1];    
                $applyFilter = $ret->values[2];         
            }   
        }
        
        $response = new ResponseDatatable();
        $response->draw = $draw;
        $response->recordsTotal = $total;
        $response->recordsFiltered = $applyFilter ? count($data) : $total;
        $response->data = $data;
        
        return json_encode($response); 
    }

    public function getUserByID()
    {
        if ($this->request->isAJAX()) {
            $userID = $this->request->getJsonVar('userID');
            $lib = new UserLibrary(); // Obtiene datos del usuario      
            $user = $lib->getUserByID($userID);   
            return json_encode($user); 
        }else{
            return null;  
        }
    }
    
    public function saveUser()
    {
        if ($this->request->isAJAX()) {
            $user = $this->request->getJsonVar('user');
            $lib = new UserLibrary(); // Grabar usuario        
            $status = $lib->saveUser($user);               
            return json_encode($status); 
        }else{
            return null;  
        }    
    }

    public function getDisabledUsers(){     
        $total = 0;  
        $data = [];  
        $draw = $this->request->getPost('draw');
        if ($this->request->isAJAX()) {
            //Opciones de datatable
            $filter = new FilterDatatable();
            $filter->draw = $draw;
            $filter->start = $this->request->getPost('start');
            $filter->length = $this->request->getPost('length');
            $order = $this->request->getPost('order');
            $filter->column = $order[0]["column"]; 
            $filter->direction = $order[0]["dir"]; 
            
            $id = $this->request->getPost('id');
            $username = $this->request->getPost('username');
            $profile = $this->request->getPost('profile');
            $blocked = $this->request->getPost('blocked'); 

            // Obtiene usuarios para table
            $lib = new UserLibrary();         
            $ret = $lib->getUsers($id, $username, $profile, $blocked, $filter, 1); //Obtiene usuarios desactivados
            if(!$ret->error){
                $total = $ret->values[0];
                $data = $ret->values[1];    
                $applyFilter = $ret->values[2];         
            }   
        }
        
        $response = new ResponseDatatable();
        $response->draw = $draw;
        $response->recordsTotal = $total;
        $response->recordsFiltered = $applyFilter ? count($data) : $total;
        $response->data = $data;
        
        return json_encode($response); 
    }

    public function disableUser()
    {
        if ($this->request->isAJAX()) {
            $userID = $this->request->getJsonVar('userID');
            $lib = new UserLibrary(); // Desactiva usuario        
            $status = $lib->disableUser($userID);   
            return json_encode($status); 
        }else{
            return null;  
        }    
    }

    public function enableUser()
    {
        if ($this->request->isAJAX()) {
            $userID = $this->request->getJsonVar('userID');
            $lib = new UserLibrary(); // Habilita usuario        
            $status = $lib->enableUser($userID);   
            return json_encode($status); 
        }else{
            return null;  
        }    
    }
    
    public function deleteUser()
    {
        if ($this->request->isAJAX()) {
            $userID = $this->request->getJsonVar('userID');
            $lib = new UserLibrary(); // Elimina definitivo usuario        
            $status = $lib->deleteUser($userID);   
            return json_encode($status); 
        }else{
            return null;  
        }    
    }

    public function changeStatusUser()
    {
        if ($this->request->isAJAX()) {
            $userID = $this->request->getJsonVar('userID');
            $status = $this->request->getJsonVar('status');
            $lib = new UserLibrary(); // Bloquea/Desbloquea usuario        
            $ret = $lib->changeStatusUser($userID, $status);   
            return json_encode($ret); 
        }else{
            return null;  
        }    
    }
}

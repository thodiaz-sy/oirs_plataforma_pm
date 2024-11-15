<?php

namespace App\Controllers;
use App\Libraries\InboxLibrary;
use App\Libraries\Classes\Response;
use App\Libraries\Classes\FilterDatatable;
use App\Libraries\Classes\ResponseDatatable;
use phpDocumentor\Reflection\DocBlock\Tags\Var_;

class Inbox extends BaseController
{
    public function index()
    {        
        $lib = new InboxLibrary(); // Obtiene estados para filtro        
        $status = $lib->getStatusFilter();   
        $data["status"] = json_decode(json_encode($status));
        $permission = $lib->getPermissionPage(); //Obtiene permisos de pagina
        $data["permission"] = json_decode(json_encode($permission));
        return view('Inbox/Index', $data);
    }

    public function read($invoice)
    {        
        $lib = new InboxLibrary();       
        $response = $lib->getFormID($invoice); // Obtiene datos del formulario 
        $data["invoice"] = $invoice;
        if(!$response->error){
            $data["form"] = json_decode(json_encode($response->values[0]));
            $actions = "";
            $form_permission = $response->values[1];
            if(isset($form_permission) && isset($form_permission->actions)){
                $actions = $form_permission->actions;
            }
            $data["form_permission"] = $actions;
            $permission = $lib->getPermissionPage(); //Obtiene permisos de pagina
            $data["permission"] = json_decode(json_encode($permission));            
        }
        return view('Inbox/Read',$data);         
    }

    public function save($invoice = NULL)
    {        
        $lib = new InboxLibrary(); 
        if($invoice){
            $response = $lib->getFormID($invoice); // Obtiene datos del formulario 
            $data["invoice"] = $invoice;
            if(!$response->error){
                $form = $response->values[0];
                $data["form"] = json_decode(json_encode($form));
                $actions = "";
                $form_permission = $response->values[1];
                if(isset($form_permission) && isset($form_permission->actions)){
                    $actions = $form_permission->actions;
                }
                $data["form_permission"] = $actions;
                $permission = $lib->getPermissionPage(); //Obtiene permisos de pagina
                $data["permission"] = json_decode(json_encode($permission));            
            }
        }else{
            $permission = $lib->getPermissionPageStatus(0); //Obtiene permisos de pagina
            $data["permission"] = json_decode(json_encode($permission));
        }      
        
        return view('Inbox/Save',$data); 
                
    }

    //#region Index

    public function getTypes()
    {
        $lib = new InboxLibrary(); // Obtiene tipos para selects        
        $types = $lib->getTypes();         
        return json_encode($types); 
    }

    public function getBranchs()
    {
        $lib = new InboxLibrary(); // Obtiene sucursal para selects        
        $branchs = $lib->getBranchs();         
        return json_encode($branchs); 
    }

    public function getAreas()
    {
        $lib = new InboxLibrary(); // Obtiene areas para selects        
        $areas = $lib->getAreas();         
        return json_encode($areas); 
    }

    public function getSubAreas()
    {
        $lib = new InboxLibrary(); // Obtiene areas para selects        
        $subareas = $lib->getSubAreas();         
        return json_encode($subareas); 
    }

    public function getChannels()
    {
        $lib = new InboxLibrary(); // Obtiene vias de respuesta para selects        
        $channels = $lib->getChannels();         
        return json_encode($channels); 
    }

    public function getChannelsEntry()
    {
        $lib = new InboxLibrary(); // Obtiene canal de ingreso para selects        
        $channels = $lib->getChannelsEntry();         
        return json_encode($channels); 
    }

    public function getGenders()
    {
        $lib = new InboxLibrary(); // Obtiene genero para selects        
        $genders = $lib->getGenders();         
        return json_encode($genders); 
    }

    public function getRegions()
    {
        $lib = new InboxLibrary(); // Obtiene regiones para selects        
        $regions = $lib->getRegions();         
        return json_encode($regions); 
    }

    public function getDistrictsByRegion()
    {
        if ($this->request->isAJAX()) {
            $region_id = $this->request->getJsonVar('region_id');
            $lib = new InboxLibrary(); // Obtiene comunas para selects        
            $districts = $lib->getDistrictsByRegion($region_id);         
            return json_encode($districts); 
        }else{
            return null;  
        }        
    }

    public function getStatusFilter()
    {
        $lib = new InboxLibrary(); // Obtiene estados para filtro        
        $status = $lib->getStatusFilter();         
        return json_encode($status); 
    }

    public function getForms(){     
        $total = 0;  
        $data = []; 
        $applyFilter = false; 
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
            $status = $this->request->getPost('status');
            $invoice = $this->request->getPost('invoice');
            $rut = $this->request->getPost('rut');
            $date_init = $this->request->getPost('date_init');
            $date_end = $this->request->getPost('date_end');
            $type = $this->request->getPost('type'); 

            // Obtiene proyectos para table
            $lib = new InboxLibrary();         
            $ret = $lib->getForms($status,$invoice, $rut, $date_init, $date_end,  $type, $filter); //Obtiene formularios
            if(!$ret->error){
                $total = $ret->values[0];
                $data = $ret->values[1];    
                $applyFilter = $ret->values[2];            
            }   
            // var_dump($ret);
        }
        
        $response = new ResponseDatatable();
        $response->draw = $draw;
        $response->recordsTotal = $total;
        $response->recordsFiltered = $applyFilter ? count($data) : $total;
        $response->data = $data; 
        //Pasa detalle de permisos 
        $session = \Config\Services::session();
        $user = $session->get('user');    
        $response->permission = $user->permission;
        return json_encode($response); 
    }

    //#endregion

    //#region Read

    public function getFormDocuments(){
        if ($this->request->isAJAX()) {
            $form_id = $this->request->getJsonVar('form_id');
            $lib = new InboxLibrary(); // Obtiene documentos del formulario      
            $form = $lib->getFormDocuments($form_id);   
            return json_encode($form); 
        }else{
            return null;  
        }
    }

    public function uploadFormDocument()
    {   
        $response = new Response();
        try {
            //Validación de archivo // 'max_size[fileForm, 4096]',
            $validateDoc = $this->validate([
                'fileForm' => [
                    'uploaded[fileForm]',
                    'ext_in[fileForm,png,jpg,jpeg,gif,pdf,doc,docx,xls,xlsx,msg,ppt,pptx]'                    
                ],
            ]);        
            if ($validateDoc) { //Valida extensiones y tamaño de 4MB max
                $file = $this->request->getFile('fileForm');
                $form_id = $this->request->getPost('form_id');
                $response->error = true;
                $response->values = null;
                $lib = new InboxLibrary(); // Sube documento        
                $response = $lib->uploadFormDocument($file, $form_id);   
            }else{
                $response->error = true;
                $response->values = null;
                $response->message = "EXT";
            }            
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        return json_encode($response); 
    }

    public function uploadFormDocumentTemp()
    {   
        $response = new Response();
        try {
            //Validación de archivo // 'max_size[fileForm, 4096]',
            $validateDoc = $this->validate([
                'fileForm' => [
                    'uploaded[fileForm]',
                    'ext_in[fileForm,png,jpg,jpeg,gif,pdf,doc,docx,xls,xlsx,msg,ppt,pptx]'                    
                ],
            ]);        
            if ($validateDoc) { //Valida extensiones y tamaño de 4MB max
                $file = $this->request->getFile('fileForm');
                $form_id = $this->request->getPost('form_id');
                $response->error = true;
                $response->values = null;
                $lib = new InboxLibrary(); // Sube documento        
                $response = $lib->uploadFormDocumentTemp($file);   
            }else{
                $response->error = true;
                $response->values = null;
                $response->message = "EXT";
            }            
        } catch (\Exception $e) {
            $response->error = true;
            $response->values = null;
            $response->message = $e->getMessage();
        }
        return json_encode($response); 
    }

    public function downloadFormDocument($upload_name,$original_name,$path)
    {   
        helper('download');
        $folder = (strlen($path) > 0 ? $path.'/' : '');
        $path = WRITEPATH . 'uploads/'.$folder.$upload_name;
        return $this->response->download($path, null)->setFileName($original_name);
    }

    public function deleteFormDocument()
    {   
        $response = new Response();   
        if ($this->request->isAJAX()) {
            $upload_name = $this->request->getJsonVar('upload_name'); 
            $doc_id = $this->request->getJsonVar('doc_id');   
            $path = $this->request->getJsonVar('path');     
            try {
                helper('filesystem');
                $folder = (strlen($path) > 0 ? $path.'/' : '');
                unlink(WRITEPATH . 'uploads/'.$folder.$upload_name);
                //Elimina en BD
                $lib = new InboxLibrary(); // Sube documento        
                $response = $lib->deleteFormDocument($doc_id);   
                //Prepara respuesta
                $response->error = false;
                $response->values = null;            
            } catch (\Exception $e) {
                $response->error = true;
                $response->values = null;
                $response->message = $e->getMessage();
            }            
        }else{
            $response->error = true;
            $response->values = 'noajax';
            $response->message = '';
        }    
        return json_encode($response);
    }

    public function getFormHistory(){
        if ($this->request->isAJAX()) {
            $form_id = $this->request->getJsonVar('form_id');
            $lib = new InboxLibrary(); // Obtiene historial del formulario      
            $form = $lib->getFormHistory($form_id);   
            return json_encode($form); 
        }else{
            return null;  
        }
    }

    public function saveHistory()
    {
        if ($this->request->isAJAX()) {
            $form_id = $this->request->getJsonVar('form_id');
            $comment = $this->request->getJsonVar('comment');
            $lib = new InboxLibrary(); // Guarda comentario        
            $form = $lib->saveHistory($form_id, $comment);   
            return json_encode($form); 
        }else{
            return null;  
        }
    }

    public function deleteHistory()
    {
        if ($this->request->isAJAX()) {
            $form_id = $this->request->getJsonVar('form_id');
            $historyID = $this->request->getJsonVar('historyID');
            $lib = new InboxLibrary(); // Elimina comentario        
            $form = $lib->deleteHistory($form_id, $historyID);   
            return json_encode($form); 
        }else{
            return null;  
        }
    }

    //#endregion

    public function saveForm()
    {
        if ($this->request->isAJAX()) {
            $form = $this->request->getJsonVar('form');
            $lib = new InboxLibrary(); // Guarda        
            $response = $lib->saveForm($form);         
            return json_encode($response); 
        }else{
            return null;  
        }        
    }

    //#region Actions
    public function discardForm()
    {   
        $response = new Response();   
        if ($this->request->isAJAX()) {
            $form_id = $this->request->getJsonVar('form_id');   
            try {
                $lib = new InboxLibrary();   
                $response = $lib->discardForm($form_id);           
            } catch (\Exception $e) {
                $response->error = true;
                $response->values = null;
                $response->message = $e->getMessage();
            }            
        }else{
            $response->error = true;
            $response->values = 'noajax';
            $response->message = '';
        }    
        return json_encode($response);
    }

    public function recoveryForm()
    {   
        $response = new Response();   
        if ($this->request->isAJAX()) {
            $form_id = $this->request->getJsonVar('form_id');   
            try {
                $lib = new InboxLibrary();      
                $response = $lib->recoveryForm($form_id);               
            } catch (\Exception $e) {
                $response->error = true;
                $response->values = null;
                $response->message = $e->getMessage();
            }            
        }else{
            $response->error = true;
            $response->values = 'noajax';
            $response->message = '';
        }    
        return json_encode($response);
    }

    public function deleteForm()
    {   
        $response = new Response();   
        if ($this->request->isAJAX()) {
            $form_id = $this->request->getJsonVar('form_id');   
            try {
                //Elimina en BD
                $lib = new InboxLibrary();       
                $response = $lib->deleteForm($form_id);         
            } catch (\Exception $e) {
                $response->error = true;
                $response->values = null;
                $response->message = $e->getMessage();
            }            
        }else{
            $response->error = true;
            $response->values = 'noajax';
            $response->message = '';
        }    
        return json_encode($response);
    }

    public function getReasignProfiles()
    {
        if ($this->request->isAJAX()) {
            $form_id = $this->request->getJsonVar('form_id');
            $lib = new InboxLibrary(); // Obtiene usuarios      
            $form = $lib->getReasignProfiles($form_id);   
            return json_encode($form); 
        }else{
            return null;  
        }
    }

    public function reasignProfiles()
    {   
        $response = new Response();   
        if ($this->request->isAJAX()) {
            $form_id = $this->request->getJsonVar('form_id');
            $user_entry_id = $this->request->getJsonVar('user_entry_id'); 
            $user_entry = $this->request->getJsonVar('user_entry'); 
            $user_manager_id = $this->request->getJsonVar('user_manager_id'); 
            $user_manager = $this->request->getJsonVar('user_manager');
            $user_director_id = $this->request->getJsonVar('user_director_id'); 
            $user_director = $this->request->getJsonVar('user_director');        
            try {
                //Reasigna en BD
                $lib = new InboxLibrary();       
                $response = $lib->reasignProfiles($form_id, $user_entry_id, $user_entry, $user_manager_id, $user_manager, $user_director_id, $user_director);   
            } catch (\Exception $e) {
                $response->error = true;
                $response->values = null;
                $response->message = $e->getMessage();
            }            
        }else{
            $response->error = true;
            $response->values = 'noajax';
            $response->message = '';
        }    
        return json_encode($response);
    }

    public function sendForm()
    {   
        $response = new Response();   
        if ($this->request->isAJAX()) {
            $form_id = $this->request->getJsonVar('form_id');   
            $comment = $this->request->getJsonVar('comment');  
            $rejection = $this->request->getJsonVar('rejection');    
            try {
                $lib = new InboxLibrary();       
                $response = $lib->sendForm($form_id, $comment, $rejection);              
            } catch (\Exception $e) {
                $response->error = true;
                $response->values = null;
                $response->message = $e->getMessage();
            }            
        }else{
            $response->error = true;
            $response->values = 'noajax';
            $response->message = '';
        }    
        return json_encode($response);
    }

    public function traerSubAreas()
    {   
        function login(){ 
            $serverName = "BDBI";
            $connectionInfo = array("Database"=>"BDOIRSPM_DEV", "UID"=>"usr_webdev", "PWD"=>"#desarrollo.2024");
            $conn = sqlsrv_connect( $serverName, $connectionInfo); 
            return($conn);
        }

        function closecon($conn){
        sqlsrv_close( $conn );
        }

        $conn = login();
        $idArea = $_POST['idArea'];
        $idAnterior = $_POST['idAnterior'];

        // echo 'Backend: '.$idArea;
        // echo 'Anterior: '.$idAnterior;
        // exit;

        $query = "SELECT idSubArea,descSubArea,idArea FROM subareas WHERE idArea = $idArea";
        // echo $query;
        // exit;
        $resultado = sqlsrv_query($conn, $query);
        $datos = array();
        $data = '';
        while ($row = sqlsrv_fetch_array($resultado, SQLSRV_FETCH_ASSOC)) {
            $datos[] = array(
                'idSubArea'         => $row['idSubArea'],
                'descSubArea' => $row['descSubArea'],
                'idArea'         => $row['idArea'],
            );
        }
        closecon($conn);
        for($i = 0; $i < count($datos); $i++){
            if($idAnterior == $datos[$i]['idSubArea']){
                $data = $data.'<option selected value="'.$datos[$i]['idSubArea'].'">'.utf8_encode($datos[$i]['descSubArea']).'</option>';
            } else {
                $data = $data.'<option value="'.$datos[$i]['idSubArea'].'">'.utf8_encode($datos[$i]['descSubArea']).'</option>';
            }
        };
        return($data);

    }

    public function previsualizar()
    {   
        function login(){ 
            $serverName = "BDBI";           
            $connectionInfo = array("Database"=>"BDOIRSPM_DEV", "UID"=>"usr_webdev", "PWD"=>"#desarrollo.2024");

            $conn = sqlsrv_connect( $serverName, $connectionInfo); 
            return($conn);
        }

        function closecon($conn){
        sqlsrv_close( $conn );
        }
        $session = session(); $user = $session->get('user');
        $conn = login();
        $formulario = $_POST['idformulario'];
        $query = "SELECT TOP 1
                        forms.invoice, 
                        forms.user_director,
                        CONCAT(forms.pacient_names,' ',forms.pacient_lastname,' ',forms.pacient_mlastname) as pacient, 
                        forms.pacient_email, 
                        FORMAT(forms.form_date_received,'dd/MM/yyyy') as entry_date, 
                        forms.form_subject_claim, 
                        forms.form_improve, 
                        users.name, 
                        users.lastname director, 
                        users.signature director_sign
                    FROM forms
                        LEFT JOIN users 
                            ON users.id = forms.user_director
                    WHERE forms.id = '$formulario'";

        $resultado = sqlsrv_query($conn, $query);
        $datos = array();
        while ($row = sqlsrv_fetch_array($resultado, SQLSRV_FETCH_ASSOC)) {
            $datos[] = array(
                'invoice'         => $row['invoice'],
                'iddirector' => $row['user_director'],
                'paciente'         => $row['pacient'],
                'correo_paciente'         => $row['pacient_email'],
                'fecha_ingreso'         => $row['entry_date'],
                'reclamo'         => $row['form_subject_claim'],
                'mejora'         => $row['form_improve'],
                'nombredir'         => $row['name'],
                'apellidodir'         => $row['director'],
                'firma'         => $row['director_sign']
            );
        }    
        $session = session();
        $userSession = $session->get('user');
        $user->id = $userSession->id;
        closeCon($conn);
        return '<div class="container">
                    <input id="idDirector" type="hidden" value="'.$userSession->id.'"/>
                    <div class="text-center mb-3">
                        <img style="width:80px"  src="'.base_url().'/public/img/pm-logo-sm.png" alt="">
                    </div>
                    <div class="fecha text-right mb-3">
                        '.date('d-m-Y h:i:s').'
                    </div>
                    <div class="text-left mb-3">
                        Estimado(a),
                        <br>
                        '.utf8_encode($datos[0]['paciente']).'
                        <br>
                        '.$datos[0]['correo_paciente'].'
                    </div>
                    <div class="text-right mb-3">
                        Ant: Presentación/Folio: <b>'.$datos[0]['invoice'].'</b>
                    </div>
                    <div class="text-left mb-3">
                        De mi consideración:
                    </div>
                    <div class="text-justify mb-3">
                        Junto con saludar, acuso recibo de su reclamo de fecha '.$datos[0]['fecha_ingreso'].', referente al caso: <b>'.utf8_encode($datos[0]['reclamo']).'</b>.
                        <b>'.utf8_encode($datos[0]['mejora']).'</b>.
                        <br>
                        <br>
                        En caso de disconformidad con el contenido de la respuesta que da nuestra institución, usted
                        podrá solicitar a la Superintendencia de Salud su revisión, dentro de un plazo de 5 días hábiles,
                        contados desde la fecha de notificación de ésta (Ley 20.584 de Derechos y Deberes de los
                        pacientes).
                        <br>
                        <br>
                        Le saluda atentamente,
                    </div>
                    <div class="text-right">
                        <b>*Firma Director*</b>
                        <br>
                        <b>'.$user->name.' '.$user->lastname.'</b>
                        <br>
                        Director Técnico
                        <br>
                        Centro Odontológico Padre Mariano
                    </div>
                </div>';

    }
    public function claveDirector()
    {   
        function login(){ 
            $serverName = "BDBI";
            $connectionInfo = array("Database"=>"BDOIRSPM_DEV", "UID"=>"usr_webdev", "PWD"=>"#desarrollo.2024");
            $conn = sqlsrv_connect( $serverName, $connectionInfo); 
            return($conn);
        }

        function closecon($conn){
        sqlsrv_close( $conn );
        }

        $conn = login();
        $director = $_POST['iddirector'];
        $query = "SELECT contrasena FROM users WHERE id = '$director'";

        $resultado = sqlsrv_query($conn, $query);
        $datos = array();
        while ($row = sqlsrv_fetch_array($resultado, SQLSRV_FETCH_ASSOC)) {
            $datos[] = array(
                'clave'         => $row['contrasena']
            );
        }    
        
        closeCon($conn);
        return $datos[0]['clave'];

    }

    public function insistForm()
    {   
        $response = new Response();   
        if ($this->request->isAJAX()) {
            $form_id = $this->request->getJsonVar('form_id');   
            $comment = $this->request->getJsonVar('comment');  
            try {
                $lib = new InboxLibrary();       
                $response = $lib->insistForm($form_id, $comment);              
            } catch (\Exception $e) {
                $response->error = true;
                $response->values = null;
                $response->message = $e->getMessage();
            }            
        }else{
            $response->error = true;
            $response->values = 'noajax';
            $response->message = '';
        }    
        return json_encode($response);
    }

    //#endregion
}

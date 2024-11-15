<?php
namespace App\Libraries;

use App\Libraries\Classes\Response;
use App\Models\EmailModel;
use CodeIgniter\I18n\Time;
use CodeIgniter\HTTP\CURLRequest;
class EmailLibrary
{
    public function send($to, $cc, $email_id, $json_params, $json_attachments)
    {   
        //Envio de correo
        $db_pm_motor_correo = null;
        $response = new Response();
        try {
            //Obtiene prioridad
            $pm_motor_correo_priority = getenv('pm_motor_correo_priority');
            //Parametros
            $email_have_parameters = 0;
            if(isset($json_params) && strlen($json_params) > 0){
                $email_have_parameters = 1;
                $email_parameters = $json_params;                   
            }
            //Adjuntos
            $email_have_attach = 0;
            if(isset($json_attachments) && strlen($json_attachments) > 0){
                $attch_list = json_decode($json_attachments);
                if(isset($attch_list) && count($attch_list) > 0){
                    $email_have_attach = 1;
                }                    
            }   

            //Prepara datos para insertar
            $data = [
                'email_to' => $to,
                'email_cc' => $cc,
                'email_have_template' => 1,
                'email_template_id' => $email_id,
                'email_have_parameters' =>  $email_have_parameters,
                'email_parameters' => $email_parameters,
                'email_have_attach' => $email_have_attach,
                'email_priority' => $pm_motor_correo_priority
            ];      
            

            //Conecta a BD            
            $db_pm_motor_correo = db_connect('pm_motor_correo'); 
            $builder = $db_pm_motor_correo->table('request_mail_delivery'); 
            $db_pm_motor_correo->query("set language 'us_english'");   
            $builder->insert($data);
            $insertID = $db_pm_motor_correo->insertID();
            if(isset($insertID)){
                //Inserta adjuntos
                if($email_have_attach == 1){
                    if(isset($json_attachments)){
                        $attachments_list = json_decode($json_attachments);
                        if(isset($attachments_list) && count($attachments_list) > 0){
                            $downloadController = base_url('index.php/download/downloadresource');
                            foreach($attachments_list as $attach){
                                $path = $attach->attachment_path;
                                if($attach->attachment_type == "GET"){
                                    $path = $downloadController.'/'.$attach->attachment_path.'/'.$attach->attachment_name;
                                }
                                $dataAttach = [
                                    'request_mail_id' => $insertID,
                                    'attachment_name' => $attach->attachment_name,
                                    'attachment_type' => $attach->attachment_type,
                                    'attachment_path' => $path,
                                    'attachment_temp' =>  $attach->attachment_temp
                                ];    
                                $builderAttach = $db_pm_motor_correo->table('request_mail_attachment'); 
                                $builderAttach->insert($dataAttach);
                            }
                        }                     
                    }        
                }
                //Activa para envío    
                $builder->where('id', $insertID);
                $builder->update(['status_id' => 1]);
                //Prepara respuesta
                $response->error = false;
                $response->message = $insertID;
            }else{
                //Prepara respuesta
                $response->error = true;
                $response->message = $insertID;
            }
                    
        } catch (\Exception $e) {
           //Prepara respuesta
           $response->error = true;
           $response->message = $e;
        }
        if($db_pm_motor_correo != null){$db_pm_motor_correo->close();}
        
        return $response;
    }

    public function send_by_app($to, $cc, $email_id, $json_params, $json_attachments)
    {   
        //Envio de correo
        $db = null;
        $response = new Response();
        try {
            //Obtiene el correo
            $db = db_connect();
            $emailModel = new EmailModel($db);
            $data = $emailModel->where('id', $email_id)->first();
            if(isset($data)){
                $from_email =  $data['from_email'];
                $from_name =  $data['from_name'];
                $subject =  $data['subject'];
                $body =  $data['body'];
                $cid_have =  $data['cid_have'];
                $cid_json_list =  $data['cid_json_list'];
                
                $email = \Config\Services::email();    
                // $config['protocol'] = 'smtp';
                // $config['smtp_host'] = 'smtp.office365.com';
                // $config['smtp_port'] = '587';
                // $config['smtp_timeout'] = '7';
                // $config['smtp_user'] = 'adminwebprueba@cumbredental.cl';
                // $config['smtp_pass'] = 'AdminPrueba5285';
                // $config['charset'] = 'utf-8';
                // $config['newline'] = "\r\n";
                // $config['mailtype'] = 'html'; // or html
                // $config['validation'] = TRUE;
                // $email->initialize($config);

                $email->setFrom($from_email, $from_name);
                $email->setTo($to);//Correo destino
                                
                $email->setCC($cc);//CC
                
                //Reemplaza valores dinamicos en correo
                if(isset($json_params)){
                    $params_list = json_decode($json_params);
                    if(isset($params_list) && count($params_list) > 0){
                        foreach($params_list as $param){ 
                            $body = str_replace($param->key, $param->value, $body);
                            $subject = str_replace($param->key, $param->value, $subject);
                        }
                    }                    
                }   
                
                //Añade CID si aplica
                if($cid_have == 1 && isset($cid_json_list)){
                    $cid_list = json_decode($cid_json_list);
                    if(isset($cid_list) && count($cid_list) > 0){
                        foreach($cid_list as $cid){ 
                            $filename = '';
                            if($cid->local == 1){ $filename = WRITEPATH.$cid->file; }
                            else{ $filename = $cid->file; }
                            $email->attach($filename);
                            $cid_generate = $email->setAttachmentCID($filename);
                            $body = str_replace($cid->key, $cid_generate, $body);
                        }
                    }
                }
                //  die;
                $email->setSubject($subject);
                $email->setMessage($body);

                //Adjunta correo
                if(isset($json_attachments)){
                    $attachments_list = json_decode($json_attachments);
                    if(isset($attachments_list) && count($attachments_list) > 0){
                        foreach($attachments_list as $attach){ 
                            $email->attach($attach->file);
                            if($attach->temp == 1){ //Si es un adjunto temporal se elimina
                                unlink($attach->file);
                            }
                        }
                    }                     
                }                
                    
                $email->send();
                //echo $email->printDebugger(['headers', 'subject', 'body']);
                //Prepara respuesta
                $response->error = false;
                $response->message = $email->printDebugger(['headers', 'subject', 'body']);

            }else{
                //Prepara respuesta
                $response->error = true;
                $response->message = "No se encontró datos de correo para el envío.";
            }            
        } catch (\Exception $e) {
           //Prepara respuesta
           $response->error = true;
           $response->message = $e;
        }
        if($db != null){$db->close();}
        
        return $response;
    }
}
?>
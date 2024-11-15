<?php

namespace App\Controllers;

class Download extends BaseController
{
    public function downloadResource($path,$upload_name)
    {   
        helper('download');
        $folder = (strlen($path) > 0 ? $path.'/' : '');
        $path = WRITEPATH . 'uploads/'.$folder.$upload_name;
        return $this->response->download($path, null)->setFileName($upload_name);
    }
}

<?php
namespace App\Libraries;

use App\Models\MenuModel;

class BaseLibrary
{
    public function getMenu($usuarioID)
    {   
        //Obtiene perfiles de usuario
        $profileID = 1;
        $db = db_connect();
        $builder = $db->table('menus');
        $builder->select('pages.id, pages.controller, pages.description, pages.icon, pages.parent_id, pages.is_parent, pages.section, pages.order_parent, pages.order_child');
        $builder->join('pages', 'pages.id = menus.page_id');
        $builder->where('menus.profile_id', $profileID);
        $builder->where('menus.deleted_at', null);
        $builder->where('pages.deleted_at', null);
        $builder->orderBy('pages.order_parent', 'ASC');
        $query = $builder->get();

        $menu = array('menu'=>$query->getResultArray());
        return $menu;
    }

}
?>
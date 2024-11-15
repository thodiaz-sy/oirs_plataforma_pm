<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <link rel="shortcut icon" href="<?=base_url()?>/public/img/pm-favicon.png">

  <!-- General CSS Files -->
  <link rel="stylesheet" href="<?=base_url()?>/public/vendors/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="<?=base_url()?>/public/vendors/fontawesome-free/css/all.min.css">

  <!-- CSS Libraries -->
  <link rel="stylesheet" href="<?=base_url()?>/public/vendors/select2/dist/css/select2.css">
  <link rel="stylesheet" href="<?=base_url()?>/public/vendors/button-loader/buttonLoader.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
  <!-- Template CSS -->
  <link rel="stylesheet" href="<?=base_url()?>/public/css/_master/master_style.css">
  <link rel="stylesheet" href="<?=base_url()?>/public/css/_master/master_components.css">

  <!-- Jquery -->
  <script src="<?=base_url()?>/public/vendors/jquery/dist/jquery.min.js"></script>
  <script src="<?=base_url()?>/public/vendors/popper.js/dist/umd/popper.min.js"></script>
  <script src="<?=base_url()?>/public/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
  <!-- Custom Header -->
  <?= $this->renderSection('header')?>
</head>

<body class="sidebar-mini">
<?php $session = session(); $user = $session->get('user'); ?>
  <div class="loading-process" style="display:none;"><i class="fas fa-circle-notch fa-2x fa-spin"></i></div>
  <div id="app">
    <div class="main-wrapper">
      <div class="navbar-bg"></div>
      <nav class="navbar navbar-expand-lg main-navbar">
        <form class="form-inline mr-auto">
          <ul class="navbar-nav mr-3">
            <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg"><i class="fas fa-bars"></i></a></li>
          </ul>
          
        </form>
        <ul class="navbar-nav navbar-right">  
        <li class="dropdown dropdown-list-toggle"><a href="#" data-toggle="dropdown" class="nav-link notification-toggle nav-link-lg beep" id="btnNotification"><i class="fas fa-bell"></i></a>
            <div class="dropdown-menu dropdown-list dropdown-menu-right">
              <div class="dropdown-header">Notificaciones
                <div class="float-right">
                  <a href="#" id="btnSetReadAllNotification">Marcar como leídas</a>
                </div>
              </div>
              <div class="dropdown-list-content dropdown-list-icons" id="notificationsList">
                <a href="#" class="dropdown-item dropdown-item-unread">
                  <div class="dropdown-item-icon bg-warning text-white">
                    <i class="fas fa-ticket-alt"></i>
                  </div>
                  <div class="dropdown-item-desc">
                    Se ha registrado una nueva solicitud <b>#1111</b>.
                    <div class="time text-primary">15/07/2022 12:00:00</div>
                  </div>
                </a>
                <a href="#" class="dropdown-item">
                  <div class="dropdown-item-icon bg-warning text-white">
                    <i class="fas fa-ticket-alt"></i>
                  </div>
                  <div class="dropdown-item-desc">
                    Se ha registrado una nueva solicitud <b>#2222</b>.
                    <div class="time text-primary">15/07/2022 11:00:00</div>
                  </div>
                </a>
                <a href="#" class="dropdown-item">
                <div class="dropdown-item-icon bg-danger text-white">
                    <i class="fas fa-bell"></i>
                  </div>
                  <div class="dropdown-item-desc">
                    La solicitud <b>#3333</b> fue rechazada.
                    <div class="time text-primary">15/07/2022 10:00:00</div>
                  </div>
                </a>
              </div>
              <div class="dropdown-footer text-center">
                <a href="<?php echo base_url('index.php/Inbox/Index')?>">Ver solicitudes <i class="fas fa-chevron-right"></i></a>
              </div>
            </div>
          </li>        
          <li class="dropdown"><a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
            <img alt="image" src="<?=base_url()?>/public/img/avatar/avatar-3.png" class="rounded-circle mr-1">
            <div class="d-sm-none d-lg-inline-block">Bienvenido(a) <span class="spanName"><?php echo $user->name.' '.$user->lastname ?></span></div></a>
            <div class="dropdown-menu dropdown-menu-right">
              <a href="javascript:void(0)" class="dropdown-item has-icon" id="btnAccount">
                <i class="fas fa-cog"></i> Perfil
              </a>
              <a href="javascript:void(0)" class="dropdown-item has-icon" id="btnPassword">
                <i class="fas fa-lock"></i> Cambiar contraseña
              </a>
              <div class="dropdown-divider"></div>
              <a href="<?php echo base_url('index.php/Login/Logout') ?>" class="dropdown-item has-icon text-danger" id="btnLogout">
                <i class="fas fa-sign-out-alt"></i> Cerrar sesión
              </a>
            </div>
          </li>
        </ul>
      </nav>
      <div class="main-sidebar">
        <aside id="sidebar-wrapper">
          <div class="sidebar-brand">
            <a href="#"><img src="<?=base_url()?>/public/img/pm-logo.png" class="img-logo"/></a>
          </div>
          <div class="sidebar-brand sidebar-brand-sm">
            <a href="#"><img src="<?=base_url()?>/public/img/pm-logo-sm.png" class="img-logo-sm"/></a>
          </div>
          <ul class="sidebar-menu pt-3">

          <?php          
            //Renderiza menú según usuario
            if(isset($user->menu)){
                $menu = $user->menu;
                //Obtiene controlador activo
                $router = service('router');
                $controller  = strtolower($router->controllerName().'/'.$router->methodName());                
                foreach($menu as $page){ 
                  //Verifica si elemento tiene una sección
                  if(isset($page['section']) && $page['parent_id'] == 0){
                    echo '<li class="menu-header">'.$page['section'].'</li>';
                  } 
                    //Renderiza submenus                              
                    if($page['is_parent'] == 1){
                      //Obtiene hijos
                      $parent_id = $page['id'];                     
                      $children = array_filter($menu, function($obj) use ($parent_id, $controller){
                          if (isset($obj["parent_id"]) && $obj["parent_id"] == $parent_id) {                              
                              return true;
                          }
                          return false;
                      });
                      //Ordena hijos
                      usort($children, function($a, $b){
                        return $a['order_child'] <=> $b['order_child'];
                      });
                      //Renderiza elemento padre y hijos
                      if(count($children) > 0){
                        echo '<li class="nav-item dropdown">'; //Se activa si hijo está activo en master/custom.js                    
                        echo '<a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="'.$page['icon'].'"></i><span>'.$page['description'].'</span></a>';
                        echo '<ul class="dropdown-menu">';
                        foreach($children as $child){ 
                          //Verifica si elemento tiene una sección
                          if(isset($child['section'])){
                            echo '<li class="menu-header">'.$child['section'].'</li>';
                          }
                          //Activa pagina en menú segun controlador
                          if(strpos($controller, strtolower($child['controller']))) { echo '<li class="child-menu active">'; }
                          else {echo '<li class="child-menu">';}
                          echo '<a class="nav-link" href="'.base_url('index.php/'.$child['controller']).'"><span>'.$child['description'].'</span></a>';
                          echo '</li>';
                        }
                        echo '</ul>';
                        echo '</li>';
                      }
                    }
                    else{ //Renderiza elementos unicos en menú                       
                        if($page['parent_id'] == 0){
                          //Activa pagina en menú segun controlador
                          if(strpos($controller, strtolower($page['controller']))) { echo '<li class="active">'; }
                          else {echo '<li>';}
                          //Despliega item menu
                          echo '<a class="nav-link" href="'.base_url('index.php/'.$page['controller']).'"><i class="'.$page['icon'].'"></i> <span>'.$page['description'].'</span></a></li>';
                        }
                      }
                }
            }            
            ?>            
            </ul>
        </aside>
      </div>

      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
              <!-- Custom Section Header -->
              <?= $this->renderSection('section-header')?>            
          </div>

          <div class="section-body">
              <!-- Custom Section Body -->
              <?= $this->renderSection('section-body')?>
          </div>
        </section>
      </div>
      <footer class="main-footer">
        <div class="footer-left">
          Copyright &copy; <?php echo date("Y");?> <div class="bullet"></div> Made with <i class="fas fa-heart"></i></a>
        </div>
        <div class="footer-right">
          1.0.0
        </div>
      </footer>
    </div>
  </div>
  <!-- Modals de master -->

  <div class="modal" tabindex="-1" role="dialog" id="modalAccount" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Actualizar Perfil</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body mt-1 need-validation">
          <div class="row">
            <div class="col-md-12">
              <p><i class="fas fa-user"></i>&nbsp;&nbsp;Datos de usuario</p>
              <hr/>
            </div>
          </div>
          <div class="row">
              <div class="col-xs-12 col-md-6">
                <div class="form-group">
                  <label>Nombre</label>
                  <input type="text" name="txtAccountName" id="txtAccountName" class="form-control" maxlength="100" value="<?php echo $user->name ?>" require/>
                  <div class="invalid-feedback">
                    Debe ingresar nombre
                  </div>
                </div>              
              </div>
              <div class="col-xs-12 col-md-6">
                <div class="form-group">
                  <label>Apellido</label>
                  <input type="text" name="txtAccountLastName" id="txtAccountLastName" class="form-control" maxlength="100" value="<?php echo $user->lastname ?>" require/>
                  <div class="invalid-feedback">
                    Debe ingresar apellido
                  </div>
                </div>
              </div>
          </div>
          <div class="row">
            <div class="col-xs-12 col-md-6">
              <div class="form-group">
                <label>Correo</label>
                <input type="text" name="txtAccountEmail" id="txtAccountEmail" class="form-control" maxlength="50" value="<?php echo $user->email ?>" require/>
                <div class="invalid-feedback">
									Debe ingresar correo válido
								</div>
              </div>
            </div>
            <div class="col-xs-12 col-md-6">
                <div class="form-group">
                  <label>Perfil</label>
                  <?php 
                  $profiles = 'Sin información';
                  if(isset($user->profile)){
                    $profiles = $user->profile;
                  }
                  ?>
                  <input type="text" name="txtAccountProfile" id="txtAccountProfile" class="form-control" maxlength="100" disabled="disabled" value="<?php echo $profiles ?>"/>
                </div>
              </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <p><i class="fas fa-signature"></i>&nbsp;&nbsp;Firma digital</p>
              <hr/>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-12 col-md-6">
            <div class="form-group needs-validation" id="upload_sing_form_profile">
              <label>Imágen de Firma <span class="required">(*)</span></label>
              <div class="custom-file mb-3">
              <input type="hidden" id="hdnSignProfile" value="<?php echo  isset($user) && isset($user->signature) && strlen($user->signature) > 0 ? $user->signature : '' ?>"/>
              <input type="file" class="custom-file-input <?php echo isset($user) && isset($user->signature) && strlen($user->signature) > 0 ? 'loaded' : '' ?>" id="fileSignProfile" data-validate='sign' name="fileSignProfile" onchange="onFileUpload(this);"  accept="image/*" data-type='image' />
              <label class="custom-file-label" for="fileSignProfile" id="labelfileSignProfile">...</label>
              <div class="invalid-feedback mt-3">
                Debe seleccionar imagen (Sólo se aceptan archivos: JPG y PNG)
              </div>
              </div>
            </div>
            </div>
            <div class="col-xs-12 col-md-6">
            <div class="form-group">
              <label>Vista Previa</label>
              <div class="text-center">
              <img class="ml-2" id="imgPreviewProfile" src="<?php echo isset($user) && isset($user->previewSign) && strlen($user->previewSign) > 0 ? $user->previewSign : base_url().'/public/img/sign/preview.png' ?>" width="200px"/>
              </div>
            </div>
            </div>                    
          </div>
          <div class="alert alert-secondary col-xs-12 col-md-12" role="alert">
            <strong>Importante:</strong> Es necesario subir una foto de su firma. <a id="btnSignExample" data-toggle="collapse" href="#modalSignExample" role="button" aria-expanded="false" aria-controls="modalSignExample" class="text-primary">Ver ejemplos y recomendaciones.</a>                 
          </div>
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" id="btnUpdateUserInfo">Guardar</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>  

  <div class="modal" tabindex="-1" role="dialog" id="modalPassword" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Actualizar Contraseña</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>        
        <div class="modal-body mt-1 need-validation">
            <div class="row">
              <div class="col-md-12">
                <p><i class="fas fa-user"></i>&nbsp;&nbsp;Datos de cuenta</p>
                <hr/>
              </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-md-6">
                  <div class="form-group">
                    <label>Usuario</label>
                    <input type="text" name="txtAccountUser" id="txtAccountUser" class="form-control" maxlength="100" disabled="disabled" value="<?php echo $user->username ?>"/>
                  </div>              
                </div>
                <div class="col-xs-12 col-md-6">
                  <div class="form-group">
                    <label>Fecha último cambio</label>
                    <input type="text" name="txtAccountPasswordChanged" id="txtAccountPasswordChanged" class="form-control" maxlength="100" disabled="disabled" value="<?php echo $user->updated_password ?>"/>
                  </div>
                </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <p><i class="fas fa-lock"></i>&nbsp;&nbsp;Cambiar contraseña</p>
                <hr/>
              </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-md-4">
                  <div class="form-group">
                    <label>Ingrese su contraseña actual</label>
                    <input type="password" name="txtAccountCurrentPassword" id="txtAccountCurrentPassword" class="form-control" maxlength="100"/>
                    <div class="invalid-feedback">
                      Debe ingresar contraseña actual
                    </div>
                  </div>
                </div>
                <div class="col-xs-12 col-md-4">
                  <div class="form-group">
                    <label>Ingrese su nueva contraseña</label>
                    <input type="password" name="txtAccountNewPassword" id="txtAccountNewPassword" class="form-control" maxlength="100"/>
                    <div class="invalid-feedback">
                      Debe ingresar nueva contraseña válida
                    </div>
                  </div>
                </div>
                <div class="col-xs-12 col-md-4">
                  <div class="form-group">
                    <label>Confirme nueva contraseseña</label>
                    <input type="password" name="txtAccountConfirmNewPassword" id="txtAccountConfirmNewPassword" class="form-control" maxlength="100"/>
                    <div class="invalid-feedback">
                      Debe ingresar confirmación válida
                    </div>
                  </div>
                </div>
                <div class="col-sm-12 col-md-12">
                  <div class="alert-message alert-message-info mt-0">
                    <h6>Política de contraseñas</h6>
                    <p>
                      <ul>
                        <li>Debe contener al menos una mayúscula y un número.</li>
                        <li>Debe contener al menos un carácter especial (#,.*$).</li>
                        <li>Debe tener un tamaño de al menos 10 caracteres.</li>
                      </ul>
                    </p>
                  </div>
                </div>
            </div>             
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" id="btnUpdatePassword">Guardar</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
          </div>
      </div>
    </div>
  </div> 

  <div class="modal" tabindex="-1" role="dialog" id="modalSignExample" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Ejemplo de firmas</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body mt-1">
          <div class="row">
            <div class="col-xs-12 col-md-6">
              <div class="alert-message alert-message-info mt-0">
                <h6>Recomendaciones para su firma</h6>
                <p>
                  <ul>
                    <li>Debe ser una imagen.</li>
                    <li>Debe tener fondo blanco y el color de la firma en negro o azul.</li>
                    <li>Evite las sombras y asegúrese que en la foto su firma se vea completamente.</li>
                    <li>Capture su firma de forma horizontal.</li>
                    <li>Evite que la foto tenga márgenes blancos muy grandes.</li>
                  </ul>
                </p>
              </div>
            </div>
            <div class="col-xs-12 col-md-6">
              <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                  <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img class="d-block w-100" src="<?=base_url()?>/public/img/sign/1.png" alt="Primer Ejemplo">
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100" src="<?=base_url()?>/public/img/sign/2.png" alt="Segundo Ejemplo">
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100" src="<?=base_url()?>/public/img/sign/3.png" alt="Tercer Ejemplo">
                  </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="sr-only">Anterior</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="sr-only">Siguiente</span>
                </a>
              </div>
            </div>            
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>

   <!-- Fin Modals de master -->         
  <?= $this->renderSection('section-modals')?>

  <!-- General JS Scripts -->
  <script src="<?=base_url()?>/public/vendors/jquery.nicescroll/dist/jquery.nicescroll.min.js"></script>
  <script src="<?=base_url()?>/public/vendors/moment/min/moment.min.js"></script>
  <script src="<?=base_url()?>/public/vendors/select2/dist/js/select2.min.js"></script>
  <script src="<?=base_url()?>/public/vendors/select2/dist/js/i18n/es.js"></script>
  <script src="<?=base_url()?>/public/vendors/sweetalert/dist/sweetalert.min.js"></script>
  <script src="<?=base_url()?>/public/vendors/tooltip.js/dist/umd/tooltip.min.js"></script>
  <script src="<?=base_url()?>/public/vendors/button-loader/jquery.buttonLoader.js"></script>
  <script src="<?=base_url()?>/public/js/_master/stisla.js"></script>

  <!-- JS Libraies -->

  <!-- Template JS File -->
  <script src="<?=base_url()?>/public/js/_master/master_utils.js"></script>
  <script src="<?=base_url()?>/public/js/_master/master_custom.js"></script>
  <script src="<?=base_url()?>/public/js/_master/master_scripts.js"></script>

  <!-- Page Specific JS File -->
  <script type='text/javascript'>
    var baseURL= "<?php echo base_url();?>"+"/index.php"; //Base para llamar a metodos controlador desde Jquery
    var baseURLContent= "<?php echo base_url();?>"; //Base para llamar a contenidos desde Jquery
    sessionStorage.setItem('userID',<?php echo $user->id?>); //Guarda el ID del usuario para la renderización
  </script>
  <?= $this->renderSection('section-scripts')?>
</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <link rel="shortcut icon" href="<?=base_url()?>/public/img/pm-favicon.png">
  <title>Olvidé mi contraseña &mdash; Plataforma OIRS</title>

    <!-- General CSS Files -->
    <link rel="stylesheet" href="<?=base_url()?>/public/vendors/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="<?=base_url()?>/public/vendors/fontawesome-free/css/all.min.css">

  <!-- CSS Libraries -->
  <link rel="stylesheet" href="<?=base_url()?>/public/vendors/button-loader/buttonLoader.css">

  <!-- Template CSS -->
  <link rel="stylesheet" href="<?=base_url()?>/public/css/_master/master_style.css">
  <link rel="stylesheet" href="<?=base_url()?>/public/css/_master/master_components.css">

  <!-- Jquery -->
  <script src="<?=base_url()?>/public/vendors/jquery/dist/jquery.min.js"></script>
  <script src="<?=base_url()?>/public/vendors/popper.js/dist/umd/popper.min.js"></script>
  <script src="<?=base_url()?>/public/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
  <script src="<?=base_url()?>/public/vendors/button-loader/jquery.buttonLoader.js"></script>

</head>

<body>
  <div id="app">
    <section class="section">
      <div class="d-flex flex-wrap align-items-stretch">
        <div class="col-lg-4 col-md-6 col-12 order-lg-1 min-vh-100 order-2 bg-white">
          <div class="p-4 m-3">
            <div class="text-center">
              <img src="<?=base_url()?>/public/img/pm-logo-sm.png" alt="logo" width="80" class="shadow-light mb-5 mt-2">
              <h4 class="text-dark font-weight-normal mb-4">Olvidé mi contraseña</h4>
            </div>
			          <?php if(session()->getFlashdata('msg')):?>
                    <div class="alert alert-info">
                       <?= session()->getFlashdata('msg') ?>
                    </div>
                    <script>
                      $("#btnRecovery").buttonLoader('stop');
                    </script>
                <?php endif;?>
            <form method="POST" action="<?php echo base_url(); ?>/index.php/ForgotPassword/recoveryPassword" class="needs-validation" novalidate="" id="forgotPassword" name="login">
              <div class="form-group">
                <label for="username">Usuario</label>
                <input id="username" type="text" class="form-control" name="username" tabindex="1" required autofocus>
                <div class="invalid-feedback">
                  Ingrese su usuario
                </div>
              </div>

              <div class="form-group text-right">
              <button type="submit" class="btn btn-primary btn-lg btn-icon icon-right mr-2 mt-2" tabindex="2" id="btnRecovery" data-load-text="Procesando">
                    Recuperar contraseña
                </button>
                <a href="<?php echo base_url('index.php/Login/Index') ?>" class="btn btn-secondary btn-lg btn-icon icon-right mt-2" tabindex="3">
                    Cancelar
                </a>
              </div>

            </form>

          </div>
        </div>
        <div class="col-lg-8 col-12 order-lg-2 order-1 min-vh-100 background-walk-y position-relative overlay-gradient-bottom" data-background="<?=base_url()?>/public/img/unsplash/login-bg.jpg">
          <div class="absolute-bottom-left index-2">
            <div class="text-light p-5 pb-2">
              <div class="mb-5 pb-3">
                <h1 class="mb-2 display-4 font-weight-bold">Recuperar contraseña</h1>
                <h4>en Plataforma OIRS - Centro Odontológico Padre Mariano</h4>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>

  <!-- General JS Scripts -->
  <script src="<?=base_url()?>/public/vendors/jquery.nicescroll/dist/jquery.nicescroll.min.js"></script>
  <script src="<?=base_url()?>/public/vendors/moment/min/moment.min.js"></script>
  <script src="<?=base_url()?>/public/vendors/select2/dist/js/select2.min.js"></script>
  <script src="<?=base_url()?>/public/vendors/select2/dist/js/i18n/es.js"></script>
  <script src="<?=base_url()?>/public/vendors/sweetalert/dist/sweetalert.min.js"></script>
  <script src="<?=base_url()?>/public/vendors/tooltip.js/dist/umd/tooltip.min.js"></script>
  <script src="<?=base_url()?>/public/js/_master/stisla.js"></script>

  <!-- JS Libraies -->

  <!-- Template JS File -->
  <script src="<?=base_url()?>/public/js/_master/master_custom.js"></script>
  <script src="<?=base_url()?>/public/js/_master/master_scripts.js"></script>
  <script src="<?=base_url()?>/public/js/ForgotPassword/forgot_password_custom.js"></script>

  <!-- Page Specific JS File -->
</body>
</html>

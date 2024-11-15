<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <link rel="shortcut icon" href="<?=base_url()?>/public/img/pm-favicon.png">
  <title>Página no autorizada &mdash; Plataforma OIRS</title>

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
<body class="sidebar-gone error-backgroud">
  <div id="app">
    <section class="section error-section">
      <div class="container mt-5">
        <div class="page-error">
          <div class="page-inner">
            <h2>Página no autorizada</h2>
            <div class="page-description mt-5">
			<p>
				<?php if (! empty($message) && $message !== '(null)') : ?>
					<?= nl2br(esc($message)) ?>
				<?php else : ?>
					Lo sentimos, el acceso a esta página está restringido. Contacte al administrador del sito.
				<?php endif ?>						
			</p>
            </div>
            <div class="mt-5">
				<a href="<?php echo site_url('index.php/Login/Index') ?>" class="btn btn-primary btn-lg">Ir al Inicio</a>
            </div>
          </div>
        </div>
        <div class="simple-footer mt-5">
			<div class="footer-left">
			Copyright &copy; <?php echo date("Y");?> <div class="bullet"></div> Made with <i class="fas fa-heart"></i></a>
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

</body>
</html>

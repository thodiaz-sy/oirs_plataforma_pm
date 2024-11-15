<?=$this->extend('_template/master')?>

<?=$this->section('header')?>

<title>Pagina inicial</title>

<?=$this->endSection('header')?>

<?=$this->section('section-header')?>
<?php $session = session(); $user = $session->get('user'); ?>
<h1>Bienvenido(a) <span class="spanName"><?php echo $user->name.' '.$user->lastname ?></span></h1>
<div class="section-header-breadcrumb">
	<div class="breadcrumb-item active"><a href="<?php echo base_url('index.php/Home/Index') ?>">Inicio</a></div>
	<div class="breadcrumb-item">Bienvenida</div>
</div>

<?=$this->endSection('section-header')?>

<?=$this->section('section-body')?>
<style>
    .card .tarjeta { 
      background-color: #21b8aa; 
	  border-radius: 15px;
	  color:white;
	  font-family: Arial !important;
    }

	.card .tarjetaTotal { 
      background-color: #1792b5; 
	  border-radius: 15px;
	  color:white;
	  font-family: Arial !important;
	 
    }
	.card .tarjeta .card-title{       
	  font-size: 0.9rem;
	  font-family: Arial !important;
    }
    .card p {
      font-size: 1.8rem; 
      font-weight: bold;
    }
	.card-body h4 {
      color:black;
    }
	
	#dateRange {
      font-size: 1.2rem;
      /* //padding: 5px 15px;  */
      width: 250px; 
	  font-family: Arial !important;
    }
    
    .daterangepicker td, .daterangepicker th {
      font-size: 1.1rem; 
    }
    .daterangepicker .drp-buttons .btn {
      font-size: 1rem; 
      padding: 5px 10px;
    }
	.totales{
		padding: 20px 400px 0px 400px;
	}
	.fecha{
		color:black;
		font-family: Arial !important;
	}
	
  </style>
<div class="row">
	<div class="col-md-12">
		<div class="card">			
			<div class="card-body">
				<div class="my-4">
				<div class="d-flex justify-content-end mb-4 fecha">
					<h3>14 Noviembre 2024</h3>
				</div>
				<div class="row totales justify-content-center ">					
					<div class="col w-50">
						<div class="card text-center tarjetaTotal">
							<div class="card-body">
							<h5 class="card-title">Ingresados del Mes</h5>
							<p class="display-6">29</p>
							</div>
						</div>
					</div>
					<div class="col w-50">
					<div class="card text-center tarjetaTotal">
						<div class="card-body">
						<h5 class="card-title">Gestionados del Mes</h5>
						<p class="display-6">20</p>
						</div>
					</div>
					</div>
					<div class="col w-50" >
						<div class="card text-center tarjetaTotal">
							<div class="card-body">
							<h5 class="card-title">Aprobados del Mes</h5>
							<p class="display-6">15</p>
							</div>
						</div>
					</div>
				</div>
				<div class="d-flex justify-content-end mb-4">
					<input type="text" id="dateRange" class="form-select w-auto">
				</div>
				<h4 class="card-header">Pendientes por aprobar</h4>
				<div class="row">
					<!-- Tarjetas -->
					<div class="col">
						<div class="card text-center tarjeta">
							<div class="card-body">
							<h5 class="card-title">Alcántara</h5>
							<p class="display-6">0</p>
							</div>
						</div>
					</div>
					<div class="col">
					<div class="card text-center tarjeta">
						<div class="card-body">
						<h5 class="card-title">Burgos</h5>
						<p class="display-6">2</p>
						</div>
					</div>
					</div>
					<div class="col">
						<div class="card text-center tarjeta">
							<div class="card-body">
							<h5 class="card-title">Providencia</h5>
							<p class="display-6">7</p>
							</div>
						</div>
					</div>

					<div class="col">
					<div class="card text-center tarjeta">
						<div class="card-body">
						<h5 class="card-title">Tenderini</h5>
						<p class="display-6">2</p>
						</div>
					</div>
					</div>
					<div class="col">
					<div class="card text-center tarjeta">
						<div class="card-body">
						<h5 class="card-title">Alameda</h5>
						<p class="display-6">1</p>
						</div>
					</div>
					</div>
				</div>

				
				<h4 class="card-header">Reclamos en gestor</h4>
				<div class="row ">
					<!-- Tarjetas -->
					<div class="col">
					<div class="card text-center tarjeta">
						<div class="card-body">
						<h5 class="card-title">Alcántara</h5>
						<p class="display-6">4</p>
						</div>
					</div>
					</div>
					<div class="col">
					<div class="card text-center tarjeta">
						<div class="card-body">
						<h5 class="card-title">Burgos</h5>
						<p class="display-6">1</p>
						</div>
					</div>
					</div>
					<div class="col">
					<div class="card text-center tarjeta">
						<div class="card-body">
						<h5 class="card-title">Providencia</h5>
						<p class="display-6">1</p>
						</div>
					</div>
					</div>
					<div class="col">
					<div class="card text-center tarjeta">
						<div class="card-body">
						<h5 class="card-title">Tenderini</h5>
						<p class="display-6">2</p>
						</div>
					</div>
					</div>
					<div class="col">
					<div class="card text-center tarjeta">
						<div class="card-body">
						<h5 class="card-title">Alameda</h5>
						<p class="display-6">4</p>
						</div>
					</div>
					</div>
				</div>

				<h4 class="card-header">Reclamos en ingreso</h4>
				<div class="row ">
					<!-- Tarjetas -->
					<div class="col">
					<div class="card text-center tarjeta">
						<div class="card-body">
						<h5 class="card-title">Alcántara</h5>
						<p class="display-6">1</p>
						</div>
					</div>
					</div>
					<div class="col">
					<div class="card text-center tarjeta">
						<div class="card-body">
						<h5 class="card-title">Burgos</h5>
						<p class="display-6">0</p>
						</div>
					</div>
					</div>
					<div class="col">
					<div class="card text-center tarjeta">
						<div class="card-body">
						<h5 class="card-title">Providencia</h5>
						<p class="display-6">2</p>
						</div>
					</div>
					</div>
					<div class="col">
					<div class="card text-center tarjeta">
						<div class="card-body">
						<h5 class="card-title">Tenderini</h5>
						<p class="display-6">1</p>
						</div>
					</div>
					</div>
					<div class="col">
					<div class="card text-center tarjeta">
						<div class="card-body">
						<h5 class="card-title">Alameda</h5>
						<p class="display-6">6</p>
						</div>
					</div>
					</div>
				</div>

				</div>
				<!-- <div id="carouselExampleIndicators3" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators3" data-slide-to="0" class="active"></li>
					<li data-target="#carouselExampleIndicators3" data-slide-to="1" class=""></li>
					<li data-target="#carouselExampleIndicators3" data-slide-to="2" class=""></li>
					</ol>
					<div class="carousel-inner">
					<div class="carousel-item carousel-item-next carousel-item-left">
						<img class="d-block w-100" src="<?=base_url()?>/public/img/news/img01.jpg" alt="First slide"/>
					</div> -->
					<!-- <div class="carousel-item">
						<img class="d-block w-100" src="/public/img/news/img02.jpg" alt="Second slide"/>
					</div>
					<div class="carousel-item active carousel-item-left">
						<img class="d-block w-100" src="/public/img/news/img03.jpg" alt="Third slide"/>
					</div> -->
					<!-- </div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators3" role="button" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
					</a>
					<a class="carousel-control-next" href="#carouselExampleIndicators3" role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
					</a>
				</div> -->
			</div>
		</div>
	</div>
</div>

<?=$this->endSection('section-body')?>

<?=$this->section('section-modals')?>

<?=$this->endSection('section-modals')?>

<?=$this->section('section-scripts')?>

<script src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>

<script>
  $(document).ready(function() {
    // Inicializar el selector de rango de fechas
    $('#dateRange').daterangepicker({
      locale: {
        format: 'DD-MM-YYYY', // Formato de fecha
        separator: ' - ',
        applyLabel: 'Aplicar',
        cancelLabel: 'Cancelar',
        fromLabel: 'Desde',
        toLabel: 'Hasta',
        customRangeLabel: 'Personalizado'
      }
    });
  });
</script>
<?=$this->endSection('section-scripts')?>
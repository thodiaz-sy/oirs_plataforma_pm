<?=$this->extend('_template/master')?>

<?=$this->section('header')?>

<title>Bandeja de Formularios</title>

<link rel="stylesheet" href="<?=base_url()?>/public/vendors/daterangepicker/daterangepicker.css">

<link rel="stylesheet" href="<?=base_url()?>/public/vendors/datatables/css/dataTables.min.css">
<link rel="stylesheet" href="<?=base_url()?>/public/vendors/datatables/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="<?=base_url()?>/public/vendors/datatables/css/select.bootstrap4.min.css">

<?=$this->endSection('header')?>

<?=$this->section('section-header')?>
<?php $session = session(); $user = $session->get('user');?>
<h1>Bandeja de Formularios</h1>
<div class="section-header-breadcrumb">
	<div class="breadcrumb-item active"><a href="<?php echo base_url('index.php/Home/Index') ?>">Inicio</a></div>
	<div class="breadcrumb-item">Bandeja</div>
</div>

<?=$this->endSection('section-header')?>

<?=$this->section('section-body')?>

<!-- Filtros -->
<div class="card">
	<div class="card-header">
		<h4>Filtros </h4>
		<div class="card-header-action">
			<a class="btn btn-primary" href="javascript:void(0)" id="btnFilter"><i class="fas fa-search"></i> Filtrar</a>
			<a class="btn btn-secondary" href="javascript:void(0)" id="btnFilterRemove"><i class="fas fa-redo"></i> Quitar filtro</a>
			<a data-collapse="#mycard-collapse" class="btn btn-icon btn-info" href="javascript:void(0)"><i class="fas fa-plus"></i></a>
		</div>
	</div>
	<div class="collapse" id="mycard-collapse">
		<div class="card-body">
			<div class="row">
				<div class="col-xs-12 col-md-3">
					<div class="form-group">
                      <label>Folio</label>
                      <input type="text" name="txtFilterInvoice" id="txtFilterInvoice" class="form-control" maxlength="10"/>
                    </div>
				</div>
				<div class="col-xs-12 col-md-3">
					<div class="form-group">
                      <label>Cédula de Identidad</label>
                      <input type="text" name="txtFilterRUT" id="txtFilterRUT" class="form-control" maxlength="100"/>
                    </div>
				</div>
				<div class="col-xs-12 col-md-3">
					<div class="form-group">
                      <label>Fecha (Desde/Hasta)</label>
					  <input type="text" name="txtFilterDate" id="txtFilterDate" class="form-control daterange" maxlength="100"/>
                    </div>
				</div>
				<div class="col-xs-12 col-md-3">
					<div class="form-group">
                      <label>Tipo de solicitud</label>
					  <select name="selFilterType" id="selFilterType" class="form-control selTipo">
					  </select>
                    </div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Fin Filtros -->
<!-- Tabla -->
<div class="row">
	<div class="col-12">
		<div class="card card-primary">
			<div class="card-header">
			<select name="selStatusFilter" id="selStatusFilter" class="form-control" style="width:200px">
			<?php $idx = 0;
				if(!$status->error && count($status->values) > 0){
					foreach($status->values as $stat){ 
						echo "<option ".($idx == 0 ? 'selected' : '')." value='".$stat->id."'>".$stat->status."</option>";
						$idx = 1;
					}					
				}else{
					echo "<option selected value='0'>Sin datos</option>";
				}
			?>
			</select>
			<div class="card-header-action position-right">
				<?php if(!$permission->error && count($permission->values) > 0){
						$canAdd = array_filter($permission->values, function($action) { return $action->action == "ADD"; });
						if(isset($canAdd) && count($canAdd) > 0){
							$detail = reset($canAdd);
							$href = "";
							if(isset($detail->href) && strlen($detail->href)> 0){
								if(strpos($detail->href, 'javascript') !== false){
									$href = $detail->href;
								}else{
									$href = site_url($detail->href);
								}
							}else{
								$href = "javascript:void(0);";
							}
							echo '<a href="'.$href.'" class="btn '.$detail->class.' mr-2"><i class="'.$detail->icon.'"></i> '.$detail->description.'</a>';
						}
					}
				?>				
			</div>
			</div>
			<div class="card-body">
				<table class="table table-bordered table-striped" id="table">
					<thead>
						<th>Folio</th>
						<th>Nombre</th>
						<th>Rut</th>
						<th>Fecha Recepción</th>
						<th>Fecha Ingreso</th>
						<th>Sucursal</th>
						<th>Área</th>
						<th>Tipo</th>
						<th>Estado</th>
						<th>Acciones</th>
					</thead>
					<tbody>
						
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- Fin Tabla -->

<?=$this->endSection('section-body')?>

<?=$this->section('section-modals')?>

<?php echo @view('Inbox/Actions'); ?>

<?=$this->endSection('section-modals')?>

<?=$this->section('section-scripts')?>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div id="resumenModal" class="modal-body"></div>
	  <div class="modal-body">
		<div class="form-group">
			<label for="">Contraseña de Director</label>
			<input id="claveDirector" class="form-control" type="password">
		</div>
	  </div>
      <div class="modal-footer">
        <button id="btnCerrar" type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button id="btnAprobar" disabled type="button" class="btn btn-primary row-btn-approve2">Aprobar</button>
      </div>
    </div>
  </div>
</div>


<script src="<?=base_url()?>/public/vendors/daterangepicker/daterangepicker.min.js"></script>

<script src="<?=base_url()?>/public/vendors/datatables/js/datatables.min.js"></script>
<script src="<?=base_url()?>/public/vendors/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="<?=base_url()?>/public/vendors/datatables/js/dataTables.select.min.js"></script>

<script src="<?=base_url()?>/public/js/Inbox/inbox_custom.js"></script>
<script src="<?=base_url()?>/public/js/Inbox/actions_custom.js"></script>

<?=$this->endSection('section-scripts')?>
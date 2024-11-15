<?=$this->extend('_template/master')?>

<?=$this->section('header')?>

<title>Usuarios</title>
<link rel="stylesheet" href="<?=base_url()?>/public/vendors/datatables/css/dataTables.min.css">
<link rel="stylesheet" href="<?=base_url()?>/public/vendors/datatables/css/dataTables.bootstrap4.min.css">

<?=$this->endSection('header')?>

<?=$this->section('section-header')?>

<h1>Mantenedor de Usuarios</h1>
<div class="section-header-breadcrumb">
	<div class="breadcrumb-item active"><a href="<?php echo base_url('index.php/Home/Index') ?>">Inicio</a></div>
    <div class="breadcrumb-item active"><a href="#">Mantenedores</a></div>
	<div class="breadcrumb-item">Usuarios</div>
</div>

<?=$this->endSection('section-header')?>

<?=$this->section('section-body')?>

<!-- Filtros -->
<div class="card">
	<div class="card-header">
		<h4>Filtros</h4>
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
                      <label>ID Usuario</label>
                      <input type="number" name="txtFilterID" id="txtFilterID" class="form-control" maxlength="10"/>
                    </div>
				</div>
				<div class="col-xs-12 col-md-3">
					<div class="form-group">
                      <label>Usuario</label>
                      <input type="text" name="txtFilterUsername" id="txtFilterUsername" class="form-control" maxlength="100"/>
                    </div>
				</div>				
				<div class="col-xs-12 col-md-3">
					<div class="form-group">
                      <label>Perfil</label>
					  <select name="selFilterProfile" id="selFilterProfile" class="form-control selProfile">
					  </select>
                    </div>
				</div>
				<div class="col-xs-12 col-md-3">
					<div class="form-group">
                      <label>Bloqueado</label>
					  <select name="selFilterActive" id="selFilterActive" class="form-control selActive select2">
					  	  <option value="0">Todos</option>
						  <option value="1">Si</option>
						  <option value="2">No</option>
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
			<h4>Usuarios</h4>
			<div class="card-header-action">
				<a class="btn btn-danger" href="javascript:void(0)" id="btnDisabledUsers"><i class="fas fa-user-alt-slash"></i> Usuarios desactivados</a>
				<a class="btn btn-success" href="javascript:void(0)" id="btnNewUser"><i class="fas fa-plus"></i> Crear usuario</a>
			</div>
			</div>
			<div class="card-body">
				<table class="table table-bordered table-striped" id="table">
					<thead>
						<th>ID</th>
						<th>Usuario</th>
						<th>Nombre</th>
						<th>Perfil</th>
						<th>Correo</th>
						<th>Bloqueado</th>
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

<!-- Modal de usuarios -->

<div class="modal" tabindex="-1" role="dialog" id="modalUser" data-backdrop="static" data-keyboard="false">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">		
		<div class="modal-header">
			<h5 class="modal-title" id="modalUserTitle"></h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="modal-body mt-1">
			<div class="row">
				<div class="col-xs-12 col-md-6">
					<div class="form-group">
						<label>Usuario</label>
						<input type="text" name="txtUserUsername" id="txtUserUsername" class="form-control" maxlength="100" required/>
						<div class="invalid-feedback">
							Debe ingresar usuario
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-md-6">
					<div class="form-group">
						<label>Contraseña</label>
						<input type="password" name="txtUserPassword" id="txtUserPassword" class="form-control" maxlength="100"/>
						<div class="invalid-feedback">
							Debe ingresar contraseña válida
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-md-6">
					<div class="form-group">
						<label>Nombre</label>
						<input type="text" name="txtUserName" id="txtUserName" class="form-control" maxlength="100" required/>
						<div class="invalid-feedback">
							Debe ingresar nombre
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-md-6">
					<div class="form-group">
						<label>Apellido</label>
						<input type="text" name="txtUserLastname" id="txtUserLastname" class="form-control" maxlength="100" required/>
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
						<input type="text" name="txtUserMail" id="txtUserMail" class="form-control" maxlength="50" required/>
						<div class="invalid-feedback">
							Debe ingresar correo válido
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-md-6">
					<div class="form-group">
						<label>Perfil</label>
						<select name="selUserProfile" id="selUserProfile" class="form-control" required>
						</select>
						<div class="invalid-feedback">
							Debe seleccionar un perfil
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-md-6" id="inputBranch" style="display:none;">
					<div class="form-group">
						<label>Sucursal</label>
						<select name="selBranch" id="selBranch" class="form-control" required>
						</select>
						<div class="invalid-feedback">
							Debe seleccionar una sucursal
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-md-6" id="inputArea" style="display:none;">
					<div class="form-group">
						<label>Área</label>
						<select name="selArea" id="selArea" class="form-control" required>
						</select>
						<div class="invalid-feedback">
							Debe seleccionar un perfil
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-md-6" id="inputBackup" style="display:none;">
					<div class="form-group">
						<label>Subrogantes</label>
						<select name="selBackup" id="selBackup" class="form-control" multiple="multiple">
						</select>
					</div>
				</div>
			</div>
			<div id="divContrasenaDirector" class="row">
				<div class="col-xs-12 col-md-6">
					<div class="form-group">
						<label>Contraseña de Aprobación: </label>
						<input maxlength="6" class="form-control" name="contrasenaDirector" id="contrasenaDirector" type="password">
					</div>
					<div class="invalid-feedback">
						Debe escribir una contraseña
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12 col-md-12">
					<div class="alert-message alert-message-info">
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
			<input type="hidden" id="hdnIDUser" value=""/>
			<button type="button" class="btn btn-primary" id="btnSaveUser">Guardar</button>
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
		</div>		
    </div>
  </div>
</div>

<!-- Fin Modal de usuarios -->

<!-- Modal de usuarios Desactivados -->

<div class="modal" tabindex="-1" role="dialog" id="modalDisabledUser" data-backdrop="static" data-keyboard="false">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Usuarios Desactivados</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mt-1">
	  			<table class="table table-bordered table-striped" id="tableDisabled">
					<thead>
						<th>ID</th>
						<th>Usuario</th>
						<th>Nombre</th>
						<th>Correo</th>
						<th>Desactivado</th>
						<th>Acciones</th>
					</thead>
					<tbody>
						
					</tbody>
				</table>
      </div>
      <div class="modal-footer">		  
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

<!-- Fin Modal de Proyectos Desactivados -->

<?=$this->endSection('section-modals')?>

<?=$this->section('section-scripts')?>

<script src="<?=base_url()?>/public/vendors/datatables/js/datatables.min.js"></script>
<script src="<?=base_url()?>/public/vendors/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="<?=base_url()?>/public/vendors/datatables/js/dataTables.select.min.js"></script>
<script src="<?=base_url()?>/public/js/User/user_classes.js"></script>
<script src="<?=base_url()?>/public/js/User/user_custom.js"></script>

<?=$this->endSection('section-scripts')?>
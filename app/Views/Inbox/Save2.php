<?=$this->extend('_template/master')?>

<?=$this->section('header')?>

<title><?php if(isset($invoice)) { echo 'Editar Formulario';} else{ echo 'Crear Formulario';} ?></title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>

<link rel="stylesheet" href="<?=base_url()?>/public/vendors/daterangepicker/daterangepicker.css">

<link rel="stylesheet" href="<?=base_url()?>/public/vendors/datatables/css/dataTables.min.css">
<link rel="stylesheet" href="<?=base_url()?>/public/vendors/datatables/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="<?=base_url()?>/public/vendors/datatables/css/select.bootstrap4.min.css">

<link rel="stylesheet" href="<?=base_url()?>/public/css/inbox/inbox_save.css">
<link rel="stylesheet" href="<?=base_url()?>/public/css/inbox/timeline.css">
<link rel="stylesheet" href="<?=base_url()?>/public/css/inbox/todo.css">

<?=$this->endSection('header')?>

<?=$this->section('section-header')?>
<?php $session = session(); $user = $session->get('user'); ?>
<h1><?php if(isset($invoice)) { echo 'Editar Formulario - Folio:'.$invoice;} else{ echo 'Crear Formulario';} ?></h1>
<div class="section-header-breadcrumb">
	<div class="breadcrumb-item active"><a href="<?php echo base_url('index.php/Home/Index') ?>">Inicio</a></div>
	<div class="breadcrumb-item"><?php if(isset($invoice)) { echo 'Editar Formulario';} else{ echo 'Crear Formulario';} ?></div>
</div>

<?=$this->endSection('section-header')?>

<?=$this->section('section-body')?>

<!-- Formulario -->
<div class="card">
	<div class="card-body pb-0">
		<?php if(!isset($invoice) || (isset($invoice) && isset($form))){
			$canManagement = isset($form_permission) && strpos($form_permission, 'MANAGEMENT') !== false ? true : false;
			?>
			
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link active" id="pacient-tab" data-toggle="tab" href="#pacient" role="tab" aria-controls="pacient" aria-selected="true">Identificación</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="form-tab" data-toggle="tab" href="#form" role="tab" aria-controls="form" aria-selected="false">Datos del formulario</a>
				</li>
				<?php if($canManagement){ ?>
				<li class="nav-item">
					<a class="nav-link" id="management-tab" data-toggle="tab" href="#management" role="tab" aria-controls="management" aria-selected="false">Gestión Interna</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="paciente-tab" data-toggle="tab" href="#gesPaciente" role="tab" aria-controls="management" aria-selected="false">Gestión Paciente</a>
				</li>
				<?php } ?>
				<li class="nav-item">
					<a class="nav-link" id="docs-tab" data-toggle="tab" href="#docs" role="tab" aria-controls="docs" aria-selected="false">Documentos</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="bit-tab" data-toggle="tab" href="#bit" role="tab" aria-controls="bit" aria-selected="false">Bitácora</a>
				</li>
			</ul>
			<form autocomplete="off">
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active tab-parent-save" id="pacient" role="tabpanel" aria-labelledby="pacient-tab">
					<div class="card no-box-shadow">
						<div class="card-header">
						<h4>Identificación del Paciente</h4>
						</div>
						<div class="card-body pb-0">
						<div class="row">
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Nombres <span class="required">(*)</span></label>
								<input type="text" onkeyup="primeroMayus(this);" name="txtName" id="txtName" class="form-control requiredForSave" maxlength="100" required value="<?php echo  isset($form) ? $form->pacient_names : '' ?>" />
								<div class="invalid-feedback">
								Debe ingresar Nombres del paciente
								</div>
							</div>
							</div>
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Apellido Paterno <span class="required">(*)</span></label>
								<input type="text" onkeyup="primeroMayus(this);" name="txtLastname" id="txtLastname" class="form-control requiredForSave" maxlength="100" required value="<?php echo  isset($form) ? $form->pacient_lastname : '' ?>"/>
								<div class="invalid-feedback">
								Debe ingresar Apellido Paterno del paciente
								</div>
							</div>
							</div>
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Apellido Materno <span class="required">(*)</span></label>
								<input type="text" onkeyup="primeroMayus(this);" name="txtLastname2" id="txtLastname2" class="form-control requiredForSave" maxlength="100" required value="<?php echo  isset($form) ? $form->pacient_mlastname : '' ?>"/>
								<div class="invalid-feedback">
								Debe ingresar Apellido Materno del paciente
								</div>
							</div>
							</div>
							<div class="col-xs-12 col-md-3">
								<?php
									if(isset($invoice)) {
								?>
									<input type="hidden" class="requiredForSave custom-file-input" id="fileForm" name="fileForm">
								<?php
									} else {
								?>
								<div class="form-group">
									<form method="post" id="upload_docs_form" enctype="multipart/form-data" onkeydown="return event.key != 'Enter';">
										<span class="fw-600">Subir documento</span>
										<div class="custom-file mb-3 mt-2">
											<input type="file" class="requiredForSave custom-file-input" id="fileForm" name="fileForm">
											<label class="custom-file-label" for="fileForm" id="labelFileForm">...</label>
											<div class="invalid-feedback">
												Debe seleccionar archivo
											</div>
										</div>
									</form>
								</div>
								<?php
									}
								?>
								<input type="hidden" name="txtSocialName" id="txtSocialName" class="form-control" maxlength="100" value="<?php echo  isset($form) ? $form->pacient_social_name : '' ?>"/>
							<!-- <div class="form-group">
								<label>Nombre social</label>
								<input type="text" name="txtSocialName" id="txtSocialName" class="form-control" maxlength="100" value="<?php echo  isset($form) ? $form->pacient_social_name : '' ?>"/>
								<div class="invalid-feedback">
								Debe ingresar Nombre social del paciente
								</div>
							</div> -->
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Cédula de Identidad <span class="required">(*)</span></label>
								<input type="text" name="txtRUT" id="txtRUT" maxlength="10" class="form-control mask-rut requiredForSave" required aria-describedby="basic-addon2" data-validate='rut' value="<?php echo  isset($form) ? $form->pacient_rut : '' ?>"/>
								<div class="invalid-feedback">
								Debe ingresar Cédula de Identidad del paciente válida
								</div> 
							</div>
							</div>
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Género <span class="required">(*)</span></label>
								<input type="hidden" id="selGenderEdit" value="<?php echo  isset($form) ? $form->pacient_gender_id : '' ?>" />
								<select id="selGender" class="form-control selGender requiredForSave" required></select>
								<div class="invalid-feedback">
								Debe seleccionar Género del paciente
								</div>
							</div>
							</div>
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Teléfono <span class="required">(*)</span></label>
								<input type="number" name="txtPhone" id="txtPhone" class="form-control requiredForSave" maxlength="9" required oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" value="<?php echo  isset($form) ? $form->pacient_phone : '' ?>"/>
								<div class="invalid-feedback">
								Debe ingresar Teléfono del paciente
								</div>
							</div>
							</div>
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Correo <span class="required">(*)</span></label>
								<input type="email" name="txtEmail" id="txtEmail" class="form-control requiredForSave" maxlength="255" required value="<?php echo  isset($form) ? $form->pacient_email : '' ?>"/>
								<div class="invalid-feedback">
								Debe ingresar Correo del paciente válido
								</div>
							</div>
							</div>                  
						</div>
						<div class="row">
							<div class="col-xs-12 col-md-6">
							<div class="form-group">
								<label>Dirección Particular <span class="required">(*)</span></label>
								<input type="text" name="txtAddress" id="txtAddress" class="form-control requiredForSave" maxlength="100" required value="<?php echo  isset($form) ? $form->pacient_address : '' ?>"/>
								<div class="invalid-feedback">
								Debe ingresar Dirección Particular del paciente
								</div>
							</div>
							</div> 
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Región <span class="required">(*)</span></label>
								<input type="hidden" id="selRegionEdit" value="<?php echo  isset($form) ? $form->pacient_region_id : '' ?>" />
								<select id="selRegion" class="form-control selRegion requiredForSave" data-district="#selDistrict" required></select>
								<div class="invalid-feedback">
								Debe seleccionar Región
								</div>
							</div>
							</div>
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Comuna <span class="required">(*)</span></label>
								<input type="hidden" id="selDistrictEdit" value="<?php echo isset($form) ? $form->pacient_district_id : '' ?>" />
								<select id="selDistrict" class="form-control selDistrict requiredForSave" required></select>
								<div class="invalid-feedback">
								Debe seleccionar Comuna
								</div>
							</div>
							</div>							
						</div>
						<div class="row">
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Fecha de atención</label>
								<input type="text" name="txtDateAttention" id="txtDateAttention" class="form-control datepicker" maxlength="10" value="<?php echo  isset($form) ? $form->attention_date : '' ?>"/>
								<div class="invalid-feedback">
								Debe ingresar Fecha de atención
								</div>
							</div>
							</div>
							<div class="col-xs-12 col-md-6">
							<div class="form-group">
								<label>Lugar de atención <span class="required">(*)</span></label>
								<input type="text" name="txtPlaceAttention" id="txtPlaceAttention" class="form-control" maxlength="100" value="<?php echo isset($form) ? $form->attention_place : '' ?>" autocomplete="off"/>
								<div class="invalid-feedback">
								Debe ingresar Lugar de atención
								</div>                        
							</div>
							</div>
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>¿Usted es el paciente? <span class="required">(*)</span></label>
								<div class="w-100 d-flex justify-content-center">
								<div class="checkbox">
									<input type="checkbox" id="cbxPacient" style="display:none" checked="<?php echo isset($form) ? ($form->is_pacient == 1 ? "checked" : "") : "checked" ?>"/>
									<label for="cbxPacient" class="toggle"><span></span></label>
								</div>
								</div>
							</div>
							</div>
						</div>
						</div>
						<div class="card-header card-reclamante" style="display: none;">
						<h4>Identificación del Apoderado</h4>
						</div>
						<div class="card-body card-reclamante" style="display: none;">
						<div class="row">
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Nombres <span class="required">(*)</span></label>
								<input type="text" name="txtNameClaimant" id="txtNameClaimant" class="form-control requiredForSaveClaimant" maxlength="100" value="<?php echo isset($form) ? $form->claimant_names : '' ?>"/>
								<div class="invalid-feedback">
								Debe ingresar Nombres del apoderado
								</div>
							</div>
							</div>
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Nombre social</label>
								<input type="text" name="txtSocialNameClaimant" id="txtSocialNameClaimant" class="form-control" maxlength="100" value="<?php echo isset($form) ? $form->claimant_social_name : '' ?>"/>
								<div class="invalid-feedback">
								Debe ingresar Nombre social del apoderado
								</div>
							</div>
							</div>
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Apellido Paterno <span class="required">(*)</span></label>
								<input type="text" name="txtLastnameClaimant" id="txtLastnameClaimant" class="form-control requiredForSaveClaimant" maxlength="100" value="<?php echo isset($form) ? $form->claimant_lastname : '' ?>"/>
								<div class="invalid-feedback">
								Debe ingresar Apellido Paterno del apoderado
								</div>
							</div>
							</div>
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Apellido Materno <span class="required">(*)</span></label>
								<input type="text" name="txtLastname2Claimant" id="txtLastname2Claimant" class="form-control requiredForSaveClaimant" maxlength="100" value="<?php echo isset($form) ? $form->claimant_mlastname : '' ?>"/>
								<div class="invalid-feedback">
								Debe ingresar Apellido Materno del apoderado
								</div>
							</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Cédula de Identidad <span class="required">(*)</span></label>
								<input type="text" name="txtRUTClaimant" id="txtRUTClaimant" class="form-control mask-rut requiredForSaveClaimant" aria-describedby="basic-addon2" data-validate='rut' value="<?php echo isset($form) ? $form->claimant_rut : '' ?>"/>
								<div class="invalid-feedback">
								Debe ingresar Cédula de Identidad del paciente válida
								</div>
							</div>
							</div>
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Género <span class="required">(*)</span></label>
								<input type="hidden" id="selGenderClaimantEdit" value="<?php echo  isset($form) ? $form->pacient_gender_id : '' ?>" />
								<select id="selGenderClaimant" class="form-control selGender requiredForSaveClaimant"></select>
								<div class="invalid-feedback">
								Debe seleccionar Género del apoderado
								</div>
							</div>
							</div>
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Teléfono <span class="required">(*)</span></label>
								<input type="number" name="txtPhoneClaimant" id="txtPhoneClaimant" class="form-control requiredForSaveClaimant" maxlength="9" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" value="<?php echo isset($form) ? $form->claimant_phone : '' ?>"/>
								<div class="invalid-feedback">
								Debe ingresar Teléfono del apoderado
								</div>
							</div>
							</div>
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Correo <span class="required">(*)</span></label>
								<input type="email" name="txtEmailClaimant" id="txtEmailClaimant" class="form-control requiredForSaveClaimant" maxlength="100" value="<?php echo isset($form) ? $form->claimant_email : '' ?>"/>
								<div class="invalid-feedback">
								Debe ingresar Correo del apoderado
								</div>
							</div>
							</div>  							             
						</div>
						<div class="row">
							<div class="col-xs-12 col-md-6">
							<div class="form-group">
								<label>Dirección Particular <span class="required">(*)</span></label>
								<input type="text" name="txtAddressClaimant" id="txtAddressClaimant" class="form-control requiredForSaveClaimant" maxlength="100" value="<?php echo isset($form) ? $form->claimant_address : '' ?>"/>
								<div class="invalid-feedback">
								Debe ingresar Dirección Particular del apoderado
								</div>
							</div>
							</div>   
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Región <span class="required">(*)</span></label>
								<input type="hidden" id="selRegionClaimantEdit" value="<?php echo  isset($form) ? $form->claimant_region_id : '' ?>" />
								<select name="selRegionClaimant" id="selRegionClaimant" class="form-control selRegion requiredForSaveClaimant" data-district="#selDistrictClaimant"></select>
								<div class="invalid-feedback">
								Debe seleccionar Región
								</div>
							</div>
							</div>
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Comuna <span class="required">(*)</span></label>
								<input type="hidden" id="selDistrictClaimantEdit" value="<?php echo  isset($form) ? $form->claimant_district_id : '' ?>" />
								<select name="selDistrictClaimant" id="selDistrictClaimant" class="form-control selDistrict requiredForSaveClaimant"></select>
								<div class="invalid-feedback">
								Debe seleccionar Comuna
								</div>
							</div>
							</div>							
						</div>
						</div> 
						<div class="card-header">
						<h4>Firma del <span id="setSignOwner">Paciente</span></h4>
						</div>
						<div class="card-body">
						<div class="row">
							<div class="col-xs-12 col-md-6">
							<div class="form-group needs-validation" id="upload_sing_form">
								<label>Imágen de Firma</label>
								<div class="custom-file mb-3">
								<input type="hidden" id="hdnSign" value="<?php echo  isset($form) ? $form->form_sign : '' ?>"/>
								<input type="file" class="custom-file-input <?php echo isset($form) && isset($form->form_sign) && strlen($form->form_sign) > 0 ? 'loaded' : '' ?>" id="fileSign" data-validate='' name="fileSign" onchange="onFileUpload(this);"  accept="image/*" data-type='image' />
								<label class="custom-file-label" for="fileSign" id="labelfileSign">...</label>
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
								<img class="imgPreview ml-2" id="imgPreview1" src="<?php echo isset($form) && isset($form->previewSign) && strlen($form->previewSign) > 0 ? $form->previewSign : base_url().'/public/img/sign/preview.png' ?>" width="200px"/>
								</div>
							</div>
							</div>                    
						</div>
						<div class="alert alert-secondary col-xs-12 col-md-12" role="alert">
							<strong>Importante:</strong> Se recomienda subir una foto de la firma para la validez del formulario. <a id="btnSignExample" data-toggle="collapse" href="#modalSignExample" role="button" aria-expanded="false" aria-controls="modalSignExample" class="text-primary">Ver ejemplos y recomendaciones.</a>                 
						</div>
						</div>    
					</div>
				</div>
				<div class="tab-pane fade tab-parent-save" id="form" role="tabpanel" aria-labelledby="form-tab">
					<div class="card no-box-shadow" id="step-3">
						<!-- <div class="card-header">
							<h4>Datos de la solicitud</h4>
						</div> -->
						<div class="card-body">
						<div class="row">
							<div class="col-xs-12 col-md-3">
								<div class="form-group">
								<label>Tipo de formulario <span class="required">(*)</span></label>
								<input type="hidden" id="selTypeEdit" value="<?php echo  isset($form) ? $form->form_type_id : '' ?>" />
								<select id="selType" class="form-control requiredForSave" required></select>
								<div class="invalid-feedback">
								Debe seleccionar Tipo de formulario
								</div>
								</div>
							</div>
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Sucursal de atención <span class="required">(*)</span></label>
								<input type="hidden" id="selBranchEdit" value="<?php echo  isset($form) ? $form->form_branch_id : '' ?>" />
								<select id="selBranch" class="form-control requiredForSave" required></select>
								<div class="invalid-feedback">
								Debe seleccionar Sucursal de atención
								</div>
							</div>
							</div>
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Área a la cual corresponde la solicitud <span class="required">(*)</span></label>
								<input type="hidden" id="selAreaEdit" value="<?php echo  isset($form) ? $form->form_area_id : '' ?>" />
								<select id="selArea" class="form-control requiredForSave" required></select>
								<div class="invalid-feedback">
								Debe seleccionar Área de la solicitud
								</div>
							</div>
							</div>
							<div class="col-xs-12 col-md-3">
								<div class="form-group">
									<label>Área específica <span class="required">(*)</span></label>
									<input type="hidden" id="selAreaEspEdit" value="<?php echo  isset($form) ? $form->form_subarea_id : '' ?>" />
									<select id="selAreaEsp" class="form-control requiredForSave" required></select>
									<div class="invalid-feedback">
									Debe seleccionar Área específica de la solicitud
									</div>
								</div>
							</div>
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Vía de respuesta <span class="required">(*)</span></label>
								<input type="hidden" id="selChannelEdit" value="<?php echo  isset($form) ? $form->form_channel_id : '' ?>" />
								<select id="selChannel" class="form-control requiredForSave" required></select>
								<div class="invalid-feedback">
								Debe seleccionar Vía de respuesta
								</div>
							</div>
							</div>							
						<!-- </div> -->
						<!-- <div class="row"> -->
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Canal de ingreso <span class="required">(*)</span></label>
								<input type="hidden" id="selEntryChannelEdit" value="<?php echo  isset($form) ? $form->form_channel_entry_id : '' ?>" />
								<select id="selEntryChannel" class="form-control requiredForSave" required></select>
								<div class="invalid-feedback">
								Debe seleccionar Canal de ingreso
								</div>
								</div>
							</div>
							<div class="col-xs-12 col-md-3">
								<div class="form-group">
								<label>Folio interno <i class="position-right fas fa-info-circle text-info mt-2 infoFolio"></i></label>
								<input type="text" name="txtInvoiceSystem" id="txtInvoiceSystem" class="form-control" maxlength="100" value="<?php echo  isset($form) ? $form->invoice : '' ?>" readonly/>
								</div>
							</div>
							<div class="col-xs-12 col-md-3">
								<div class="form-group">
								<label>Folio Físico </label>
								<input type="text" name="txtInternInvoice" id="txtInternInvoice" class="form-control" maxlength="100" value="<?php echo isset($form) ? $form->intern_invoice : '' ?>"/>
								</div>			
							</div>
							<div class="col-xs-12 col-md-3">
								<div class="form-group">
								<label>Fecha de recepción <span class="required">(*)</span></label>
								<input type="text" name="txtEntryDate" id="txtEntryDate" class="form-control datepicker requiredForSave" maxlength="10" required value="<?php echo  isset($form) ? $form->form_date_received : '' ?>"/>
								<div class="invalid-feedback">
									Debe ingresar Fecha de recepción
								</div>	
								</div>			
							</div>
						</div>
						<div id="claim-detail" <?php if(isset($form)) { if($form->form_type_id == 1){ echo 'style="display:block"'; } else { echo 'style="display:none"'; } } else { echo 'style="display:none"'; } ?>>
							<div class="row">
								<div class="col-xs-12 col-md-12">
								<div class="form-group">
									<label>Informar Derecho vulnerado<span class="required">(*)</span></label>
									<textarea id="txtResume" class="form-control counter" maxlength="1500" data-counterlabel="#counterResume" required><?php echo  isset($form) ? $form->form_resume : '' ?></textarea>
									<div class="invalid-feedback">
									Debe ingresar Relato del hecho
									</div>
									<div class="text-muted float-right" id="counterResume">
									0 de 1500 caracteres.
									</div>
								</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12 col-md-12">
								<div class="form-group">
									<label>Peticiones concretas <span class="required">(*)</span></label>
									<textarea id="txtSolution" class="form-control counter" maxlength="1500" data-counterlabel="#counterSolution" required><?php echo  isset($form) ? $form->form_solution : '' ?></textarea>
									<div class="invalid-feedback">
									Debe ingresar Peticiones concretas
									</div>
									<div class="text-muted float-right" id="counterSolution">
									0 de 1500 caracteres.
									</div>
								</div>
								</div>
							</div>
						</div>
						<div id="other-detail" <?php if(isset($form)) { if($form->form_type_id == 1){ echo 'style="display:none"'; } else { echo 'style="display:block"'; } } else { echo 'style="display:none"'; } ?>>
							<div class="row">
									<div class="col-xs-12 col-md-12">
										<div class="form-group">
										<label>Comentarios </label>
										<textarea id="txtComments" class="form-control counter" maxlength="1500" data-counterlabel="#counterComments" required><?php echo  isset($form) ? $form->form_comments : '' ?></textarea>
										<div class="invalid-feedback" <?php if(isset($form)) { if($form->form_type_id == 1){ echo 'style="display:none"'; } else { echo 'style="display:block"'; } } else { echo 'style="display:none"'; } ?>>
										Debe ingresar comentarios
										</div>
										<div class="text-muted float-right" id="counterComments">
										0 de 1500 caracteres.
										</div>					
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<?php if($canManagement){ ?>
				<div class="tab-pane fade tab-parent-save" id="gesPaciente" role="tabpanel" aria-labelledby="paciente-tab">
					<div class="row">
						<div class="card no-box-shadow col-md-6" id="step-3" >
							<div class="card-body">
								<div class="alert alert-info" role="alert">
									<i class="fas fa-info-circle"></i>&nbsp; La Información de esta sección es la respuesta que recibe el paciente
								</div>
								<div class="row">								
									<div class="col-xs-12 col-md-6">
										<div class="form-group">
											<label>Materia del reclamo <span class="required">(*)</span></label>
											<input type="text" name="txtSubjectClaim requiredForSave" id="txtSubjectClaim" class="form-control" maxlength="100" required value="<?php echo  isset($form) ? $form->form_subject_claim : '' ?>"/>
											<div class="invalid-feedback">
												Debe ingresar Materia del reclamo
											</div>	
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12 col-md-12">
										<div class="form-group">
										<label>Respuesta a Solicitud del Paciente (Tiempo para realizarlo) <span class="required">(*)</span></label>
										<textarea id="txtImprove" class="form-control counter requiredForSave"  maxlength="5000" data-counterlabel="#counterImprove" required><?php echo  isset($form) ? $form->form_improve : '' ?></textarea>					
										<div class="invalid-feedback">
										Debe ingresar Gestión del reclamo 
										</div>
										<div class="text-muted float-right" id="counterImprove">
										0 de 5000 caracteres.
										</div>	
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="card no-box-shadow col-md-6">
							<div class="card-body">
							<button type="button" id="generatePDF" class="btn btn-secondary">Vista Previa</button>
							
							<iframe id="pdfPreview" style="width: 100%; height: 500px;"></iframe>

							</div>
						</div>
					</div>
					
				</div>
				<div class="tab-pane fade tab-parent-save" id="management" role="tabpanel" aria-labelledby="management-tab">
					<div class="card no-box-shadow" id="step-3">
						<div class="card-body">
							<div class="alert alert-info" role="alert">
								<i class="fas fa-info-circle"></i>&nbsp; La información de esta sección es de gestión interna
							</div>
							<div class="row">								
								<div class="col-xs-12 col-md-3">
									<div class="form-group">
										<label>OT</label>
										<input type="text" name="txtOT" id="txtOT" class="form-control" maxlength="100" value="<?php echo  isset($form) ? $form->form_ot : '' ?>"/>
										<div class="invalid-feedback">
											Debe ingresar OT
										</div>	
									</div>
								</div>
								<div class="col-xs-12 col-md-3">
								<div class="form-group">
									<label>¿Es Prioritario? <span class="required">(*)</span></label>
									<div class="w-100 d-flex justify-content-center">
									<div class="checkbox">
										<input type="checkbox" id="cbxPriority" class="requiredForSave" style="display:none" checked="<?php echo isset($form) ? ($form->form_is_priority == 1 ? "checked" : "") : "checked" ?>"/>
										<label for="cbxPriority" class="toggle"><span></span></label>
									</div>
									</div>
								</div>
								</div>										
							</div>
							<div class="row">
								<div class="col-xs-12 col-md-12">
									<div class="form-group">
									<label>Gestión del reclamo <span class="required">(*)</span></label>
									<textarea id="txtManagement" class="form-control counter requiredForSave"  maxlength="1500" data-counterlabel="#counterManagement" required><?php echo  isset($form) ? $form->form_management : '' ?></textarea>
									<div class="invalid-feedback">
									Debe ingresar Gestión del reclamo 
									</div>
									<div class="text-muted float-right" id="counterManagement">
									0 de 1500 caracteres.
									</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<?php } ?>
				<div class="tab-pane fade" id="docs" role="tabpanel" aria-labelledby="docs-tab">
					<div class="row">				
						<div class="col-xs-12 col-md-4 py-2">
							<div class="card border-light mb-0">
								<div class="card-body pb-32px">
									<form method="post" id="upload_docs_form" enctype="multipart/form-data" onkeydown="return event.key != 'Enter';">
										<span class="fw-600">Subir documento</span>
										<div class="custom-file mb-3 mt-2">
											<input type="file" class="custom-file-input" id="fileForm" name="fileForm" onchange="onFileUpload(this);">
											<label class="custom-file-label" for="fileForm" id="labelFileForm">...</label>
											<div class="invalid-feedback">
												Debe seleccionar archivo
											</div>
										</div>
									</form>
								</div>							
							</div>
						</div>					
						<div class="col-xs-12 col-md-8 py-2">
							<div class="card border-light mb-0">
								<div class="card-body">
									<span class="fw-600">Documentos</span>
									<div class="todo-list" id="formDocs">
										<div class="todo-list">
										<div class="todo-item-no-data">
										<span>Cargando...</span>									
										</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="bit" role="tabpanel" aria-labelledby="bit-tab">
					<div class="row">
						<div class="col-xs-12 col-md-4 py-2">
							<div class="card border-light mb-0">
								<div class="card-body">
									<form method="post" id="add-hitory" onkeydown="return event.key != 'Enter';">
										<span class="fw-600">Añadir comentario</span>
										<textarea name="txtHistoryComment" id="txtHistoryComment" class="form-control h-100 mt-2" maxlength="500" rows="4" required></textarea>
										<div class="invalid-feedback">
											Debe ingresar comentario
										</div>
									</form>
								</div>
								<div class="card-footer text-right pt-0"><a id="btnSaveHistory" href="#" class="btn btn-primary">Agregar comentario</a></div>
							</div>
						</div>					
						<div class="col-xs-12 col-md-8 py-2">
							<div class="alert alert-info">
								<i class="fas fa-info-circle"></i>&nbsp; La información mostrada es de uso interno para saber la evolución del paciente
							</div>
							<div class="card border-light mb-0">
								<div class="card-body">
									<span class="fw-600">Historial</span>	
									<div id="formHistory">
										<div class="todo-list">
										<div class="todo-item-no-data">
										<span>Cargando...</span>									
										</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" id="hdnFormID" value="<?php echo (isset($form) ? $form->id : 0) ?>"/>
			</form>
			<?php } else { ?>
			<div class="row">				
				<div class="col-xs-12 col-md-12 py-2">
					<div class="card border-light">
						<div class="card-body">
						 	<p class="fw-600 text-center">Error al cargar datos de formulario. Inténtelo mas tarde, si el error persiste, comuníquese con el administrador del sito.</p>
						</div>
					</div>
				</div>	
			</div>
			<?php } ?>
			
	</div>
	<div class="card-footer pt-0">
		<div class="row">
		<div class="col-xs-12 col-md-6 text-left">
		</div>
		<div class="col-xs-12 col-md-6 text-right">
			<?php
			if(isset($permission) && !$permission->error && count($permission->values) > 0){
				//Puede enviar?
				// $canSend = array_filter($permission->values, function($action) { return $action->action == "SEND"; });
				// if(isset($canSend) && count($canSend) > 0){
				// 	$detail =  reset($canSend);
				// 	$href = "";
				// 	if(isset($detail->href) && strlen($detail->href)> 0){
				// 		if(strpos($detail->href, 'javascript') !== false){
				// 			$href = $detail->href;
				// 		}else{
				// 			$href = site_url($detail->href);
				// 		}
				// 	}else{
				// 		$href = "javascript:void(0);";
				// 	}
				// 	echo '<a href="'.$href.'" class="btn '.$detail->class.' mr-2"><i class="'.$detail->icon.'"></i> '.$detail->description.'</a>';
				// }
				//Puede guardar?
				$canSave = array_filter($permission->values, function($action) { return $action->action == "EDIT" || $action->action == "ADD"; });
				if(isset($canSave) && count($canSave) > 0){
					echo '<a href="javascript:void(0);" class="btn btn-success row-btn-add mr-2"><i class="fas fa-save"></i> Guardar</a>';
				}				
			}
			
			?>
			<a class="btn btn-secondary mr-2" href="<?php echo base_url('index.php/Inbox/Index') ?>" id="btnBack">Cancelar</a>
		</div>
		</div>                  
	</div>
</div>
<!-- Fin Formulario -->


<?=$this->endSection('section-body')?>

<?=$this->section('section-modals')?>

	<div class="modal" tabindex="-1" role="dialog" id="modalSeeDocForms">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title">Ver detalle de documento</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
			<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="modal-body">
			<div class="row">
				<div class="col-xs-12 col-md-12">
					<div class="form-group">
						<label>Nombre del documento</label>
						<input type="text" name="txtDocName" id="txtDocName" class="form-control" maxlength="100" required/>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-md-12">
					<div class="form-group">
						<label>Autor</label>
						<input type="text" name="txtDocAuthor" id="txtDocAuthor" class="form-control" maxlength="100" required/>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-md-12">
					<div class="form-group">
						<label>Fecha publicación</label>
						<input type="text" name="txtDocDate" id="txtDocDate" class="form-control" maxlength="100" required/>
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

  <?=$this->endSection('section-modals')?>

<?=$this->section('section-scripts')?>



<script src="<?=base_url()?>/public/vendors/daterangepicker/daterangepicker.min.js"></script>

<script src="<?=base_url()?>/public/vendors/datatables/js/datatables.min.js"></script>
<script src="<?=base_url()?>/public/vendors/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="<?=base_url()?>/public/vendors/datatables/js/dataTables.select.min.js"></script>
  <script src="<?=base_url()?>/public/vendors/inputmask/jquery.inputmask.min.js"></script>

<script src="<?=base_url()?>/public/js/Inbox/save_classes.js"></script>
<script src="<?=base_url()?>/public/js/Inbox/save_custom.js"></script>

<?=$this->endSection('section-scripts')?>

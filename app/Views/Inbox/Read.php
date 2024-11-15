<?=$this->extend('_template/master')?>

<?=$this->section('header')?>

<title>Ver Formulario</title>

<link rel="stylesheet" href="<?=base_url()?>/public/vendors/daterangepicker/daterangepicker.css">

<link rel="stylesheet" href="<?=base_url()?>/public/vendors/datatables/css/dataTables.min.css">
<link rel="stylesheet" href="<?=base_url()?>/public/vendors/datatables/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="<?=base_url()?>/public/vendors/datatables/css/select.bootstrap4.min.css">


<link rel="stylesheet" href="<?=base_url()?>/public/css/inbox/timeline.css">
<link rel="stylesheet" href="<?=base_url()?>/public/css/inbox/todo.css">

<?=$this->endSection('header')?>

<?=$this->section('section-header')?>
<?php $session = session(); $user = $session->get('user'); ?>
<h1>Ver formulario - Folio:<?php echo $invoice ?></h1>
<div class="section-header-breadcrumb">
	<div class="breadcrumb-item active"><a href="<?php echo base_url('index.php/Home/Index') ?>">Inicio</a></div>
	<div class="breadcrumb-item">Ver formulario</div>
</div>

<?=$this->endSection('section-header')?>

<?=$this->section('section-body')?>

<!-- Formulario -->
<div class="card">
	<div class="card-body pb-0">
		<?php if(isset($form)){ ?>
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link active" id="pacient-tab" data-toggle="tab" href="#pacient" role="tab" aria-controls="pacient" aria-selected="true">Identificación</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="form-tab" data-toggle="tab" href="#form" role="tab" aria-controls="form" aria-selected="false">Datos del formulario</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="management-tab" data-toggle="tab" href="#management" role="tab" aria-controls="management" aria-selected="false">Gestión Interna</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="paciente-tab" data-toggle="tab" href="#gesPaciente" role="tab" aria-controls="management" aria-selected="false">Gestión Paciente</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="docs-tab" data-toggle="tab" href="#docs" role="tab" aria-controls="docs" aria-selected="false">Documentos</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="bit-tab" data-toggle="tab" href="#bit" role="tab" aria-controls="bit" aria-selected="false">Bitácora</a>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="pacient" role="tabpanel" aria-labelledby="pacient-tab">
					<div class="card no-box-shadow">
						<div class="card-header">
						<h4>Identificación del Paciente</h4>
						</div>
						<div class="card-body pb-0">
						<div class="row">
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Nombres</label>
								<input type="text" onkeyup="primeroMayus(this);" name="txtName" id="txtName" class="form-control" readonly="readonly" value="<?php echo $form->pacient_names ?>" />
							</div>
							</div>
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Apellido Paterno</label>
								<input type="text" name="txtLastname" id="txtLastname" class="form-control" readonly="readonly" value="<?php echo $form->pacient_lastname ?>" />                        
							</div>
							</div>
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Apellido Materno</label>
								<input type="text" name="txtLastname2" id="txtLastname2" class="form-control" readonly="readonly" value="<?php echo $form->pacient_mlastname ?>" />                        
							</div>
							</div>
							<div class="col-xs-12 col-md-3">
							<!-- <div class="form-group">
								<label>Nombre social</label>
								<input type="text" name="txtSocialName" id="txtSocialName" class="form-control" readonly="readonly" value="<?php echo strlen($form->pacient_social_name) > 0 ? $form->pacient_social_name : "Sin información" ?>" />                        
							</div> -->
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Cédula de Identidad</label>
								<input type="text" name="txtRUT" id="txtRUT" class="form-control mask-rut" readonly="readonly" value="<?php echo $form->pacient_rut ?>"/>
								
							</div>
							</div>
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Género</label>
								<input type="text" name="txtGender" id="txtGender" class="form-control" readonly="readonly" value="<?php echo $form->pacient_gender ?>" />
								
							</div>
							</div>
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Teléfono</label>
								<input type="number" name="txtPhone" id="txtPhone" class="form-control" readonly="readonly" value="<?php echo $form->pacient_phone ?>" />
								
							</div>
							</div>
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Correo</label>
								<input type="email" name="txtEmail" id="txtEmail" class="form-control" readonly="readonly" value="<?php echo $form->pacient_email ?>" />
							</div>
							</div>                  
						</div>
						<div class="row">
							<div class="col-xs-12 col-md-6">
							<div class="form-group">
								<label>Dirección Particular</label>
								<input type="text" name="txtAddress" id="txtAddress" class="form-control" readonly="readonly" value="<?php echo $form->pacient_address ?>" />                    
							</div>
							</div> 
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Región</label>
								<input type="text" name="selRegion" id="selRegion" class="form-control" readonly="readonly" value="<?php echo $form->pacient_region ?>" />
							</div>
							</div>
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Comuna</label>
								<input type="text" name="selDistrict" id="selDistrict" class="form-control" readonly="readonly" value="<?php echo $form->pacient_district ?>" />
							</div>
							</div>
							
						</div>
						<div class="row">
							<div class="col-xs-12 col-md-6">
							<div class="form-group">
								<label>Lugar de atención</label>
								<input type="text" name="txtPlaceAttention" id="txtPlaceAttention" class="form-control" readonly="readonly" value="<?php echo $form->attention_place ?>" />                       
							</div>
							</div>
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>Fecha de atención</label>
									<input type="text" name="txtDateAttention" id="txtDateAttention" class="form-control" readonly="readonly" value="<?php echo $form->attention_date ?>" />
								</div>
							</div>
							<div class="col-xs-12 col-md-3">
							<div class="form-group">
								<label>¿El apoderado es el paciente?</label>
								<input type="text" name="cbxPacient" id="cbxPacient" class="form-control" readonly="readonly" value="<?php echo ($form->is_pacient == 1 ? "Si" : "No") ?>" />
							</div>
							</div>
						</div>
						</div>
						<?php if ($form->is_pacient == 0) {?>
						<div class="card-header card-reclamante">
						<h4>Identificación del Apoderado</h4>
						</div>
						<div class="card-body card-reclamante">
							<div class="row">
								<div class="col-xs-12 col-md-3">
								<div class="form-group">
									<label>Nombres</label>
									<input type="text" name="txtNameClaimant" id="txtNameClaimant" class="form-control" readonly="readonly" value="<?php echo $form->claimant_names ?>" />
								</div>
								</div>
								<div class="col-xs-12 col-md-3">
								<!-- <div class="form-group">
									<label>Nombre social</label>
									<input type="text" name="txtSocialNameClaimant" id="txtSocialNameClaimant" class="form-control" readonly="readonly" value="<?php echo strlen($form->pacient_social_name) > 0 ? $form->pacient_social_name : "Sin información" ?>"/>
								
								</div> -->
								</div>
								<div class="col-xs-12 col-md-3">
								<div class="form-group">
									<label>Apellido Paterno</label>
									<input type="text" name="txtLastnameClaimant" id="txtLastnameClaimant" class="form-control" readonly="readonly" value="<?php echo $form->claimant_lastname ?>" />
								
								</div>
								</div>
								<div class="col-xs-12 col-md-3">
								<div class="form-group">
									<label>Apellido Materno</label>
									<input type="text" name="txtLastname2Claimant" id="txtLastname2Claimant" class="form-control" readonly="readonly" value="<?php echo $form->claimant_mlastname ?>" />
								
								</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12 col-md-3">
								<div class="form-group">
									<label>Cédula de Identidad</label>
									<input type="text" name="txtRUTClaimant" id="txtRUTClaimant" class="form-control" readonly="readonly" value="<?php echo $form->claimant_rut ?>"/>
								
								</div>
								<div class="col-xs-12 col-md-3">
								<div class="form-group">
									<label>Género</label>
									<input type="text" name="txtGenderClaimant" id="txtGenderClaimant" class="form-control" readonly="readonly" value="<?php echo $form->claimant_gender ?>" />
									
								</div>
								</div>
								</div>
								<div class="col-xs-12 col-md-3">
								<div class="form-group">
									<label>Teléfono</label>
									<input type="number" name="txtPhoneClaimant" id="txtPhoneClaimant" class="form-control" readonly="readonly" value="<?php echo $form->claimant_phone ?>" />
								
								</div>
								</div>  
								<div class="col-xs-12 col-md-6">
								<div class="form-group">
									<label>Dirección Particular</label>
									<input type="text" name="txtAddressClaimant" id="txtAddressClaimant" class="form-control" readonly="readonly" value="<?php echo $form->claimant_address ?>" />
									
								</div>
								</div>                
							</div>
							<div class="row">
								<div class="col-xs-12 col-md-3">
								<div class="form-group">
									<label>Región</label>
									<input type="text" name="selRegionClaimant" id="selRegionClaimant" class="form-control" readonly="readonly" value="<?php echo $form->claimant_region ?>" />                        
								</div>
								</div>
								<div class="col-xs-12 col-md-3">
								<div class="form-group">
									<label>Comuna</label>
									<input type="text" name="selDistrictClaimant" id="selDistrictClaimant" class="form-control" readonly="readonly" value="<?php echo $form->claimant_district ?>" />
								</div>
								</div>
								<div class="col-xs-12 col-md-6">
								<div class="form-group">
									<label>Correo</label>
									<input type="email" name="txtEmailClaimant" id="txtEmailClaimant" class="form-control" readonly="readonly" value="<?php echo $form->claimant_email ?>" />
								</div>
								</div>
							</div>
						</div>
						<?php } ?>
						<div class="card-header">
						<h4>Firma del <span id="setSignOwner"><?php echo ($form->is_pacient == 1 ? "Paciente" : "Apoderado") ?></span></h4>
						</div>
						<div class="card-body">
						<div class="row">
							<div class="col-xs-12 col-md-12">
							<div class="form-group">
								<div class="text-center">
								<img class="imgPreview ml-2" id="imgPreview1" src="<?php echo isset($form) && isset($form->previewSign) && strlen($form->previewSign) > 0 ? $form->previewSign : base_url().'/public/img/sign/preview.png' ?>" width="200px"/>
								</div>
							</div>
							</div>                    
						</div>
						</div>                
					</div>
				</div>
				<div class="tab-pane fade" id="form" role="tabpanel" aria-labelledby="form-tab">
					<div class="card no-box-shadow" id="step-3">
						<!-- <div class="card-header">
							<h4>Datos de la solicitud</h4>
						</div> -->
						<div class="card-body">
							<div class="row">
								<div class="col-xs-12 col-md-3">
									<div class="form-group">
									<label>Tipo de formulario</label>
									<input type="text" name="radioType" id="radioType" class="form-control" readonly="readonly" value="<?php echo $form->type ?>"/>
									</div>
								</div>
								<div class="col-xs-12 col-md-3">
									<div class="form-group">
									<label>Sucursal de atención</label>
									<input type="text" name="selBranch" id="selBranch" class="form-control" readonly="readonly" value="<?php echo $form->branch ?>"/>	
									</div>
								</div>								
								<div class="col-xs-12 col-md-3">
									<div class="form-group">
										<label>Área a la cual corresponde la solicitud </label>
										<input type="text" name="selArea" id="selArea" class="form-control" readonly="readonly" value="<?php echo $form->area ?>"/>						
									</div>
								</div>
								<div class="col-xs-12 col-md-3">
									<div class="form-group">
										<label>Área específica de la solicitud </label>
										<input type="text" name="selArea" id="selArea" class="form-control" readonly="readonly" value="<?php echo $form->descSubArea ?>"/>						
									</div>
								</div>
								<div class="col-xs-12 col-md-3">
									<div class="form-group">
										<label>Vía de respuesta </label>
										<input type="text" name="selChannel" id="selChannel" class="form-control" readonly="readonly" value="<?php echo $form->channel ?>"/>	
									</div>
								</div>
							<!-- </div> -->
							<!-- <div class="row"> -->
								<div class="col-xs-12 col-md-3">
									<div class="form-group">
									<label>Canal de ingreso</label>
									<input type="text" name="" id="" class="form-control" readonly="readonly" value="<?php echo $form->entry_channel ?>"/>
									</div>
								</div>				
								<div class="col-xs-12 col-md-3">
									<div class="form-group">
										<label>Folio interno <i class="position-right fas fa-info-circle text-info pt-2 infoFolio"></i></label>
										<input type="text" class="form-control" readonly="readonly" value="<?php echo $form->invoice ?>"/>	
									</div>
								</div>											
								<div class="col-xs-12 col-md-3">
									<div class="form-group">
									<label>Folio Físico </label>
									<input type="text" class="form-control" readonly="readonly" value="<?php echo isset($form) ? $form->intern_invoice : '' ?>"/>
									</div>			
								</div>	
								<div class="col-xs-12 col-md-3">
									<div class="form-group">
									<label>Fecha de ingreso</label>
									<input type="text" name="txtEntryDate" id="txtEntryDate" class="form-control" readonly="readonly" value="<?php echo  isset($form) && strlen($form->form_date_received) > 0 ? $form->form_date_received : 'Sin gestión' ?>"/>
									</div>
								</div>
							</div>
							<?php if($form->form_type_id == 1){ ?>
							<div id="claim-detail">
								<div class="row">
									<div class="col-xs-12 col-md-12">
										<div class="form-group">
										<label>Informar Derecho Vulnerado</label>
										<textarea id="txtResume" class="form-control counter" readonly="readonly"><?php echo $form->form_resume ?></textarea>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12 col-md-12">
										<div class="form-group">
										<label>Peticiones concretas </label>
										<textarea id="txtSolution" class="form-control counter" readonly="readonly"><?php echo $form->form_solution ?></textarea>						
										</div>
									</div>
								</div>
							</div>
							<?php } else { ?>
							<div id="other-detail">
							<div class="row">
									<div class="col-xs-12 col-md-12">
										<div class="form-group">
										<label>Comentarios </label>
										<textarea id="txtComments" class="form-control counter" readonly="readonly"><?php echo $form->form_comments ?></textarea>						
										</div>
									</div>
								</div>
							</div>
							<?php } ?>
						</div>
					</div>
				</div>
				<div class="tab-pane fade tab-parent-save" id="gesPaciente" role="tabpanel" aria-labelledby="paciente-tab">
					<div class="card no-box-shadow" id="step-3">
						<div class="card-body">
							<div class="alert alert-info" role="alert">
								<i class="fas fa-info-circle"></i>&nbsp; La Información de esta sección es la respuesta que recibe el paciente
							</div>
							<div class="row">								
								<div class="col-xs-12 col-md-6">
									<div class="form-group">
									<label>Materia del reclamo</label>
									<input type="text" name="txtSubjectClaim" id="txtSubjectClaim" class="form-control" readonly="readonly" value="<?php echo  isset($form->form_subject_claim) && strlen($form->form_subject_claim) > 0 ? $form->form_subject_claim : 'Sin gestión' ?>"/>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12 col-md-12">
									<div class="form-group">
									<label>Plan de mejora / Medidas correctivas (Tiempo para realizarlo) </label>
									<textarea id="txtImprove" class="form-control counter" readonly="readonly"><?php echo  isset($form) && strlen($form->form_improve) > 0 ? $form->form_improve : 'Sin gestión' ?></textarea>					
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="management" role="tabpanel" aria-labelledby="management-tab">
					<div class="card no-box-shadow" id="step-3">
						<!-- <div class="card-header">
							<h4>Gestión del formulario</h4>
						</div> -->
						<div class="card-body">
							<div class="alert alert-info" role="alert">
								<i class="fas fa-info-circle"></i>&nbsp; La información de esta sección es de gestión interna
							</div>
							<div class="row">
								<div class="col-xs-12 col-md-3">
									<div class="form-group">
									<label>OT</label>
									<input type="text" name="txtOT" id="txtOT" class="form-control" readonly="readonly" value="<?php echo  isset($form) && strlen($form->form_ot) > 0 ? $form->form_ot : '' ?>"/>
									</div>
								</div>
								<div class="col-xs-12 col-md-3">
									<div class="form-group">
										<label>¿Es Prioritario?</label>
										<input type="text" class="form-control" readonly="readonly" value="<?php echo ($form->form_is_priority == 1 ? "Si" : "No") ?>" />					
									</div>
								</div>									
							</div>
							<div class="row">
								<div class="col-xs-12 col-md-12">
									<div class="form-group">
									<label>Gestión del reclamo</label>
									<textarea id="txtManagement" class="form-control counter" readonly="readonly"><?php echo  isset($form) && strlen($form->form_management) > 0 ? $form->form_management : 'Sin gestión' ?></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
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
			<input type="hidden" id="hdnFormID" value="<?php echo $form->id ?>"/>
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
			if(isset($form_permission) && strlen($form_permission) > 0){
				$actions = explode(',', strtoupper($form_permission));
				if(isset($actions) && count($actions) > 0){
					if(!$permission->error){
						$details = $permission->values;
						if(isset($details) && count($details) > 0){
							foreach($actions as $act){
								$getDetail = array_filter($details, function($det) use ($act) { return $det->action == $act && $det->action!='SEE'; });
								if(isset($getDetail) && count($getDetail) > 0){
									$detail = array_values($getDetail)[0];
									// var_dump($detail); echo $detail->href; die;
									$data = $detail->data;
									$href = $detail->href;
									$click = "javascript:void(0);";
									if((isset($href) && strlen($href)> 0)){
										//Reemplaza valor parametro
										$href = str_replace("{form_id}",$form->id,$href);
										$href = str_replace("{invoice}",$form->invoice,$href);	
										if(strpos($href, ';') !== false){
											$click = $href;
											$href = "#";
										}else{		
											//Reemplaza valor parametro								
											$href = site_url($href);
										}
									}else{
										$href = "javascript:void(0);";
									}
									if((isset($data) && strlen($data)> 0)){
										//Reemplaza valor parametro
										$data = str_replace("{form_id}",$form->id,$data);
										$data = str_replace("{invoice}",$form->invoice,$data);
									}
									// echo '<a href="'.$href.'" class="btn '.$detail->class.' mr-2" '.(isset($data) ? $data : '').' onclick="'.$click.'"><i class="'.$detail->icon.'"></i> '.$detail->description.'</a>';
									echo '<a href="'.$href.'" class="btn '.(($form->form_type_id == 3 || $form->form_type_id == 2) && $form->status_id == 3 ? $detail->class.'3' : $detail->class) .' mr-2" '.(isset($data) ? $data : '').' onclick="'.$click.'"><i class="'.$detail->icon.'"></i> '.$detail->description.'</a>';
									
								}
							}
						}
					}	
				}
			}
			?>
			<a class="btn btn-secondary mr-2" href="<?php echo base_url('index.php/Inbox/Index') ?>">Volver</a>
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
					<input type="text" name="txtDocName" id="txtDocName" class="form-control" readonly="readonly"/>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 col-md-12">
				<div class="form-group">
					<label>Autor</label>
					<input type="text" name="txtDocAuthor" id="txtDocAuthor" class="form-control" readonly="readonly"/>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 col-md-12">
				<div class="form-group">
					<label>Fecha publicación</label>
					<input type="text" name="txtDocDate" id="txtDocDate" class="form-control" readonly="readonly"/>
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

<script src="<?=base_url()?>/public/js/Inbox/read_custom.js"></script>
<script src="<?=base_url()?>/public/js/Inbox/actions_custom.js"></script>

<?=$this->endSection('section-scripts')?>
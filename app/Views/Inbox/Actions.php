<!-- Modal Reasignacion -->
<div class="modal" tabindex="-1" role="dialog" id="modalReasign" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Reasignar Formulario: <span id="spanFolioReasign"></span></h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>        
        <div class="modal-body mt-1 need-validation">
            <div class="row">
                <div class="col-xs-12 col-md-4">
                  <div class="form-group">
                    <label>Perfil Ingreso</label>
                    <select id="selEntryProfile" class="form-control selEntryProfile requiredForSave"></select>                    
                  </div>              
                </div>
                <div class="col-xs-12 col-md-4">
                  <div class="form-group">
                    <label>Perfil Gestión</label>
                    <select id="selManagementProfile" class="form-control selManagementProfile requiredForSave"></select>  
                  </div>
                </div>
                <div class="col-xs-12 col-md-4">
                  <div class="form-group">
                    <label>Perfil Director</label>
                    <select id="selDirectorProfile" class="form-control selDirectorProfile requiredForSave"></select>  
                  </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <input id="hdnFormIDReasign" type="hidden"/>
            <button type="button" class="btn btn-primary" id="btnReasign">Reasignar</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>
<!-- end Modal Reasignacion -->
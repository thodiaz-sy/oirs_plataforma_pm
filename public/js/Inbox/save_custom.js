"use strict";
var $img_default = baseURLContent+'/public/img/sign/preview.png';
var $documents = [], $documentsChanges = [], $history = [], $historyChanges = [];
var form = new Form();
 $(document).ready(function() {

    //#region Init
    // $('#selArea').change(function(){
    //     alert($('#selArea').val());
    // })  
    // $('#selArea').change(function(){
    //     traerSubAreas();
    // })
    // function traerSubAreas() {
    //     var idArea = $('#selArea').val();
    //     var idAnterior = $('#selAreaEspEdit').val();
    //     $.ajax({
    //         url:  baseURL+'/Inbox/traerSubAreas',
    //         type: "POST",
    //         data : {'idArea': idArea, 'idAnterior': idAnterior},
    //         success : function(response) {
    //             $('#selAreaEsp').html(response);   
    //         },
    //         error : function(response) {
    //         //    alert('Ocurrió un error inesperado al visualizar, inténtelo mas tarde.'); 
    //         }
    //      });
    // }

    $(".mask-rut").inputmask({
        mask: '(9(999){2}-K)|(99(999){2}-K)',
        autoUnmask: false, //para que .val() devuelva sin mascara (sin puntos ni guion)
        keepStatic: true, //para que el formato de mascara mas corta se mantenga hasta que sea necesario el mas largo
        showMaskOnFocus: false, //oculta la mascara en focus
        showMaskOnHover: false, //oculta la mascara en hover
        definitions: {
            'K': {
                validator: '[0-9|kK]',
                casing: 'upper',
            }
        }
    });

    getTypes();
    getBranchs();
    getAreas();
    // getSubAreas();
    getChannels();
    getChannelsEntry();
    getGenders();
    getRegions();
    getFormDocuments();
    getFormHistory();
    
    $(".selRegion").select2({
        data: [],
        placeholder: 'Seleccione región'
    });
    $(".selDistrict").select2({
        data: [],
        placeholder: 'Seleccione comuna'
    });

    //#endregion

    //#region SetListeners   
    //CAMBIO PDF
    $("#generatePDF").click(async function() {
        const reclamo = document.getElementById('txtSubjectClaim').value;
        const respuesta = document.getElementById('txtImprove').value;
       
        const response = await fetch('/app/Views/pdfTemplates/reclamotemplate.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams({
                reclamo: reclamo,
                respuesta: respuesta,
            })
        });
    
        if (!response.ok) {
            console.error('Error en la respuesta del servidor:', response.statusText);
            return;
        }
    
        const pdfBlob = await response.blob();
        const pdfUrl = URL.createObjectURL(pdfBlob);
        document.getElementById('pdfPreview').src = pdfUrl;
    });

    $(".infoFolio").click(function(){
        swal("Información",'Corresponde al folio interno del sistema, se genera automáticamente al crear formulario.','info');
    });
    
    $("#cbxPacient").click(function(){
        if($(this).is(":checked")){
            $(".card-reclamante").hide(); 
            $("#setSignOwner").text('Paciente');
            var inputsRequiredClaimant = $(".requiredForSaveClaimant");
            $.each(inputsRequiredClaimant, function(idx, input){
                var id = $(input).attr('id');
                document.getElementById(id).setCustomValidity('');
            });
        }else{
            $(".card-reclamante").fadeIn(); 
            $("#setSignOwner").text('Apoderado');
        }
    });

    $(".selRegion").change(function(){        
        var selDistrict = $(this).data('district');
        var region = $(this).val();
        if(region && selDistrict){
            getDistricts(region, selDistrict);
        }
    });

    $("#selType").change(function(){        
        var type = $(this).val();
        if(type){
            if(type == 1){
                $("#other-detail").hide(); $("#claim-detail").show();      
            }else{
                $("#claim-detail").hide(); $("#other-detail").show();  
            }
        }
    });

    $('#fileSign').on('change', function (e) {
        var $this = $(this);
        var name = $($this).val();
        if($this && $this.length > 0 && name && name.length > 0){
            var file = $this[0]; 
            uploadSign(file);
        }
    });

    $(".counter").on('keypress', function() {
        var limit = $(this).attr('maxlength');
        var init = $(this).val().length;     
        var counter = $(this).data('counterlabel');        
        if(init<limit){
          init++;
          $(counter).text(init+' de '+limit+' caracteres.'); 
        }
    });

    $(".counter").on('change', function() {
        var limit = $(this).attr('maxlength');
        var init = $(this).val().length;     
        var counter = $(this).data('counterlabel');        
        if(init<limit){
          init++;
          $(counter).text(init+' de '+limit+' caracteres.'); 
        }
    });

    $(".row-btn-add").click(function(e){
       var $this = $(this);
       saveForm($this);
    });

    //#region SetListener Documentos
    
    $('#fileForm').on('change', function (e) {
        e.preventDefault();
        var file = $('#fileForm').val();
        if(file && file.length > 0){
            uploadFormDocumentTemp();
        }
    });
    $("#formDocs").on("click",".btn-doc-download-form",function(e){
        e.preventDefault();
        var $this = $(this);
        try{
            var upload_name = $($this).data('upload_name');
            var original_name = $($this).data('original_name');
            var path = $($this).data('path');
            var type = $($this).data('type');
            if(upload_name && original_name){                
                downloadFormDocument(upload_name, original_name, path, $this, type);                    
            } 
        }catch(e){
            console.warn(e);
            swal("Error al descargar","Ocurrió un error al descargar, inténtelo mas tarde.",'error');
        }           
    });
    $("#formDocs").on("click",".btn-doc-remove-form",function(e){
        e.preventDefault();
        var $this = $(this);
        try{
            var doc = $($this).data('id');
            var docTemp = $($this).data('doctemp');
            var upload_name = $($this).data('upload_name');
            var path = $($this).data('path');
            deleteFormDocument(upload_name, doc, docTemp, path, $this);   
        }catch(e){
            console.warn(e);
            swal("Error al eliminar","Ocurrió un error al eliminar, inténtelo mas tarde.",'error');
        }           
    });
    $("#formDocs").on("click",".btn-doc-see-form",function(e){
        e.preventDefault();
        var $this = $(this);
        try{
            var doc = $($this).data('doc');
            if(doc){
                $("#txtDocName").val(doc.doc_desc);
                $("#txtDocAuthor").val(doc.full_name);
                $("#txtDocDate").val(doc.created_at);
                $("#modalSeeDocForms").modal();
            } else{
                swal("Error al eliminar","Ocurrió un error al cargar detalle del documento, inténtelo mas tarde.",'error');
            }
        }catch(e){
            console.warn(e);
            swal("Error al eliminar","Ocurrió un error al cargar detalle del documento, inténtelo mas tarde.",'error');
        }           
    });
    //#endregion

    //#region SetListener Historial
        $("#btnSaveHistory").click(function(e){
            e.preventDefault(); 
            var $this = $(this);
            var valid = true;
            var comment = $("#txtHistoryComment").val().trim();
            if(comment.length == 0){document.getElementById("txtHistoryComment").setCustomValidity('invalid'); valid = false;}
            else{ document.getElementById("txtHistoryComment").setCustomValidity(''); }
            //Validado
            $("#add-hitory").addClass("was-validated");
            if(valid){
                saveHistory(comment,$this);
            }
        }); 
        $("#formHistory").on("click",".btn-delete-history",function(e){
            e.preventDefault();
            var $this = $(this);
            var id = $($this).data('id');
            var idTemp = $($this).data('idtemp');
            deleteHistory(id, idTemp, $this);
        });
    //#endregion

    //#endregion SetListeners
    
 });

//#region Functions

//#region Selects

this.getTypes = function(){
    var items = [];    
    var html = '';

    $.ajax({
        url:  baseURL+'/Inbox/getTypes',
        type: "POST",
        dataType: "json",
        data : {},
        success : function(response) {
            if(response && !response.error){
                if(response.values && response.values.length>0){
                    if(response && !response.error){
                        if(response.values && response.values.length>0){
                            items = response.values.map(function(e){return {'id': e.id.toString(), 'text':e.type}});
                        }
                    }
                    $("#selType").select2({
                        data: items,
                        placeholder: 'Seleccione tipo'
                    });
                    $("#selType").val(null).trigger('change');     
                    
                    //Precarga datos en selects si aplica
                    var type = $("#selTypeEdit").val();   
                    if(type && type.length > 0){ $("#selType").val(type).trigger('change');  }
                }else{
                    $("#selType").select2({
                        data: items,
                        placeholder: 'Seleccione tipo'
                    });
                    $("#selType").val(null).trigger('change');
                }
            }else{
                $("#selType").select2({
                    data: items,
                    placeholder: 'Seleccione tipo'
                });
                $("#selType").val(null).trigger('change');       
            }
                    
        },
        error : function(response) {
            $("#selType").select2({
                data: items,
                placeholder: 'Seleccione tipo'
            });
            $("#selType").val(null).trigger('change');
        }
    });
}

this.getBranchs = function(){
    var items = [];
    $.ajax({
        url:  baseURL+'/Inbox/getBranchs',
        type: "POST",
        dataType: "json",
        data : {},
        success : function(response) {
            if(response && !response.error){
                if(response.values && response.values.length>0){
                    items = response.values.map(function(e){return {'id': e.id, 'text':e.branch}});
                }
            }
            $("#selBranch").select2({
                data: items,
                placeholder: 'Seleccione sucursal'
            });
            $("#selBranch").val(null).trigger('change');    
            //Precarga datos en selects si aplica
            var branch = $("#selBranchEdit").val();   
            if(branch && branch.length > 0){ $("#selBranch").val(branch).trigger('change');  }
        },
        error : function(response) {
            $("#selBranch").select2({
                data: items,
                placeholder: 'Seleccione sucursal'
            });
            $("#selBranch").val(null).trigger('change');          
        }
    });
}

this.getAreas = function(){
    var items = [];
    $.ajax({
        url:  baseURL+'/Inbox/getAreas',
        type: "POST",
        dataType: "json",
        data : {},
        success : function(response) {
            if(response && !response.error){
                if(response.values && response.values.length>0){
                    items = response.values.map(function(e){return {'id': e.id.toString(), 'text':e.area}});
                }
            }
            $("#selArea").select2({
                data: items,
                placeholder: 'Seleccione área'
            });
            $("#selArea").val(null).trigger('change');     
            
            //Precarga datos en selects si aplica
            var area = $("#selAreaEdit").val();   
            if(area && area.length > 0){ $("#selArea").val(area).trigger('change');  }
                   
        },
        error : function(response) {
            $("#selArea").select2({
                data: items,
                placeholder: 'Seleccione área'
            });
            $("#selArea").val(null).trigger('change');         
        }
    });
}

this.getSubAreas = function(){
    var items = [];
    $.ajax({
        url:  baseURL+'/Inbox/getSubAreas',
        type: "POST",
        dataType: "json",
        data : {},
        success : function(response) {
            if(response && !response.error){
                console.log(response);
                if(response.values && response.values.length>0){
                    items = response.values.map(function(e){return {'id': e.id, 'text':e.area}});
                }
            }
            $("#selAreaEsp").select2({
                data: items,
                placeholder: 'Seleccione área específica'
            });
            $("#selAreaEsp").val(null).trigger('change');     
            
            //Precarga datos en selects si aplica
            var subarea = $("#selAreaEspEdit").val();   
            if(subarea && subarea.length > 0){ $("#selAreaEsp").val(subarea).trigger('change');  }
                   
        },
        error : function(response) {
            $("#selAreaEsp").select2({
                data: items,
                placeholder: 'Seleccione área específica'
            });
            $("#selAreaEsp").val(null).trigger('change');         
        }
    });
}

this.getChannels = function(){
    var items = [];
    $.ajax({
        url:  baseURL+'/Inbox/getChannels',
        type: "POST",
        dataType: "json",
        data : {},
        success : function(response) {
            if(response && !response.error){
                if(response.values && response.values.length>0){
                    items = response.values.map(function(e){return {'id': e.id.toString(), 'text':e.channel}});
                }
            }
            $("#selChannel").select2({
                data: items,
                placeholder: 'Seleccione vía de contacto'
            });
            $("#selChannel").val(null).trigger('change');    
            
            //Precarga datos en selects si aplica
            var channel = $("#selChannelEdit").val();   
            if(channel && channel.length > 0){ $("#selChannel").val(channel).trigger('change');  }
        },
        error : function(response) {
            $("#selChannel").select2({
                data: items,
                placeholder: 'Seleccione vía de contacto'
            });
            $("#selChannel").val(null).trigger('change');         
        }
    });
}

this.getChannelsEntry = function(){
    var items = [];
    $.ajax({
        url:  baseURL+'/Inbox/getChannelsEntry',
        type: "POST",
        dataType: "json",
        data : {},
        success : function(response) {
            if(response && !response.error){
                if(response.values && response.values.length>0){
                    items = response.values.map(function(e){return {'id': e.id, 'text':e.entry_channel}});
                }
            }
            $("#selEntryChannel").select2({
                data: items,
                placeholder: 'Seleccione canal de ingreso'
            });
            $("#selEntryChannel").val(null).trigger('change');    
            
            //Precarga datos en selects si aplica
            var channel = $("#selEntryChannelEdit").val();   
            if(channel && channel.length > 0){ $("#selEntryChannel").val(channel).trigger('change');  }
        },
        error : function(response) {
            $("#selEntryChannel").select2({
                data: items,
                placeholder: 'Seleccione canal de ingreso'
            });
            $("#selEntryChannel").val(null).trigger('change');         
        }
    });
}

this.getGenders = function(){
    var items = [];
    $.ajax({
        url:  baseURL+'/Inbox/getGenders',
        type: "POST",
        dataType: "json",
        data : {},
        success : function(response) {
            if(response && !response.error){
                if(response.values && response.values.length>0){
                    items = response.values.map(function(e){return {'id': e.id, 'text':e.gender}});
                }
            }
            $(".selGender").select2({
                data: items,
                placeholder: 'Seleccione género'
            });
            $(".selGender").val(null).trigger('change');    
            
            //Precarga datos en selects si aplica
            var gender = $("#selGenderEdit").val();   
            if(gender && gender.length > 0){ $("#selGender").val(gender).trigger('change');  }
            var genderClaimant = $("#selGenderClaimantEdit").val();   
            if(genderClaimant && genderClaimant.length > 0){ $("#selGenderClaimant").val(genderClaimant).trigger('change');  }
        },
        error : function(response) {
            $(".selGender").select2({
                data: items,
                placeholder: 'Seleccione género'
            });
            $(".selGender").val(null).trigger('change');          
        }
    });
}

this.getRegions = function(){
    var items = [];
    $.ajax({
        url:  baseURL+'/Inbox/getRegions',
        type: "POST",
        dataType: "json",
        data : {},
        success : function(response) {
            if(response && !response.error){
                if(response.values && response.values.length>0){
                    items = response.values.map(function(e){return {'id': e.id.toString(), 'text':e.region}});
                }
            }
            $(".selRegion").select2({
                data: items,
                placeholder: 'Seleccione región'
            });
            $(".selRegion").val(null).trigger('change'); 

            //Precarga datos en selects si aplica
            var pacient_region = $("#selRegionEdit").val();   
            if(pacient_region && pacient_region.length > 0){ $("#selRegion").val(pacient_region).trigger('change');  }
            var claimant_region = $("#selRegionClaimant").val();    
            if(claimant_region && claimant_region.length > 0){ $("#selRegionClaimant").val(claimant_region).trigger('change');  } 
        },
        error : function(response) {
            $(".selRegion").select2({
                data: items,
                placeholder: 'Seleccione región'
            });
            $(".selRegion").val(null).trigger('change');       
        }
    });
}

this.getDistricts = function(region_id, selDistrict){
    var items = [];
    $(selDistrict+' option').remove();
    $.ajax({
        url:  baseURL+'/Inbox/getDistrictsByRegion',
        type: "POST",
        dataType: "json",
        data : JSON.stringify({ region_id: region_id }),
        success : function(response) {
            if(response && !response.error){
                if(response.values && response.values.length>0){
                    items = response.values.map(function(e){return {'id': e.id.toString(), 'text':e.district}});
                }
            }
            $(selDistrict).select2({
                data: items,
                placeholder: 'Seleccione comuna'
            });
            $(selDistrict).val(null).trigger('change');  
            
            var pacient_district = $("#selDistrictEdit").val();  
            if(pacient_district && pacient_district.length > 0){ $("#selDistrict").val(pacient_district).trigger('change');  }  
            var claimant_district  = $("#selDistrictClaimantEdit").val();  
            if(claimant_district && claimant_district.length > 0){ $("#selDistrictClaimant").val(claimant_district).trigger('change');  } 
             //Precarga datos en selects si aplica          
        },
        error : function(response) {
            $(selDistrict).select2({
                data: items,
                placeholder: 'Seleccione comuna'
            });
            $(selDistrict).val(null).trigger('change');       
        }
    });
}
 
//#endregion

this.saveForm = function(btn){
    
    validateForm(form).then(function(isValid){
        if(isValid && form){
            swal({
                title: "¿Está seguro de guardar los cambios del formulario?",
                text: "Confirme para continuar.",
                icon: "warning",
                buttons: {
                    cancel: {
                      text: "Cancelar",
                      visible: true,
                      closeModal: true,
                    },
                    confirm: {
                      text: "Aceptar",
                      visible: true
                    }
                  },
                dangerMode: true
            })
            .then(function(ok) {
                if (ok) {
                    $.ajax({
                        url:  baseURL+'/Inbox/saveForm',
                        type: "POST",
                        dataType: "json",
                        data : JSON.stringify({ form: form }),
                        beforeSend: function(){ $(btn).buttonLoader('start'); },
                        success : function(response) {
                            $(btn).buttonLoader('stop');
                            if(response && !response.error){
                                if(response.values && response.values.length>0){
                                    if(form.id != "0"){
                                        swal("Operación exitosa","Se ha editado el formulario: "+response.values,"success").then(function(){
                                            document.getElementById('btnBack').click();
                                        });
                                    }else{
                                        swal("Operación exitosa","Se ha ingresado el formulario: "+response.values,"success").then(function(){
                                            location.reload();
                                        });
                                    }
                                }else{
                                    swal("Error inesperado","Ocurrió un error inesperado al procesar su formulario, contacte al administrador del sitio.","error");       
                                }
                            }else{
                                swal("Error inesperado","Ocurrió un error inesperado al procesar su formulario, contacte al administrador del sitio.","error");       
                            }
                                    
                        },
                        error : function(response) {
                            $(btn).buttonLoader('stop');
                            swal("Error inesperado","Ocurrió un error inesperado al procesar su formulario, contacte al administrador del sitio.","error");
                        }
                    });     
                }
            });        
        }
        else{
            // swal("Error inesperado","Ocurrió un error inesperado, contacte al administrador del sitio.","error");
        }
    });
}

this.validateForm = function(form){
    return new Promise(function(resolve){
        var isValid = true;
        var inputsRequired = $(".requiredForSave");
        if(!$("#cbxPacient").is(":checked")){
            var inputsRequiredClaimant = $(".requiredForSaveClaimant");
            Array.prototype.push.apply(inputsRequired,inputsRequiredClaimant);
        }
        $.each(inputsRequired, function(idx, input){
            var id = $(input).attr('id');
            if($(input).data('validate') == 'rut'){
                isValid = checkRut(document.getElementById(id));
            } 
            else 
            {
                if($(input).data('validate') == 'sign'){
                    if(!$(input).hasClass('loaded')){
                        isValid = false;                   
                        document.getElementById(id).setCustomValidity('invalid');
                    }else{
                        document.getElementById(id).setCustomValidity('');
                    }
                }
                else {
                    var value = $(input).val();           
                    if(value && value.length > 0){
                        document.getElementById(id).setCustomValidity('');
                    }else{
                        document.getElementById(id).setCustomValidity('invalid');
                        isValid = false;
                    }    
                }  
            }                              
        });  
        if($("#selType").val() == 1){
            var value = $("#txtResume").val();           
            if(value && value.length > 0){
                document.getElementById("txtResume").setCustomValidity('');
            }else{
                document.getElementById("txtResume").setCustomValidity('invalid');
                isValid = false;
            } 
            var value = $("#txtSolution").val();           
            if(value && value.length > 0){
                document.getElementById("txtSolution").setCustomValidity('');
            }else{
                document.getElementById("txtSolution").setCustomValidity('invalid');
                isValid = false;
            }  
        }else{
            var value = $("#txtComments").val();           
            if(value && value.length > 0){
                document.getElementById("txtComments").setCustomValidity('');
            }else{
                document.getElementById("txtComments").setCustomValidity('invalid');
                isValid = false;
            }
        }
        $(".tab-parent-save").addClass('was-validated');
        //Muestra pestaña con validación
        if(!$('.invalid-feedback').is(':visible')){
            $('.invalid-feedback').each(function(){
                var $this = this;
                if($($this).css("display")=="block"){
                    // alert($this.textContent);
                    if(!$($this).is(':visible')){
                        var pane = $($this).closest('.tab-pane');
                        // alert(pane.attr("id"));
                        if(pane){
                            var tab = $(pane).attr('aria-labelledby');
                            // alert(tab);
                            $("#"+tab).trigger('click');     
                            return false;               
                        }
                    }
                }
            });
        }
        if(isValid) { fillForm().then(function(){ resolve(isValid); }); } else { resolve(isValid); }
    });
}

this.fillForm = function(){
    return new Promise(function(resolve){
        //Formulario
        form.id = $("#hdnFormID").val();
        form.intern_invoice =  $("#txtInternInvoice").val().trim();
        //Información del paciente
        form.pacient_names = $("#txtName").val().trim();
        form.pacient_social_name = $("#txtSocialName").val().trim();
        form.pacient_lastname = $("#txtLastname").val().trim();
        form.pacient_mlastname = $("#txtLastname2").val().trim();
        form.pacient_rut = $("#txtRUT").val().trim();
        form.pacient_gender_id = $("#selGender").val() || 0;
        form.pacient_phone = $("#txtPhone").val().trim();
        form.pacient_address = $("#txtAddress").val().trim();
        form.pacient_region_id = $("#selRegion").val() || 0;
        form.pacient_district_id = $("#selDistrict").val() || 0;
        form.pacient_email = $("#txtEmail").val().trim();
        var tmpDate = $("#txtDateAttention").val().trim();
        form.attention_date = moment(tmpDate,'DD/MM/YYYY').format('YYYY/MM/DD');
        form.attention_place = $("#txtPlaceAttention").val().trim();
        form.is_pacient = $("#cbxPacient").is(":checked") ? 1 : 0;
        //Información del reclamante
        if(form.is_pacient == 0){
            form.claimant_names = $("#txtNameClaimant").val().trim();
            form.claimant_social_name = $("#txtSocialNameClaimant").val().trim();
            form.claimant_lastname = $("#txtLastnameClaimant").val().trim();
            form.claimant_mlastname = $("#txtLastname2Claimant").val().trim();
            form.claimant_rut = $("#txtRUTClaimant").val().trim();
            form.claimant_gender_id = $("#selGenderClaimant").val() || 0;
            form.claimant_phone = $("#txtPhoneClaimant").val().trim();
            form.claimant_address = $("#txtAddressClaimant").val().trim();
            form.claimant_region_id = $("#selRegionClaimant").val() || 0;
            form.claimant_district_id = $("#selDistrictClaimant").val() || 0;
            form.claimant_email = $("#txtEmailClaimant").val().trim();
        }
        form.form_sign = $("#hdnSign").val() || "";
        //Formulario
        form.form_type_id = $("#selType").val() || 0;
        form.form_type_desc = $("#selType option:selected").get(0).label;
        form.form_branch_id = $("#selBranch").val();
        form.form_branch_desc = $("#selBranch option:selected").get(0).label;
        form.form_area_id = $("#selArea").val() || 0;
        form.form_area_desc = $("#selArea option:selected").get(0).label;
        form.form_subarea_id = $("#selAreaEsp").val() || 0;
        form.form_subarea_desc = $("#selAreaEsp option:selected").get(0).label;
        form.form_channel_id = $("#selChannel").val() || 0;
        form.form_channel_desc = $("#selChannel option:selected").get(0).label;
        form.form_channel_entry_id = $("#selEntryChannel").val() || 0; 
        form.invoice = $("#txtInvoiceSystem").val().trim();
        var tmpDate = $("#txtEntryDate").val().trim();
        form.form_date_received = moment(tmpDate,'DD/MM/YYYY').format('YYYY/MM/DD');  
        form.form_resume = $("#txtResume").val().trim();
        form.form_solution = $("#txtSolution").val().trim();
        form.form_comments = $("#txtComments").val().trim();
        //Gestión
        if($("#management") && $("#management").length > 0){
            form.form_subject_claim = $("#txtSubjectClaim").val().trim();
            form.form_ot = $("#txtOT").val().trim();
            form.form_is_priority = $("#cbxPriority").is(":checked") ? 1 : 0;  
            form.form_management = $("#txtManagement").val().trim();
            form.form_improve = $("#txtImprove").val().trim();
        }
        //Documentos
        form.docs = $documentsChanges;
        //Historial
        form.history = $historyChanges;
        resolve('OK');
    });
}

this.uploadSign = function($this){
    var isValid = true;

    if($('#fileSign').val() == ''){ document.getElementById("fileSign").setCustomValidity('invalid'); isValid = false; }
    else{ document.getElementById("fileSign").setCustomValidity(''); }
    if(isValid){
        var file = $this.files[0];
        var fileType = file["type"];
        var validImageTypes = ["image/jpeg", "image/png"];
        if ($.inArray(fileType, validImageTypes) < 0) {            
            document.getElementById("fileSign").setCustomValidity('invalid');
            isValid = false;
        }
    }
    if(!isValid){
        $("#upload_sing_form").addClass("was-validated");
        $("#fileSign").text('...');
        $('#fileSign').val('').trigger('change');
        $(".imgPreview").attr("src",$img_default);
    }else{
        $("#upload_sing_form").removeClass("was-validated");
        var file = $this.files[0];
        getBase64Preview(file);
    }
}

function getBase64Preview(file) {
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function () {
      var b64 = reader.result;
      $(".imgPreview").attr("src",b64);
      form.form_sign_64 = b64;
      $("#fileSign").addClass("loaded");
    };
    reader.onerror = function (error) {
      console.error('Error: ', error);
      $(".imgPreview").attr("src",$img_default);
      $("#fileSign").removeClass("loaded");
    };
}

function checkRut(rut) {
    // Despejar Puntos
    var valor = rut.value.replaceAll('.','');
    // Despejar Guión
    valor = valor.replaceAll('-','');
    
    // Aislar Cuerpo y Dígito Verificador
    var cuerpo = valor.slice(0,-1);
    var dv = valor.slice(-1).toUpperCase();
        
    // Si no cumple con el mínimo ej. (n.nnn.nnn)
    if(cuerpo.length < 7) { rut.setCustomValidity("RUT Incompleto"); return false;}
    
    // Calcular Dígito Verificador
    var suma = 0;
    var multiplo = 2;
    
    // Para cada dígito del Cuerpo
    for(var i=1;i<=cuerpo.length;i++) {
    
        // Obtener su Producto con el Múltiplo Correspondiente
        var index = multiplo * valor.charAt(cuerpo.length - i);
        
        // Sumar al Contador General
        suma = suma + index;
        
        // Consolidar Múltiplo dentro del rango [2,7]
        if(multiplo < 7) { multiplo = multiplo + 1; } else { multiplo = 2; }
  
    }
    
    // Calcular Dígito Verificador en base al Módulo 11
    var dvEsperado = 11 - (suma % 11);
    
    // Casos Especiales (0 y K)
    dv = (dv == 'K')?10:dv;
    dv = (dv == 0)?11:dv;

    // Validar que el Cuerpo coincide con su Dígito Verificador
    if(dvEsperado != dv) { rut.setCustomValidity("RUT Inválido"); return false; }
    
    // Si todo sale bien, eliminar errores (decretar que es válido)
    rut.setCustomValidity('');
    return true;
}

//#region Documentos e Historial
this.getFormDocuments = function(){
    var form_id = $("#hdnFormID").val();
    if(form_id != "0"){
        $.ajax({
                url: baseURL+'/Inbox/getFormDocuments',
                method: "POST",
                data: JSON.stringify({form_id : form_id}),
                processData: false,
                contentType: false,
                cache: false,
                dataType: "json",
                success : function(response) {
                    if(response && !response.error && response.values && response.values.length > 0){ //Obtiene datos del archivo
                        $documents = response.values; //Actualiza documentos                   
                        //Actualiza tabla de documentos
                        reloadFormDocs($documents);
                    }
                    else{
                        //Actualiza tabla de documentos
                        reloadFormDocs($documents);
                    }
                },
                error : function(response) {
                //Actualiza tabla de documentos
                reloadFormDocs($documents);
                }
        });
    }else{
        reloadFormDocs($documents);
    }
}

this.uploadFormDocumentTemp = function(){
    var isValid = true;
    var formId = $("#hdnFormID").val();
    var desc = $("#labelFileForm").text();

    if($('#fileForm').val() == ''){ document.getElementById("fileForm").setCustomValidity('invalid'); isValid = false;}
    else{ document.getElementById("fileForm").setCustomValidity(''); }

    if(!isValid){
        $("#upload_docs_form").addClass("was-validated");
        $("#labelFileForm").text('...');
        $('#fileForm').val('').trigger('change');
    }else{
        $("#upload_docs_form").removeClass("was-validated");
        var formData = new FormData();
        formData.append('fileForm', $('#fileForm')[0].files[0]);
        //Sube archivo a servidor
        $.ajax({
            url: baseURL+'/Inbox/uploadFormDocumentTemp',
            method: "POST",
            data: formData,
            processData: false,
            contentType: false,
            cache: false,
            dataType: "json",
            success : function(response) {
                console.log(response);
                if(response && !response.error){ //Obtiene datos del archivo
                    //Guarda documento en array temporal
                    var tmpDoc = response.values;
                    console.log(tmpDoc)
                    if(tmpDoc){
                        var idTemp = Math.random().toString(36).slice(2);
                        $documents.push({
                            'id': "0",
                            'idTemp': idTemp,
                            'doc_desc': tmpDoc.doc_desc,
                            'original_name': tmpDoc.original_name,
                            'upload_name': tmpDoc.upload_name,
                            'path':tmpDoc.path,
                            "full_name":$(".spanName").text(),"created_at":moment().format('DD/MM/YYYY hh:mm:ss'),
                            'action': 'add'
                        });
                        $documentsChanges.push({
                            'id': "0",
                            'idTemp': idTemp,
                            'doc_desc': tmpDoc.doc_desc,
                            'original_name': tmpDoc.original_name,
                            'upload_name': tmpDoc.upload_name,
                            'path':tmpDoc.path,
                            "full_name":$(".spanName").text(),"created_at":moment().format('DD/MM/YYYY hh:mm:ss'),
                            'action': 'add'
                        })
                        //Limpia formulario
                        $("#labelFileForm").text('...');
                        //Mensaje OK
                        // swal('Operación Exitosa','El documento ha sido subido. Presione Guardar para conservar sus cambios.','success');
                        //Actualiza tabla de documentos
                        reloadFormDocs($documents);
                    }
                    else{
                        swal('Error inesperado','Ocurrió un error inesperado al subir archivo, inténtelo mas tarde.','error'); 
                        $("#labelFileForm").text('...');
                    }
                }
                else{
                    if(response.message == 'EXT'){
                        swal("Validación","Extensión no válida (Permitido: Imágenes, Word, Excel, Presentaciones y Correos).","info");
                    }else{
                        swal('Error inesperado','Ocurrió un error inesperado al subir archivo, inténtelo mas tarde.','error'); 
                        $("#labelFileForm").text('...');
                    }
                }
            },
            error : function(response) {
                swal('Error inesperado','Ocurrió un error inesperado al subir archivo, inténtelo mas tarde.','error'); 
                $("#labelFileForm").text('...');
            }
        });
    }
}

this.reloadFormDocs = function(documentsForm){
    //Carga documentos
    var html = '';
    if(documentsForm && documentsForm.length > 0){
        $.each(documentsForm,function(i, doc){
            html += '<div class="todo-item" data-doc="'+doc.id+'" data-doctemp="'+doc.idTemp+'">';
            html += '<span>'+ doc.doc_desc + '</span>';
            if(doc.user_logged == doc.user_id){
                html += '<a class="badge badge-danger badge-pill float-right btn-doc-remove-form pl-2 action" data-id="'+doc.id+'" data-doctemp="'+doc.idTemp+'" data-upload_name="'+doc.upload_name+'" data-path="'+doc.path+'" data-original_name="'+doc.original_name+'" title="Eliminar" data-toggle="tooltip"><i class="fas fa-trash"></i></a>';												
            }
            html += '<a class="badge badge-primary badge-pill float-right btn-doc-download-form pl-2 mr-1 action" data-id="'+doc.id+'" data-doctemp="'+doc.idTemp+'" data-upload_name="'+doc.upload_name+'" data-path="'+doc.path+'" data-type="'+doc.type+'" data-original_name="'+doc.original_name+'" title="Descargar" data-toggle="tooltip"><i class="fas fa-download"></i></a>';
            html += '<a class="badge badge-success badge-pill float-right btn-doc-see-form pl-2 mr-1 action" data-doc=\''+JSON.stringify(doc)+'\' title="Ver más" data-toggle="tooltip"><i class="fas fa-eye"></i></a>';
            html += '</div>';
        });
    }
    else{
        html += '<div class="todo-item-no-data">';
        html += '<span>No se encontraron documentos para mostrar</span>';									
        html += '</div>';
    }
    $("#formDocs").html(html);

}

this.downloadFormDocument = function(upload_name, original_name, path, btn, type){ 
    $(btn).buttonLoader('start');
    if(type == 'GET'){
        window.location = path;
    }
    else{
        // Trick for making downloadable link
        var a = document.createElement('a');
        a.href = baseURL+'/Inbox/downloadFormDocument/'+upload_name+'/'+original_name+'/'+path;
        console.log( a.href);
        // Give filename you wish to download
        a.download = original_name;
        a.style.display = 'none';
        document.body.appendChild(a);
        a.click();    
    }
    $(btn).buttonLoader('stop');  
}

this.deleteFormDocument = function(upload_name, doc, docTemp, path = '',btn){
    //Elimina tooltip
    $("#"+$(btn).attr('aria-describedby')).remove();
    var form_id = $("#hdnFormID").val();
    if(form_id != "0" && doc != "0"){
        $documentsChanges.push({
            'id': doc,
            'upload_name': upload_name,
            'path': path,
            'action': 'del'
        });
        $documents = $documents.filter(function(e){ return e.id != doc});
        reloadFormDocs($documents);
        
    }else{
        $documents = $documents.filter(function(e){ return e.idTemp != docTemp});
        $documentsChanges = $documentsChanges.filter(function(e){ return e.idTemp != docTemp});
        $documentsChanges.push({
            'id': doc,
            'upload_name': upload_name,
            'path': path,
            'action': 'del'
        });
        reloadFormDocs($documents);
    }    
}

this.getFormHistory = function(){
    var form_id = $("#hdnFormID").val();
    if(form_id != "0"){
        $.ajax({
                url: baseURL+'/Inbox/getFormHistory',
                method: "POST",
                data: JSON.stringify({form_id : form_id}),
                processData: false,
                contentType: false,
                cache: false,
                dataType: "json",
                success : function(response) {
                    if(response && !response.error && response.values && response.values.length > 0){
                        $history = response.values;                  
                        //Actualiza historial
                        reloadFormHistory($history);
                    }
                    else{
                        //Actualiza historial
                        reloadFormHistory($history);
                    }
                },
                error : function(response) {
                    //Actualiza historial
                    reloadFormHistory($history);
                }
        });
    }else{
        //Actualiza historial
        reloadFormHistory($history);
    }
}

this.reloadFormHistory = function(history){
    //Carga historial
    var html = '';
    if(history && history.length > 0){
        html += '<ul class="timeline-basic">';
        $.each(history,function(i, his){
            html += '<li class="row-history" data-id="'+his.id+'" data-idtemp="'+his.idTemp+'">';
            html += '<a href="javascript:void(0)">'+his.full_name+(his.system == '1' ? '<b class="badge badge-pill badge-secondary ml-2 mb-1">Creado por sistema</b>': '')+'</a>';
            if(his.is_admin == 1 && his.system != '1'){
                html += '<a href="#" class="btn-delete btn btn-icon btn-danger btn-delete-history" title="Eliminar" data-toggle="tooltip" data-original-title="Eliminar" data-id="'+his.id+'" data-idtemp="'+his.idTemp+'"><i class="fas fa-trash"></i></a>';
            }else{
                if(his.user_id == his.user_logged && his.system != '1'){
                    html += '<a href="#" class="btn-delete btn btn-icon btn-danger btn-delete-history" title="Eliminar" data-toggle="tooltip" data-original-title="Eliminar" data-id="'+his.id+'" data-idtemp="'+his.idTemp+'"><i class="fas fa-trash"></i></a>';
                }
            }
            html += '<a href="#" class="float-right"><i class="fas fa-clock"></i> '+his.created_at+'</a>';
            html += '<p>'+his.message+'</p>';
            html += '</li>';
        });
        html += '</ul>';
    }
    else{
        html += '<div class="todo-list">';
        html += '<div class="todo-item-no-data">';
        html += '<span>No se encontró historial para mostrar</span>';									
        html += '</div>';
        html += '</div>';
    }
    $("#formHistory").html(html);

}

this.saveHistory = function(comment,btn){
    var form_id = $("#hdnFormID").val();
    var idTemp = Math.random().toString(36).slice(2);
    $history.push({ id:"0", idTemp: idTemp, form_id: form_id, message: comment, full_name: $(".spanName").text(), created_at: moment().format('DD/MM/YYYY hh:mm:ss'), action: 'add', user_id: 0, user_logged: 0 });
    $historyChanges.push({ idTemp: idTemp, form_id: form_id, message: comment, action: 'add' });
    // swal('Operación Exitosa','El comentario ha sido grabado. Presione Guardar para conservar sus cambios.','success');  
    $("#txtHistoryComment").val('');             
    $("#add-hitory").removeClass("was-validated");
    //Actualiza historial
    reloadFormHistory($history);    
}

this.deleteHistory = function(historyID, historyIDTemp, btn){
    //Elimina tooltip
    $("#"+$(btn).attr('aria-describedby')).remove();
    var form_id = $("#hdnFormID").val();
    if(form_id != "0" && historyID != "0"){
        $history = $history.filter(function(e){ return e.id != historyID});
        $historyChanges.push({ id: historyID, action: 'del' });
        reloadFormHistory($history);
    }else{
        $history = $history.filter(function(e){ return e.idTemp != historyIDTemp});
        $historyChanges = $historyChanges.filter(function(e){ return e.idTemp != historyIDTemp});
        reloadFormHistory($history);
    }
}
//#endregion

//#endregion
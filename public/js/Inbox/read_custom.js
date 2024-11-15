"use strict";

 $(document).ready(function() {

    getFormDocuments();
    getFormHistory();

    //#region SetListeners

    $(".infoFolio").click(function(){
        swal("Información",'Corresponde al folio interno del sistema, se genera automáticamente al crear formulario.','info');
    });

    //SetListener Documentos
    
    $('#fileForm').on('change', function (e) {
        e.preventDefault();
        var file = $('#fileForm').val();
        if(file && file.length > 0){
            uploadFormDocument();
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
            var upload_name = $($this).data('upload_name');
            var path = $($this).data('path');
            if(doc){
                swal({
                    title: "¿Desea eliminar este documento?",
                    text: "Confirme para continuar",
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
                    deleteFormDocument(upload_name, doc, path, $this);           
                }
                });                         
            } 
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

    //SetListener Historial
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
            swal({
                title: "¿Desea añadir este comentario?",
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
                saveHistory(comment,$this);
            }
            });
        }
    }); 
    $("#formHistory").on("click",".btn-delete-history",function(e){
        e.preventDefault();
        var $this = $(this);
        var id = $($this).data('id');
        swal({
            title: "¿Desea eliminar este comentario?",
            text: "Esta acción no se podrá deshacer",
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
            deleteHistory(id, $this);
        }
        });         
    });
    //#endregion
    
 });

//#region Selects

//#endregion

//#region Funciones

this.getFormDocuments = function(){
    var form_id = $("#hdnFormID").val();
    var documentsForm = [];
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
                   documentsForm = response.values; //Actualiza documentos                   
                    //Actualiza tabla de documentos
                    reloadFormDocs(documentsForm);
                }
                else{
                    //Actualiza tabla de documentos
                    reloadFormDocs(documentsForm);
                }
            },
            error : function(response) {
               //Actualiza tabla de documentos
               reloadFormDocs(documentsForm);
            }
        });
}

this.uploadFormDocument = function(){
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
        var tmpFormData = [];
        tmpFormData.push({name: "form_id", value: formId });
        var form = $('#upload_docs_form')[0];
        $.each(tmpFormData, function(i,param){
            $('<input />').attr('type', 'hidden')
                .attr('name', param.name)
                .attr('value', param.value)
                .appendTo(form);
        });
        var formData = new FormData(form);
        //Elimina inputs luego de obtener post
        $.each(tmpFormData, function(i,param){
            $('#upload_docs_form input[name="'+param.name+'"]').remove();
        });
        //Sube archivo a servidor
        $.ajax({
            url: baseURL+'/Inbox/uploadFormDocument',
            method: "POST",
            data: formData,
            processData: false,
            contentType: false,
            cache: false,
            dataType: "json",
            success : function(response) {
                if(response && !response.error){ //Obtiene datos del archivo
                    //Limpia formulario
                    $("#labelFileForm").text('...');
                    //Mensaje OK
                    swal('Operación Exitosa','El documento ha sido subido.','success');
                    //Actualiza tabla de documentos
                    getFormDocuments();
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
            html += '<div class="todo-item" data-doc="'+doc.id+'">';
            html += '<span>'+ doc.doc_desc + '</span>';
            if(doc.user_logged == doc.user_id){
                html += '<a class="badge badge-danger badge-pill float-right btn-doc-remove-form pl-2 action" data-id="'+doc.id+'" data-upload_name="'+doc.upload_name+'" data-path="'+doc.path+'" data-original_name="'+doc.original_name+'" title="Eliminar" data-toggle="tooltip"><i class="fas fa-trash"></i></a>';												
            }
            html += '<a class="badge badge-primary badge-pill float-right btn-doc-download-form pl-2 mr-1 action" data-id="'+doc.id+'" data-upload_name="'+doc.upload_name+'" data-path="'+doc.path+'" data-type="'+doc.type+'" data-original_name="'+doc.original_name+'" title="Descargar" data-toggle="tooltip"><i class="fas fa-download"></i></a>';
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

this.deleteFormDocument = function(upload_name, doc, path, btn){
    if(doc){   
        $.ajax({
            url:  baseURL+'/Inbox/deleteFormDocument',
            type: "POST",
            dataType: "json",
            data : JSON.stringify({ upload_name:upload_name, doc_id: doc, path:path }),
            beforeSend: function(){ $(btn).buttonLoader('start'); },
            success : function(response) {
                $(btn).buttonLoader('stop');
                if(response && !response.error){                    
                    //Mensaje OK
                    swal('Operación Exitosa','El documento ha sido eliminado.','success'); 
                    //Elimina
                    $(".todo-item[data-doc='"+doc+"']").fadeIn('slow', function(){
                        $(this).remove();
                    });
                }else{
                    swal('Error inesperado','Ocurrió un error inesperado al eliminar archivo, inténtelo mas tarde.','error'); 
                }
            },
            error : function(response) {               
                $(btn).buttonLoader('stop');
                swal('Error inesperado','Ocurrió un error inesperado al eliminar archivo, inténtelo mas tarde.','error'); 
            }
        });
    }else{
        swal('Error inesperado','Ocurrió un error inesperado, inténtelo mas tarde.','error'); 
    }
}

this.getFormHistory = function(){
    var form_id = $("#hdnFormID").val();
    var history = [];
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
                    history = response.values;                  
                    //Actualiza historial
                    reloadFormHistory(history);
                }
                else{
                    //Actualiza historial
                    reloadFormHistory(history);
                }
            },
            error : function(response) {
               //Actualiza historial
               reloadFormHistory(history);
            }
        });
}

this.reloadFormHistory = function(history){
    //Carga historial
    var html = '';
    if(history && history.length > 0){
        html += '<ul class="timeline-basic" id="">';
        $.each(history,function(i, his){
            html += '<li>';
            html += '<a href="javascript:void(0)">'+his.full_name+(his.system == '1' ? '<b class="badge badge-pill badge-secondary ml-2 mb-1">Creado por sistema</b>': '')+'</a>';
            if(his.is_admin == 1 && his.system != '1'){
                html += '<a href="#" class="btn-delete btn btn-icon btn-danger btn-delete-history" title="Eliminar" data-toggle="tooltip" data-original-title="Eliminar" data-id="'+his.id+'"><i class="fas fa-trash"></i></a>';
            }else{
                if(his.user_id == his.user_logged && his.system != '1'){
                    html += '<a href="#" class="btn-delete btn btn-icon btn-danger btn-delete-history" title="Eliminar" data-toggle="tooltip" data-original-title="Eliminar" data-id="'+his.id+'"><i class="fas fa-trash"></i></a>';
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
    $.ajax({
        url:  baseURL+'/Inbox/saveHistory',
        type: "POST",
        dataType: "json",
        data : JSON.stringify({ form_id: form_id, comment: comment }),
        beforeSend: function(){
            $(btn).buttonLoader('start');
        },
        success : function(response) {
            $(btn).buttonLoader('stop');
            if(response && !response.error){
               swal('Operación Exitosa','El comentario ha sido grabado.','success');  
               $("#txtHistoryComment").val('');             
               $("#add-hitory").removeClass("was-validated");
               getFormHistory();               
            }else{
                swal('Error inesperado','Ocurrió un error inesperado al grabar, inténtelo mas tarde.','error'); 
            }                
        },
        error : function(response) {
            $(btn).buttonLoader('stop');
            swal('Error inesperado','Ocurrió un error inesperado al grabar, inténtelo mas tarde.','error'); 
        }
    });
}

this.deleteHistory = function(historyID,btn){
    var form_id = $("#hdnFormID").val();
    $.ajax({
        url:  baseURL+'/Inbox/deleteHistory',
        type: "POST",
        dataType: "json",
        data : JSON.stringify({ form_id: form_id, historyID: historyID }),
        beforeSend: function(){
            $(btn).buttonLoader('start');
        },
        success : function(response) {
            $(btn).buttonLoader('stop');
            if(response && !response.error){
               swal('Operación Exitosa','El comentario ha sido eliminado.','success');               
               getFormHistory();            
            }else{
                swal('Error inesperado','Ocurrió un error inesperado al eliminar, inténtelo mas tarde.','error'); 
            }                
        },
        error : function(response) {
            $(btn).buttonLoader('stop');
            swal('Error inesperado','Ocurrió un error inesperado al eliminar, inténtelo mas tarde.','error'); 
        }
    });
}

//#endregion
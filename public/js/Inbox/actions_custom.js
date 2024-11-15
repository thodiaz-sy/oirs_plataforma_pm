"use strict";
 $(document).ready(function() {

    //#region Init

    //#endregion

    //#region SetListeners   

    $('body').on('click', '.row-btn-reasign',function(e){
      e.preventDefault();
      var btn = $(this);
      var form_id = $(btn).data('id');
      var invoice = $(btn).data('invoice');
      $("#hdnFormIDReasign").val(form_id);
      $("#spanFolioReasign").text(invoice);
      getReasignProfiles(form_id, btn).then(function(resolve){
         if(resolve == "ERROR"){
            swal('Error inesperado','Ocurrió un error inesperado al cargar datos para reasignar, inténtelo mas tarde.','error');
         }else{
            $("#modalReasign").modal('show');
         }
      });
    });

    $('body').on('click', '#btnReasign',function(e){
         e.preventDefault();
         var btn = $(this);
         var form_id = $("#hdnFormIDReasign").val() || "0";
         var user_entry_id = $("#selEntryProfile").val() || "0";
         var user_entry = $("#selEntryProfile option:selected").text() || 'Ninguno';
         var user_manager_id = $("#selManagementProfile").val() || "0";
         var user_manager = $("#selManagementProfile option:selected").text() || 'Ninguno';
         var user_director_id = $("#selDirectorProfile").val() || "0";
         var user_director = $("#selDirectorProfile option:selected").text() || 'Ninguno';
         reasignProfiles(form_id, user_entry_id, user_entry, user_manager_id, user_manager, user_director_id, user_director, btn);
    });

    $('body').on('click', '.row-btn-send',function(e){
      e.preventDefault();
      var btn = $(this);
      var form_id = $(btn).data('id');
      var invoice = $(btn).data('invoice');
      swal({
         title: "Confirmación",
         text: "¿Desea enviar formulario para su gestión?",
         content: {
         element: "input",
         attributes: {
             placeholder: "Escriba un comentario",
             type: "text",
             autocomplete:"off",
             maxlength:500
         }},  
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
         dangerMode: true,
         closeOnClickOutside: false
     })
     .then(function(comment) {
         if(comment!=null){           
            sendForm(form_id, comment, btn).then(function(resolve){               
            });
         }
     });      
    });
    
    $('body').on('click', '.row-btn-decline',function(e){
      e.preventDefault();
      var btn = $(this);
      var form_id = $(btn).data('id');
      var invoice = $(btn).data('invoice');
      swal({
         title: "Confirmación",
         text: "¿Desea rechazar gestión del formulario?",
         content: {
         element: "input",
         attributes: {
             placeholder: "Escriba un comentario",
             type: "text",
             autocomplete:"off",
             maxlength:500
         }},  
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
         dangerMode: true,
         closeOnClickOutside: false
     })
     .then(function(comment) {
         if(comment!=null){           
            sendForm(form_id, comment, btn, 1).then(function(resolve){               
            });
         }
     });      
    }); 

    $('body').on('click', '.row-btn-approve2',function(e){
      e.preventDefault();
      $('#exampleModal').modal('hide');
      var btn = $(this);
      var btn2 = $('#btnCerrar');
      var form_id = $(btn).val();
      var invoice = $(btn2).val();
      // alert(form_id);
      // alert(invoice);
      swal({
         title: "Confirmación",
         text: "¿Desea aprobar gestión del formulario?",
         content: {
         element: "input",
         attributes: {
             placeholder: "Escriba un comentario",
             type: "text",
             autocomplete:"off",
             maxlength:500
         }},  
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
         dangerMode: true,
         closeOnClickOutside: false
     })
     .then(function(comment) {
         if(comment!=null){           
            sendForm(form_id, 0).then(function(resolve){               
            });
         }
     });      
    });

    $('body').on('click', '.row-btn-approve',function(e){
      e.preventDefault();
      $('#btnAprobar').prop("disabled", true);
      $('#claveDirector').val('');
      $('#btnAprobar').val('');
      $('#btnCerrar').val('');
      var btn = $(this);
      var form_id = $(btn).data('id');
      var invoice = $(btn).data('invoice');
      $('#btnAprobar').val(form_id);
      $('#btnCerrar').val(invoice);
      vistaPrevia(form_id);
      $('#exampleModalLabel').html(`Previsualización ${invoice}`);
      $('#exampleModal').modal('show');
    });

    $('body').on('click', '.row-btn-approve3',function(e){
      e.preventDefault();
      var btn = $(this);
      var form_id = $(btn).data('id');
      swal({
         title: "Confirmación",
         text: "¿Desea aprobar gestión del formulario?",
         content: {
         element: "input",
         attributes: {
             placeholder: "Escriba un comentario",
             type: "text",
             autocomplete:"off",
             maxlength:500
         }},  
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
         dangerMode: true,
         closeOnClickOutside: false
     })
     .then(function(comment) {
         if(comment!=null){           
            sendForm(form_id, 0).then(function(resolve){});
         }
     });      
   });


    function vistaPrevia(id){
      $.ajax({
         url:  baseURL+'/Inbox/previsualizar',
         type: "POST",
         data : {'idformulario': id},
         success : function(response) {
            $('#resumenModal').html(response);          
         },
         error : function(response) {
            alert('Ocurrió un error inesperado al visualizar, inténtelo mas tarde.'); 
         }
      });
    }

    $(document).on('keyup', '#claveDirector', function() {
      var director = $('#idDirector').val();
      // alert(director);
      claveDirector(director);
    });

   function claveDirector(director){
      //   alert(director);
      var clave = $('#claveDirector').val();
      $.ajax({
         url:  baseURL+'/Inbox/claveDirector',
         type: "POST",
         data : {'iddirector': director},
         success : function(response) {
            if(clave == response){
               $('#btnAprobar').prop("disabled", false);
            } else {
               $('#btnAprobar').prop("disabled", true);
            }         
         },
      });
   }

    $('body').on('click', '.row-btn-insist',function(e){
      e.preventDefault();
      var btn = $(this);
      var form_id = $(btn).data('id');
      var invoice = $(btn).data('invoice');
      swal({
         title: "Confirmación",
         text: "¿Desea insistir para gestión del formulario?",
         content: {
         element: "input",
         attributes: {
             placeholder: "Escriba un comentario",
             type: "text",
             autocomplete:"off",
             maxlength:500
         }},  
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
         dangerMode: true,
         closeOnClickOutside: false
     })
     .then(function(comment) {
         if(comment!=null && comment.length > 0){           
            insistForm(form_id, comment, btn).then(function(resolve){               
            });
         }else{
            if(comment!=null){
               swal('Validación','Para insistir debe ingresar un comentario.','info'); 
            }     
         }
     });      
    });
    
    $('body').on('click', '.row-btn-reopen',function(e){
      e.preventDefault();
      var btn = $(this);
      var form_id = $(btn).data('id');
      var invoice = $(btn).data('invoice');
      swal({
         title: "Confirmación",
         text: "¿Desea reabrir formulario?",
         content: {
         element: "input",
         attributes: {
             placeholder: "Escriba un comentario",
             type: "text",
             autocomplete:"off",
             maxlength:500
         }},  
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
         dangerMode: true,
         closeOnClickOutside: false
     })
     .then(function(comment) {
         if(comment!=null){           
            sendForm(form_id, comment, btn, 1).then(function(resolve){               
            });
         }
     });      
    });
    
    //#endregion SetListeners
    
 });

//#region Functions

this.discardForm = function(form_id, btn){
   swal({
      title: "¿Está seguro de descartar este formulario?",
      text: "Al confirmar el formulario quedará en estado Descartado.",
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
            url:  baseURL+'/Inbox/discardForm',
            type: "POST",
            dataType: "json",
            data : JSON.stringify({ form_id: form_id }),
            beforeSend: function(){
               $(btn).buttonLoader('start');
            },
            success : function(response) {
               $(btn).buttonLoader('stop');
               if(response && !response.error){
                  swal('Operación Exitosa','El formulario ha sido descartado.','success').then(function(){
                        location.reload();
                  });        
               }else{
                     swal('Error inesperado','Ocurrió un error inesperado al descartar, inténtelo mas tarde.','error'); 
               }                
            },
            error : function(response) {
               $(btn).buttonLoader('stop');
               swal('Error inesperado','Ocurrió un error inesperado al descartar, inténtelo mas tarde.','error'); 
            }
         });
      }
   });
}

this.recoveryForm = function(form_id, btn){
   swal({
      title: "¿Está seguro de recuperar este formulario?",
      text: "Al confirmar el formulario quedará en estado Ingresado.",
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
            url:  baseURL+'/Inbox/recoveryForm',
            type: "POST",
            dataType: "json",
            data : JSON.stringify({ form_id: form_id }),
            beforeSend: function(){
               $(btn).buttonLoader('start');
            },
            success : function(response) {
               $(btn).buttonLoader('stop');
               if(response && !response.error){
                  swal('Operación Exitosa','El formulario ha sido recuperado.','success').then(function(){
                     location.reload();
                  }); 
               }else{
                     swal('Error inesperado','Ocurrió un error inesperado al recuperar, inténtelo mas tarde.','error'); 
               }                
            },
            error : function(response) {
               $(btn).buttonLoader('stop');
               swal('Error inesperado','Ocurrió un error inesperado al recuperar, inténtelo mas tarde.','error'); 
            }
         });
      }
   });
}

this.deleteForm = function(form_id, btn){
   swal({
      title: "¿Está seguro de eliminar este formulario?",
      text: "Al confirmar: El formulario, documentos e historial asociado serán eliminados permanentemente del sistema.",
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
            url:  baseURL+'/Inbox/deleteForm',
            type: "POST",
            dataType: "json",
            data : JSON.stringify({ form_id: form_id }),
            beforeSend: function(){
               $(btn).buttonLoader('start');
            },
            success : function(response) {
               $(btn).buttonLoader('stop');
               if(response && !response.error){
                  swal('Operación Exitosa','El formulario ha sido eliminado.','success').then(function(){
                     location.href=baseURL+'/Inbox/Index';
                  }); 
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
   });
}

this.getReasignProfiles = function(form_id,btn){
   return new Promise(function(resolve){
      $.ajax({
         url:  baseURL+'/Inbox/getReasignProfiles',
         type: "POST",
         dataType: "json",
         data : JSON.stringify({ form_id: form_id }),
         beforeSend: function(){
            $(btn).buttonLoader('start');
         },
         success : function(response) {
            $(btn).buttonLoader('stop');
            if(response && !response.error && response.values && response.values.length > 0){
               try{
                  var tmpItems = [];
                  var entry = response.values[1];
                  if(entry && entry.length > 0){                     
                     tmpItems = entry.map(function(e){return {'id': e.id.toString(), 'text':e.name+' '+e.lastname}});
                     tmpItems.unshift({ 'id':"0", 'text': "Ninguno" });
                     $("#selEntryProfile").select2({
                        data: tmpItems,
                        placeholder: 'Seleccione usuario'
                    });
                    $("#selEntryProfile").val("0").trigger('change'); 
                  }
                  var management = response.values[2];
                  if(management && management.length > 0){                     
                     tmpItems = management.map(function(e){return {'id': e.id.toString(), 'text':e.name+' '+e.lastname}});
                     tmpItems.unshift({ 'id':"0", 'text': "Ninguno" });
                     $("#selManagementProfile").select2({
                        data: tmpItems,
                        placeholder: 'Seleccione usuario'
                    });
                    $("#selManagementProfile").val("0").trigger('change'); 
                  }
                  var director = response.values[3];
                  if(director && director.length > 0){                     
                     tmpItems = director.map(function(e){return {'id': e.id.toString(), 'text':e.name+' '+e.lastname}});
                     tmpItems.unshift({ 'id':"0", 'text': "Ninguno" });
                     $("#selDirectorProfile").select2({
                        data: tmpItems,
                        placeholder: 'Seleccione usuario'
                    });
                    $("#selDirectorProfile").val("0").trigger('change'); 
                  }
                  var form = response.values[0];
                  if(form && form[0]){
                     form = form[0];
                     if(form.user_entry && form.user_entry != 0) { $("#selEntryProfile").val(form.user_entry).trigger('change');  }
                     if(form.user_manager && form.user_manager != 0) { $("#selManagementProfile").val(form.user_manager).trigger('change');  }
                     if(form.user_director && form.user_director != 0) { $("#selDirectorProfile").val(form.user_director).trigger('change');  }                     
                  }
                  resolve("OK");
               }catch(ex){
                  console.error(ex);
                  resolve("ERROR");
               }              
            }else{
               resolve("ERROR");  
            }                
         },
         error : function(response) {
            $(btn).buttonLoader('stop');
            resolve("ERROR");
         }
      });
   });
}

this.reasignProfiles = function(form_id, user_entry_id, user_entry, user_manager_id, user_manager, user_director_id, user_director, btn){
   swal({
      title: "¿Está seguro de reasignar este formulario?",
      text: "Al confirmar el formulario quedará asignado a los usuarios seleccionados.",
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
            url:  baseURL+'/Inbox/reasignProfiles',
            type: "POST",
            dataType: "json",
            data : JSON.stringify({ form_id:form_id, user_entry_id:user_entry_id, user_entry:user_entry, user_manager_id:user_manager_id, user_manager:user_manager, user_director_id:user_director_id, user_director:user_director }),
            beforeSend: function(){
               $(btn).buttonLoader('start');
            },
            success : function(response) {
               $(btn).buttonLoader('stop');
               if(response && !response.error){
                  swal('Operación Exitosa','El formulario ha sido reasignado.','success').then(function(){
                     location.reload();
                  }); 
               }else{
                     swal('Error inesperado','Ocurrió un error inesperado al reasignar, inténtelo mas tarde.','error'); 
               }                
            },
            error : function(response) {
               $(btn).buttonLoader('stop');
               swal('Error inesperado','Ocurrió un error inesperado al reasignar, inténtelo mas tarde.','error'); 
            }
         });
      }
   });
}

this.sendForm = function(form_id,comment,btn,rejection = 0){
   return new Promise(function(resolve){
      $.ajax({
         url:  baseURL+'/Inbox/sendForm',
         type: "POST",
         dataType: "json",
         data : JSON.stringify({ form_id: form_id, comment: comment, rejection: rejection }),
         beforeSend: function(){
            $(btn).buttonLoader('start');
         },
         success : function(response) {
            $(btn).buttonLoader('stop');
            if(response && !response.error){
               swal('Operación Exitosa','El formulario ha sido enviado.','success').then(function(){
                  location.reload();
               }); 
            }else{
                  swal('Error','Ocurrió un error al enviar: '+response.values,'info'); 
            }                
         },
         error : function(response) {
            $(btn).buttonLoader('stop');
            swal('Error inesperado','Ocurrió un error inesperado al enviar, inténtelo mas tarde.','error'); 
         }
      });
   });
}

this.insistForm = function(form_id,comment,btn){
   return new Promise(function(resolve){
      $.ajax({
         url:  baseURL+'/Inbox/insistForm',
         type: "POST",
         dataType: "json",
         data : JSON.stringify({ form_id: form_id, comment: comment }),
         beforeSend: function(){
            $(btn).buttonLoader('start');
         },
         success : function(response) {
            $(btn).buttonLoader('stop');
            if(response && !response.error){
               swal('Operación Exitosa','El formulario ha sido insistido.','success').then(function(){
                  location.reload();
               }); 
            }else{
                  swal('Error inesperado','Ocurrió un error inesperado al insistir, inténtelo mas tarde.','error'); 
            }                
         },
         error : function(response) {
            $(btn).buttonLoader('stop');
            swal('Error inesperado','Ocurrió un error inesperado al insistir, inténtelo mas tarde.','error'); 
         }
      });
   });
}

//#endregion
/**
 *
 * You can write your JS code here, DO NOT touch the default style file
 * because it will make it harder for you to update.
 *
 */

"use strict";
var $tmpUserSignProfile = null;
$( document ).ready(function() {
    //Activar elemento de submenu
    var active = $('li.child-menu.active');
    if(active){
        $(active).parent().parent().addClass('active');
    }
    //Configuración general del sitio
    $.fn.select2.defaults.set("language", "es"); //Idioma de select2

    //#region SetListeners

    $('body').tooltip({ //Fix tooltip freeze
        selector: '[data-toggle="tooltip"]',
        trigger: 'hover',
        container: 'body'
    }).on('click mousedown mouseup', '[data-toggle="tooltip"]', function () {
        var element = $(this);
        var tooltip = $(element).attr('aria-describedby');
        $(tooltip).remove();
    });

    $(window).on('shown.bs.modal', function() { 
        $('[data-toggle="tooltip"]').tooltip('hide');
    });

    $("#btnAccount").click(function(){
        $("#modalAccount").modal();
    });   

    $("#btnPassword").click(function(){
        $("#modalPassword").modal();
    });

    $(document).ajaxStart(function() {
        $('.loading-process').show();
    }).ajaxStop(function() {
        $('.loading-process').fadeOut();
    });

    $('.modal').on('hidden.bs.modal', function () { //Cuando algún modal se cierra pero hay otro modal abierto añade clase a body para mantener scroll
        if($('.modal').is(':visible')){
            $('body').addClass('modal-open');
        }
    });

    $("#btnUpdateUserInfo").click(function(){
        var $this = $(this);
        var user = { name: '', lastname: '', email: '' };
        var isValid = validUserInfo(user);
        if(isValid){
            swal({
                title: "¿Desea actualizar sus datos?",
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
                updateUserInfo(user, $this);
            }
            });
        }
    });

    $("#btnUpdatePassword").click(function(){
        var $this = $(this);
        var user = { current: '', new: '', confirm: '' };
        var isValid = validUserPassword(user);
        if(isValid){
            swal({
                title: "¿Desea actualizar su contraseña?",
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
                updateUserPassword(user, $this);
            }
            });
        }
    });

    $("#btnNotification").click(function(){
        getNotifications();
    });

    $("#btnSetReadAllNotification").click(function(){
        swal({
            title: "¿Está seguro de marcar todas sus notificaciones como leídas?",
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
                setReadAllNotifications();
            }
         });
    });
    
    $("#btnSignExample").click(function(){
        $("#modalSignExample").modal('show');
    });

    //Firma
    $('#fileSignProfile').on('change', function (e) {
        var $this = $(this);
        var name = $($this).val();
        if($this && $this.length > 0 && name && name.length > 0){
            var file = $this[0]; 
            uploadSignProfile(file);
        }
    });

    //SidebarMini
    var body = $('body');
    body.addClass('sidebar-mini');
    body.removeClass('sidebar-show');
    var sidebar_nicescroll = $(".main-sidebar").getNiceScroll();
    sidebar_nicescroll.remove();
    sidebar_nicescroll = null;
    $(".main-sidebar .sidebar-menu > li").each(function() {
        let me = $(this);
        if(me.find('> .dropdown-menu').length) {
            me.find('> .dropdown-menu').hide();
            me.find('> .dropdown-menu').prepend('<li class="dropdown-title pt-3">'+ me.find('> a').text() +'</li>');
        }else{
            me.find('> a').attr('data-toggle', 'tooltip');
            me.find('> a').attr('data-original-title', me.find('> a').text());
            $("[data-toggle='tooltip']").tooltip({
            placement: 'right'
            });
        }
    });

    $.fn.hasScrollBar = function() {
        return this.get(0).scrollHeight > this.height();
    }

    //#endregion
});

this.validUserInfo = function (user){
    var valid = true;
    
    user.name = $("#txtAccountName").val().trim();
    if(user.name.length == 0){document.getElementById("txtAccountName").setCustomValidity('invalid'); valid = false;}
    else{ document.getElementById("txtAccountName").setCustomValidity(''); }

    user.lastname = $("#txtAccountLastName").val().trim();
    if(user.lastname.length == 0){document.getElementById("txtAccountLastName").setCustomValidity('invalid'); valid = false;}
    else{ document.getElementById("txtAccountLastName").setCustomValidity(''); }

    user.email = $("#txtAccountEmail").val().trim();
    if(user.email.length == 0){document.getElementById("txtAccountEmail").setCustomValidity('invalid'); valid = false;}
    else{ 
        //Valida correo
        if(!IsEmailValid(user.email)){
            document.getElementById("txtAccountEmail").setCustomValidity('invalid'); valid = false;
        } else {
            document.getElementById("txtAccountEmail").setCustomValidity(''); 
        }
    }

    user.signature = $("#hdnSignProfile").val().trim();
    user.signatureb64 = $tmpUserSignProfile;
    if(!user.signatureb64 && user.signature.length == 0){ //Es obligatorio
        document.getElementById("fileSignProfile").setCustomValidity('invalid'); valid = false;
    }else{
        document.getElementById("fileSignProfile").setCustomValidity('');
    }

    //Validado
    $("#modalAccount .modal-body").addClass("was-validated");

    return valid;
}

this.updateUserInfo = function (user, btn){
    //Valida los datos
    $.ajax({
        url:  baseURL+'/Master/updateUserInfo',
        type: "POST",
        dataType: "json",
        data : JSON.stringify({ user: user }),
        beforeSend: function(){
            $(btn).buttonLoader('start');
        },
        success : function(response) {
            $(btn).buttonLoader('stop');
            if(response && !response.error){
               swal('Operación Exitosa','Sus datos han sido actualizados.','success');
               $("#modalAccount").modal('hide');
               //Actualiza nombre en bienvenida
               $(".spanName").text(user.name+' '+user.lastname);
            }else{
                swal('Error inesperado','Ocurrió un error inesperado al actualizar sus datos, inténtelo mas tarde.','error'); 
            }                
        },
        error : function(response) {
            $(btn).buttonLoader('stop');
            swal('Error inesperado','Ocurrió un error inesperado al actualizar sus datos, inténtelo mas tarde.','error'); 
        }
    });
}

this.validUserPassword = function (user){
    var valid = true;

    user.current = $("#txtAccountCurrentPassword").val().trim();
    if(user.current.length == 0){document.getElementById("txtAccountCurrentPassword").setCustomValidity('invalid'); valid = false;}
    else{ 
        document.getElementById("txtAccountCurrentPassword").setCustomValidity(''); 
    }

    user.new = $("#txtAccountNewPassword").val().trim();
    if(user.new.length == 0){document.getElementById("txtAccountNewPassword").setCustomValidity('invalid'); valid = false;}
    else{ 
        //Valida contraseñas
        if(!IsPasswordValid(user.new)){
            document.getElementById("txtAccountNewPassword").setCustomValidity('invalid'); valid = false;
        }else {
            document.getElementById("txtAccountNewPassword").setCustomValidity(''); 
        }
    }

    user.confirm = $("#txtAccountConfirmNewPassword").val().trim();
    if(user.confirm.length == 0){document.getElementById("txtAccountConfirmNewPassword").setCustomValidity('invalid'); valid = false;}
    else{ 
        //Valida contraseñas
        if(user.confirm!=user.new){
            document.getElementById("txtAccountConfirmNewPassword").setCustomValidity('invalid'); valid = false;
        }else {
            document.getElementById("txtAccountConfirmNewPassword").setCustomValidity(''); 
        }
    }

    //Validado
    $("#modalPassword .modal-body").addClass("was-validated");

    return valid;
}

this.updateUserPassword = function (user, btn){
    //Valida los datos
    $.ajax({
        url:  baseURL+'/Master/updateUserPassword',
        type: "POST",
        dataType: "json",
        data : JSON.stringify({ user: user }),
        beforeSend: function(){
            $(btn).buttonLoader('start');
        },
        success : function(response) {
            $(btn).buttonLoader('stop');
            if(response && !response.error){
               swal('Operación Exitosa','Su contraseña ha sido actualizada. Favor vuelva a iniciar sesión.','success').then(function(){
                   window.location = baseURL+'/Login/Logout';
               });               
            }else{
                if(response && response.values == "ERRPWD"){
                    document.getElementById("txtAccountCurrentPassword").setCustomValidity('invalid');
                    $("#txtAccountCurrentPassword").focus();
                }else{
                    swal('Error inesperado','Ocurrió un error inesperado al grabar, inténtelo mas tarde.','error'); 
                }
            }                
        },
        error : function(response) {
            $(btn).buttonLoader('stop');
            swal('Error inesperado','Ocurrió un error inesperado al actualizar sus datos, inténtelo mas tarde.','error'); 
        }
    });
}

this.getNotifications = function(){
    var loading = '<a href="#" class="dropdown-item"><div class="dropdown-item-desc w-100 text-center"><i class="fas fa-spinner fa-spin"></i> Cargando...</div></a>';
    var empty = '<a href="#" class="dropdown-item"><div class="dropdown-item-desc w-100 text-center">Sin notificaciones nuevas</div></a>';
       
    $.ajax({
        url:  baseURL+'/Master/getNotifications',
        type: "POST",
        dataType: "json",
        data : {},
        beforeSend: function(){
            $("#notificationsList").html(loading);
        },
        success : function(response) {            
            if(response && !response.error && response.values && response.values.length > 0){
                var html = '';
                $.each(response.values, function(idx,not){
                    html += '<a href="#" class="dropdown-item row-notification" data-id="'+not.id+'">';
                    html += '<div class="dropdown-item-icon '+not.class+' text-white">';
                    html += '  <i class="'+not.icon+'"></i>';
                    html += '</div>';
                    html += '<div class="dropdown-item-desc">';
                    html += not.notification+'.';
                    html += '  <div class="time text-primary">'+not.created_at+'</div>';
                    html += '</div>';
                    html += '</a>';

                });                
                $("#notificationsList").html(html); 
                $(".row-notification").click(function(){
                    var id = $(this).data('id');
                    setReadNotification(id);
                });    
            }else{
                $("#notificationsList").html(empty);
            }                
        },
        error : function(response) {
            $("#notificationsList").html(empty);
        }
    });
}

this.setReadNotification = function(id){
    $.ajax({
        url:  baseURL+'/Master/setReadNotification',
        type: "POST",
        dataType: "json",
        data : JSON.stringify({id:id}),
        beforeSend: function(){
        },
        success : function(response) {            
            if(response && !response.error && response.values){
                location.href = baseURL+'/Inbox/Read/'+response.values.invoice;    
            }else{
                swal("Información","Ocurrió un error al mostrar información de la solicitud. Inténtelo mas tarde.","info");               
            }                
        },
        error : function(response) {
            swal("Información","Ocurrió un error al mostrar información de la solicitud. Inténtelo mas tarde.","info");
        }
    });
}

this.setReadAllNotifications = function(){
    $.ajax({
        url:  baseURL+'/Master/setReadAllNotifications',
        type: "POST",
        dataType: "json",
        data : {},
        beforeSend: function(){
        },
        success : function(response) {            
            if(response && !response.error){
                swal("Operación Exitosa","Todas sus notificaciones han sido marcadas como leídas.","success"); 
            }else{
                swal("Error inesperado","Ocurrió un error al marcar notificaciones como leídas. Inténtelo mas tarde.","error");               
            }                
        },
        error : function(response) {
            swal("Error inesperado","Ocurrió un error al marcar notificaciones como leídas. Inténtelo mas tarde.","error");
        }
    });
}

this.uploadSignProfile = function($this){
    var isValid = true;

    if($('#fileSignProfile').val() == ''){ document.getElementById("fileSignProfile").setCustomValidity('invalid'); isValid = false; }
    else{ document.getElementById("fileSignProfile").setCustomValidity(''); }
    if(isValid){
        var file = $this.files[0];
        var fileType = file["type"];
        var validImageTypes = ["image/jpeg", "image/png"];
        if ($.inArray(fileType, validImageTypes) < 0) {            
            document.getElementById("fileSignProfile").setCustomValidity('invalid');
            isValid = false;
        }
    }
    if(!isValid){
        $("#upload_sing_form_profile").addClass("was-validated");
        $("#fileSignProfile").text('...');
        $('#fileSignProfile').val('').trigger('change');
        $("#imgPreviewProfile").attr("src",$img_default);
    }else{
        $("#upload_sing_form_profile").removeClass("was-validated");
        var file = $this.files[0];
        getBase64PreviewProfile(file);
    }
}

function getBase64PreviewProfile(file) {
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function () {
      var b64 = reader.result;
      $("#imgPreviewProfile").attr("src",b64);
      $tmpUserSignProfile = b64;
      $("#fileSignProfile").addClass("loaded");
    };
    reader.onerror = function (error) {
      console.error('Error: ', error);
      $tmpUserSignProfile = null;
      $("#imgPreviewProfile").attr("src",$img_default);
      $("#fileSignProfile").removeClass("loaded");
    };
}
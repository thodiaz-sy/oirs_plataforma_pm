 "use strict";
var $profiles = [], $bkp_temp = [];
 $(document).ready(function() {
    $('#divContrasenaDirector').hide();
    $("#selUserProfile").change(function(){
        if($("#selUserProfile").val() == 5 || $("#selUserProfile").val() == 6){
            $('#divContrasenaDirector').show();
        } else {
            $('#divContrasenaDirector').hide();
        }
    });
    
    //#region Init

    getProfiles();  
    getBranchs();  
    getAreas();  
    getUsers();

    //#endregion

    //#region SetListeners   

    $("#btnFilter").click(function(e){
        e.preventDefault();
        getUsers();
    });

    $("#btnFilterRemove").click(function(e){
        $("#txtFilterID").val('');
        $("#txtFilterUsername").val('');
        $("#selFilterProfile").val("0").trigger('change');
        $("#selFilterActive").val("0").trigger('change');
        getUsers();
    });

    $("#btnNewUser").click(function(e){
        e.preventDefault();
        openModalUser(0);
    });

    $("#selUserProfile").change(function(e){
        e.preventDefault();
        var value = $(this).val();
        if(value){
            setProfileSelected(value);
        }
    });

    //#region SetListeners tableUsers

    $("#btnSaveUser").click(function(e){
        e.preventDefault();   
        var $this = $(this);     
        var user = new User();
        var isValid = validateUser(user);
        if(isValid){
            swal({
                title: "¿Desea "+ (user.id == '0' ? 'crear' : 'editar') + " este usuario?",
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
                saveUser(user,$this);
            }
            });
        }
    });


    $('#table tbody').on('click', '.row-btn-fiche', function () {
        var $this = $(this);
        var table = $('#table').DataTable();
        var data = table.row($($this).parents('tr')).data();
        getUserByID(data.id, $this);           
    });

    $('#table tbody').on('click', '.row-btn-edit', function () {
        var $this = $(this);
        var table = $('#table').DataTable();
        var data = table.row($($this).parents('tr')).data();
        openModalUser(data.id, $this);           
    });
    
    $('#table tbody').on('click', '.row-btn-disable', function () {
        var $this = $(this);
        swal({
            title: "¿Desea desactivar este usuario?",
            text: "Esta acción se puede deshacer en la sección de usuarios Desactivados",
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
            var table = $('#table').DataTable();
            var data = table.row($($this).parents('tr')).data();
            disableUser(data.id, $this);
        }
        });            
    });

    $('#table tbody').on('change', '.row-chk-status', function () {
        var $this = $(this);
        var status = $($this).is(':checked');
        swal({
            title: "¿Desea "+ (status ? 'bloquear' : 'desbloquear') +" este usuario?",
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
            var table = $('#table').DataTable();
            var data = table.row($($this).parents('tr')).data();
            changeStatusUser(data.id, status, $this);
        }else{
            $($this).prop('checked',!status); //Retorna a estado anterior
        }
        });            
    });

    //#endregion SetListeners

    //#region SetListeners tableDisabled

    $("#btnDisabledUsers").click(function(e){
        e.preventDefault();
        $("#modalDisabledUser").modal();
        getDisabledUsers();
    });

    $('#tableDisabled tbody').on('click', '.row-btn-enable', function () {
        var $this = $(this);
        swal({
            title: "¿Desea activar este usuario?",
            text: "El usuario será visible",
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
        .then((willDelete) => {
        if (willDelete) {
            var table = $('#tableDisabled').DataTable();
            var data = table.row($($this).parents('tr')).data();
            enableUser(data.id, $this);
        }
        });            
    });

    $('#tableDisabled tbody').on('click', '.row-btn-delete', function () {
        var $this = $(this);
        swal({
            title: "¿Desea eliminar permanentemente este usuario?",
            text: "Esta acción no se puede deshacer",
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
        .then((willDelete) => {
        if (willDelete) {
            var table = $('#tableDisabled').DataTable();
            var data = table.row($($this).parents('tr')).data();
            deleteUser(data.id, $this);
        }
        });            
    });

    //#endregion SetListeners

    //#endregion
    
 });

 //#region Functions

//#region Selects

this.getProfiles = function(){
    var profiles = [], tmpProfiles = [];
    profiles.push({'id': '0', 'text':'Todos'});
    $.ajax({
        url:  baseURL+'/User/getProfiles',
        type: "POST",
        dataType: "json",
        data : {},
        success : function(response) {
            if(response && !response.error){
                if(response.values && response.values.length>0){
                    tmpProfiles = response.values[0];
                    $profiles = tmpProfiles;
                    tmpProfiles = tmpProfiles.map(function(e){return {'id': e.id.toString(), 'text':e.profile}});
                    Array.prototype.push.apply(profiles, tmpProfiles);
                }
            }

            $(".selProfile").select2({
                data: profiles,
                placeholder: 'Seleccione perfil'
            });
            $(".selProfile").val("0").trigger('change');
            //SelectPerfil dentro de modal
            $("#selUserProfile").select2({
                data: tmpProfiles,
                placeholder: 'Seleccione perfil',
                dropdownParent: $('#modalUser')
            });
            $("#selUserProfile").val(null).trigger('change');
            
        },
        error : function(response) {
            $(".selProfile").select2({
                data: profiles,
                placeholder: 'Seleccione perfil',
                dropdownParent: $('#modalUser')
            });
            $(".selProfile").val("0").trigger('change');
            //selUserProfile dentro de modal
            $("#selUserProfile").select2({
                data: tmpProfiles,
                placeholder: 'Seleccione perfil',
                dropdownParent: $('#modalUser')
            });
            $("#selUserProfile").val(null).trigger('change');            
        }
    });
}

this.setProfileSelected = function(profile_id){
    var profile = $profiles.filter(function(p){ return p.id == profile_id});
    if(profile && profile.length > 0 && profile[0]){
        profile = profile[0];
        if(profile.need_branch == 1){ $("#inputBranch").fadeIn(); } else { $("#inputBranch").hide(); }
        if(profile.need_area == 1){ $("#inputArea").fadeIn(); } else { $("#inputArea").hide(); }
        if(profile.need_bkp == 1){
            var users = [];
            var user_id = $("#hdnIDUser").val();
            $("#selBackup option").remove();
            $.ajax({
                url:  baseURL+'/User/getUsersBackups',
                type: "POST",
                dataType: "json",
                data : JSON.stringify({'profile_id': profile_id, 'user_id': user_id}),
                success : function(response) {
                    if(response && !response.error){
                        if(response.values && response.values.length>0){
                            users = response.values.map(function(e){return {'id': e.id.toString(), 'text':e.name+' '+e.lastname}});
                        }
                    }
                    
                    //selBackup dentro de modal
                    $("#selBackup").select2({
                        data: users,
                        placeholder: 'Seleccione subrogante',
                        dropdownParent: $('#modalUser')
                    });
                    if($bkp_temp && $bkp_temp.length > 0){
                        $("#selBackup").val($bkp_temp).trigger('change');
                    }else{
                        $("#selBackup").val(null).trigger('change');
                    }
                    
                },
                error : function(response) {
                    //selBackup dentro de modal
                    $("#selBackup").select2({
                        data: users,
                        placeholder: 'Seleccione subrogante',
                        dropdownParent: $('#modalUser')
                    });
                    $("#selBackup").val(null).trigger('change');            
                }
            });
            $("#inputBackup").fadeIn();
        } else { $("#inputBackup").hide(); }
    }else{
        $("#inputBranch").hide();
        $("#inputArea").hide();
        $("#inputBackup").hide();
    }    
}

this.getBranchs = function(){
    var branchs = [], tmpbranchs = [];
    branchs.push({'id': '0', 'text':'Ninguno'});
    $.ajax({
        url:  baseURL+'/User/getBranchs',
        type: "POST",
        dataType: "json",
        data : {},
        success : function(response) {
            if(response && !response.error){
                if(response.values && response.values.length>0){
                    tmpbranchs = response.values.map(function(e){return {'id': e.id.toString(), 'text':e.branch}});
                    Array.prototype.push.apply(branchs, tmpbranchs);
                }
            }
            //selBranch dentro de modal
            $("#selBranch").select2({
                data: branchs,
                placeholder: 'Seleccione sucursal',
                dropdownParent: $('#modalUser')
            });
            $("#selBranch").val("0").trigger('change');
            
        },
        error : function(response) {
           //selBranch dentro de modal
           $("#selBranch").select2({
                data: branchs,
                placeholder: 'Seleccione sucursal',
                dropdownParent: $('#modalUser')
            });
            $("#selBranch").val("0").trigger('change');            
            }
    });
}

this.getAreas = function(){
    var areas = [], tmpareas = [];
    areas.push({'id': '0', 'text':'Ninguno'});
    $.ajax({
        url:  baseURL+'/User/getAreas',
        type: "POST",
        dataType: "json",
        data : {},
        success : function(response) {
            if(response && !response.error){
                if(response.values && response.values.length>0){
                    tmpareas = response.values.map(function(e){return {'id': e.id.toString(), 'text':e.area}});
                    Array.prototype.push.apply(areas, tmpareas);
                }
            }
            //selArea dentro de modal
            $("#selArea").select2({
                data: areas,
                placeholder: 'Seleccione área',
                dropdownParent: $('#modalUser')
            });
            $("#selArea").val("0").trigger('change');
            
        },
        error : function(response) {
           //selArea dentro de modal
           $("#selArea").select2({
                data: areas,
                placeholder: 'Seleccione área',
                dropdownParent: $('#modalUser')
            });
            $("#selArea").val("0").trigger('change');            
        }
    });
}
//#endregion

//#region Users
this.getUsers = function(){
    var filter = {
        "id": $("#txtFilterID").val() || null,
        "username": $("#txtFilterUsername").val() || null,
        "profile": $("#selFilterProfile").val() || null,
        "blocked": $("#selFilterActive").val() || null
    }
    $('#table').DataTable().clear();
    $('#table').DataTable({
        responsive: true,
        destroy: true,
        scrollX: false,
        scrollCollapse: false,
        fixedHeader: true,
        language: {
            url: baseURLContent+'/public/vendors/datatables/lang/spanish.json'
        },
        "processing": true,
        "serverSide": true,
        "searching": false,
        "order": [[ 0, "desc" ]],
        "ajax": {
            "url": baseURL+'/User/getUsers',
            "type": "POST",
            "data": filter,
            "beforeSend": function(){
                $("#btnFilter").buttonLoader('start');
            }         
        },
        "columns": [
            { "data": 'id' },
            { "data": 'username' },
            { "data": 'fullname' },
            { "data": 'profile' },
            { "data": 'email' },
            { "type": 'html' },
            { "type": 'html' }
        ],
        "drawCallback": function () {
            $('[data-toggle="tooltip"]').tooltip({
                trigger : 'hover'
            });
            $("#btnFilter").buttonLoader('stop');
        },
        "columnDefs": [
            {
                "targets": 5,
                "orderable": false,
                "visible": true,
                "data": null,
                width: 50,
                render: function (data, type, row) {
                    var blocked = '<label class="switch">';
                    var is_blocked = data.blocked_at ? 'checked="checked"' : '';
                    blocked += '<input type="checkbox" ' + is_blocked + ' class="row-chk-status"/>';
                    blocked += '<span class="slider round"></span>';
                    blocked += '</label>';
                    var op = "<p class='text-center'>" + blocked + "</p>";
                    return op;
                }
            },
            {
                "targets": 6,
                "orderable": false,
                "visible": true,
                "data": null,
                width: 100,
                render: function (data, profile, row) {
                    var btnEdit = '<a href="javascript:void(0);" class="btn btn-icon btn-primary row-btn-edit" title="Editar" data-toggle="tooltip"><i class="fas fa-pen"></i></a>';
					var btnDisable = '';
                    var user = sessionStorage.getItem('userID');
                    if(data.id != user){
                        btnDisable = '<a href="javascript:void(0);" class="btn btn-icon btn-danger row-btn-disable" title="Desactivar" data-toggle="tooltip"><i class="fas fa-trash"></i></a>';
                    }
                    var op = "<p class='text-center'>" + btnEdit + "&nbsp;" + btnDisable + "</p>";
                    return op;
                }
            }
        ]
    });
}

this.openModalUser = function(userID,btn){
    clearModalUser();
    if(userID){ //Editar usuario
        $("#hdnIDUser").val(userID);
        $("#modalUserTitle").html('Editar usuario'); //Asigna titulo de modal
        getUserByID(userID,btn,true).then(function(resolve){
            if(resolve == "OK"){
                $("#modalUser").modal('show');
            }
        });        
    }
    else{ //Crear usuario
        $("#hdnIDUser").val('0');
        $("#modalUserTitle").html('Crear usuario'); //Asigna titulo de modal
        $("#modalUser").modal();
    }
}

this.clearModalUser = function(){
    //Datos del usuario
    $("#nav-user-tab").trigger('click');
    $("#txtUserUsername").val('');
    $("#txtUserPassword").val('');
    $("#txtUserName").val('');
    $("#txtUserLastname").val('');
    $("#txtUserMail").val('');
    //Datos de cuenta
    $("#inputBranch").hide();
    $("#inputArea").hide();
    $("#inputBackup").hide();
    $("#selUserProfile").val(null).trigger('change');
    $("#selBranch").val(null).trigger('change');
    $("#selArea").val(null).trigger('change');
    $("#selBackup").val(null).trigger('change');
    $bkp_temp = [];
    $("#nav-tabContent").removeClass("was-validated");
}

this.validateUser = function(user){
    
    var valid = true;

    //Generales  
    user.id = $("#hdnIDUser").val() || '0';  

    user.username = $("#txtUserUsername").val().trim();
    if(user.username.length == 0){document.getElementById("txtUserUsername").setCustomValidity('invalid'); valid = false;}
    else{ document.getElementById("txtUserUsername").setCustomValidity(''); }
    
    user.password = $("#txtUserPassword").val().trim();
    $("#txtUserPassword").attr('required','required');
    if(user.id == "0" && user.password.length == 0){
        document.getElementById("txtUserPassword").setCustomValidity('invalid'); valid = false;
    }
    else{
        if(user.password.length > 0){ 
            //Valida contraseñas
            if(!IsPasswordValid(user.password)){
                document.getElementById("txtUserPassword").setCustomValidity('invalid'); valid = false;
            }else {
                $("#txtUserPassword").removeAttr('required');
                document.getElementById("txtUserPassword").setCustomValidity(''); 
            }
        }else{            
            $("#txtUserPassword").removeAttr('required');
            document.getElementById("txtUserPassword").setCustomValidity(''); 
        }
    }   
    
    user.name = $("#txtUserName").val().trim();
    if(user.name.length == 0){document.getElementById("txtUserName").setCustomValidity('invalid'); valid = false;}
    else{ document.getElementById("txtUserName").setCustomValidity(''); }

    user.lastname = $("#txtUserLastname").val().trim();
    if(user.lastname.length == 0){document.getElementById("txtUserLastname").setCustomValidity('invalid'); valid = false;}
    else{ document.getElementById("txtUserLastname").setCustomValidity(''); }

    user.email = $("#txtUserMail").val().trim();
    if(user.email.length == 0){document.getElementById("txtUserMail").setCustomValidity('invalid'); valid = false;}
    else{ 
        //Valida correo
        if(!IsEmailValid(user.email)){
            document.getElementById("txtUserMail").setCustomValidity('invalid'); valid = false;
        } else {
            document.getElementById("txtUserMail").setCustomValidity(''); 
        }
    }

    user.profile_id = $("#selUserProfile").val() || null;
    if(!user.profile_id){document.getElementById("selUserProfile").setCustomValidity('invalid'); valid = false;}
    else{ document.getElementById("selUserProfile").setCustomValidity(''); }

    if($("#selBranch").is(":visible")){     
        user.branch_id = $("#selBranch").val() || null;
        if(!user.branch_id){document.getElementById("selBranch").setCustomValidity('invalid'); valid = false;}
        else{ document.getElementById("selBranch").setCustomValidity(''); }
    } else {  user.branch_id = 0; }
    
    if($("#selArea").is(":visible")){     
        user.area_id = $("#selArea").val() || null;
        if(!user.area_id){document.getElementById("selArea").setCustomValidity('invalid'); valid = false;}
        else{ document.getElementById("selArea").setCustomValidity(''); }
    } else {  user.area_id = 0; }
    
    if($("#selBackup").is(":visible")){
        user.backups = $("#selBackup").val();
    }else{
        user.backups = [];
    }
    user.contrasena = $("#contrasenaDirector").val() || null;
    if($("#selUserProfile").val() < 5){
        document.getElementById("contrasenaDirector").setCustomValidity(''); 
    } else {
        if(!user.contrasena){document.getElementById("contrasenaDirector").setCustomValidity('invalid'); valid = false;}
        else{ document.getElementById("contrasenaDirector").setCustomValidity(''); }
    }

    //Validado
    $("#modalUser .modal-body").addClass("was-validated");
    
    return valid;
}

this.saveUser = function(user,btn){
    debugger;
    JSON.stringify({ user: user });

    $.ajax({
        url:  baseURL+'/User/saveUser',
        type: "POST",
        dataType: "json",
        data : JSON.stringify({ user: user }),
        beforeSend: function(){
            $(btn).buttonLoader('start');
        },
        success : function(response) {
            $(btn).buttonLoader('stop');
            if(response && !response.error){
               swal('Operación Exitosa','El usuario ha sido grabado.','success');
               getUsers();
               $("#modalUser").modal('hide');

            }else{
                if(response && response.values == "ERRUSR"){
                    swal('Validación','El nombre de usuario ya se encuentra registrado.','info'); 
                    $("#nav-user-tab").trigger('click');
                    $("#txtUserUsername").focus();
                }else{
                    swal('Error inesperado','Ocurrió un error inesperado al grabar, inténtelo mas tarde.','error'); 
                }
            }                
        },
        error : function(response) {
            $(btn).buttonLoader('stop');
            swal('Error inesperado','Ocurrió un error inesperado al grabar, inténtelo mas tarde.','error'); 
        }
    });
}

this.getUserByID = function(userID,btn){
    return new Promise(function (resolve) {
        if(userID){
            $("#hdnIDUser").val(userID);
            $.ajax({
                url:  baseURL+'/User/getUserByID',
                type: "POST",
                dataType: "json",
                data : JSON.stringify({ userID: userID }),
                beforeSend: function(){
                    $(btn).buttonLoader('start');
                },
                success : function(response) {
                    $(btn).buttonLoader('stop');
                    if(response && !response.error && response.values && response.values.length > 0){
                        renderModalUser(response.values[0], response.values[1]); 
                        resolve("OK");
                    }else{
                        swal('Error inesperado','Ocurrió un error inesperado, inténtelo mas tarde.','error'); 
                        resolve("ERROR");
                    }                
                },
                error : function(response) {
                    $(btn).buttonLoader('stop');
                    swal('Error inesperado','Ocurrió un error inesperado, inténtelo mas tarde.','error');  
                    resolve("ERROR");
                }
            });
        }else{
            swal('Error inesperado','Ocurrió un error inesperado, inténtelo mas tarde.','error');  
            resolve("ERROR");
        }
    });
}

this.renderModalUser = function(user,backups){
    if(user){
        //Datos del usuario
        $("#txtUserUsername").val(user.username);
        $("#txtUserPassword").val('');
        $("#txtUserName").val(user.name);
        $("#txtUserLastname").val(user.lastname);
        $("#txtUserMail").val(user.email);      
        if(backups && backups.length > 0){
            var tmp = backups.map(function(b){ return b.user_bkp });
            $bkp_temp = tmp;
        }else{
            $("#selBackup").val(null).trigger('change');
        }
        $("#selUserProfile").val(user.profile_id).trigger('change');
        $("#selBranch").val(user.branch_id || "0").trigger('change');
        $("#selArea").val(user.area_id || "0").trigger('change');
        $("#contrasenaDirector").val(user.contrasena); 
        
    } 
}
//#endregion

//#region Elimina funciones
this.getDisabledUsers = function(){
    var filter = {
        "id": $("#txtFilterID").val() || null,
        "username": $("#txtFilterUsername").val() || null,
        "profile": $("#selFilterProfile").val() || null,
        "blocked": $("#selFilterActive").val() || null
    }
    $('#tableDisabled').DataTable().clear();
    $('#tableDisabled').DataTable({
        responsive: true,
        destroy: true,
        scrollX: false,
        scrollCollapse: false,
        fixedHeader: true,
        language: {
            url: baseURLContent+'/public/vendors/datatables/lang/spanish.json'
        },
        "processing": true,
        "serverSide": true,
        "searching": false,
        "ajax": {
            "url": baseURL+'/User/getDisabledUsers',
            "type": "POST",
            "data": filter           
        },
        "columns": [
            { "data": 'id' },
            { "data": 'username' },
            { "data": 'fullname' },
            { "data": 'email' },
            { "data": 'deleted_at' },
            { "type": 'html' }
        ],
        "drawCallback": function () {
            $('[data-toggle="tooltip"]').tooltip({
                trigger : 'hover'
            });
        },
        "columnDefs": [
            {
                "targets": 5,
                "width": 100,
                "orderable": false,
                "visible": true,
                "data": null,
                render: function (data, profile, row) {
                    var btnEnable = '<a href="javascript:void(0);" class="btn btn-icon btn-success row-btn-enable" title="Activar" data-toggle="tooltip"><i class="fas fa-check"></i></a>';
                    var btnDelete = '<a href="javascript:void(0);" class="btn btn-icon btn-danger row-btn-delete" title="Eliminar" data-toggle="tooltip"><i class="fas fa-trash"></i></a>';
                    var op = "<p class='text-center'>" + btnEnable + "&nbsp;" + btnDelete + "</p>";
                    return op;
                }
            }
        ]
    });
}

this.disableUser = function(userID,btn){
    if(userID){
        $.ajax({
            url:  baseURL+'/User/disableUser',
            type: "POST",
            dataType: "json",
            data : JSON.stringify({ userID: userID }),
            beforeSend: function(){
                $(btn).buttonLoader('start');
            },
            success : function(response) {
                $(btn).buttonLoader('stop');
                if(response && !response.error){
                   swal('Operación Exitosa','Usuario desactivado','success'); 
                   getUsers();
                }else{
                    swal('Error inesperado','Ocurrió un error inesperado, inténtelo mas tarde.','error'); 
                }                
            },
            error : function(response) {
                $(btn).buttonLoader('stop');
                swal('Error inesperado','Ocurrió un error inesperado, inténtelo mas tarde.','error'); 
            }
        });
    }else{
        swal('Error inesperado','Ocurrió un error inesperado, inténtelo mas tarde.','error'); 
    }
}

this.enableUser = function(userID,btn){
    if(userID){
        $.ajax({
            url:  baseURL+'/User/enableUser',
            type: "POST",
            dataType: "json",
            data : JSON.stringify({ userID: userID }),
            beforeSend: function(){
                $(btn).buttonLoader('start');
            },
            success : function(response) {
                $(btn).buttonLoader('stop');
                if(response && !response.error){
                   swal('Operación Exitosa','Usuario activado','success'); 
                   getDisabledUsers();
                   getUsers();

                }else{
                    swal('Error inesperado','Ocurrió un error inesperado, inténtelo mas tarde.','error'); 
                }                
            },
            error : function(response) {
                $(btn).buttonLoader('stop');
                swal('Error inesperado','Ocurrió un error inesperado, inténtelo mas tarde.','error'); 
            }
        });
    }else{
        swal('Error inesperado','Ocurrió un error inesperado, inténtelo mas tarde.','error'); 
    }
}

this.deleteUser = function(userID,btn){
    if(userID){
        $.ajax({
            url:  baseURL+'/User/deleteUser',
            type: "POST",
            dataType: "json",
            data : JSON.stringify({ userID: userID }),
            beforeSend: function(){
                $(btn).buttonLoader('start');
            },
            success : function(response) {
                $(btn).buttonLoader('stop');
                if(response && !response.error){
                   swal('Operación Exitosa','Usuario eliminado','success'); 
                   getDisabledUsers();
                }else{
                    swal('Error inesperado','Ocurrió un error inesperado, inténtelo mas tarde.','error'); 
                }                
            },
            error : function(response) {
                $(btn).buttonLoader('stop');
                swal('Error inesperado','Ocurrió un error inesperado, inténtelo mas tarde.','error'); 
            }
        });
    }else{
        swal('Error inesperado','Ocurrió un error inesperado, inténtelo mas tarde.','error'); 
    }
}
//#endregion

//#region Bloquear/Desbloquear funciones

this.changeStatusUser = function(userID,status,btn){
    if(userID){
        $.ajax({
            url:  baseURL+'/User/changeStatusUser',
            type: "POST",
            dataType: "json",
            data : JSON.stringify({ userID: userID, status: status }),
            beforeSend: function(){
                $(btn).buttonLoader('start');
            },
            success : function(response) {
                $(btn).buttonLoader('stop');
                if(response && !response.error){
                   swal('Operación Exitosa','Usuario ha sido '+(status ? 'bloqueado' : 'desbloqueado'),'success'); 
                }else{
                    swal('Error inesperado','Ocurrió un error inesperado, inténtelo mas tarde.','error'); 
                    $(btn).prop('checked',!status); //Retorna a estado anterior
                }                
            },
            error : function(response) {
                $(btn).buttonLoader('stop');
                swal('Error inesperado','Ocurrió un error inesperado, inténtelo mas tarde.','error'); 
                $(btn).prop('checked',!status); //Retorna a estado anterior
            }
        });
    }else{
        swal('Error inesperado','Ocurrió un error inesperado, inténtelo mas tarde.','error'); 
        $(btn).prop('checked',!status); //Retorna a estado anterior
    }
}

//#endregion

//#endregion
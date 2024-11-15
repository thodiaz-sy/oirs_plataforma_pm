"use strict";

 $(document).ready(function() {

    //#region Init

    getTypes();
    $("#txtFilterDate").val('');
    getForms();

    //#endregion

    //#region SetListeners

    $("#btnFilter").click(function(e){
        e.preventDefault();
        getForms();
    });

    $("#btnFilterRemove").click(function(e){
        e.preventDefault();
        $("#txtFilterInvoice").val('');
        $("#txtFilterRUT").val('');
        $("#txtFilterDate").val('');
        $("#selFilterType").val(null).trigger('change');
        getForms();
    });

    $("#selStatusFilter").change(function(e){
        e.preventDefault();
        getForms();
    })

    //#endregion


 });

//#region Selects

this.getTypes = function(){
    var items = [];    
    $.ajax({
        url:  baseURL+'/Inbox/getTypes',
        type: "POST",
        dataType: "json",
        data : {},
        success : function(response) {
            if(response && !response.error){
                if(response.values && response.values.length>0){
                    items = response.values.map(function(e){return {'id': e.id.toString(), 'text':e.type}});
                }
            }
            $(".selTipo").select2({
                data: items,
                placeholder: 'Seleccione tipo'
            });
            $(".selTipo").val(null).trigger('change');            
        },
        error : function(response) {
            $(".selTipo").select2({
                data: items,
                placeholder: 'Seleccione tipo'
            });
            $(".selTipo").val(null).trigger('change');         
        }
    });
}

//#endregion

//#region Funciones

this.getForms = function(){
    debugger;
    //Seleccion de fechas
    var dateInit = null, dateEnd = null;
    var dateSelected = $("#txtFilterDate").val().trim();
    if(dateSelected && dateSelected.length > 0){
        dateSelected = dateSelected.split(' - ')
        dateInit = moment(dateSelected[0],"DD/MM/YYYY").format("YYYYMMDD");
        dateEnd = moment(dateSelected[1],"DD/MM/YYYY").format("YYYYMMDD");
    }

    var filter = {
        "status": $("#selStatusFilter").val() || 0,
        "invoice": $("#txtFilterInvoice").val().trim(),
        "rut": $("#txtFilterRUT").val().trim(),
        "date_init": dateInit,
        "date_end": dateEnd,
        "type": $("#selFilterType").val() || null
    }
    $('#table').DataTable().clear().destroy();
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
            "url": baseURL+'/Inbox/getForms',
            "type": "POST",
            "data": filter,
            "beforeSend": function(){
                $("#btnFilter").buttonLoader('start');
            }         
        },
        "columns": [
            { "data": 'invoice' },
            { "data": 'name' },
            { "data": 'pacient_rut' },
            { "data": 'form_date_received' },
            { "data": 'form_date_entry' },
            { "data": 'branch' },
            { "data": 'area' },
            { "data": 'type' },
            { "data": 'status' },
            { "type": 'html' }
        ],
        "drawCallback": function (e) {
            $('[data-toggle="tooltip"]').tooltip({
                trigger : 'hover'
            });
            $("#btnFilter").buttonLoader('stop');
            // permissions = e.json["permissions"];
        },
        "columnDefs": [
            {
                "targets": 9,
                "orderable": false,
                "visible": true,
                "data": null,
                width: 200,
                render: function (data, type, row, meta) {                    
                    var html = '';
                    //Permisos
                    try {
                        if(data.permissions && data.permissions.length > 0){
                            var actions = data.permissions.toUpperCase().split(',');
                            if(actions && actions.length > 0){
                                var details = [];
                                try { details =  meta.settings.json.permission; } catch(ex) { details = []; }
                                if(details && details.length > 0){
                                    $.each(actions, function(idx, action){
                                        var getDetail = details.filter(function(e){return e.action == action });
                                        if(getDetail && getDetail.length > 0){
                                            var detail = getDetail[0];
                                            var href = detail.href;
                                            var click = "javascript:void(0);";
                                            var dataElement = detail.data;
                                            if(href && href.length > 0){
                                                //Reemplaza valor parametro
                                                href = href.replaceAll("{form_id}",data.id);
                                                href = href.replaceAll("{invoice}",data.invoice);
                                                if(href.includes(';')){
                                                    click = href;
                                                    href = "#";
                                                }else{
                                                    //Reemplaza valor parametro								
                                                    href = baseURL+(href);
                                                }
                                            }else{
                                                href = "javascript:void(0);";
                                            }
                                            if(dataElement && dataElement.length > 0){
                                                // console.log(dataElement.length);
                                                //Reemplaza valor parametro
                                                dataElement = dataElement.replaceAll("{form_id}",data.id);
                                                dataElement = dataElement.replaceAll("{invoice}",data.invoice);
                                            }
                                            html += '<a href="'+ href +'" class="btn btn-icon '+((data.form_type_id == 3 || data.form_type_id == 2) && data.status_id == 3 ? detail.class+'3' : detail.class) +'" '+(dataElement ? dataElement : '')+'title="'+detail.description+'" data-toggle="tooltip" onclick="'+click+'"><i class="'+detail.icon+'"></i></a>&nbsp;';                                            
                                        }
                                    });
                                    // (data.form_type_id == 1 ? detail.class : detail.class + '2')
                                }
                                else{
                                    html = 'Sin permisos.';
                                }
                            }
                            else{
                                html = 'Sin permisos.';
                            }
                        }
                        else{
                            html = 'Sin permisos.';
                        }
                    } catch(e) { console.error(e); html = 'Sin permisos.'; }
                    
                    var op = "<p class='text-center'>" + html + "</p>";
                    return op;
                }
            }
        ]
    });
}

//#endregion
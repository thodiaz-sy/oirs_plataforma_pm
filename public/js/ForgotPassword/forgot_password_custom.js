 "use strict";

 $(document).ready(function() {
    
    //#region SetListeners   

    $("#forgotPassword").on('submit',function(e){
        if(!$(".invalid-feedback").is(":visible")){
            $("#btnRecovery").buttonLoader('start');
        }
    });
    
    //#endregion SetListeners
    
 });

//#region Functions

//#endregion
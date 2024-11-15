 "use strict";

 $(document).ready(function() {
    
    //#region SetListeners   

    $("#recoveryPassword").on('submit',function(e){
        var password = $("#passwordNew").val().trim();
        var confirm = $("#passwordConfirm").val().trim();
        if(password.length > 0 && confirm.length > 0){

            if(!hasUpper(password)){ e.preventDefault(); $(".invalid-feedback-number").fadeIn(); } else { $(".invalid-feedback-number").hide(); }
            if(!hasNumber(password)){ e.preventDefault(); $(".invalid-feedback-number").fadeIn(); } else { $(".invalid-feedback-number").hide(); }
            if(!hasSpecialCharacters(password)){ e.preventDefault(); $(".invalid-feedback-special").fadeIn(); } else { $(".invalid-feedback-special").hide(); }
            if(password.length < 10){ e.preventDefault(); $(".invalid-feedback-length").fadeIn(); } else { $(".invalid-feedback-length").hide(); }

            if(password!=confirm){
                e.preventDefault();
                $(".invalid-feedback-equal").fadeIn();
            }else{
                $(".invalid-feedback-equal").hide();
            }
        }
        if(!$(".invalid-feedback").is(":visible")){
            $("#btnRecovery").buttonLoader('start');
        }
    });
    
    //#endregion SetListeners
    
 });

//#region Functions

//#endregion
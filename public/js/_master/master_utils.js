this.IsEmailValid = function IsEmailValid(email) {
    var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if(!regex.test(email)) {
      return false;
    }else{
      return true;
    }
}

this.IsPasswordValid = function IsPasswordValid(pass) {
    var valid = true;
    if(!hasUpper(pass)){ valid = false; }
    if(!hasNumber(pass)){ valid = false; }
    if(!hasSpecialCharacters(pass)){ valid = false; }
    if(pass.length < 10){ valid = false; }
    return valid;
}

this.hasUpper = function hasUpper(str) {
    return /[A-Z]/.test(str);
}

this.hasNumber = function hasNumber(str) {
    return /\d/.test(str);
}

this.hasSpecialCharacters = function hasSpecialCharacters(str) {
    return /[ `!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/.test(str);
}

this.onFileUpload = function onFileUpload(input) {
    var fileName = '...';
    if($(input).val()){ fileName = $(input).val().split("\\").pop();}
    $(input).siblings(".custom-file-label").addClass("selected").html(fileName);
}
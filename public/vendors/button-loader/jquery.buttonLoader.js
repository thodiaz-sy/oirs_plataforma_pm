/*A jQuery plugin which add loading indicators into buttons
* By Minoli Perera
* MIT Licensed.
*/
(function ($) {
    $('.has-spinner').attr("disabled", false);
    $.fn.buttonLoader = function (action) {
        var self = $(this);
        if (action == 'start') {
            if ($(self).hasClass('disabled-loader')) {
                return false;
            }
            $(self).addClass("disabled-loader");
            $(self).attr('data-btn-text', $(self).html());
            var text = '';
            if(!$(self).hasClass('btn-icon')){
                text = 'Procesando';
            }
            if($(self).attr('data-load-text') != undefined && $(self).attr('data-load-text') != ""){
                var text = $(self).attr('data-load-text');
            }
            $(self).html('<i class="fas fa-spinner fa-spin"></i> '+text);
            $(self).addClass('active');
        }
        if (action == 'stop') {
            $(self).html($(self).attr('data-btn-text'));
            $(self).removeClass('active');
            $(self).removeClass("disabled-loader");
        }
    }
})(jQuery);

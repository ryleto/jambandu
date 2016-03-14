//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require_tree .

// FLASH MESSAGES: FADEOUT
$(function() {
    var flashCallback;
    flashCallback = function() {
        return $(".alert").fadeOut();
    };
    $(".alert").bind('click', (function(_this) {
        return function(ev) {
            return $(".alert").fadeOut();
        };
    })(this));
    return setTimeout(flashCallback, 3000);
});

$(function(){
    $(".new_company_link").click(function(){
        $("#new_company").slideDown('fast');
    });
    $(".new_company_cancel").click(function(){
        $("#new_company").slideUp('fast');
    });
});
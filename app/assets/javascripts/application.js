// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.autocomplete
//= require autocomplete-rails
//= require rails.validations
//= require_tree .
//= require holder

$(function() {
    $('.mini_nav').on('click',function() {
        $('.page').toggleClass('nav_active');
        $('.banner').toggleClass('nav_active');
    });
    $('.slog_preview a').on('click', function(e) {
        e.preventDefault;
    });
    $('.slog_preview:not(active)').on('click', function() {
        $(this).addClass('active');
    });
    $('.close').on('click', function(){
      $('.alert').hide();
    });
});

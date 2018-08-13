// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap
//= require moment
//= require tempusdominus-bootstrap-4.js
//= require jquery_ujs
//= require_tree .

window.onload = function(){
	$('#datetimepicker4').datetimepicker({
    format: 'MMMM D, YYYY',
    maxDate: new Date(Date.now() + (365 * 24 * 60 * 60 * 1000)),
    icons: {
      up: 'fas fa-arrow-up',
      down: 'fas fa-arrow-down',
      previous: 'fas fa-chevron-left',
      next: 'fas fa-chevron-right',
      close: 'fas fa-times'
    },
    buttons: {showClose: true }
  });
  $('#datetimepicker3').datetimepicker({
    format: 'MMMM D, YYYY',
    maxDate: new Date(Date.now() + (365 * 24 * 60 * 60 * 1000)),
    icons: {
      up: 'fas fa-arrow-up',
      down: 'fas fa-arrow-down',
      previous: 'fas fa-chevron-left',
      next: 'fas fa-chevron-right',
      close: 'fas fa-times'
    },
    buttons: {showClose: true }
  });
  $("#establishment_tipo_inspeccion").change(function(){
    if($(this).val() == "Ex-Post"){
      $("#architects_form").hide();
    }else{
      $("#architects_form").show();
    }
  })
}
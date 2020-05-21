#= require jquery
#= require jquery_ujs
#= require jquery3
#= require jquery-fileupload
#= require dropzone
#= require fileinput.min
#= require tinymce
#= require tinymce-jquery
#= require chosen-jquery
#= require popper
#= require bootstrap-sprockets
#= require font_awesome5

@onReady ->
  $('.date-picker').datepicker
    format: 'dd/mm/yyyy'
    clearBtn: true
    language: 'pt-BR'
    autoclose: true

@onReady ->
  $('.time-picker').datepicker
    format: 'dd/mm/yyyy'
    clearBtn: true
    language: 'pt-BR'
    autoclose: true

() ->
  $(document).foundation()

#= require jquery
#= require jquery_ujs
#= require jquery3
#= require tinymce
#= require tinymce-jquery
#= require chosen-jquery
#= require popper
#= require bootstrap-sprockets

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

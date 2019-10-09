#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require jquery3
#= require popper
#= require bootstrap-sprockets
#= require_tree .

@onReady = (fn) ->
  $ fn
  $(document).on 'turbolinks:load', fn

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

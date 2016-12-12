# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#meeting_contact_title').autocomplete
    source: $('#meeting_contact_title').data('autocomplete-source')

ready = ->
  $('#meeting_date').datepicker(dateFormat: "dd.mm.yy");

  $('#histories').dataTable()

$(document).ready(ready)
#$(document).on('page:load', ready)
$(document).on "turbolinks:load", ->
  alert "page loaded"

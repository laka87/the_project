jQuery ->
  ready = ->
    $('#histories').dataTable


$(document).ready(ready)
#$(document).on('page:load', ready)
$(document).on "turbolinks:load", ->
  alert "page loaded"

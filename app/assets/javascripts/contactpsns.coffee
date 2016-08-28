# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  ready = ->
    $('#reports').dataTable()

$(document).ready(ready)
$(document).on('page:load', ready)

#    "columnDefs": [{
#        "targets": -1,
#        "sortable":false,
#        $("contactpsns td a").live("click") ->
#          $.getScript(this.href);
#            return false;
#
#      }
    #  ,
    #  {
    #    "targets": -2,
    #    "sortable":false,
    #    "data": "show_contact_contactpsn_path"
    #    "render": (data, type,full,meta) ->
    #        return '<a href=" show">Anzeigen</a> ';
    #  },
    #  {
    #      "targets": -3,
    #      "sortable":false,
    #      "data": "show_contact_contactpsn_path"
    #      "render": (data, type,full,meta) ->
    #          return '<a href=" show">Anzeigen</a> ';
    #  }



    #  ,
    #  {
    #            "targets": -1,
    #            "sortable":false,
    #            "data": "contact_contactpsn_path"
    #            "render": (data, type,full,meta) ->
    #            return '<a data-confirm="Are you sure?" data-method="delete" href=" contact_contactpsn_path(@contact, contactpsn) " >Löschen</a> ';
    #          }
#    ]

#    });

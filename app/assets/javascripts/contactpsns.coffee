# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#contactpsns').dataTable({

    "columnDefs": [{
        "targets": -1,
        "sortable":false,
        "data": 'edit_contact_contactpsn_path(@contact, contactpsn)'
        "render": (data, type,full,meta) ->
            return '<a href="   ">Editieren</a> ';

      },
      {
        "targets": -2,
        "sortable":false,
        "data": "show_contact_contactpsn_path"
        "render": (data, type,full,meta) ->
            return '<a href=" show">Anzeigen</a> ';
      },
      {
          "targets": -3,
          "sortable":false,
          "data": "show_contact_contactpsn_path"
          "render": (data, type,full,meta) ->
              return '<a href=" show">Anzeigen</a> ';
      }



    #  ,
    #  {
    #            "targets": -1,
    #            "sortable":false,
    #            "data": "contact_contactpsn_path"
    #            "render": (data, type,full,meta) ->
    #            return '<a data-confirm="Are you sure?" data-method="delete" href=" contact_contactpsn_path(@contact, contactpsn) " >Löschen</a> ';
    #          }
    ]

    });

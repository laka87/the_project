# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#contactpsns').dataTable({

    "columnDefs": [{
      "targets": [-1,-2,-3, -4],
      "orderable": false,
      "sortable": false,
      "searchable": false

      }]

      "columnDefs": [{
        "targets": -1,
        "data": "edit_contact_contactpsn_path"
        "render": function(data, type,full,meta) {
            return '<a href="'+data+' ">editieren</a> ';
        }
      }]

    });

$(document).ready(function() {
  $('#poll-questions').tableDnD({
    onDrop: function(table, row) {
      $.ajax({
        type: "POST",
        url: "<%= url_for(:action => 'sort') %>",
        processData: false,
        data: $.tableDnD.serialize() + '&authenticity_token=' + encodeURIComponent('<%= form_authenticity_token if protect_against_forgery? %>'),
        success: function(msg) {
          alert("The specifications have been updated")
        }
      });
    }
  });
});
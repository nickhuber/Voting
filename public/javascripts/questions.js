$(document).ready(function() {
  // Hide form items.
  $("form input").hide();
  $(".question-weight").hide();
  
  // Bind anonymous function to the onDrop event.
  $("#poll-questions").tableDnD({
    onDrop: function(table, row) {
      var rows = $("tr", table).toArray();
      // First row is headers (doesn't get a weight).
      rows.shift();

      // Updating weight values for each element based on order.
      $(rows).each(function (i, row){
        $("select", row).val(i);
      });
      
      // Trigger form's submit event.
      $("form#questions-sort").submit();
    }
  });
});
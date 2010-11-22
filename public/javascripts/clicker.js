$(document).ready(function() {
  setTimeout(longPoll, 2 * 1000);
});

function longPoll() {
  var active_poll = $('#active_poll_id').text();
  var dest = "http://0.0.0.0:8124/query_active_question";
  var request = { active_poll: active_poll }
  
  console.log("REQUEST");
  
  $.ajax({
    url: dest,
    data: request,
    dataType: 'jsonp',
    error: function(XMLHttpRequest, textStatus, errorThrown) {
      //don't flood the servers on error, wait 10 seconds before retrying
      setTimeout(longPoll, 5 * 1000);
    },
    success: function(json) {
      console.log(json);
      //location.reload();
      // If everything went well, begin another request immediately.
      longPoll();
    }
  });
}
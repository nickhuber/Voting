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
      console.log("ERROR");
      //don't flood the servers on error, wait 10 seconds before retrying
      setTimeout(longPoll, 5 * 1000);
    },
    success: function(question) {
      var container_question = $("#container_question");
      var container_answers = $("#container_answers");
      
      // Remove old answers.
      $("li", container_answers).each(function(index, item) {
        $(item).remove();
      });
      
      // Update question.
      $("h2", container_question).text(question.question);
      
      // Create new answers.
      $(question.answers).each(function(index, answer) {
        var dest =  "/active_polls/" 
                    + active_poll 
                    + "/submit?answer=" 
                    + answer.id;
        var a = $("<a>").attr("href", dest).text(answer.body);
        var li = $("<li>").attr("class", "arrow").append(a);
        $(container_answers).append(li);
      });
      
      // If everything went well, begin another request immediately.
      longPoll();
    }
  });
}
$(document).ready(function() {
  var dest = "http://0.0.0.0:8124/set_question";
  var id = $("#active_poll_id").text();
  var question_id = $("#active_question_id").text();
  var request = { id: id, question_id: question_id, }
  
  console.log(id);
  console.log(question_id);
  
  $.ajax({
    url: dest,
    data: request,
    dataType: 'jsonp',
    success: function(data) {}
  });
});
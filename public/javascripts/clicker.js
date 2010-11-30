var jQT;
$(document).ready(function() {
  jQT = new $.jQTouch({
    icon: 'jqtouch.png',
    statusBar: 'black-translucent',
    preloadImages: [
      '../jqtouch/themes/jqt/img/chevron.png',
      '../jqtouch/themes/jqt/img/rowhead.png',
      '../jqtouch/themes/jqt/img/back_button_clicked.png',
      '../jqtouch/themes/jqt/img/button_clicked.png'
    ],
    fixedViewport: false
  });
  setTimeout(longPoll, 2 * 1000);
  fixAnswerLinks();
  
  $(document).bind("pageInserted", function(page) {
    console.log(page);
  });
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
    success: longPollSuccess,
  });
}

function longPollSuccess(question) {
  var active_poll = $('#active_poll_id').text();
  var container_question = $("#container_question");
  var container_answers = $("#container_answers");
  var question_home_id = "pageQuestion";
  
  // Remove old answers.
  $("li", container_answers).each(function(index, item) {
    $(item).remove();
  });
  
  // Update question.
  $("h2", container_question).text(question.question);
  
  // Create new answers.
  $(question.answers).each(function(index, answer) {
    var dest =  "/" + active_poll + "/submit/" + answer.id;
    var a = $("<a>").attr("href", dest + "#" + "pageSubmit")
                    .addClass("answer")
                    .text(answer.body);
    var li = $("<li>").attr("class", "arrow").append(a);
    $(container_answers).append(li);
  });
  
  fixAnswerLinks(question_home_id);
  
  if ($(".current").attr("id") != question_home_id) {
    //jQT.goTo("#" + question_home_id, 'slide');
    jQT.goBack();
  }
  
  
  // If everything went well, begin another request immediately.
  longPoll();
}

function fixAnswerLinks() {
  console.log("FIXANSWERLINKS");
  $('a.answer').each(function(i, item) {  
    $(item).bind("click", function() {
      $.get($(item).attr("href"));
    });
  });
}
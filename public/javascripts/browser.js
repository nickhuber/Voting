$(document).ready(function() {  
  var submit_message_id = "submit_message";
  var reload_question_text;
  var reload_text;
  
  /**
   * Claims then answer link's click events back from jQTouch.
   */
  $('body').bind('FixAnswerLinks', function() {
    $('a.answer').each(function(i, item) {  
      $(item).bind("click", function() {
        var submit_message = $("<div>").attr("id", submit_message_id)
          .append($("<h2>")
            .text("Thanks, your answer has been submitted!"))
          .append($("<p>")
            .text("To go back and change your submission, push the back button below."))
          .append($("<p>")
            .text("This page will update as soon as the next question is posted."));
        
        $("#container_question").hide();
        $(submit_message).insertAfter($("#container_question"));
        
        reload_question_text = $("a", "#reload-question").text();
        reload_text = $("#reload-text", "#reload-question");
        $(reload_text).hide();
        $("a", "#reload-question").text("Back");
        
        $.get($(item).attr("href"));
        return false;
      });
    });
  });
  
  $('body').bind('LongPollSuccess', function() {
    $("#" + submit_message_id).remove();
    $("#container_question").show();
    $(reload_text).show();
    $("a", "#reload-question").text(reload_question_text);
  });
});
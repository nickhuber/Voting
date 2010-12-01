$(document).ready(function() {
  // Initialize new jQTouch object.
  var jQT = new $.jQTouch({
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
  
  /**
   * When necessary, claim back answer link's click events back from jQTouch.
   */
  $('body').bind('FixAnswerLinks', function() {
    $('a.answer').each(function(i, item) {  
      $(item).bind("click", function() {
        $.get($(item).attr("href"));
      });
    });
  });
  
  /**
   * On LongPollSuccess, tell jQTouch to go back to question view.
   */
  $('body').bind('LongPollSuccess', function() {
    jQT.goBack();
  });
});
var options = { 
  bars: {
    show:true 
  },
  xaxis: {
    max : num_of_questions,
    tickSize: 1,
    tickAlign: "left"
  },
    yaxis: {
      min : 0,
      max : num_of_participants,
      tickSize: 1            
    },
  legend: {
    show: false
  },
  hooks: {
    processOptions: processOptions        
  }
}

var graph;
var num_of_questions;
var num_of_participants;

function processOptions(plot, options) {
    var labels = new Array();
  console.log(options);    
  $(".question_name").each(function(i, item) {
      labels[i] = new Array();
      labels[i].push(i);
      labels[i].push($(item).text());
  });

  options.xaxis.ticks = labels;
}

$(document).ready(function(){
    var num_of_participants = $(".num_of_participants").html();
    var num_of_questions    = $("tbody tr").size();
    var data = new Array();
    var index = 0;

    $("#temp-table").hide();
    $("#placeholder").show();
    
    $(".correct_answer").each(function(index,row){
        data[index] = {data: [[index, $(row).html()]]};
    });
    
    graph = new $.plot($("#placeholder"), data, options);

    //fetchData();
    setInterval(fetchData, 4000);
    console.log(graph);
});

function fetchData() {   
    $.ajax({
        // usually, we'll just call the same URL, a script
        // connected to a database, but in this case we only
        // have static example files so we need to modify the
        // URL
        url: $("#report-id").value,
        method: 'GET',
        dataType: 'json',
        success: onDataReceived,
        
     });
   
    function onDataReceived(data, textStatus, XMLHttpRequest) {
        var result = new Array();
        result = data.shift();

        if(result.correct_questions[0] == -1) {
            $("#placeholder").hide();
            $("#temp-table").show();
        }

        updateTables(result);
        updateGraph(result.correct_questions);
    }
    
    function updateGraph(correct_questions) {
      var data = new Array();
      for (var i = 0; i < correct_questions.length; i++) {
        data[i] = {data: new Array()};
        data[i].data[0] = new Array();
        data[i].data[0][0] = i;
        data[i].data[0][1] = correct_questions[i];
      }
      
      console.log(data);
      $.plot($("#placeholder"), data, options, 0)
      graph.setData(data);
      graph.draw();
    }
    
    function updateTables(result)
    {
        var index = 0;
        $(".report-question").each(function(idx,el){
           
            $(".value",el).each(function(ex, el){
                $(el).text(result.answers_picked[index++]);
             });
            
        });
    }   
};

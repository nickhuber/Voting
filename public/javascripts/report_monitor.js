var options = { 
        bars:{show:true },
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
    $("#temp-table").hide();
    $("#placeholder").show();
    fetchData();
    setInterval(fetchData, 4000);

    var num_of_participants = $(".num_of_participants").html();
    var num_of_questions    = $("tbody tr").size();
    var counter = .5;
    var data = new Array();
    var bar_counter;
    var index = 0;
    var answer;
   // var newData = [{data: [[0,.5], [1,1]]}];
    
    $(".correct_answer").each(function(index,row){
        data[index] = {data: [[index,$(row).html()]]};
    });

	graph = new $.plot($("#placeholder"), data, options, 0);
    console.log(graph);
   $('.tickLabel').each(function(idx, el){          
        //$(el).css('left', 100);
        //console.log($(el));            
        //var c = $(el);
        //var value = c.parent().css('left');
        // c.parent().css('right',parseInt(value)+1000+'px');
    });
      
});
function fetchData()
{   
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
        console.log(data);
        var result = new Array();
        result = data.shift();

        if(result.correct_questions[0] == -1) {
            $("#placeholder").hide();
            $("#temp-table").show();
        }

        updateTables(result);
        
        graph.setData(result.correct_questions);
        graph.draw();
    }
    function updateTables(result)
    {
        var index = 0;
        $(".question").each(function(idx,el){
           
            $(".value",el).each(function(ex, el){
                $(el).text(result.answers_picked[index++]);
             });
            
        });
    }   
};

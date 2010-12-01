var options = { 
        bars:{show:true },
        xaxis: {
	        max : num_of_questions,
      
		},
        yaxis: {
            min : 0,
            max : num_of_participants,
        },
		legend: {
		    show: false
		}
    }
var num_of_questions;
var num_of_participants;
$(function () {
    $("#temp-table").hide();
    $("#placeholder").show();
    setInterval(fetchData, 4000);
    fetchData();
/*    var num_of_participants = $(".num_of_participants").html();
    var num_of_questions    = $("tbody tr").size();
    var counter = .5;
    var data = new Array();
    var bar_counter;
    var index = 0;
    var answer;
   // var newData = [{data: [[0,.5], [1,1]]}];
    
    $("tbody tr").each(function(index,row){
        data[index] = {data: [[index,$('.correct_answer', row).html()]]};
    });

	$.plot($("#placeholder"), data,options);*/
      
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
   
    function onDataReceived(data, textStatus, XMLHttpRequest)
    {
        // we get all the data in one go, if we only got partial
        // data, we could merge it with what we already got
        var num_of_participants = data[0];   
        var num_of_questions    = data[2].length
        var result = new Array();  
        var count = 0;        
        options.yaxis.max = num_of_participants;
        options.xaxis.max = num_of_questions;
        //result = data[0];
        while(count < data[2].length)
        {
            result[count] = {data: [[count,data[2][count]]]};
            count++;
        }
        console.log(result);
        $.plot($("#placeholder"), result, options);
    }
};

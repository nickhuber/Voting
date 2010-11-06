
$(function () {
    
    var num_of_participants = $(".num_of_participants").html();
    var num_of_questions    = $("tbody tr").size();
    var counter = .5;
    var data = new Array();
    var bar_counter;
    var index = 0;
    var answer;
    var newData = [];
    $("tbody tr").each(function(index,row){
        data[index] = $('.correct_answer', row).html();
        //data += [[bar_counter++,row.find("td")[1].html()]];
    });
console.log(data);
     //$.ajax({
                // usually, we'll just call the same URL, a script
                // connected to a database, but in this case we only
                // have static example files so we need to modify the
                // URL
             /*   url: "data-eu-gdp-growth-" + iteration + ".json",
                method: 'GET',
                dataType: 'json',
                success: onDataReceived*/
       //     });

    function onDataReceived(series) 
    {
                // we get all the data in one go, if we only got partial
                // data, we could merge it with what we already got
                data = [ series ];
                
                $.plot($("#placeholder"), data, options);
    }
    var count = 0;
    while(answer < num_of_questions) {
        newData[count++] = {                
            data: [[counter++,data[answer++]]],    
            // data: [[bar_counter++,<%= AnsweredQuestion.num_correct(q) %>]],    
            bars: { show: true}
        };
    }
	$.plot($("#placeholder"), newData, 
    {
        xaxis: {
	        max : num_of_questions,
        /*    ticks: [ 
                
            ],		    */   
		},
        yaxis: {
            min : 0,
            max : num_of_participants,
        },
		legend: {
		    show: false
		}

	});
});

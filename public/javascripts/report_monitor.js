
$(function () {
    
    var num_of_participants = $(".num_of_participants").html();
    var num_of_questions    = $("tbody tr").size();
    var counter = .5;
    var data = new Array();
    var bar_counter;
    var index = 0;
    var answer;
    var newData = [{data: [[0,.5], [1,1]]}];
    var options = { 
        bars:{show:true },
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
    }
    

    $("tbody tr").each(function(index,row){
        data[index] = {data: [[index,$('.correct_answer', row).html()]]};
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
    
	$.plot($("#placeholder"), data,options);
    
});

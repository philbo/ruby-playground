
function init() {
	$("#g-search").submit(function(e) {

		var postData = $(this).serializeArray();
		var formURL = $(this).attr("action");
		$.ajax(
		{
			url : formURL,
			type: "POST",
			data : postData,
			success:function(data, textStatus, jqXHR) 
			{
				var jsonData = JSON.parse(data);
				if(jsonData.status === "ZERO_RESULTS") {
					$("#search-results").html("No results found");
				} else {
					renderResults(jsonData);
				}
			},
			error: function(jqXHR, textStatus, errorThrown) 
			{
				//if fails      
			}
		});
		e.preventDefault();
	});
}

function renderResults(data) {
	var output = "<ul>";
	$.each(data["predictions"], function(i, item) {
		output += "<li><a href='/details?reference=" + item["reference"] + "'>" + item["description"] + "</a></li>";
	});
	output += "</ul>";

	$("#search-results").html(output);
}

$(document).ready(init);
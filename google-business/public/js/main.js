
function init() {
	$("#g-search").submit(function(e) {

		var postData = $(this).serializeArray();
		var formURL = $(this).attr("action");
		$.ajax(
		{
			url : formURL,
			type: "POST",
			data : postData,
			success: function(data, textStatus, jqXHR) 
			{
				var jsonData = JSON.parse(data);
				console.log(jsonData);
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

function getDetails(reference) {
	$.ajax(
	{
		url : "/details?reference=" + reference,
		type: "GET",
		success: function(data, textStatus, jqXHR) 
		{
			var jsonData = JSON.parse(data);
			if(jsonData.status === "ZERO_RESULTS") {
				$("#search-results").html("No results found");
			} else {
				var location = jsonData["result"]["geometry"]["location"];
				drawMap(location["lat"], location["lng"]);
			}
		},
		error: function(jqXHR, textStatus, errorThrown) 
		{
			//if fails      
		}
	});
	return false;
}

function renderResults(data) {
	var output = "<ul>";
	var location = "";
	$.each(data["predictions"], function(i, item) {
		output += "<li><a href='#' onclick='getDetails(\"" + item["reference"] + "\")';>" + item["description"] + "</a></li>";
	});
	output += "</ul>";

	$("#search-results").html(output);
}

function drawMap(lat, lng) {
	var myLatlng = new google.maps.LatLng(lat, lng);
	var mapOptions = {
	  zoom: 16,
	  center: myLatlng
	}
	var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

	// To add the marker to the map, use the 'map' property
	var marker = new google.maps.Marker({
	    position: myLatlng,
	    map: map,
	    title:"Hello World!"
	});
}

$(document).ready(init);
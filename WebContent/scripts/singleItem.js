/**
 * Created by Shachar Zeplovitch
 */

$(document).ready(function(){ 
	var itemInfo = [];
	$(".view-item").click(function() {
		itemInfo = [];
		var $row = $(this).closest("tr"); // Find the row
		var $tds = $row.find("td");
		$.each($tds, function(){
			itemInfo.push($(this).text());
			fillArray(itemInfo, ".itemInfo");
		});
	});
});

var fillArray = function(itemInfo, info) {
	var newHTML = [];
	
	$.each(itemInfo, function(index, value) {
		
	    newHTML.push('<span>' + value + '</span><br>');
	});
	
	$(info).html(newHTML.join(""));	
}
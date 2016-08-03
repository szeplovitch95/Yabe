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
			console.log($(this).text());
			itemInfo.push($(this).text());
			fillArray(itemInfo);
		});
	});
});

var fillArray = function(itemInfo) {
	var newHTML = [];
	$.each(itemInfo, function(index, value) {
	    newHTML.push('<span>' + value + '</span>');
	});
	$(".joinHere").html(newHTML.join(""));	
}
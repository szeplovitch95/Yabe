/**
 * Created by Shachar Zeplovitch
 */

$(document).ready(function(){ 
	var auctionInfo = [];
	$(".view-item").click(function() {
		auctionInfo = [];
		var $row = $(this).closest("tr"); // Find the row
		var $tds = $row.find("td");
		$.each($tds, function(){
			console.log($(this).text());
			auctionInfo.push($(this).text());
			fillArray(auctionInfo);
		});
	});
});

var fillArray = function(auctionInfo) {
	var newHTML = [];
	$.each(itemInfo, function(index, value) {
	    newHTML.push('<span>' + value + '</span>');
	});
	$(".joinHere").html(newHTML.join(""));	
}
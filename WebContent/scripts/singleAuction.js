/**
 * Created by Shachar Zeplovitch
 */

$(document).ready(function() {
	var auctionInfo = [];
	$(".view-auction").click(function() {
		auctionInfo = [];
		var $row = $(this).closest("tr"); // Find the row
		var $tds = $row.find("td");
		$.each($tds, function() {
			console.log($(this).text());
			auctionInfo.push($(this).text());
			fillArray(auctionInfo, ".auctionInfo");
		});
	});
});
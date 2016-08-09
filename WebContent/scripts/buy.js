/**
 * Created by Shachar Zeplovitch 
 * Created on 7/31/2016
 */

$(document).ready(function() {
	$('#availableAuctionsButton').click(function() {
		console.log("here auction");
		$('#availableAuctionsDiv').removeClass('hidden');
		$('#buyerBids').addClass('hidden');
	});

	$('#buyerBidsButton').click(function() {
		console.log("here item");
		$('#buyerBids').removeClass('hidden');
		$('#availableAuctionsDiv').addClass('hidden');
	});
});
/**
 * Created by Shachar Zeplovitch 
 * Created on 7/31/2016
 */

$(document).ready(function () {
	$('#auctionButton').click(function(){
		console.log("here auction");
	    $('#auctionDiv').removeClass('hidden');
	    $('#itemDiv').addClass('hidden');
	});
	
	$('#itemButton').click(function(){
		console.log("here item");
	    $('#itemDiv').removeClass('hidden');
	    $('#auctionDiv').addClass('hidden');
	});
});
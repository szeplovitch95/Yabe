/**
 * Created by Shachar Zeplovitch
 */

$(document).ready(function() {
	$('#userType').on('change', function() {
		  if(this.value === 'Seller') {
			  $('#sellerDiv').removeClass('hidden');
			  $('#buyerDiv').addClass('hidden');
		  } else {
			  $('#buyerDiv').removeClass('hidden');
			  $('#sellerDiv').addClass('hidden');
		  }
	});
});
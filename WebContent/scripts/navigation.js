/**
 * Created by Shachar Zeplovitch 
 */

$(document).ready(function() {
	$('.nav li').click(function() {
		$('.nav li').removeClass('active');
	});

	var myPage = "#" + $('#activePage').text();
	$(myPage).addClass("active");
});
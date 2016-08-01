/**
 * Created by Shachar Zeplovitch 
 * Created on 7/31/2016
 */

$(document).ready(function () {
	$('.nav li').click(function(){
	    $('.nav li').removeClass('active');
	});
	
	var myPage =  "#" + $('#activePage').text();
	$(myPage).addClass("active");
});
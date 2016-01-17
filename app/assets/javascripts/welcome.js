$(window).load(function(){
	// $("#my_account").hide();
	$(".wait").hide();
	$("#team").fadeIn();
});

// $(document).ready(function () {
// 	$('#my_account').hide();
// 	if($($( "#noti" ).children()[0]).text() != "") {
//   	$( "#noti" ).fadeIn( "slow" );
//   	setTimeout(function (){
//     	$( "#noti" ).fadeOut( "slow" );
//   	}, 1000);
// 	}

// 	$('#account_button').click(function (e) {
// 		e.preventDefault();
// 		$('#my_account').fadeIn();
// 	});

// 	$(document).click(function (e) {
// 		if ($(e.target).closest('#my_account').length > 0 || $(e.target).closest('#account_button').length > 0) return;
// 	    $('#my_account').fadeOut();
// 	});
// });
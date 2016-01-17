$(document).ready(function() {
	$("input").change(function(){
		var row = $(this).closest('.row');
		// alert(row.attr('id'));
		var submit = row.find('button[type=submit]');
		submit.removeClass("disabled");
		submit.prop('disabled', false);
	});	
});
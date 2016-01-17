$(document).ready(function()
{
    associateBackupPictures();
});

function associateBackupPictures(){
	$(".backup_picture").error(function(){
        $(this).attr('src', '/assets/categories/placeholder.png');
    });
    $('.wait').hide();
    $('.async-action').click(function(){
    	$('.wait').show();
    });
    $('.form').hide();
    $('.btn-admin').click(function(){
		var card = $(this).closest('.card')
    	card.find('.form').show();
    	card.find('.normal').hide();  	
    });
}
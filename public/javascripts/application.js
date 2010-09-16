// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready( function(){	
	
	if ($('.search-field').val() == '')
		$('.search-field').val('Type in a title..');
	
	$('.search-field').focus(function() { 
		if ($(this).val() == 'Type in a title..')
			$(this).val('');
		this.style.color = '#000000'
	});
	
	$('.search-field').blur(function() { 
		if ($(this).val() == '')
			$(this).val('Type in a title..');
		this.style.color = '#7F7F7F';
	});
	
	$('.clear-search').click(function() { 
		$('.search-field').val('');
		$('.search-field').focus();
	});
	
});
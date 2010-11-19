// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function mark_for_destroy(element) {
	console.log($(element).next('.should_destroy'));
	$(element).next('.should_destroy').val(1);
	$(element).parent('.answer').hide();
}
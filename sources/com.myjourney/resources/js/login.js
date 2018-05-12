$(".forgot").click(function() {
	$("#login-session").css('display', 'none');
	$("#register-session").css('display', 'none');
	$("#forgot-session").css('display', 'block');
});
$(".backtosignin").click(function() {
	$("#login-session").css('display', 'block');
	$("#forgot-session").css('display', 'none');
	$("#register-session").css('display', 'none');
});
$("#register").click(function() {
	$("#login-session").css('display', 'none');
	$("#forgot-session").css('display', 'none');
	$("#register-session").css('display', 'block');
});

$("#SubmitForm").on('submit', function(e) {
	e.preventDefault();
	var el = $(this);
	$.ajax({
		url : el.attr('action'),
		method : el.attr('method') || 'post',
		data : el.serialize(),
		dataType : 'json',
		success : function(data) {
			var type = parseInt(data.type);
			var msg = data.message;
			/*if (type === 1) {
				alert(msg + '' + type);
			} else {
				alert(msg + '' + type);
			}*/
			$('#type-json').text(type);
			$('#message-json').text(msg);
		}
	});
});

$(function() {
	// ----- OPEN
	$('[data-popup-open]').on('click', function(e) {
		var targeted_popup_class = jQuery(this).attr('data-popup-open');
		$('[data-popup="' + targeted_popup_class + '"]').fadeIn(150);
		//e.preventDefault();
	});
	// ----- CLOSE
	$('[data-popup-close]').on('click', function(e) {
		var targeted_popup_class = jQuery(this).attr('data-popup-close');
		$('[data-popup="' + targeted_popup_class + '"]').fadeOut(150);
		//e.preventDefault();
	});
});

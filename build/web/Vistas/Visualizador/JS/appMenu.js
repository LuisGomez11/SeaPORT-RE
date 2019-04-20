$(document).ready(function(){

	var serGen = $("#serGenerados");
	var serAsi = $("#serAsignados");

	$('#pri').click(function(e){
		e.preventDefault();
		$(this).addClass("activado");
		$('#seg').removeClass("activado");
		serGen.show();
		serAsi.hide();
	});

	$('#seg').click(function(e){
		e.preventDefault();
		$(this).addClass("activado");
		$('#pri').removeClass("activado");
		serAsi.show();
		serGen.hide();
	});

});
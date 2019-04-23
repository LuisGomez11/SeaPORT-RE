$(document).ready(function(){
	$('.btn-menu').click(function(){
		$('.contenedor-menu .menu').slideToggle();
	});

	$(window).resize(function(){
		if ($(document).width() > 500) {
			$('.contenedor-menu .menu').css({'display':'block'});
		}

		if ($(document).width() < 500) {
			$('.contenedor-menu .menu').css({'display':'none'});
		}
	});

	//////////////////////// CONTENEDORES ///////////////////////
	var inicio = $('.contenedor-inicio');
	var regProveedor = $('.contenedor-regProveedor');
	var conProveedor = $('.contenedor-conProveedor');

	////////////////////// BOTONES - MENU //////////////////////
	var btnInicio = $('#inicio');
	var primera = $('#primera');
	var segunda = $('#segunda');

	function menuControl(act, no1, no2, btnAct, btn1, btn2){
		act.css({'display':'block'});
		no1.css({'display':'none'});
		no2.css({'display':'none'});
		//////////////////////////////////////////////////////
		btnAct.addClass('activado');
		//////////////////////////////////////////////////////
		btn1.removeClass('activado');
		btn2.removeClass('activado');
	}

	$('#inicio').click(function(e){
		e.preventDefault();
		menuControl(inicio,regProveedor,conProveedor,
			btnInicio,primera,segunda);
		if ($(document).width() < 500) {
			$('.contenedor-menu .menu').slideUp();
		}
	});

	$('#primera').click(function(e){
		e.preventDefault();
		menuControl(regProveedor,inicio,conProveedor,
			primera,btnInicio,segunda);
		if ($(document).width() < 500) {
			$('.contenedor-menu .menu').slideUp();
		}
	});

	$('#segunda').click(function(e){
		e.preventDefault();
		menuControl(conProveedor,regProveedor,inicio,
			segunda,primera,btnInicio);
		if ($(document).width() < 500) {
			$('.contenedor-menu .menu').slideUp();
		}
	});
        
        //VALIDACIONES DEL FORMULARIO DE REGISTRO
        
        $("#btnRegistrar").click(function(e){
            var nombre = $("#nombre").val().trim();
            var telefono = $("#telefono").val().trim();
            var movil = $("#movil").val().trim();
            var correo = $("#correo").val().trim();
            var nit = $("#nit").val().trim();
            var cantTra = $("#cantTra").val().trim();
            if(nombre === "" || telefono === "" || movil === "" ||
                    correo === "" || nit === "" || cantTra === ""){
                swal("ERROR!", "Complete todos los campos por favor", "warning");
                e.preventDefault();
            }
            
        });

});
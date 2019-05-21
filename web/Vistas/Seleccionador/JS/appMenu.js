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
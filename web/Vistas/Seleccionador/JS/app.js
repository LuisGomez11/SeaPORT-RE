$(document).ready(function () {
    $('.btn-menu').click(function (e) {
        $('.contenedor-menu').slideToggle();
        e.preventDefault();
    });

    $(window).resize(function () {
        if ($(document).width() > 1015) {
            $('.contenedor-menu').css({'display': 'block'});
        } else {
            $('.contenedor-menu').css({'display': 'none'});
        }
        
        if($(document).width() <= 767){
            $('.formOpcio').removeClass("container");
        }else{
            $('.formOpcio').addClass("container");
        }
        
    });

    //VALIDACIONES DEL FORMULARIO DE REGISTRO

    $("#btnRegistrar").click(function (e) {
        var nombre = $("#nombre").val().trim();
        var telefono = $("#telefono").val().trim();
        var movil = $("#movil").val().trim();
        var correo = $("#correo").val().trim();
        var nit = $("#nit").val().trim();
        var cantTra = $("#cantTra").val().trim();
        if (nombre === "" || telefono === "" || movil === "" ||
                correo === "" || nit === "" || cantTra === "") {
            swal("ERROR!", "Complete todos los campos por favor", "warning");
            e.preventDefault();
        }

    });

});
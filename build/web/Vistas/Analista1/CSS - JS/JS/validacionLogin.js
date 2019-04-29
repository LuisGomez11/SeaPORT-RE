$(document).ready(function () {
    $("#btn_iniciar").click(function () {

        var user = $("#user").val().trim();
        var pass = $("#pass").val().trim();

        if (user === null || user.length === 0 || /^\s+$/.test(user)) {
            //$("#alerta").html("Ingrese su usuario por favor").slideDown(500);
            swal("ERROR!", "Ingrese su usuario por favor", "warning");
            $("#user").focus();
            return false;
        }


        if (pass === null || pass.length === 0) {
            //$("#alerta").html("Ingrese su contraseña por favor").slideDown(500);
            swal("ERROR!", "Ingrese su contraseña por favor", "warning");
            $("#pass").focus();
            return false;
        }

        if (user === 'analista' && pass === 'passanalista') {
            window.location = "Inicio.jsp";
        } else {
            swal("ERROR!", "Datos incorrectos, intente nuevamente", "error");
            return false;
        }


    });
});
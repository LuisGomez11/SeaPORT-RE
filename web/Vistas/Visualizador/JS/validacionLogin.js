$(document).ready(function () {
    $("#btn_iniciar").click(function () {

        var user = $("#user").val().trim();
        var pass = $("#pass").val().trim();

        if (user === null || user.length === 0 || /^\s+$/.test(user)) {
            swal("ERROR!", "Ingrese su usuario por favor", "warning");
            $("#user").focus();
            return false;
        }


        if (pass === null || pass.length === 0) {
            swal("ERROR!", "Ingrese su contraseña por favor", "warning");
            $("#pass").focus();
            return false;
        }

        if (user === 'visualizador' && pass === 'passvisualizador') {
            window.location = "menuVisualizador.jsp";
        } else {
            swal("ERROR!", "Datos incorrectos, intente nuevamente", "error");
            return false;
        }


    });
});
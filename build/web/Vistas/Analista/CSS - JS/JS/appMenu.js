$(document).ready(function () {

    $('.btn-menu').click(function (e) {
        $('.contenedor-menu .menu').slideToggle();
        e.preventDefault();
    });

    $(window).resize(function () {
        if ($(document).width() > 1015) {            
            $('.contenedor-menu .menu').css({'display': 'block'});          
        }
    });
    
    ///////////////////////////PAGINACION/////////////////////////////

    var numTablas = $(".loop .carta").length;
    var limite = 1;
    $(".loop .carta:gt(" + (limite - 1) + ")").hide();
    var totalPaginas = numTablas / limite;

    $(".pagination").append("<li class='page-item current-page active'><a class='page-link' href='#'>" + 1 + "</a></li>");

    for (var i = 2; i <= totalPaginas; i++) {
        $(".pagination").append("<li class='page-item current-page'><a class='page-link' href='#'>" + i + "</a></li>");
    }

    $(".pagination").append("<li id='siguiente-pag' class='page-item'><a class='page-link' href='#'><span aria-hidden='true'>&raquo;</span></a></li>");

    ///////////////////////////CAMBIAR NOMBRE MES/////////////////////////////

    function cambiarMes(current) {
        switch (current) {
            case 1:
                $('#tituloInfo').html('Informes - Mes de enero');
                break;
            case 2:
                $('#tituloInfo').html('Informes - Mes de febrero');
                break;
            case 3:
                $('#tituloInfo').html('Informes - Mes de marzo');
                break;
            case 4:
                $('#tituloInfo').html('Informes - Mes de abril');
                break;
            case 5:
                $('#tituloInfo').html('Informes - Mes de mayo');
                break;
            case 6:
                $('#tituloInfo').html('Informes - Mes de junio');
                break;
            case 7:
                $('#tituloInfo').html('Informes - Mes de julio');
                break;
            case 8:
                $('#tituloInfo').html('Informes - Mes de agosto');
                break;
            case 9:
                $('#tituloInfo').html('Informes - Mes de septiembre');
                break;
            case 10:
                $('#tituloInfo').html('Informes - Mes de octubre');
                break;
            case 11:
                $('#tituloInfo').html('Informes - Mes de noviembre');
                break;
            case 12:
                $('#tituloInfo').html('Informes - Mes de diciembre');
                break;
        }
    }

    $(".pagination li.current-page").on("click", function (e) {
        e.preventDefault();
        if ($(this).hasClass("active")) {
            return false;
        } else {
            var current = $(this).index();
            $(".pagination li").removeClass("active");
            $(this).addClass("active");
            $(".loop .carta").hide();

            var gran = limite * current;

            for (var i = gran - limite; i < gran; i++) {
                $(".loop .carta:eq(" + i + ")").show();
            }

            cambiarMes(current);

        }

    });

    $("#siguiente-pag").on("click", function (e) {
        e.preventDefault();
        var current = $(".pagination li.active").index();

        if (current === totalPaginas) {
            return false;
        } else {
            current++;
            $(".pagination li").removeClass('active');
            $(".loop .carta").hide();
            var gran = limite * current;

            for (var i = gran - limite; i < gran; i++) {
                $(".loop .carta:eq(" + i + ")").show();
            }

            $(".pagination li.current-page:eq(" + (current - 1) + ")").addClass('active');

            cambiarMes(current);
        }
    });


    $("#anterior-pag").on("click", function (e) {
        e.preventDefault();
        var current = $(".pagination li.active").index();

        if (current === 1) {
            return false;
        } else {
            current--;
            $(".pagination li").removeClass('active');
            $(".loop .carta").hide();
            var gran = limite * current;

            for (var i = gran - limite; i < gran; i++) {
                $(".loop .carta:eq(" + i + ")").show();
            }

            $(".pagination li.current-page:eq(" + (current - 1) + ")").addClass('active');

            cambiarMes(current);
        }
    });

    /////////////////////////// FECHA FIN Y HORA FIN AUTOMATICO ///////////////////////////

    function finAutomatico() {
        var horaIn = $("#horaInicio").val();
        var split = horaIn.split(':');

        var horaIn = split[0];
        var minIn = split[1];

        var horas = $("#hrsOp").val();

        var res = parseInt(horaIn) + parseInt(horas);

        var fecha = new Date($('#fechaInicio').val());

        if (res >= 24) {
            res = res - 24;
            fecha.setDate(fecha.getDate() + 1);
        }

        var año = fecha.getFullYear();
        var mes = (fecha.getMonth() + 1);
        var dia = (fecha.getDate() + 1);

        if (dia < 10) {
            dia = "0" + dia;
        }

        if (mes < 10) {
            mes = "0" + mes;
        }

        if (res < 10) {
            res = "0" + res;
        }

        $("#fechaFinal").attr("value", año + "-" + mes + "-" + dia);
        $("#horaFinal").attr("value", res + ":" + minIn);
    }

    $("#fechaInicio").change(function () {

        finAutomatico();

    });

    $("#horaInicio").change(function () {

        finAutomatico();

    });

    $("#hrsOp").keyup(function () {

        finAutomatico();

    });

    $("#actualizar").on("click", function () {

        finAutomatico();

    });

    /////////////////////////////// LIMPIAR CAMPOS ///////////////////////////////

    $("#limpiarCampos").click(function () {
        if (confirm('Esta seguro que desea cancelar el registro del servicio?')) {
            $("#lloyd").val('');
            $("#uvi").val('');
            $("#referencia").val('');
            $("#fechaInicio").val('');
            $("#horaInicio").val('');
            $("#hrsOp").val('');
            $("#fechaFinal").val('');
            $("#horaFinal").val('');
        }

    });
});
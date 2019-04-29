<%-- 
    Document   : login
    Created on : 12/04/2019, 01:47:40 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <!-- METAS -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <!-- ICONO VENTANA -->
        <link rel="icon" href="../../IMG/version-para-favicon.png">

        <!-- ESTILOS -->
        <link rel="stylesheet" type="text/css" href="CSS - JS/CSS/estilosLogin.css">
        <link rel="stylesheet" href="../../CSS/animate.css">
        <link rel="stylesheet" type="text/css" href="../../CSS/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

        <!-- SCRIPTS -->
        <script src="../../JS/jquery-3.1.1.min.js"></script>
        <script src="../../JS/bootstrap.min.js"></script>
        <script src="CSS - JS/JS/validacionLogin.js"></script>
        <script src="../../JS/sweetalert.min.js"></script>
        
        <title>SeaPORT R&E</title>
    </head>
    <body>
        <img src="../../IMG/slider-background2.jpg">
        <a href="../../index.jsp"><i id="volver" class="fas fa-arrow-alt-circle-left mt-4 ml-4"></i></a>
        <div class="fondo"></div>
        <div class="contenedor mt-1">
            <div class="logo"><i class="far fa-user"></i></div>
            <h2 class="loginTitulo">Inicio de sesion</h2>
            <form action="" role="form" id="formulario" autocomplete="off">
                <div class="inputUser">
                    <input type="text" placeholder="Usuario" id="user">
                    <i class="fas fa-user"></i>
                </div>
                <div class="inputPass">
                    <input type="password" placeholder="Contraseña" id="pass">
                    <i class="fas fa-unlock-alt"></i>
                </div>

                <button type="button" class="btnIngresar" id="btn_iniciar">Ingresar</button>

            </form>
        </div>
    </body>
</html>

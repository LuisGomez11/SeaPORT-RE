<%-- 
    Document   : index
    Created on : 12/04/2019, 08:37:29 PM
    Author     : User
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
        <link rel="icon" href="IMG/version-para-favicon.png">

        <!-- ESTILOS -->
        <link rel="stylesheet" href="CSS/animate.css">
        <link rel="stylesheet" type="text/css" href="CSS/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <style>
            .contTitulo{
                padding: 30px;
                background-color: rgba(255,255,255,.5);
                width: 55%;
                -webkit-box-shadow: 0px 0px 19px 12px rgba(0,0,0,0.69);
                -moz-box-shadow: 0px 0px 19px 12px rgba(0,0,0,0.69);
                box-shadow: 0px 0px 19px 12px rgba(0,0,0,0.69);
            }
            
            .contTitulo h2{
                letter-spacing: 2px;
            }
        </style>

        <!-- SCRIPTS -->
        <script src="JS/jquery-3.1.1.min.js"></script>
        <script src="JS/bootstrap.min.js"></script>
        <script src="JS/sweetalert.min.js"></script>

        <title>SeaPORT R&E</title>
    </head>
    <body>
        <img style="width: 100%; height: 100%; position: absolute; z-index: -100;"
             src="IMG/slider-background2.jpg">
        <nav class="navbar navbar-expand-sm bg-info navbar-dark">
            <!-- Brand/logo -->
            <a class="navbar-brand" href="index.jsp">
                <img src="IMG/logo-barra-de-navegacion.png" width="55" height="60">
            </a>

            <!-- Links -->
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="Vistas/Analista/Login.jsp">Analista</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Vistas/Seleccionador/Login.jsp">Seleccionador</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Vistas/Visualizador/Login.jsp">Visualizador</a>
                </li>
            </ul>
        </nav>

        <div class="contTitulo mt-5 ml-5">
            <h1>SeaPORT R&E</h1><br>
            <h4>Aplicación web para la administración de petición y ejecución de servicios en la SPRC</h4>
        </div>
    </body>
</html>

<%-- 
    Document   : Modificar
    Created on : 29/04/2019, 12:42:59 PM
    Author     : Luis Alberto Gomez
--%>

<%@page import="Config.OpcionesEntidades"%>
<%@page import="Modelos.Entidades"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- METAS -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximun-scale=1.0, minimun-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <!-- ICONO VENTANA -->
        <link rel="icon" href="../../../../IMG/version-para-favicon.png">

        <!-- ESTILOS -->
        <link rel="stylesheet" href="../../../../CSS/animate.css">
        <link rel="stylesheet" type="text/css" href="../../../../CSS/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../../CSS - JS/CSS/styles.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

        <!-- SCRIPTS -->
        <script src="../../../../JS/jquery-3.1.1.min.js"></script>
        <script src="../../../../JS/bootstrap.min.js"></script>
        <script src="../../../../JS/sweetalert.min.js"></script>
        <script src="../../CSS - JS/JS/app.js"></script>

        <title>SeaPORT R&E</title>
    </head>
    <body>
        <img src="../../../../IMG/slider-background2.jpg">
        <%
        
            int id = Integer.parseInt(request.getParameter("id"));
            
            Entidades en = OpcionesEntidades.mostrarEntidad(id);

        %>
        <div class="formOpcio container p-5">
            <form method="POST" autocomplete="off" action="../../../../ControlEntidad?opc=mod">
                <h1 class="text-center">Modificar entidad fisica</h1><hr>
                <div class="row">
                    <div class="form-group col-md-3">
                        <label for="id">ID</label>
                        <input type="text" class="form-control" value="<%= id%>" id="id" name="id" readonly>
                    </div>
                    <div class="form-group col-md-5">
                        <label for="nombre">Nombre</label>
                        <input type="text" class="form-control" value="<%= en.getNombre()%>" id="nombre" name="nombre" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="tipo">Tipo de entidad</label>
                        <select class="form-control" name="tipo">
                            <option><%= en.getTipo() %></option>
                            <option>Motonave</option>
                            <option>Grua</option>
                            <option>Camion</option>
                        </select>
                    </div>
                </div>
                <div class="botones1">
                    <a href="../../Entidades.jsp" class="btn btn-danger">CANCELAR</a>
                    <input type="submit" value="MODIFICAR" class="btn btn-primary ml-2" id="modificar">
                </div>
            </form>
        </div>
    </body>
</html>

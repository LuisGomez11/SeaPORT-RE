<%-- 
    Document   : Modificar
    Created on : 11/04/2019, 02:10:30 PM
    Author     : E201
--%>

<%@page import="Clases.ConexionBD"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <!-- METAS -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximun-scale=1.0, minimun-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <!-- ICONO VENTANA -->
        <link rel="icon" href="../../IMG/version-para-favicon.png">

        <!-- ESTILOS -->
        <link rel="stylesheet" href="../../CSS/animate.css">
        <link rel="stylesheet" type="text/css" href="../../CSS/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="CSS/estilos1.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

        <!-- SCRIPTS -->
        <script src="../../JS/jquery-3.1.1.min.js"></script>
        <script src="../../JS/bootstrap.min.js"></script>
        <script src="../../JS/sweetalert.min.js"></script>
        <script src="JS/appMenu.js"></script>

        <title>SeaPORT R&E</title>
    </head>
    <body>
        <!-- ////////////////////////////BARRA SUPERIOR//////////////////////////// -->
        <nav id="navMod">
            <div id="empresa">
                <h1>SPRC</h1>
            </div>
            <div id="titulo">
                <h4 class="ml-4">Modificar servicio</h4>
            </div>
        </nav>
        <!-- ////////////////////////////BARRA SUPERIOR//////////////////////////// -->
        <br><br><br><br><br>
        <%

            Connection connect = ConexionBD.connect();
            int cod = Integer.parseInt(request.getParameter("cod"));
            PreparedStatement ps = connect.prepareStatement("select * from proveedores where codProveedor=" + cod);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

        %>
        <div class="container">
            <form autocomplete="off" method="POST" action="../../ControlProveedores?opc=mod">
                <div class="row">
                    <div class="form-group col-12">
                        <label for="nombre">Codigo del proveedor</label>
                        <input type="text" class="form-control" name="cod" value="<%= cod%>" readonly>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="form-group col-12">
                        <label for="nombre">Nombre</label>
                        <input type="text" class="form-control" name="nombre" value="<%= rs.getString("nombre")%>" required>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="form-group col-6">
                        <label for="telefono">Telefono</label>
                        <input type="number" class="form-control" name="telefono" value="<%= rs.getString("telefono")%>" required>
                    </div>
                    <div class="form-group col-6">
                        <label for="movil">Movil</label>
                        <input type="number" class="form-control" name="movil" value="<%= rs.getString("movil")%>" required>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="form-group col-12">
                        <label for="correo">Correo electronico</label>
                        <input type="email" class="form-control" name="correo" value="<%= rs.getString("correo")%>" required>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="form-group col-6">
                        <label for="nit">NIT del proveedor</label>
                        <input type="text" class="form-control" name="nit" value="<%= rs.getString("nit")%>" required>
                    </div>
                    <div class="form-group col-6">
                        <label for="cantTra">Cantidad de trabajadores</label>
                        <input type="number" class="form-control" name="cantTra" value="<%= rs.getString("cantTra")%>" required>
                    </div>
                </div>
                <br>
                <div style="float: right; width:35%;">
                    <a href="menuSeleccionador.jsp" style="float: right; margin-left: 10px;" class="btn btn-danger">CANCELAR</a>
                    <input style="float: right;" type="submit" value="MODIFICAR" class="btn btn-primary">
                </div>
            </form>
        </div>
        <%}%>
    </body>
</html>

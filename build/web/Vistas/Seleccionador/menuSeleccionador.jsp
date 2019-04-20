<%-- 
    Document   : menuSeleccionador
    Created on : 4/04/2019, 03:15:55 PM
    Author     : E201
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Clases.ConexionBD"%>
<%@page import="java.sql.Connection"%>
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
        <%
            if (request.getParameter("val") != null) {
                if (request.getParameter("val").equals("correcto")) {
                    out.print("<script>swal('Correcto!', 'El proveedor fue registrado satisfactoriamente, lo puede consultar en la sección de consultar proveedor', 'success').then((value) => {window.location = 'menuSeleccionador.jsp';});</script>");
                } else {
                    out.print("<script>swal('Error!', 'Ya hay un proveedor registrado con ese NIT', 'error').then((value) => {window.location = 'menuSeleccionador.jsp';});</script>");
                }
            }

            if (request.getParameter("valMod") != null) {
                if (request.getParameter("valMod").equals("correcto")) {
                    out.print("<script>swal('Correcto!', 'El proveedor fue modificado correctamente', 'success').then((value) => {window.location = 'menuSeleccionador.jsp';});</script>");
                } else {
                    out.print("<script>swal('Error!', 'Error al modificar el proveedor', 'error').then((value) => {window.location = 'menuSeleccionador.jsp';});</script>");
                }
            }
            if (request.getParameter("valEli") != null) {
                out.print("<script>swal('Correcto!', 'El proveedor fue eliminado de la base de datos correctamente', 'success').then((value) => {window.location = 'menuSeleccionador.jsp';});</script>");
            }
        %>
        <!-- ////////////////////////////BARRA SUPERIOR//////////////////////////// -->
        <nav id="navPri">
            <div id="empresa">
                <h1>SPRC</h1>
            </div>
            <div id="titulo">
                <h4 class="ml-4">Bienvenido al menu del seleccionador</h4>
            </div>
            <div id="cerrar">
                <i data-toggle="modal" data-target="#myModal" class="icono fas fa-power-off"></i>
            </div>
        </nav>
        <!-- ////////////////////////////BARRA SUPERIOR//////////////////////////// -->

        <!-- ////////////////////////////MODAL DE CONFIRMACIÓN//////////////////////////// -->
        <div class="modal fade" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Confirmación</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        Esta seguro que desea cerrar sesión?
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">

                        <a class="btn btn-primary" href="../../index.jsp">Confirmar</a>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>

                    </div>

                </div>
            </div>
        </div>
        <!--//////////////////////////// MODAL DE CONFIRMACIÓN //////////////////////////// -->

        <!-- ////////////////////////////MENU LATERAL//////////////////////////// -->

        <div class="contenedor-menu">
            <ul class="menu">
                <li><a href="#" class="activado" id="inicio"><i class="fas fa-home"></i><span>Inicio</span></a></li>
                <li><a href="#" class="" id="primera"><i class="fas fa-plus-circle"></i><span>Agregar proveedores</span></a></li>
                <li><a href="#" class="" id="segunda"><i class="fas fa-search"></i><span>Consultar proveedor</span></a></li>
            </ul>
        </div>
        <!-- ////////////////////////////MENU LATERAL//////////////////////////// -->

        <a href="#" class="btn-menu">Menu <i class="icon fas fa-bars"></i></a>

        <!-- ////////////////////////////INICIO//////////////////////////// -->
        <div class="contenedor-inicio">
            <h3>Inicio</h3>
            <hr>
        </div>
        <!-- ////////////////////////////INICIO//////////////////////////// -->

        <!-- ////////////////////////////REGISTRAR PROVEEDOR//////////////////////////// -->
        <div class="contenedor-regProveedor">
            <h3>Ingresar datos del proveedor</h3>
            <hr>
            <br><br>
            <form autocomplete="off" method="POST" action="../../ControlProveedores?opc=agregar">
                <div class="row">
                    <div class="form-group col-12">
                        <label for="nombre">Nombre</label>
                        <input type="text" class="form-control" name="nombre" required>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="form-group col-6">
                        <label for="telefono">Telefono</label>
                        <input type="number" class="form-control" name="telefono" required>
                    </div>
                    <div class="form-group col-6">
                        <label for="movil">Movil</label>
                        <input type="number" class="form-control" name="movil" required>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="form-group col-12">
                        <label for="correo">Correo electronico</label>
                        <input type="email" class="form-control" name="correo" required>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="form-group col-6">
                        <label for="nit">NIT del proveedor</label>
                        <input type="text" class="form-control" name="nit" required>
                    </div>
                    <div class="form-group col-6">
                        <label for="cantTra">Cantidad de trabajadores</label>
                        <input type="number" class="form-control" name="cantTra" required>
                    </div>
                </div>
                <br>
                <div style="float: right; width:35%;">
                    <button type="button" style="float: right; margin-left: 10px;" class="btn btn-danger">CANCELAR</button>
                    <input style="float: right;" type="submit" value="REGISTRAR" class="btn btn-primary">
                </div>
            </form>
        </div>
        <!-- ////////////////////////////REGISTRAR PROVEEDOR//////////////////////////// -->

        <!-- ////////////////////////////CONSULTAR PROVEEDOR//////////////////////////// -->
        <div class="contenedor-conProveedor">
            <h3>Consultar datos de los proveedores</h3>
            <hr>
            <div class="table-responsive mr-3" style="height: 500px;">
                <table class="table table-bordered" style="width: 1500px;">
                    <thead>
                        <tr>
                            <th>NOMBRE</th>
                            <th>TELEFONO</th>
                            <th>MOVIL</th>
                            <th>CORREO ELECTRONICO</th>
                            <th>NIT</th>
                            <th>CANTIDAD DE TRABAJADORES</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Connection connect = ConexionBD.connect();
                            PreparedStatement ps = connect.prepareStatement("select * from proveedores");
                            ResultSet rs = ps.executeQuery();

                            while (rs.next()) {

                        %>
                        <tr>
                            <td><%= rs.getString("nombre")%></td>
                            <td><%= rs.getString("telefono")%></td>
                            <td><%= rs.getString("movil")%></td>
                            <td><%= rs.getString("correo")%></td>
                            <td><%= rs.getString("nit")%></td>
                            <td><%= rs.getInt("cantTra")%></td>
                            <td>
                                <a href="Modificar.jsp?cod=<%= rs.getString("codProveedor")%>" class="btn btn-warning">MODIFICAR</a>
                                <a href="Eliminar.jsp?cod=<%= rs.getString("codProveedor")%>" class="btn btn-danger">ELIMINAR</a>
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- ////////////////////////////CONSULTAR PROVEEDOR//////////////////////////// -->

    </body>
</html>
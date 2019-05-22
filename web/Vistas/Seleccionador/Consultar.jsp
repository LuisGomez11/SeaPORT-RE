<%-- 
    Document   : Consultar
    Created on : 20/05/2019, 05:40:37 PM
    Author     : User
--%>

<%@page import="java.util.List"%>
<%@page import="Config.OpcionesProveedor"%>
<%@page import="Modelos.Proveedores"%>
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
        <script src="JS/app1.js"></script>
        
        <title>SeaPORT R&E</title>
    </head>
    <body>
        
        <%
        
            List<Proveedores> lista = OpcionesProveedor.listar();
            
            //MENSAJES DE ALERTA
            if (request.getParameter("val") != null) {
                if (request.getParameter("val").equals("correcto")) {
                    out.print("<script>swal('Correcto!', 'El proveedor fue registrado correctamente', 'success').then((value) => {window.location = 'Consultar.jsp';});</script>");
                }
            }
            if (request.getParameter("valMod") != null) {
                if (request.getParameter("valMod").equals("correcto")) {
                    out.print("<script>swal('Correcto!', 'El proveedor fue modificado correctamente', 'success').then((value) => {window.location = 'Consultar.jsp';});</script>");
                }
            }
            if (request.getParameter("valEli") != null) {
                if (request.getParameter("valEli").equals("correcto")) {
                    out.print("<script>swal('Correcto!', 'El proveedor fue eliminado correctamente', 'success').then((value) => {window.location = 'Consultar.jsp';});</script>");
                }
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
                <li><a href="Registrar.jsp" class="" id="primera"><i class="fas fa-plus-circle"></i><span>Agregar proveedores</span></a></li>
                <li><a href="#" class="activado" id="segunda"><i class="fas fa-search"></i><span>Consultar proveedor</span></a></li>
            </ul>
        </div>
        <!-- ////////////////////////////MENU LATERAL//////////////////////////// -->

        <a href="#" class="btn-menu">Menu <i class="icon fas fa-bars"></i></a>

        <!-- ////////////////////////////CONSULTAR PROVEEDOR//////////////////////////// -->
        <div class="contenedor-conProveedor">
            <h3>Consultar datos de los proveedores</h3>
            <hr>
            <div class="row w-100 h-auto">

                <%                    
                    for (Proveedores dato : lista) {
                %>

                <div class="col-lg-4 my-2" id="carPro">
                    <div class="card border-primary">
                        <div class="card-header text-center"><%= dato.getNombre() %></div>
                        <div class="card-body" id="bodyCard">
                            <strong>Codigo: </strong><label class="ml-2"><%= dato.getId() %></label><br>
                            <strong>Telefono: </strong><label class="ml-2"><%= dato.getTelefono() %></label><br>
                            <strong>Movil: </strong><label class="ml-2"><%= dato.getMovil() %></label><br>
                            <strong>Correo: </strong><label class="ml-2"><%= dato.getCorreo() %></label><br>
                            <strong>NIT: </strong><label class="ml-2"><%= dato.getNit() %></label><br>
                            <strong>Cant. de trab. disponibles: </strong><label class="ml-1"><%= dato.getCantTra() %></label><br>
                        </div>
                        <div class="card-footer">
                            <div class=" text-center">
                                <a href="Modificar.jsp?cod=<%= dato.getId() %>" class="btn btn-outline-warning" style="width: 48%;">MODIFICAR</a>
                                <a href="Eliminar.jsp?cod=<%= dato.getId()%>" class="btn btn-outline-danger" style="width: 48%;">ELIMINAR</a>
                            </div>
                        </div>
                    </div>
                </div>
                <%  }  %>
            </div>
        </div>
        <!-- ////////////////////////////CONSULTAR PROVEEDOR//////////////////////////// -->
    </body>
</html>

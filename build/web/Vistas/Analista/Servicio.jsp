<%-- 
    Document   : Servicio
    Created on : 28/04/2019, 08:28:54 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="Config.OpcionesServicios"%>
<%@page import="Modelos.Servicios"%>
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
        <link rel="icon" href="../../IMG/version-para-favicon.png">

        <!-- ESTILOS -->
        <link rel="stylesheet" href="../../CSS/animate.css">
        <link rel="stylesheet" type="text/css" href="../../CSS/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="CSS - JS/CSS/estilos.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

        <!-- SCRIPTS -->
        <script src="../../JS/jquery-3.1.1.min.js"></script>
        <script src="../../JS/bootstrap.min.js"></script>
        <script src="../../JS/sweetalert.min.js"></script>
        <script src="../../JS/chart.js"></script>
        <script src="CSS - JS/JS/appMenu.js"></script>

        <title>SeaPORT R&E</title>
    </head>
    <body>
        
        <%
        
            List<Servicios> listaSer = OpcionesServicios.listar();
            
            if (request.getParameter("valSer") != null) {
                if (request.getParameter("valSer").equals("correcto")) {
                    out.print("<script>swal('Correcto!', 'El servicio fue registrado correctamente', 'success').then((value) => {window.location = 'Servicio.jsp';});</script>");
                } else {
                    out.print("<script>swal('Error!', 'Ya hay un servicio registrado con ese nombre', 'error').then((value) => {window.location = 'Servicio.jsp';});</script>");
                }
            }
            
            if (request.getParameter("valEli") != null) {
                out.print("<script>swal('Correcto!', 'El servicio fue eliminado de la base de datos correctamente', 'success').then((value) => {window.location = 'Servicio.jsp';});</script>");
            }
        
        %>
        
        <!-- ////////////////////////////BARRA SUPERIOR//////////////////////////// -->
        <nav id="navPri">
            <div id="empresa">
                <h1>SPRC</h1>
            </div>
            <div id="titulo">
                <h4 class="ml-4">Bienvenido al menu del analista</h4>
            </div>
            <div id="cerrar">
                <i data-toggle="modal" data-target="#myModal" class="icono fas fa-sign-out-alt"></i>
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
                <li><a href="Inicio.jsp" class="" id="inicio"><i class="fas fa-home"></i><span>Inicio</span></a></li>
                <li><a href="#" class="activado" id="primera"><i class="fas fa-plus-circle"></i><span>Agregar servicio</span></a></li>
                <li><a href="Entidades.jsp" class="" id="segunda"><i class="fas fa-truck"></i><span>Entidades fisicas</span></a></li>
                <li><a href="Generar.jsp" class="" id="tercera"><i class="fas fa-folder-plus"></i><span>Generar servicio</span></a></li>
                <li><a href="Generados.jsp" class="" id="cuarta"><i class="fas fa-clipboard"></i><span>Servicios generados</span></a></li>
                <li><a href="Asignados.jsp" class="" id="quinta"><i class="fas fa-clipboard-check"></i><span>Servicios asignados</span></a></li>
                <li><a href="Informes.jsp" class="" id="sexta"><i class="fas fa-calendar-alt"></i><span>Informes</span></a></li>
                <li><a href="Datos.jsp" class="" id="septima"><i class="fas fa-chart-pie"></i><span>Datos estadisticos</span></a></li>
            </ul>
        </div>
        <!-- ////////////////////////////MENU LATERAL//////////////////////////// -->

        <a href="" class="btn-menu">Menu <i class="icon fas fa-bars"></i></a>
        
        <!-- ////////////////////////////AGREGAR SERVICIO//////////////////////////// -->
        <div class="contenedor-agServicio">
            <h3>Agregar servicio</h3>
            <hr>
            <br>
            <form method="POST" autocomplete="off" action="../../ControlServ?opc=agregar">
                <div class="row">
                    <div class="col-lg-5 mb-5">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" name="nombre" class="form-control" required>
                        </div>
                        <br>
                        <div class="botones">
                            <input type="submit" value="REGISTRAR" class="btn btn-outline-primary" id="registrar">
                            <button type="button" class="btn btn-outline-danger ml-2" id="limpiarCampos">CANCELAR</button>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <table class="table table-bordered">
                            <thead>
                                <tr><th colspan="2">LISTADO DE SERVICIOS</th></tr>
                                <tr>
                                    <th>NOMBRE</th>
                                    <th>ACCIONES</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Servicios dato : listaSer) {

                                %>
                                <tr>
                                    <td><%= dato.getNombre()%></td>
                                    <td>
                                        <a href="Opciones/Servicio/Modificar.jsp?nom=<%= dato.getNombre()%>" class="btn btn-outline-warning mb-1">MODIFICAR</a>
                                        <a href="Opciones/Servicio/Eliminar.jsp?nom=<%= dato.getNombre()%>" class="btn btn-outline-danger">ELIMINAR</a>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </form>
        </div>
        <!-- ////////////////////////////AGREGAR SERVICIO//////////////////////////// -->
    </body>
</html>

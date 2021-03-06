<%-- 
    Document   : Entidades
    Created on : 28/04/2019, 08:47:25 PM
    Author     : Luis ALberto Gomez
--%>

<%@page import="Config.OpcionesAsignados"%>
<%@page import="Modelos.serAsignados"%>
<%@page import="Config.OpcionesGenerados"%>
<%@page import="Modelos.serGenerados"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
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
        <link rel="icon" href="../../IMG/version-para-favicon.png">

        <!-- ESTILOS -->
        <link rel="stylesheet" href="../../CSS/animate.css">
        <link rel="stylesheet" type="text/css" href="../../CSS/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="CSS - JS/CSS/styles.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

        <!-- SCRIPTS -->
        <script src="../../JS/jquery-3.1.1.min.js"></script>
        <script src="../../JS/bootstrap.min.js"></script>
        <script src="../../JS/sweetalert.min.js"></script>
        <script src="../../JS/chart.js"></script>
        <script src="CSS - JS/JS/app.js"></script>
        
        <title>SeaPORT R&E</title>
    </head>
    <body>

        <%

            //LISTAS            
            List<serGenerados> listaGen = OpcionesGenerados.listar();
            List<serAsignados> listaAsi = OpcionesAsignados.listar();
            List<Entidades> listaEn = OpcionesEntidades.listar();

            if (request.getParameter("val") != null) {
                if (request.getParameter("val").equals("correcto")) {
                    out.print("<script>swal('Correcto!', 'La entidad fisica fue registrada correctamente', 'success').then((value) => {window.location = 'Entidades.jsp';});</script>");
                } else {
                    out.print("<script>swal('Error!', 'Error al registrar la entidad', 'error').then((value) => {window.location = 'Entidades.jsp';});</script>");
                }
            }

            if (request.getParameter("valEli") != null) {
                out.print("<script>swal('Correcto!', 'La entidad fue eliminada de la base de datos correctamente', 'success').then((value) => {window.location = 'Entidades.jsp';});</script>");
            }

            if (request.getParameter("valMod") != null) {
                out.print("<script>swal('Correcto!', 'La entidad fue modificada correctamente', 'success').then((value) => {window.location = 'Entidades.jsp';});</script>");
            }

            OpcionesAsignados.estado(listaGen, listaAsi);

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
                <li><a href="Servicio.jsp" class="" id="primera"><i class="fas fa-plus-circle"></i><span>Agregar servicio</span></a></li>
                <li><a href="#" class="activado" id="segunda"><i class="fas fa-truck"></i><span>Entidades fisicas</span></a></li>
                <li><a href="Generar.jsp" class="" id="tercera"><i class="fas fa-folder-plus"></i><span>Generar servicio</span></a></li>
                <li><a href="Generados.jsp" class="" id="cuarta"><i class="fas fa-clipboard"></i><span>Servicios generados</span></a></li>
                <li><a href="Asignados.jsp" class="" id="quinta"><i class="fas fa-clipboard-check"></i><span>Servicios asignados</span></a></li>
                <li><a href="Informes.jsp" class="" id="sexta"><i class="fas fa-calendar-alt"></i><span>Informes</span></a></li>
                <li><a href="Datos.jsp" class="" id="septima"><i class="fas fa-chart-pie"></i><span>Datos estadisticos</span></a></li>
                <li><a href="Proveedores.jsp" class="" id="octava"><i class="fas fa-address-book"></i><span>Consultar proveedores</span></a></li>
            </ul>
        </div>
        <!-- ////////////////////////////MENU LATERAL//////////////////////////// -->

        <a href="" class="btn-menu">Menu <i class="icon fas fa-bars"></i></a>

        <!-- ////////////////////////////ENTIDAD FISICA//////////////////////////// -->
        <div class="contenedor-enFisica">
            <h3>Entidades fisicas</h3>
            <hr>
            <br>
            <form method="POST" autocomplete="off" action="../../ControlEntidad?opc=agregar">
                <div class="row">
                    <div class="form-group col-6">
                        <label for="nombre">Nombre</label>
                        <input type="text" name="nombre" class="form-control" required>
                    </div>
                    <div class="form-group col-6">
                        <label for="tipo">Tipo de entidad</label>
                        <select class="form-control" name="tipo">
                            <option>Motonave</option>
                            <option>Grua</option>
                            <option>Camion</option>
                        </select>
                    </div>
                </div>
                <div class="botones">
                    <input type="submit" value="REGISTRAR" class="btn btn-outline-primary" id="registrar">
                    <button type="button" class="btn btn-outline-danger ml-2" id="limpiarCampos">CANCELAR</button>
                </div>
                
            </form>
            <br><br><br>
            <hr><br>
            <div class="input-group mb-3 w-50 float-right">
                    <input type="text" class="form-control" placeholder="Ingrese la informacion">
                    <div class="input-group-append">
                        <input class="btn btn-outline-primary" type="submit" value="BUSCAR">
                    </div>
                </div>
            <table class="table table-bordered">
                <thead>
                    <tr><th colspan="4">LISTADO DE ENTIDADES FISICAS</th></tr>
                    <tr>
                        <th>ID</th>
                        <th>NOMBRE</th>
                        <th>TIPO DE ENTIDAD</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
                <tbody>
                    <%                        
                        for (Entidades dato : listaEn) {
                    %>
                    <tr>
                        <td><%= dato.getId_entidad()%></td>
                        <td><%= dato.getNombre()%></td>
                        <td><%= dato.getTipo()%></td>
                        <td>
                            <a href="Opciones/Entidades/Modificar.jsp?id=<%= dato.getId_entidad()%>" class="btn btn-outline-warning">MODIFICAR</a>
                            <a href="Opciones/Entidades/Eliminar.jsp?id=<%= dato.getId_entidad()%>" class="btn btn-outline-danger">ELIMINAR</a>
                        </td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </div>
        <!-- ////////////////////////////ENTIDAD FISICA//////////////////////////// -->
    </body>
</html>

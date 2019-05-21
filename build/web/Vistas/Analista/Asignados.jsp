<%-- 
    Document   : Asignados
    Created on : 28/04/2019, 09:10:20 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="Modelos.serGenerados"%>
<%@page import="Config.OpcionesGenerados"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Config.OpcionesAsignados"%>
<%@page import="Modelos.serAsignados"%>
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
            List<serAsignados> listaAsi = OpcionesAsignados.listar();
            List<serGenerados> listaGen = OpcionesGenerados.listar();
            
            //NUMERO DE SERVICIOS ASIGNADOS
            int numAsignaciones = OpcionesAsignados.numAsignados();
            
            //MENSAJES DE ALERTA
            if (request.getParameter("valAsi") != null) {
                out.print("<script>swal('Correcto!', 'El servicio fue asignado correctamente', 'success').then((value) => {window.location = 'Asignados.jsp';});</script>");
            }
            
            if (request.getParameter("valEli") != null) {
                out.print("<script>swal('Correcto!', 'El servicio asignado fue eliminado de la base de datos correctamente', 'success').then((value) => {window.location = 'Asignados.jsp';});</script>");
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
                <li><a href="Entidades.jsp" class="" id="segunda"><i class="fas fa-truck"></i><span>Entidades fisicas</span></a></li>
                <li><a href="Generar.jsp" class="" id="tercera"><i class="fas fa-folder-plus"></i><span>Generar servicio</span></a></li>
                <li><a href="Generados.jsp" class="" id="cuarta"><i class="fas fa-clipboard"></i><span>Servicios generados</span></a></li>
                <li><a href="#" class="activado" id="quinta"><i class="fas fa-clipboard-check"></i><span>Servicios asignados</span></a></li>
                <li><a href="Informes.jsp" class="" id="sexta"><i class="fas fa-calendar-alt"></i><span>Informes</span></a></li>
                <li><a href="Datos.jsp" class="" id="septima"><i class="fas fa-chart-pie"></i><span>Datos estadisticos</span></a></li>
                <li><a href="Proveedores.jsp" class="" id="octava"><i class="fas fa-address-book"></i><span>Consultar proveedores</span></a></li>
            </ul>
        </div>
        <!-- ////////////////////////////MENU LATERAL//////////////////////////// -->

        <a href="" class="btn-menu">Menu <i class="icon fas fa-bars"></i></a>
        
        <!-- ////////////////////////////SERVICIOS ASIGNADOS//////////////////////////// -->
        <div class="contenedor-serAsignados">
            <div class="d-flex row">
                <h3 class="col-6">Servicios asignados</h3>
                <div class="col-6" style="text-align: end">
                    <a href="#" class="btn btn-link">Todos</a>
                    <a href="#" class="btn btn-link">En espera</a>
                    <a href="#" class="btn btn-link">En proceso</a>
                    <a href="#" class="btn btn-link">Finalizados</a>
                </div>
            </div>
            <hr>
            <%
                if (numAsignaciones == 0) {
            %>
            <h3>No hay servicios asignados.</h3>
            <%
            } else {

                String ref = "";
                int pri = 1;

            %>

            <div class="row w-100 h-auto">

                <%                    
                    for (serAsignados dato : listaAsi) {

                        if (pri == 1) {
                            ref = dato.getReferencia();
                            pri++;
                        }

                        if (!ref.equalsIgnoreCase(dato.getReferencia())) {
                            ref = dato.getReferencia();
                %>

            </div>
            <br><hr><br>
            <div class="row w-100 h-auto" id="conAsi">    

                <%
                    }
                %>
                <div class="col-lg-4 my-2"  id="carAsi">
                    <div class="card border-primary">
                        <div class="card-header text-center"><%= dato.getLloyd() + " // " + dato.getUvi() + " - " + dato.getReferencia()%></div>
                        <div class="card-body" id="bodyCard">

                            <strong>Terminal: </strong><label class="ml-2"><%= dato.getTerminal()%></label><br>
                            <strong>Motonave: </strong><label class="ml-1"><%= dato.getMotonave()%></label><br>
                            <strong>Muelle: </strong><label class="ml-2"><%= dato.getMuelle()%></label><br>
                            <strong>Grúa(s): </strong><label class="ml-2"><%= dato.getGrua()%></label><br>
                            <strong>Fecha de cita: </strong><label class="ml-2"><%= dato.getFechaCita()%></label><br>
                            <strong>Hora de cita: </strong><label class="ml-2"><%= dato.getHoraCita()%></label><br>
                            <strong>Hrs. en operacion: </strong><label class="ml-2"><%= dato.getHrsOpe()%></label><br>
                            <strong>Fecha final: </strong><label class="ml-2"><%= dato.getFechaFinal()%></label><br>
                            <strong>Hora final: </strong><label class="ml-2"><%= dato.getHoraFinal()%></label><br>
                            <strong>Servicio: </strong><label class="ml-2"><%= dato.getServicio()%></label><br>
                            <strong>Proveedor: </strong><label class="ml-2"><%= dato.getProveedor()%></label><br>
                            <strong>Cantidad de trabajadores: </strong><label class="ml-2"><%= dato.getCantidad()%></label><br>
                            <strong>Observaciones: </strong><label class="ml-2"><%= dato.getObservaciones()%></label><br>
                            <strong>Hrs. totales: </strong><label class="ml-2"><%= dato.getHorasTotales()%></label>
                        </div>
                        <div class="card-footer">
                            <center>
                                <%
                                    String estado = dato.getEstado();
                                    String tipo = "";
                                    String desactivar = "";
                                    if (estado.equalsIgnoreCase("En espera")) {
                                        tipo = "info";
                                        desactivar = "";
                                    } else if (estado.equalsIgnoreCase("En progreso")) {
                                        tipo = "warning";
                                        desactivar = "disabled";
                                    } else if (estado.equalsIgnoreCase("Finalizado")) {
                                        tipo = "success";
                                        desactivar = "";
                                    }
                                %>
                                <span class="badge badge-pill badge-<%= tipo%>"><%= estado%></span>
                                <hr>
                                <a href="Opciones/Asignados/Eliminar.jsp?ref=<%= dato.getReferencia()%>" class="btn btn-outline-danger btn-block  <%= desactivar%>">ELIMINAR</a>
                            </center>
                        </div>
                    </div>
                </div>
                <%}
                    }%>
            </div>
        </div>
        <!-- ////////////////////////////SERVICIOS ASIGNADOS//////////////////////////// -->
    </body>
</html>

<%-- 
    Document   : Informes
    Created on : 28/04/2019, 09:17:27 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Config.OpcionesGenerados"%>
<%@page import="Modelos.serGenerados"%>
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
        <link rel="stylesheet" type="text/css" href="CSS - JS/CSS/estilos.css">
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
            List<serAsignados> listaInfo = OpcionesAsignados.listarInforme();
            List<serGenerados> listaGen = OpcionesGenerados.listar();
            List<serAsignados> listaAsi = OpcionesAsignados.listar();

            String ref1 = "",ref2 = "",ref3 = "",ref4 = "",ref5 = "",ref6 = "",
                ref7 = "",ref8 = "",ref9 = "",ref10 = "",ref11 = "",ref12 = "";
            
            int pri1 = 1,pri2 = 1,pri3 = 1,pri4 = 1,pri5 = 1,pri6 = 1,pri7 = 1,
                pri8 = 1,pri9 = 1,pri10 = 1,pri11 = 1,pri12 = 1;
            
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
                <li><a href="Asignados.jsp" class="" id="quinta"><i class="fas fa-clipboard-check"></i><span>Servicios asignados</span></a></li>
                <li><a href="#" class="activado" id="sexta"><i class="fas fa-calendar-alt"></i><span>Informes</span></a></li>
                <li><a href="Datos.jsp" class="" id="septima"><i class="fas fa-chart-pie"></i><span>Datos estadisticos</span></a></li>
                <li><a href="Proveedores.jsp" class="" id="octava"><i class="fas fa-address-book"></i><span>Consultar proveedores</span></a></li>
            </ul>
        </div>
        <!-- ////////////////////////////MENU LATERAL//////////////////////////// -->

        <a href="" class="btn-menu">Menu <i class="icon fas fa-bars"></i></a>

        <!-- ////////////////////////////INFORMES//////////////////////////// -->
        <div class="contenedor-informes">
            <div class="flex row">
                <div class="col-lg-6">
                    <h3 id="tituloInfo">Informes - Mes de enero</h3>
                </div>
                <div class="col-lg-6">
                    <ul class="pagination">
                        <li id="anterior-pag" class="page-item"><a class="page-link" href="#"><span aria-hidden="true">&laquo;</span></a></li>
                    </ul>
                </div>
            </div>
            <hr>
            
            <div class="loop">
                <div class="carta w-100 h-auto">
                    <div class="row w-100 h-auto">
                        <%                        for (serAsignados dato : listaInfo) {

                                String fecha = dato.getFechaCita();

                                String[] splits = fecha.split("-");

                                if (splits[1].equalsIgnoreCase("01")) {
                                    if (pri1 == 1) {
                                        ref1 = dato.getReferencia();
                                        pri1++;
                                    }

                                    if (!ref1.equalsIgnoreCase(dato.getReferencia())) {
                                        ref1 = dato.getReferencia();
                        %>

                    </div>
                    <br><hr><br>
                    <div class="row w-100 h-auto">    

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

                            </div>
                        </div>
                        <% }
                        } %>
                    </div>
                </div>
                <div class="carta w-100 h-auto">
                    <div class="row w-100 h-auto">
                        <%
                            for (serAsignados dato : listaInfo) {

                                String fecha = dato.getFechaCita();

                                String[] splits = fecha.split("-");

                                if (splits[1].equalsIgnoreCase("02")) {
                                    if (pri2 == 1) {
                                        ref2 = dato.getReferencia();
                                        pri2++;
                                    }

                                    if (!ref2.equalsIgnoreCase(dato.getReferencia())) {
                                        ref2 = dato.getReferencia();
                        %>

                    </div>
                    <br><hr><br>
                    <div class="row w-100 h-auto">    

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

                            </div>
                        </div>
                        <% }
                        } %>
                    </div>
                </div>
                <div class="carta w-100 h-auto">
                    <div class="row w-100 h-auto">
                        <%
                            for (serAsignados dato : listaInfo) {

                                String fecha = dato.getFechaCita();

                                String[] splits = fecha.split("-");

                                if (splits[1].equalsIgnoreCase("03")) {
                                    if (pri3 == 1) {
                                        ref3 = dato.getReferencia();
                                        pri3++;
                                    }

                                    if (!ref3.equalsIgnoreCase(dato.getReferencia())) {
                                        ref3 = dato.getReferencia();
                        %>

                    </div>
                    <br><hr><br>
                    <div class="row w-100 h-auto">    

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

                            </div>
                        </div>
                        <% }
                        } %>
                    </div>
                </div>
                <div class="carta w-100 h-auto">
                    <div class="row w-100 h-auto">
                        <%
                            for (serAsignados dato : listaInfo) {

                                String fecha = dato.getFechaCita();

                                String[] splits = fecha.split("-");

                                if (splits[1].equalsIgnoreCase("04")) {
                                    if (pri4 == 1) {
                                        ref4 = dato.getReferencia();
                                        pri4++;
                                    }

                                    if (!ref4.equalsIgnoreCase(dato.getReferencia())) {
                                        ref4 = dato.getReferencia();
                        %>

                    </div>
                    <br><hr><br>
                    <div class="row w-100 h-auto">    

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

                            </div>
                        </div>
                        <% }
                        } %>
                    </div>
                </div>
                <div class="carta w-100 h-auto">
                    <div class="row w-100 h-auto">
                        <%
                            for (serAsignados dato : listaInfo) {

                                String fecha = dato.getFechaCita();

                                String[] splits = fecha.split("-");

                                if (splits[1].equalsIgnoreCase("05")) {
                                    if (pri5 == 1) {
                                        ref5 = dato.getReferencia();
                                        pri5++;
                                    }

                                    if (!ref5.equalsIgnoreCase(dato.getReferencia())) {
                                        ref5 = dato.getReferencia();
                        %>

                    </div>
                    <br><hr><br>
                    <div class="row w-100 h-auto">    

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

                            </div>
                        </div>
                        <%}
                        } %>
                    </div>
                </div>
                <div class="carta w-100 h-auto">
                    <div class="row w-100 h-auto">
                        <%
                            for (serAsignados dato : listaInfo) {

                                String fecha = dato.getFechaCita();

                                String[] splits = fecha.split("-");

                                if (splits[1].equalsIgnoreCase("06")) {
                                    if (pri6 == 1) {
                                        ref6 = dato.getReferencia();
                                        pri6++;
                                    }

                                    if (!ref6.equalsIgnoreCase(dato.getReferencia())) {
                                        ref6 = dato.getReferencia();
                        %>

                    </div>
                    <br><hr><br>
                    <div class="row w-100 h-auto">    

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

                            </div>
                        </div>
                        <% }
                        } %>
                    </div>
                </div>
                <div class="carta w-100 h-auto">
                    <div class="row w-100 h-auto">
                        <%
                            for (serAsignados dato : listaInfo) {

                                String fecha = dato.getFechaCita();

                                String[] splits = fecha.split("-");

                                if (splits[1].equalsIgnoreCase("07")) {
                                    if (pri7 == 1) {
                                        ref7 = dato.getReferencia();
                                        pri7++;
                                    }

                                    if (!ref7.equalsIgnoreCase(dato.getReferencia())) {
                                        ref7 = dato.getReferencia();
                        %>

                    </div>
                    <br><hr><br>
                    <div class="row w-100 h-auto">    

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

                            </div>
                        </div>
                        <% }
                        } %>
                    </div>
                </div>
                <div class="carta w-100 h-auto">
                    <div class="row w-100 h-auto">
                        <%
                            for (serAsignados dato : listaInfo) {

                                String fecha = dato.getFechaCita();

                                String[] splits = fecha.split("-");

                                if (splits[1].equalsIgnoreCase("08")) {
                                    if (pri8 == 1) {
                                        ref8 = dato.getReferencia();
                                        pri8++;
                                    }

                                    if (!ref8.equalsIgnoreCase(dato.getReferencia())) {
                                        ref8 = dato.getReferencia();
                        %>

                    </div>
                    <br><hr><br>
                    <div class="row w-100 h-auto">    

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

                            </div>
                        </div>
                        <% }
                        } %>
                    </div>
                </div>
                <div class="carta w-100 h-auto">
                    <div class="row w-100 h-auto">
                        <%
                            for (serAsignados dato : listaInfo) {

                                String fecha = dato.getFechaCita();

                                String[] splits = fecha.split("-");

                                if (splits[1].equalsIgnoreCase("09")) {
                                    if (pri9 == 1) {
                                        ref9 = dato.getReferencia();
                                        pri9++;
                                    }

                                    if (!ref9.equalsIgnoreCase(dato.getReferencia())) {
                                        ref9 = dato.getReferencia();
                        %>

                    </div>
                    <br><hr><br>
                    <div class="row w-100 h-auto">    

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

                            </div>
                        </div>
                        <% }
                        } %>
                    </div>
                </div>
                <div class="carta w-100 h-auto">
                    <div class="row w-100 h-auto">
                        <%
                            for (serAsignados dato : listaInfo) {

                                String fecha = dato.getFechaCita();

                                String[] splits = fecha.split("-");

                                if (splits[1].equalsIgnoreCase("10")) {
                                    if (pri10 == 1) {
                                        ref10 = dato.getReferencia();
                                        pri10++;
                                    }

                                    if (!ref10.equalsIgnoreCase(dato.getReferencia())) {
                                        ref10 = dato.getReferencia();
                        %>

                    </div>
                    <br><hr><br>
                    <div class="row w-100 h-auto">    

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

                            </div>
                        </div>
                        <% }
                        } %>
                    </div>
                </div>
                <div class="carta w-100 h-auto">
                    <div class="row w-100 h-auto">
                        <%
                            for (serAsignados dato : listaInfo) {

                                String fecha = dato.getFechaCita();

                                String[] splits = fecha.split("-");

                                if (splits[1].equalsIgnoreCase("11")) {
                                    if (pri11 == 1) {
                                        ref11 = dato.getReferencia();
                                        pri11++;
                                    }

                                    if (!ref11.equalsIgnoreCase(dato.getReferencia())) {
                                        ref11 = dato.getReferencia();
                        %>

                    </div>
                    <br><hr><br>
                    <div class="row w-100 h-auto">    

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

                            </div>
                        </div>
                        <% }
                        } %>
                    </div>
                </div>
                <div class="carta w-100 h-auto">
                    <div class="row w-100 h-auto">
                        <%
                            for (serAsignados dato : listaInfo) {

                                String fecha = dato.getFechaCita();

                                String[] splits = fecha.split("-");

                                if (splits[1].equalsIgnoreCase("12")) {
                                    if (pri12 == 1) {
                                        ref12 = dato.getReferencia();
                                        pri12++;
                                    }

                                    if (!ref12.equalsIgnoreCase(dato.getReferencia())) {
                                        ref12 = dato.getReferencia();
                        %>

                    </div>
                    <br><hr><br>
                    <div class="row w-100 h-auto">    

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

                            </div>
                        </div>
                        <% }
                        }%>
                    </div>
                </div>
            </div>      
        </div>
            
        <!-- ////////////////////////////INFORMES//////////////////////////// -->
    </body>
</html>

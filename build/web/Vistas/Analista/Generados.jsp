<%-- 
    Document   : Generados
    Created on : 28/04/2019, 09:01:28 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="Config.OpcionesAsignados"%>
<%@page import="Modelos.serAsignados"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Modelos.serGenerados"%>
<%@page import="java.util.List"%>
<%@page import="Config.OpcionesGenerados"%>
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
        
            //LISTAS            
            List<serGenerados> listaGen = OpcionesGenerados.listar();
            List<serAsignados> listaAsi = OpcionesAsignados.listar();
            
            //NUMERO DE SERVICIOS GENERADOS
            int numServicios = OpcionesGenerados.numGenerados();
            
            //MENSAJES DE ALERTAS
            if (request.getParameter("val") != null) {
                if (request.getParameter("val").equals("correcto")) {
                    out.print("<script>swal('Correcto!', 'El servicio fue generado satisfactoriamente', 'success').then((value) => {window.location = 'Generados.jsp';});</script>");
                }
            }
            
            if (request.getParameter("valEli") != null) {
                out.print("<script>swal('Correcto!', 'El servicio generado fue eliminado de la base de datos correctamente', 'success').then((value) => {window.location = 'Generados.jsp';});</script>");
            }
            
            if (request.getParameter("valMod") != null) {
                if (request.getParameter("valMod").equals("correcto")) {
                    out.print("<script>swal('Correcto!', 'El servicio generado fue modificado correctamente', 'success').then((value) => {window.location = 'Generados.jsp';});</script>");
                } else {
                    out.print("<script>swal('Error!', 'Error al modificar el servicio', 'error').then((value) => {window.location = 'Generados.jsp';});</script>");
                }
            }    
        
            //COMPROBACIONES DE LOS HORARIOS DE LOS SERVICIOS
            DateFormat formato = new SimpleDateFormat("YYYY/MM/dd");
            DateFormat formato1 = new SimpleDateFormat("HH:mm");
            String fechaActual = formato.format(new Date());
            String horaActual = formato1.format(new Date());
            
            String[] actual = fechaActual.split("/");
            int diaActual = Integer.parseInt(actual[2]);
            int mesActual = Integer.parseInt(actual[1]);
            int anioActual = Integer.parseInt(actual[0]);

            String[] hActual = horaActual.split(":");
            int hoActual = Integer.parseInt(hActual[0]);
            int minutoActual = Integer.parseInt(hActual[1]);
            
            for(serGenerados dato : listaGen){
                String fechaIni = dato.getFechaCita();
                String horaIni = dato.getHoraCita();
                
                String[] Inicio = fechaIni.split("-");
                int diaInicio = Integer.parseInt(Inicio[2]);
                int mesInicio = Integer.parseInt(Inicio[1]);
                int anioInicio = Integer.parseInt(Inicio[0]);

                String[] hInicio = horaIni.split(":");
                int hoInicio = Integer.parseInt(hInicio[0]);
                int minutoInicio = Integer.parseInt(hInicio[1]);
                
                if (anioActual > anioInicio) {
                    OpcionesGenerados.eliminarSer(dato.getReferencia());
                } else if (anioActual == anioInicio && mesActual > mesInicio) {
                    OpcionesGenerados.eliminarSer(dato.getReferencia());
                } else if (anioActual == anioInicio && mesActual == mesInicio
                        && diaActual > diaInicio) {
                    OpcionesGenerados.eliminarSer(dato.getReferencia());
                } else if (anioActual == anioInicio && mesActual == mesInicio
                        && diaActual == diaInicio && hoActual > hoInicio) {
                    OpcionesGenerados.eliminarSer(dato.getReferencia());
                } else if (anioActual == anioInicio && mesActual == mesInicio && diaActual == diaInicio
                        && hoActual == hoInicio && minutoActual >= minutoInicio) {
                    OpcionesGenerados.eliminarSer(dato.getReferencia());
                }
            }

            for (serAsignados dato : listaAsi) {
                String fechaIni = dato.getFechaCita();
                String horaIni = dato.getHoraCita();
                String fechaFin = dato.getFechaFinal();
                String horaFin = dato.getHoraFinal();     

                String[] Inicio = fechaIni.split("-");
                int diaInicio = Integer.parseInt(Inicio[2]);
                int mesInicio = Integer.parseInt(Inicio[1]);
                int anioInicio = Integer.parseInt(Inicio[0]);

                String[] hInicio = horaIni.split(":");
                int hoInicio = Integer.parseInt(hInicio[0]);
                int minutoInicio = Integer.parseInt(hInicio[1]);

                String[] Fin = fechaFin.split("-");
                int diaFin = Integer.parseInt(Fin[2]);
                int mesFin = Integer.parseInt(Fin[1]);
                int anioFin = Integer.parseInt(Fin[0]);

                String[] hFin = horaFin.split(":");
                int hoFin = Integer.parseInt(hFin[0]);
                int minutoFin = Integer.parseInt(hFin[1]);

                if (anioActual > anioInicio) {
                    OpcionesAsignados.pasarProceso(dato.getReferencia());
                } else if (anioActual == anioInicio && mesActual > mesInicio) {
                    OpcionesAsignados.pasarProceso(dato.getReferencia());
                } else if (anioActual == anioInicio && mesActual == mesInicio
                        && diaActual > diaInicio) {
                    OpcionesAsignados.pasarProceso(dato.getReferencia());
                } else if (anioActual == anioInicio && mesActual == mesInicio
                        && diaActual == diaInicio && hoActual > hoInicio) {
                    OpcionesAsignados.pasarProceso(dato.getReferencia());
                } else if (anioActual == anioInicio && mesActual == mesInicio && diaActual == diaInicio
                        && hoActual == hoInicio && minutoActual >= minutoInicio) {
                    OpcionesAsignados.pasarProceso(dato.getReferencia());
                }

                if (anioActual > anioFin) {
                    OpcionesAsignados.pasarFinalizado(dato.getReferencia());
                } else if (anioActual == anioFin && mesActual > mesFin) {
                    OpcionesAsignados.pasarFinalizado(dato.getReferencia());
                } else if (anioActual == anioFin && mesActual == mesFin
                        && diaActual > diaFin) {
                    OpcionesAsignados.pasarFinalizado(dato.getReferencia());
                } else if (anioActual == anioFin && mesActual == mesFin
                        && diaActual == diaFin && hoActual > hoFin) {
                    OpcionesAsignados.pasarFinalizado(dato.getReferencia());
                } else if (anioActual == anioFin && mesActual == mesFin && diaActual == diaFin
                        && hoActual == hoFin && minutoActual >= minutoFin) {
                    OpcionesAsignados.pasarFinalizado(dato.getReferencia());
                }

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
                <li><a href="Servicio.jsp" class="" id="primera"><i class="fas fa-plus-circle"></i><span>Agregar servicio</span></a></li>
                <li><a href="Entidades.jsp" class="" id="segunda"><i class="fas fa-truck"></i><span>Entidades fisicas</span></a></li>
                <li><a href="Generar.jsp" class="" id="tercera"><i class="fas fa-folder-plus"></i><span>Generar servicio</span></a></li>
                <li><a href="#" class="activado" id="cuarta"><i class="fas fa-clipboard"></i><span>Servicios generados</span></a></li>
                <li><a href="Asignados.jsp" class="" id="quinta"><i class="fas fa-clipboard-check"></i><span>Servicios asignados</span></a></li>
                <li><a href="Informes.jsp" class="" id="sexta"><i class="fas fa-calendar-alt"></i><span>Informes</span></a></li>
                <li><a href="Datos.jsp" class="" id="septima"><i class="fas fa-chart-pie"></i><span>Datos estadisticos</span></a></li>
            </ul>
        </div>
        <!-- ////////////////////////////MENU LATERAL//////////////////////////// -->

        <a href="" class="btn-menu">Menu <i class="icon fas fa-bars"></i></a>
        
        <!-- ////////////////////////////SERVICIOS GENERADOS//////////////////////////// -->
        <div class="contenedor-serGenerados">
            <h3>Servicios generados</h3>
            <hr>
            <%
                if (numServicios == 0) {
            %>
            <h3>No hay servicios generados.</h3>
            <%
            } else {

            %>

            <div class="row w-100 h-auto">

                <%                    
                    for (serGenerados dato : listaGen) {
                %>

                <div class="col-lg-4 my-2" id="carAsi">
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
                            <strong>Servicio: </strong><label class="ml-2"><%= dato.getServicio()%></label>
                        </div>
                        <div class="card-footer">
                            <a href="Opciones/Generados/numProveedores.jsp?ref=<%= dato.getReferencia()%>" class="btn btn-outline-primary btn-block">ASIGNAR</a>
                            <hr>
                            <div class=" text-center">
                                <a href="Opciones/Generados/Modificar.jsp?ref=<%= dato.getReferencia()%>" class="btn btn-outline-warning" style="width: 48%;">MODIFICAR</a>
                                <a href="Opciones/Generados/Eliminar.jsp?ref=<%= dato.getReferencia()%>" class="btn btn-outline-danger" style="width: 48%;">ELIMINAR</a>
                            </div>
                        </div>
                    </div>
                </div>
                <%  }
                    }   %>
            </div>
        </div>
        <!-- ////////////////////////////SERVICIOS GENERADOS//////////////////////////// -->
    </body>
</html>

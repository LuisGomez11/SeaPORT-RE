<%-- 
    Document   : Generar
    Created on : 28/04/2019, 08:55:11 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Config.OpcionesAsignados"%>
<%@page import="Modelos.serAsignados"%>
<%@page import="Config.OpcionesEntidades"%>
<%@page import="Modelos.Entidades"%>
<%@page import="Config.OpcionesServicios"%>
<%@page import="Modelos.Servicios"%>
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
        <link rel="stylesheet" type="text/css" href="CSS - JS/CSS/styles.css">
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
        
            // LISTAS
            List<Servicios> listaSer = OpcionesServicios.listar();
            List<Entidades> listaMoto = OpcionesEntidades.listarMoto();
            List<Entidades> listaGrua = OpcionesEntidades.listarGrua();
            List<serGenerados> listaGen = OpcionesGenerados.listar();
            List<serAsignados> listaAsi = OpcionesAsignados.listar();
            
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
                <li><a href="#" class="activado" id="tercera"><i class="fas fa-folder-plus"></i><span>Generar servicio</span></a></li>
                <li><a href="Generados.jsp" class="" id="cuarta"><i class="fas fa-clipboard"></i><span>Servicios generados</span></a></li>
                <li><a href="Asignados.jsp" class="" id="quinta"><i class="fas fa-clipboard-check"></i><span>Servicios asignados</span></a></li>
                <li><a href="Informes.jsp" class="" id="sexta"><i class="fas fa-calendar-alt"></i><span>Informes</span></a></li>
                <li><a href="Datos.jsp" class="" id="septima"><i class="fas fa-chart-pie"></i><span>Datos estadisticos</span></a></li>
                <li><a href="Proveedores.jsp" class="" id="octava"><i class="fas fa-address-book"></i><span>Consultar proveedores</span></a></li>
            </ul>
        </div>
        <!-- ////////////////////////////MENU LATERAL//////////////////////////// -->

        <a href="" class="btn-menu">Menu <i class="icon fas fa-bars"></i></a>
        
        <!-- ////////////////////////////GENERAR SERVICIO//////////////////////////// -->
        <div class="contenedor-genServicio">
            <h3>Ingresar datos del servicio generico</h3>
            <hr>
            <br>
            <form method="POST" autocomplete="off" action="../../ControlServicios?opc=agregar">
                <div class="row">
                    <div class="form-group col-md-4">
                        <label for="term">Terminal</label>
                        <select class="form-control" name="term">
                            <option>SPRC</option>
                            <option>CTC</option>
                        </select>
                    </div>
                    <div class="form-group col-md-8">
                        <label for="moto">Motonave / Frente de servicio</label>
                        <select class="form-control" name="moto">
                            <%
                                for (Entidades dato : listaMoto) {
                            %>
                            <option><%= dato.getNombre()%></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="lloyd">Lloyd-Escala</label>
                        <input type="text" maxlength="5" class="form-control" id="lloyd" name="lloyd" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="uvi">UVI</label>
                        <input type="text" maxlength="4" class="form-control" id="uvi" name="uvi" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="referencia">Referencia</label>
                        <input type="text" maxlength="4" class="form-control" id="referencia" name="referencia" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="muelle">Muelle</label>
                        <select class="form-control" name="muelle">
                            <option>N/A</option>
                            <option>M1</option>
                            <option>M2</option>
                            <option>M3</option>
                            <option>M4</option>
                            <option>M5</option>
                            <option>M6</option>
                            <option>M7</option>
                            <option>M8</option>
                            <option>M9</option>
                            <option>S1</option>
                            <option>S2</option>
                            <option>S3</option>
                            <option>S4</option>
                            <option>S5</option>
                            <option>S6</option>
                            <option>S7</option>
                            <option>S8</option>
                            <option>S9</option>
                            <option>RORO</option>
                        </select>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="grua">Grúa 1</label>
                        <select class="form-control" name="grua1">
                            <option>N/A</option>
                            <%
                                for (Entidades dato : listaGrua) {
                            %>
                            <option><%= dato.getNombre()%></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="grua">Grúa 2</label>
                        <select class="form-control" name="grua2">
                            <option>N/A</option>
                            <%
                                for (Entidades dato : listaGrua) {
                            %>
                            <option><%= dato.getNombre()%></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="grua">Grúa 3</label>
                        <select class="form-control" name="grua3">
                            <option>N/A</option>
                            <%
                                for (Entidades dato : listaGrua) {
                            %>
                            <option><%= dato.getNombre()%></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="grua">Grúa 4</label>
                        <select class="form-control" name="grua4">
                            <option>N/A</option>
                            <%
                                for (Entidades dato : listaGrua) {
                            %>
                            <option><%= dato.getNombre()%></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="fechaCita">Fecha de citación</label>
                        <input type="date" class="form-control" name="fechaCita" id="fechaInicio" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="horaCita">Hora de citación</label>
                        <input type="time" class="form-control" name="horaCita" id="horaInicio" required>
                    </div>

                    <div class="form-group col-md-4">
                        <label for="horasOp">Hrs. Operación</label>
                        <input type="number" id="hrsOp" class="form-control" name="horasOp" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="fechaCita">Fecha de finalización</label>
                        <input type="date" class="form-control" name="fechaFinal" id="fechaFinal" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="horaCita">Hora de finalización</label>
                        <input type="time" class="form-control" name="horaFinal"  id="horaFinal" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="servicio">Servicio</label>
                        <select class="form-control" name="servicio">
                            <%
                                for (Servicios dato : listaSer) {
                            %>
                            <option><%= dato.getNombre()%></option>
                            <% } %>
                        </select>
                    </div>
                </div>
                <div class="botones mb-4">
                    <button type="button" class="btn btn-outline-danger ml-2" id="limpiarCampos">CANCELAR</button>
                    <input type="submit" value="GENERAR" class="btn btn-outline-primary" id="guardar">
                </div>
            </form>
        </div>
        <!-- ////////////////////////////GENERAR SERVICIO//////////////////////////// -->
    </body>
</html>

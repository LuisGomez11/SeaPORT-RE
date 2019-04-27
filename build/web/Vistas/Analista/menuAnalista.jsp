<%-- 
    Document   : menuAnalista
    Created on : 04/04/2019, 10:35:57 AM
    Author     : Luis Gomez
--%>

<%@page import="Modelos.serAsignados"%>
<%@page import="Modelos.serGenerados"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Config.OpcionesEntidades"%>
<%@page import="Modelos.Entidades"%>
<%@page import="java.util.List"%>
<%@page import="Config.OpcionesServicios"%>
<%@page import="Modelos.Servicios"%>
<%@page import="Config.OpcionesAsignados"%>
<%@page import="Config.OpcionesGenerados"%>
<%@page import="Clases.ConexionBD"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
        <script src="../../JS/chart.js"></script>
        <script src="JS/appMenu1.js"></script>

        <title>SeaPORT R&E</title>
    </head>
    <body>
        <%Connection connect = ConexionBD.connect();%>
        <%
            int contador = 0;
            int contador1 = 0;
            int numServicios = OpcionesGenerados.numGenerados();
            int numAsignaciones = OpcionesAsignados.numAsignados();

            DateFormat formato = new SimpleDateFormat("YYYY/MM/dd");
            DateFormat formato1 = new SimpleDateFormat("HH:mm");
            String fechaActual = formato.format(new Date());
            String horaActual = formato1.format(new Date());

            PreparedStatement psAsi = connect.prepareStatement("select * from servicios_asignados");
            ResultSet rsAsi = psAsi.executeQuery();

            while (rsAsi.next()) {
                String fechaIni = rsAsi.getString("fechaCita");
                String horaIni = rsAsi.getString("horaCita");
                String fechaFin = rsAsi.getString("fechaFinal");
                String horaFin = rsAsi.getString("horaFinal");

                String[] actual = fechaActual.split("/");
                int diaActual = Integer.parseInt(actual[2]);
                int mesActual = Integer.parseInt(actual[1]);
                int anioActual = Integer.parseInt(actual[0]);

                String[] hActual = horaActual.split(":");
                int hoActual = Integer.parseInt(hActual[0]);
                int minutoActual = Integer.parseInt(hActual[1]);

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
                    OpcionesAsignados.pasarProceso(rsAsi.getString("referencia"));
                } else if (anioActual == anioInicio && mesActual > mesInicio) {
                    OpcionesAsignados.pasarProceso(rsAsi.getString("referencia"));
                } else if (anioActual == anioInicio && mesActual == mesInicio
                        && diaActual > diaInicio) {
                    OpcionesAsignados.pasarProceso(rsAsi.getString("referencia"));
                } else if (anioActual == anioInicio && mesActual == mesInicio
                        && diaActual == diaInicio && hoActual > hoInicio) {
                    OpcionesAsignados.pasarProceso(rsAsi.getString("referencia"));
                } else if (anioActual == anioInicio && mesActual == mesInicio && diaActual == diaInicio
                        && hoActual == hoInicio && minutoActual >= minutoInicio) {
                    OpcionesAsignados.pasarProceso(rsAsi.getString("referencia"));
                }

                if (anioActual > anioFin) {
                    OpcionesAsignados.pasarFinalizado(rsAsi.getString("referencia"));
                } else if (anioActual == anioFin && mesActual > mesFin) {
                    OpcionesAsignados.pasarFinalizado(rsAsi.getString("referencia"));
                } else if (anioActual == anioFin && mesActual == mesFin
                        && diaActual > diaFin) {
                    OpcionesAsignados.pasarFinalizado(rsAsi.getString("referencia"));
                } else if (anioActual == anioFin && mesActual == mesFin
                        && diaActual == diaFin && hoActual > hoFin) {
                    OpcionesAsignados.pasarFinalizado(rsAsi.getString("referencia"));
                } else if (anioActual == anioFin && mesActual == mesFin && diaActual == diaFin
                        && hoActual == hoFin && minutoActual >= minutoFin) {
                    OpcionesAsignados.pasarFinalizado(rsAsi.getString("referencia"));
                }

            }
        %>
        <%
            if (request.getParameter("val") != null) {
                if (request.getParameter("val").equals("correcto")) {
                    out.print("<script>swal('Correcto!', 'El servicio fue generado satisfactoriamente, lo puede consultar en la sección de servicios generados', 'success').then((value) => {window.location = 'menuAnalista.jsp';});</script>");
                } else {
                    out.print("<script>swal('Error!', 'Ya hay un servicio generado con esa referencia', 'error').then((value) => {window.location = 'menuAnalista.jsp';});</script>");
                }
            }

            if (request.getParameter("valEn") != null) {
                if (request.getParameter("valEn").equals("correcto")) {
                    out.print("<script>swal('Correcto!', 'La entidad fisica fue registrada correctamente', 'success').then((value) => {window.location = 'menuAnalista.jsp';});</script>");
                } else {
                    out.print("<script>swal('Error!', 'Ya hay una entidad registrada con ese nombre', 'error').then((value) => {window.location = 'menuAnalista.jsp';});</script>");
                }
            }

            if (request.getParameter("valSer") != null) {
                if (request.getParameter("valSer").equals("correcto")) {
                    out.print("<script>swal('Correcto!', 'El servicio fue registrado correctamente', 'success').then((value) => {window.location = 'menuAnalista.jsp';});</script>");
                } else {
                    out.print("<script>swal('Error!', 'Ya hay un servicio registrado con ese nombre', 'error').then((value) => {window.location = 'menuAnalista.jsp';});</script>");
                }
            }

            if (request.getParameter("valMod") != null) {
                if (request.getParameter("valMod").equals("correcto")) {
                    out.print("<script>swal('Correcto!', 'El servicio fue modificado correctamente', 'success').then((value) => {window.location = 'menuAnalista.jsp';});</script>");
                } else {
                    out.print("<script>swal('Error!', 'Error al modificar el servicio', 'error').then((value) => {window.location = 'menuAnalista.jsp';});</script>");
                }
            }
            if (request.getParameter("valEli") != null) {
                out.print("<script>swal('Correcto!', 'El servicio fue eliminado de la base de datos correctamente', 'success').then((value) => {window.location = 'menuAnalista.jsp';});</script>");
            }
            if (request.getParameter("valAsi") != null) {
                out.print("<script>swal('Correcto!', 'El servicio fue asignado correctamente, lo puede consultar en la sección de servicios asignados', 'success').then((value) => {window.location = 'menuAnalista.jsp';});</script>");
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
                <li><a href="#" class="" id="primera"><i class="fas fa-plus-circle"></i><span>Agregar servicio</span></a></li>
                <li><a href="#" class="" id="segunda"><i class="fas fa-truck"></i><span>Entidades fisicas</span></a></li>
                <li><a href="#" class="" id="tercera"><i class="fas fa-folder-plus"></i><span>Generar servicio</span></a></li>
                <li><a href="#" class="" id="cuarta"><i class="fas fa-clipboard"></i><span>Servicios generados</span></a></li>
                <li><a href="#" class="" id="quinta"><i class="fas fa-clipboard-check"></i><span>Servicios asignados</span></a></li>
                <li><a href="#" class="" id="sexta"><i class="fas fa-folder-open"></i><span>Informes</span></a></li>
                <li><a href="#" class="" id="septima"><i class="fas fa-chart-pie"></i><span>Datos estadisticos</span></a></li>
            </ul>
        </div>
        <!-- ////////////////////////////MENU LATERAL//////////////////////////// -->

        <a href="#" class="btn-menu">Menu <i class="icon fas fa-bars"></i></a>

        <!-- ////////////////////////////INICIO//////////////////////////// -->
        <div class="contenedor-inicio">
            <h3>Inicio</h3>
            <hr>
            <div class="serGenerados">
                <div class="contImagen1"><i class="fas fa-clipboard"></i></div>
                <div class="texto1">
                    <h1><%= numServicios%></h1>
                    <h5>Servicios Generados</h5>
                </div>
            </div>
            <div class="serAsignados">
                <div class="contImagen2"><i class="fas fa-clipboard-check"></i></div>
                <div class="texto2">
                    <h1><%= numAsignaciones%></h1>
                    <h5>Servicios Asignados</h5>
                </div>
            </div>
            <br><br><br><br><br><br><br><br><br><hr>
            <div class="ultNovedades">
                <h3>Ultimas novedades</h3>
                <br>
                <div class="serGenerados1">
                    <h4>Servicios generados</h4>
                    <br>
                    <div class="table-responsive">
                        <table class="table table-bordered tablaInicio">
                            <thead>
                                <tr>
                                    <th>Terminal</th>
                                    <th>Lloyd escala / UVI / Referencia</th>
                                    <th>Hrs en operacion</th>
                                    <th>Servicio</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    PreparedStatement ps2 = connect.prepareStatement("select * from servicios_generados");
                                    ResultSet rs2 = ps2.executeQuery();

                                    while (rs2.next()) {

                                %>
                                <tr>
                                    <td><%= rs2.getString("terminal")%></td>
                                    <td><%= rs2.getString("lloyd") + " // " + rs2.getString("uvi") + " - " + rs2.getString("referencia")%></td>
                                    <td><%= rs2.getString("hrsOp")%></td>
                                    <td><%= rs2.getString("servicio")%></td>
                                </tr>
                                <%
                                        contador++;
                                        if (contador == 3) {
                                            contador = 0;
                                            break;
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="serAsignados1">
                    <h4>Servicios asignados</h4>
                    <br>
                    <div class="table-responsive"  >
                        <table class="table table-bordered tablaInicio">
                            <thead>
                                <tr>
                                    <th>Lloyd escala / UVI / Referencia</th>
                                    <th>Servicio</th>
                                    <th>Proveedor</th>
                                    <th>Hrs. Totales</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    PreparedStatement ps13 = connect.prepareStatement("select * from servicios_asignados");
                                    ResultSet rs13 = ps13.executeQuery();

                                    while (rs13.next()) {

                                %>
                                <tr>

                                    <td><%= rs13.getString("lloyd") + " // " + rs13.getString("uvi") + " - " + rs13.getString("referencia")%></td>
                                    <td><%= rs13.getString("servicio")%></td>
                                    <td><%= rs13.getString("proveedor")%></td>
                                    <td><%= rs13.getString("hrsTotales")%></td>
                                </tr>
                                <%
                                        contador1++;
                                        if (contador1 == 3) {
                                            contador1 = 0;
                                            break;
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- ////////////////////////////INICIO//////////////////////////// -->

        <!-- ////////////////////////////AGREGAR SERVICIO//////////////////////////// -->
        <div class="contenedor-agServicio">
            <h3>Agregar servicio</h3>
            <hr>
            <br>
            <form method="POST" autocomplete="off" action="../../ControlServ?opc=agregar">
                <div class="row">
                    <div class="col-5">
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
                    <div class="col-7">
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
                                    List<Servicios> listaSer = OpcionesServicios.listar();

                                    for (Servicios dato : listaSer) {

                                %>
                                <tr>
                                    <td><%= dato.getNombre()%></td>
                                    <td>
                                        <a href="#" class="btn btn-outline-warning">MODIFICAR</a>
                                        <a href="#" class="btn btn-outline-danger">ELIMINAR</a>
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
            <table class="table table-bordered">
                <thead>
                    <tr><th colspan="3">LISTADO DE ENTIDADES FISICAS</th></tr>
                    <tr>
                        <th>NOMBRE</th>
                        <th>TIPO DE ENTIDAD</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Entidades> listaEn = OpcionesEntidades.listar();

                        for (Entidades dato : listaEn) {

                    %>
                    <tr>
                        <td><%= dato.getNombre()%></td>
                        <td><%= dato.getTipo()%></td>
                        <td>
                            <a href="#" class="btn btn-outline-warning">MODIFICAR</a>
                            <a href="#" class="btn btn-outline-danger">ELIMINAR</a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <!-- ////////////////////////////ENTIDAD FISICA//////////////////////////// -->

        <!-- ////////////////////////////GENERAR SERVICIO//////////////////////////// -->
        <div class="contenedor-genServicio">
            <h3>Ingresar datos del servicio generico</h3>
            <hr>
            <br>
            <form method="POST" autocomplete="off" action="../../ControlServicios?opc=agregar">
                <div class="row">
                    <div class="form-group col-4">
                        <label for="term">Terminal</label>
                        <select class="form-control" name="term">
                            <option>SPRC</option>
                            <option>CTC</option>
                        </select>
                    </div>
                    <div class="form-group col-8">
                        <label for="moto">Motonave / Frente de servicio</label>
                        <select class="form-control" name="moto">
                            <%
                                List<Entidades> listaMoto = OpcionesEntidades.listarMoto();

                                for (Entidades dato : listaMoto) {
                            %>
                            <option><%= dato.getNombre()%></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group col-4">
                        <label for="lloyd">Lloyd-Escala</label>
                        <input type="text" maxlength="5" class="form-control" id="lloyd" name="lloyd" required>
                    </div>
                    <div class="form-group col-4">
                        <label for="uvi">UVI</label>
                        <input type="text" maxlength="4" class="form-control" id="uvi" name="uvi" required>
                    </div>
                    <div class="form-group col-4">
                        <label for="referencia">Referencia</label>
                        <input type="text" maxlength="4" class="form-control" id="referencia" name="referencia" required>
                    </div>
                    <div class="form-group col-4">
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
                    <div class="form-group col-2">
                        <label for="grua">Grúa 1</label>
                        <select class="form-control" name="grua1">
                            <option>N/A</option>
                            <%
                                List<Entidades> listaGrua = OpcionesEntidades.listarGrua();

                                for (Entidades dato : listaGrua) {
                            %>
                            <option><%= dato.getNombre()%></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group col-2">
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
                    <div class="form-group col-2">
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
                    <div class="form-group col-2">
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
                    <div class="form-group col-4">
                        <label for="fechaCita">Fecha de citación</label>
                        <input type="date" class="form-control" name="fechaCita" id="fechaInicio" required>
                    </div>
                    <div class="form-group col-4">
                        <label for="horaCita">Hora de citación</label>
                        <input type="time" class="form-control" name="horaCita" id="horaInicio" required>
                    </div>

                    <div class="form-group col-3">
                        <label for="horasOp">Hrs. Operación</label>
                        <input type="number" id="hrsOp" class="form-control" name="horasOp" required>
                    </div>

                    <div class="form-group col-1">
                        <button type="button" class="btn btn-info btn-block mt-4" id="actualizar"><i class="fas fa-sync"></i></button>
                    </div>
                    <div class="form-group col-4">
                        <label for="fechaCita">Fecha de finalización</label>
                        <input type="date" class="form-control" name="fechaFinal" id="fechaFinal" required>
                    </div>
                    <div class="form-group col-4">
                        <label for="horaCita">Hora de finalización</label>
                        <input type="time" class="form-control" name="horaFinal"  id="horaFinal" required>
                    </div>
                    <div class="form-group col-4">
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
                <div class="botones">
                    <button type="button" class="btn btn-outline-danger ml-2" id="limpiarCampos">CANCELAR</button>
                    <input type="submit" value="GENERAR" class="btn btn-outline-primary" id="guardar">
                </div>
            </form>
        </div>
        <!-- ////////////////////////////GENERAR SERVICIO//////////////////////////// -->

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
                List<serGenerados> listaGen = OpcionesGenerados.listar();
            %>

            <div class="row w-100 h-auto">

                <%
                    for (serGenerados dato : listaGen) {

                %>

                <div class="col-4 my-2" id="carAsi">
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
                            <a href="numProveedores.jsp?ref=<%= dato.getReferencia()%>" class="btn btn-outline-primary btn-block">ASIGNAR</a>
                            <hr>
                            <div class=" text-center">
                                <a href="Modificar.jsp?ref=<%= dato.getReferencia()%>" class="btn btn-outline-warning" style="width: 48%;">MODIFICAR</a>
                                <a href="Eliminar.jsp?ref=<%= dato.getReferencia()%>" class="btn btn-outline-danger" style="width: 48%;">ELIMINAR</a>
                            </div>
                        </div>
                    </div>
                </div>
                <%  }
                }   %>
            </div>
        </div>
        <!-- ////////////////////////////SERVICIOS GENERADOS//////////////////////////// -->

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
                List<serAsignados> listaAsi = OpcionesAsignados.listar();

                if (numAsignaciones == 0) {
            %>
            <h3>No hay servicios asignados.</h3>
            <%
            } else {

                String ref = "";
                int pri = 1;

            %>

            <div class="row w-100 h-auto">

                <%                    for (serAsignados dato : listaAsi) {

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
                <div class="col-4 my-2"  id="carAsi">
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
                                    if (estado.equalsIgnoreCase("En espera")) {
                                        tipo = "info";
                                    } else if (estado.equalsIgnoreCase("En progreso")) {
                                        tipo = "warning";
                                    } else if (estado.equalsIgnoreCase("Finalizado")) {
                                        tipo = "success";
                                    }
                                %>
                                <span class="badge badge-pill badge-<%= tipo%>"><%= estado%></span>
                                <hr>
                                <a href="Extras/Eliminar.jsp?ref=<%= dato.getReferencia()%>" class="btn btn-outline-danger btn-block">ELIMINAR</a>
                            </center>
                        </div>
                    </div>
                </div>
                <%}
                    }%>
            </div>
        </div>
        <!-- ////////////////////////////SERVICIOS ASIGNADOS//////////////////////////// -->

        <!-- ////////////////////////////INFORMES//////////////////////////// -->
        <div class="contenedor-informes">
            <div class="flex">
                <h3 id="tituloInfo">Informes - Mes de enero</h3>
                <ul class="pagination">
                    <li id="anterior-pag" class="page-item"><a class="page-link" href="#"><span aria-hidden="true">&laquo;</span></a></li>
                </ul>
            </div>
            <hr>
            <div class="loop">
                <div class="carta row w-100 h-auto">
                    <%
                        for (serAsignados dato : listaAsi) {

                            String fecha = dato.getFechaCita();

                            String[] splits = fecha.split("-");

                            if (splits[1].equalsIgnoreCase("01")) {

                    %>
                    <div class="col-4 my-2" id="carAsi">
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
                <div class="carta row w-100 h-auto">
                    <%
                        for (serAsignados dato : listaAsi) {

                            String fecha = dato.getFechaCita();

                            String[] splits = fecha.split("-");

                            if (splits[1].equalsIgnoreCase("02")) {

                    %>
                    <div class="col-4 my-2" id="carAsi">
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
                <div class="carta row w-100 h-auto">
                    <%
                        for (serAsignados dato : listaAsi) {

                            String fecha = dato.getFechaCita();

                            String[] splits = fecha.split("-");

                            if (splits[1].equalsIgnoreCase("03")) {

                    %>
                    <div class="col-4 my-2" id="carAsi">
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
                <div class="carta row w-100 h-auto">
                    <%
                        for (serAsignados dato : listaAsi) {

                            String fecha = dato.getFechaCita();

                            String[] splits = fecha.split("-");

                            if (splits[1].equalsIgnoreCase("04")) {

                    %>
                    <div class="col-4 my-2" id="carAsi">
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
                <div class="carta row w-100 h-auto">
                    <%
                        for (serAsignados dato : listaAsi) {

                            String fecha = dato.getFechaCita();

                            String[] splits = fecha.split("-");

                            if (splits[1].equalsIgnoreCase("05")) {

                    %>
                    <div class="col-4 my-2" id="carAsi">
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
                <div class="carta row w-100 h-auto">
                    <%
                        for (serAsignados dato : listaAsi) {

                            String fecha = dato.getFechaCita();

                            String[] splits = fecha.split("-");

                            if (splits[1].equalsIgnoreCase("06")) {

                    %>
                    <div class="col-4 my-2" id="carAsi">
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
                <div class="carta row w-100 h-auto">
                    <%
                        for (serAsignados dato : listaAsi) {

                            String fecha = dato.getFechaCita();

                            String[] splits = fecha.split("-");

                            if (splits[1].equalsIgnoreCase("07")) {

                    %>
                    <div class="col-4 my-2" id="carAsi">
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
                <div class="carta row w-100 h-auto">
                    <%
                        for (serAsignados dato : listaAsi) {

                            String fecha = dato.getFechaCita();

                            String[] splits = fecha.split("-");

                            if (splits[1].equalsIgnoreCase("08")) {

                    %>
                    <div class="col-4 my-2" id="carAsi">
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
                <div class="carta row w-100 h-auto">
                    <%
                        for (serAsignados dato : listaAsi) {

                            String fecha = dato.getFechaCita();

                            String[] splits = fecha.split("-");

                            if (splits[1].equalsIgnoreCase("09")) {

                    %>
                    <div class="col-4 my-2" id="carAsi">
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
                <div class="carta row w-100 h-auto">
                    <%
                        for (serAsignados dato : listaAsi) {

                            String fecha = dato.getFechaCita();

                            String[] splits = fecha.split("-");

                            if (splits[1].equalsIgnoreCase("10")) {

                    %>
                    <div class="col-4 my-2" id="carAsi">
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
                <div class="carta row w-100 h-auto">
                    <%
                        for (serAsignados dato : listaAsi) {

                            String fecha = dato.getFechaCita();

                            String[] splits = fecha.split("-");

                            if (splits[1].equalsIgnoreCase("11")) {

                    %>
                    <div class="col-4 my-2" id="carAsi">
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
                <div class="carta row w-100 h-auto">
                    <%
                        for (serAsignados dato : listaAsi) {

                            String fecha = dato.getFechaCita();

                            String[] splits = fecha.split("-");

                            if (splits[1].equalsIgnoreCase("12")) {

                    %>
                    <div class="col-4 my-2" id="carAsi">
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
        <!-- ////////////////////////////INFORMES//////////////////////////// -->

        <!-- ////////////////////////////INFORMES//////////////////////////// -->
        <div class="contenedor-estadisticos">
            <h3>Datos estadisticos</h3>
            <hr>
            <canvas id="myChart" width="400" height="400"></canvas>

        </div>
        <!-- ////////////////////////////INFORMES//////////////////////////// -->

        <!-- SCRIPT GRAFICAS -->
        <script src="JS/graficas.js"></script>

    </body>
</html>

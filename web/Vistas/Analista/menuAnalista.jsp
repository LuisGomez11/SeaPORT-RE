<%-- 
    Document   : menuAnalista
    Created on : 04/04/2019, 10:35:57 AM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

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
        <link rel="stylesheet" type="text/css" href="CSS/estilos.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

        <!-- SCRIPTS -->
        <script src="../../JS/jquery-3.1.1.min.js"></script>
        <script src="../../JS/bootstrap.min.js"></script>
        <script src="../../JS/sweetalert.min.js"></script>
        <script src="../../JS/chart.js"></script>
        <script src="JS/appMenu.js"></script>

        <title>SeaPORT R&E</title>
    </head>
    <body>
        <%
            int contador = 0;
            int contador1 = 0;
            int numServicios = 0;
            int numAsignaciones = 0;
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

            Connection connect = ConexionBD.connect();
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
                    <%
                        PreparedStatement ps3 = connect.prepareStatement("select count(*) from servicios_generados");
                        ResultSet rs3 = ps3.executeQuery();

                        while (rs3.next()) {

                            numServicios = (Integer) rs3.getInt(1);
                    %>
                    <h1><%= numServicios%></h1>
                    <%}%>
                    <h5>Servicios Generados</h5>
                </div>
            </div>
            <div class="serAsignados">
                <div class="contImagen2"><i class="fas fa-clipboard-check"></i></div>
                <div class="texto2">
                    <%
                        PreparedStatement ps6 = connect.prepareStatement("SELECT COUNT(DISTINCT referencia) FROM servicios_asignados;");
                        ResultSet rs6 = ps6.executeQuery();

                        while (rs6.next()) {

                            numAsignaciones = (Integer) rs6.getInt(1);
                    %>
                    <h1><%= numAsignaciones%></h1>
                    <%}%>
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
                            <input type="text" name="nombre" class="form-control">
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
                                    PreparedStatement ps7 = connect.prepareStatement("select * from servicios");
                                    ResultSet rs7 = ps7.executeQuery();

                                    while (rs7.next()) {

                                %>
                                <tr>
                                    <td><%= rs7.getString(1)%></td>
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
                        <input type="text" name="nombre" class="form-control">
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
                        PreparedStatement ps4 = connect.prepareStatement("select * from entidad_fisica order by tipo");
                        ResultSet rs4 = ps4.executeQuery();

                        while (rs4.next()) {

                    %>
                    <tr>
                        <td><%= rs4.getString("nombre")%></td>
                        <td><%= rs4.getString("tipo")%></td>
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
                                PreparedStatement ps5 = connect.prepareStatement("select * from entidad_fisica where tipo='Motonave'");
                                ResultSet rs5 = ps5.executeQuery();

                                while (rs5.next()) {
                            %>
                            <option><%= rs5.getString(1)%></option>
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
                                PreparedStatement ps9 = connect.prepareStatement("select * from entidad_fisica where tipo='Grua'");
                                ResultSet rs9 = ps9.executeQuery();

                                while (rs9.next()) {
                            %>
                            <option><%= rs9.getString(1)%></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group col-2">
                        <label for="grua">Grúa 2</label>
                        <select class="form-control" name="grua2">
                            <option>N/A</option>
                            <%
                                PreparedStatement ps10 = connect.prepareStatement("select * from entidad_fisica where tipo='Grua'");
                                ResultSet rs10 = ps10.executeQuery();

                                while (rs10.next()) {
                            %>
                            <option><%= rs10.getString(1)%></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group col-2">
                        <label for="grua">Grúa 3</label>
                        <select class="form-control" name="grua3">
                            <option>N/A</option>
                            <%
                                PreparedStatement ps11 = connect.prepareStatement("select * from entidad_fisica where tipo='Grua'");
                                ResultSet rs11 = ps11.executeQuery();

                                while (rs11.next()) {
                            %>
                            <option><%= rs11.getString(1)%></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group col-2">
                        <label for="grua">Grúa 4</label>
                        <select class="form-control" name="grua4">
                            <option>N/A</option>
                            <%
                                PreparedStatement ps12 = connect.prepareStatement("select * from entidad_fisica where tipo='Grua'");
                                ResultSet rs12 = ps12.executeQuery();

                                while (rs12.next()) {
                            %>
                            <option><%= rs12.getString(1)%></option>
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
                                PreparedStatement ps8 = connect.prepareStatement("select * from servicios");
                                ResultSet rs8 = ps8.executeQuery();

                                while (rs8.next()) {
                            %>
                            <option><%= rs8.getString(1)%></option>
                            <% } %>
                        </select>
                    </div>
                </div>
                <div class="botones">
                    <div class="alerta ml-2"></div>
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
                PreparedStatement ps = connect.prepareStatement("select * from servicios_generados");
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {

            %>

            <div class="card border-primary mr-4 my-2" style="float: left; width: 31%;">
                <div class="card-header text-center"><%= rs.getString("lloyd") + " // " + rs.getString("uvi") + " - " + rs.getString("referencia")%></div>
                <div class="card-body" id="bodyCard">
                    <div id="informacion" style="z-index: 2;">
                        <strong>Terminal: </strong><label class="ml-2"><%= rs.getString("terminal")%></label><br>
                        <strong>Motonave: </strong><label class="ml-2"><%= rs.getString("motonave")%></label><br>
                        <strong>Muelle: </strong><label class="ml-2"><%= rs.getString("muelle")%></label><br>
                        <strong>Grúa(s): </strong><label class="ml-2"><%= rs.getString("grua")%></label><br>
                        <strong>Fecha de cita: </strong><label class="ml-2"><%= rs.getString("fechaCita")%></label><br>
                        <strong>Hora de cita: </strong><label class="ml-2"><%= rs.getString("horaCita")%></label><br>
                        <strong>Hrs. en operacion: </strong><label class="ml-2"><%= rs.getString("hrsOp")%></label><br>
                        <strong>Fecha final: </strong><label class="ml-2"><%= rs.getString("fechaFinal")%></label><br>
                        <strong>Hora final: </strong><label class="ml-2"><%= rs.getString("horaFinal")%></label><br>
                        <strong>Servicio: </strong><label class="ml-2"><%= rs.getString("servicio")%></label>
                    </div>
                </div>
                <div class="card-footer">
                    <a href="numProveedores.jsp?ref=<%= rs.getString("referencia")%>" class="btn btn-outline-primary btn-block">ASIGNAR</a>
                    <hr>
                    <div class=" text-center">
                        <a href="Modificar.jsp?ref=<%= rs.getString("referencia")%>" class="btn btn-outline-warning" style="width: 48%;">MODIFICAR</a>
                        <a href="Eliminar.jsp?ref=<%= rs.getString("referencia")%>" class="btn btn-outline-danger" style="width: 48%;">ELIMINAR</a>
                    </div>
                </div>
            </div>
            <%

                    }

                }
            %>
        </div>
        <!-- ////////////////////////////SERVICIOS GENERADOS//////////////////////////// -->

        <!-- ////////////////////////////SERVICIOS ASIGNADOS//////////////////////////// -->
        <div class="contenedor-serAsignados">
            <h3>Servicios asignados</h3>
            <hr>
            <%
                if (numAsignaciones == 0) {
            %>
            <h3>No hay servicios asignados.</h3>
            <%
            } else {
                PreparedStatement ps1 = connect.prepareStatement("select * from servicios_asignados");
                ResultSet rs1 = ps1.executeQuery();

                while (rs1.next()) {

            %>
            <div class="card border-primary mr-4 my-2" style="float: left; width: 31%; height: 450px">
                <div class="card-header text-center"><%= rs1.getString("lloyd") + " // " + rs1.getString("uvi") + " - " + rs1.getString("referencia")%></div>
                <div class="card-body" id="bodyCard">
                    <div id="informacion" style="z-index: 2;">
                        <strong>Terminal: </strong><label class="ml-2"><%= rs1.getString("terminal")%></label><br>
                        <strong>Motonave: </strong><label class="ml-2"><%= rs1.getString("motonave")%></label><br>
                        <strong>Muelle: </strong><label class="ml-2"><%= rs1.getString("muelle")%></label><br>
                        <strong>Grúa(s): </strong><label class="ml-2"><%= rs1.getString("grua")%></label><br>
                        <strong>Fecha de cita: </strong><label class="ml-2"><%= rs1.getString("fechaCita")%></label><br>
                        <strong>Hora de cita: </strong><label class="ml-2"><%= rs1.getString("horaCita")%></label><br>
                        <strong>Hrs. en operacion: </strong><label class="ml-2"><%= rs1.getString("hrsOp")%></label><br>
                        <strong>Fecha final: </strong><label class="ml-2"><%= rs1.getString("fechaFinal")%></label><br>
                        <strong>Hora final: </strong><label class="ml-2"><%= rs1.getString("horaFinal")%></label><br>
                        <strong>Servicio: </strong><label class="ml-2"><%= rs1.getString("servicio")%></label><br>
                        <strong>Proveedor: </strong><label class="ml-2"><%= rs1.getString("proveedor")%></label><br>
                        <strong>Cantidad: </strong><label class="ml-2"><%= rs1.getInt("cantidad")%></label><br>
                        <strong>Observaciones: </strong><label class="ml-2"><%= rs1.getString("observaciones")%></label><br>
                        <strong>Hrs. totales: </strong><label class="ml-2"><%= rs1.getInt("hrsTotales")%></label>
                    </div>
                </div>
            </div>
            <%}
                }%>

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
                <div class="carta">
                <%                                
                    PreparedStatement pst = connect.prepareStatement("select * from servicios_asignados");
                    ResultSet rst = pst.executeQuery();
                                
                    while (rst.next()) {

                    String fecha = rst.getString("fechaCita");

                    String[] splits = fecha.split("-");

                    if (splits[1].equalsIgnoreCase("01")) {

                %>
                <div class="card border-primary mr-4 my-2" style="float: left; width: 31%; height: 450px">
                <div class="card-header text-center"><%= rst.getString(4) + " // " + rst.getString(5) + " - " + rst.getString(6)%></div>
                <div class="card-body" id="bodyCard">
                    <div id="informacion" style="z-index: 2;">
                        <strong>Terminal: </strong><label class="ml-2"><%= rst.getString(2)%></label><br>
                        <strong>Motonave: </strong><label class="ml-2"><%= rst.getString(3)%></label><br>
                        <strong>Muelle: </strong><label class="ml-2"><%= rst.getString(7)%></label><br>
                        <strong>Grua: </strong><label class="ml-2"><%= rst.getString(8)%></label><br>
                        <strong>Fecha de cita: </strong><label class="ml-2"><%= rst.getString(9)%></label><br>
                        <strong>Hora de cita: </strong><label class="ml-2"><%= rst.getString(10)%></label><br>
                        <strong>Hrs. en operacion: </strong><label class="ml-2"><%= rst.getString(11)%></label><br>
                        <strong>Fecha final: </strong><label class="ml-2"><%= rst.getString(12)%></label><br>
                        <strong>Hora final: </strong><label class="ml-2"><%= rst.getString(13)%></label><br>
                        <strong>Servicio: </strong><label class="ml-2"><%= rst.getString(14)%></label><br>
                        <strong>Proveedor: </strong><label class="ml-2"><%= rst.getString(15)%></label><br>
                        <strong>Cantidad: </strong><label class="ml-2"><%= rst.getInt(16)%></label><br>
                        <strong>Observaciones: </strong><label class="ml-2"><%= rst.getString(17)%></label><br>
                        <strong>Hrs. totales: </strong><label class="ml-2"><%= rst.getInt(18)%></label>
                    </div>
                </div>

            </div>
            <% } } %>
            </div>
            <div class="carta">
            <%                                
                    PreparedStatement pst1 = connect.prepareStatement("select * from servicios_asignados");
                    ResultSet rst1 = pst1.executeQuery();
                                
                                
                    while (rst1.next()) {

                    String fecha = rst1.getString("fechaCita");

                    String[] splits = fecha.split("-");

                    if (splits[1].equalsIgnoreCase("02")) {

                %>
                <div class="card border-primary mr-4 my-2" style="float: left; width: 31%; height: 450px">
                <div class="card-header text-center"><%= rst1.getString(4) + " // " + rst1.getString(5) + " - " + rst1.getString(6)%></div>
                <div class="card-body" id="bodyCard">
                    <div id="informacion" style="z-index: 2;">
                        <strong>Terminal: </strong><label class="ml-2"><%= rst1.getString(2)%></label><br>
                        <strong>Motonave: </strong><label class="ml-2"><%= rst1.getString(3)%></label><br>
                        <strong>Muelle: </strong><label class="ml-2"><%= rst1.getString(7)%></label><br>
                        <strong>Grua: </strong><label class="ml-2"><%= rst1.getString(8)%></label><br>
                        <strong>Fecha de cita: </strong><label class="ml-2"><%= rst1.getString(9)%></label><br>
                        <strong>Hora de cita: </strong><label class="ml-2"><%= rst1.getString(10)%></label><br>
                        <strong>Hrs. en operacion: </strong><label class="ml-2"><%= rst1.getString(11)%></label><br>
                        <strong>Fecha final: </strong><label class="ml-2"><%= rst1.getString(12)%></label><br>
                        <strong>Hora final: </strong><label class="ml-2"><%= rst1.getString(13)%></label><br>
                        <strong>Servicio: </strong><label class="ml-2"><%= rst1.getString(14)%></label><br>
                        <strong>Proveedor: </strong><label class="ml-2"><%= rst1.getString(15)%></label><br>
                        <strong>Cantidad: </strong><label class="ml-2"><%= rst1.getInt(16)%></label><br>
                        <strong>Observaciones: </strong><label class="ml-2"><%= rst1.getString(17)%></label><br>
                        <strong>Hrs. totales: </strong><label class="ml-2"><%= rst1.getInt(18)%></label>
                    </div>
                </div>

            </div>
            <% } } %>
        </div>
        <div class="carta">
                <%                                
                    PreparedStatement pst2 = connect.prepareStatement("select * from servicios_asignados");
                    ResultSet rst2 = pst2.executeQuery();
                                
                                
                    while (rst2.next()) {

                    String fecha = rst2.getString("fechaCita");

                    String[] splits = fecha.split("-");

                    if (splits[1].equalsIgnoreCase("03")) {

                %>
                <div class="card border-primary mr-4 my-2" style="float: left; width: 31%; height: 450px">
                <div class="card-header text-center"><%= rst2.getString(4) + " // " + rst2.getString(5) + " - " + rst2.getString(6)%></div>
                <div class="card-body" id="bodyCard">
                    <div id="informacion" style="z-index: 2;">
                        <strong>Terminal: </strong><label class="ml-2"><%= rst2.getString(2)%></label><br>
                        <strong>Motonave: </strong><label class="ml-2"><%= rst2.getString(3)%></label><br>
                        <strong>Muelle: </strong><label class="ml-2"><%= rst2.getString(7)%></label><br>
                        <strong>Grua: </strong><label class="ml-2"><%= rst2.getString(8)%></label><br>
                        <strong>Fecha de cita: </strong><label class="ml-2"><%= rst2.getString(9)%></label><br>
                        <strong>Hora de cita: </strong><label class="ml-2"><%= rst2.getString(10)%></label><br>
                        <strong>Hrs. en operacion: </strong><label class="ml-2"><%= rst2.getString(11)%></label><br>
                        <strong>Fecha final: </strong><label class="ml-2"><%= rst2.getString(12)%></label><br>
                        <strong>Hora final: </strong><label class="ml-2"><%= rst2.getString(13)%></label><br>
                        <strong>Servicio: </strong><label class="ml-2"><%= rst2.getString(14)%></label><br>
                        <strong>Proveedor: </strong><label class="ml-2"><%= rst2.getString(15)%></label><br>
                        <strong>Cantidad: </strong><label class="ml-2"><%= rst2.getInt(16)%></label><br>
                        <strong>Observaciones: </strong><label class="ml-2"><%= rst2.getString(17)%></label><br>
                        <strong>Hrs. totales: </strong><label class="ml-2"><%= rst2.getInt(18)%></label>
                    </div>
                </div>

            </div>
            <% } } %>
            </div>
            <div class="carta">
                <%                                
                    PreparedStatement pst3 = connect.prepareStatement("select * from servicios_asignados");
                    ResultSet rst3 = pst3.executeQuery();
                                
                                
                    while (rst3.next()) {

                    String fecha = rst3.getString("fechaCita");

                    String[] splits = fecha.split("-");

                    if (splits[1].equalsIgnoreCase("04")) {

                %>
                <div class="card border-primary mr-4 my-2" style="float: left; width: 31%; height: 450px">
                <div class="card-header text-center"><%= rst3.getString(4) + " // " + rst3.getString(5) + " - " + rst3.getString(6)%></div>
                <div class="card-body" id="bodyCard">
                    <div id="informacion" style="z-index: 2;">
                        <strong>Terminal: </strong><label class="ml-2"><%= rst3.getString(2)%></label><br>
                        <strong>Motonave: </strong><label class="ml-2"><%= rst3.getString(3)%></label><br>
                        <strong>Muelle: </strong><label class="ml-2"><%= rst3.getString(7)%></label><br>
                        <strong>Grua: </strong><label class="ml-2"><%= rst3.getString(8)%></label><br>
                        <strong>Fecha de cita: </strong><label class="ml-2"><%= rst3.getString(9)%></label><br>
                        <strong>Hora de cita: </strong><label class="ml-2"><%= rst3.getString(10)%></label><br>
                        <strong>Hrs. en operacion: </strong><label class="ml-2"><%= rst3.getString(11)%></label><br>
                        <strong>Fecha final: </strong><label class="ml-2"><%= rst3.getString(12)%></label><br>
                        <strong>Hora final: </strong><label class="ml-2"><%= rst3.getString(13)%></label><br>
                        <strong>Servicio: </strong><label class="ml-2"><%= rst3.getString(14)%></label><br>
                        <strong>Proveedor: </strong><label class="ml-2"><%= rst3.getString(15)%></label><br>
                        <strong>Cantidad: </strong><label class="ml-2"><%= rst3.getInt(16)%></label><br>
                        <strong>Observaciones: </strong><label class="ml-2"><%= rst3.getString(17)%></label><br>
                        <strong>Hrs. totales: </strong><label class="ml-2"><%= rst3.getInt(18)%></label>
                    </div>
                </div>

            </div>
            <% } } %>
            </div>
            <div class="carta">
                <%                                
                    PreparedStatement pst4 = connect.prepareStatement("select * from servicios_asignados");
                    ResultSet rst4 = pst4.executeQuery();
                                
                                
                    while (rst4.next()) {

                    String fecha = rst4.getString("fechaCita");

                    String[] splits = fecha.split("-");

                    if (splits[1].equalsIgnoreCase("05")) {

                %>
                <div class="card border-primary mr-4 my-2" style="float: left; width: 31%; height: 450px">
                <div class="card-header text-center"><%= rst4.getString(4) + " // " + rst4.getString(5) + " - " + rst4.getString(6)%></div>
                <div class="card-body" id="bodyCard">
                    <div id="informacion" style="z-index: 2;">
                        <strong>Terminal: </strong><label class="ml-2"><%= rst4.getString(2)%></label><br>
                        <strong>Motonave: </strong><label class="ml-2"><%= rst4.getString(3)%></label><br>
                        <strong>Muelle: </strong><label class="ml-2"><%= rst4.getString(7)%></label><br>
                        <strong>Grua: </strong><label class="ml-2"><%= rst4.getString(8)%></label><br>
                        <strong>Fecha de cita: </strong><label class="ml-2"><%= rst4.getString(9)%></label><br>
                        <strong>Hora de cita: </strong><label class="ml-2"><%= rst4.getString(10)%></label><br>
                        <strong>Hrs. en operacion: </strong><label class="ml-2"><%= rst4.getString(11)%></label><br>
                        <strong>Fecha final: </strong><label class="ml-2"><%= rst4.getString(12)%></label><br>
                        <strong>Hora final: </strong><label class="ml-2"><%= rst4.getString(13)%></label><br>
                        <strong>Servicio: </strong><label class="ml-2"><%= rst4.getString(14)%></label><br>
                        <strong>Proveedor: </strong><label class="ml-2"><%= rst4.getString(15)%></label><br>
                        <strong>Cantidad: </strong><label class="ml-2"><%= rst4.getInt(16)%></label><br>
                        <strong>Observaciones: </strong><label class="ml-2"><%= rst4.getString(17)%></label><br>
                        <strong>Hrs. totales: </strong><label class="ml-2"><%= rst4.getInt(18)%></label>
                    </div>
                </div>

            </div>
            <% } } %>
            </div>
            <div class="carta">
                <%                                
                    PreparedStatement pst5 = connect.prepareStatement("select * from servicios_asignados");
                    ResultSet rst5 = pst5.executeQuery();
                                
                                
                    while (rst5.next()) {

                    String fecha = rst5.getString("fechaCita");

                    String[] splits = fecha.split("-");

                    if (splits[1].equalsIgnoreCase("06")) {

                %>
                <div class="card border-primary mr-4 my-2" style="float: left; width: 31%; height: 450px">
                <div class="card-header text-center"><%= rst5.getString(4) + " // " + rst5.getString(5) + " - " + rst5.getString(6)%></div>
                <div class="card-body" id="bodyCard">
                    <div id="informacion" style="z-index: 2;">
                        <strong>Terminal: </strong><label class="ml-2"><%= rst5.getString(2)%></label><br>
                        <strong>Motonave: </strong><label class="ml-2"><%= rst5.getString(3)%></label><br>
                        <strong>Muelle: </strong><label class="ml-2"><%= rst5.getString(7)%></label><br>
                        <strong>Grua: </strong><label class="ml-2"><%= rst5.getString(8)%></label><br>
                        <strong>Fecha de cita: </strong><label class="ml-2"><%= rst5.getString(9)%></label><br>
                        <strong>Hora de cita: </strong><label class="ml-2"><%= rst5.getString(10)%></label><br>
                        <strong>Hrs. en operacion: </strong><label class="ml-2"><%= rst5.getString(11)%></label><br>
                        <strong>Fecha final: </strong><label class="ml-2"><%= rst5.getString(12)%></label><br>
                        <strong>Hora final: </strong><label class="ml-2"><%= rst5.getString(13)%></label><br>
                        <strong>Servicio: </strong><label class="ml-2"><%= rst5.getString(14)%></label><br>
                        <strong>Proveedor: </strong><label class="ml-2"><%= rst5.getString(15)%></label><br>
                        <strong>Cantidad: </strong><label class="ml-2"><%= rst5.getInt(16)%></label><br>
                        <strong>Observaciones: </strong><label class="ml-2"><%= rst5.getString(17)%></label><br>
                        <strong>Hrs. totales: </strong><label class="ml-2"><%= rst5.getInt(18)%></label>
                    </div>
                </div>

            </div>
            <% } } %>
            </div>
            <div class="carta">
                <%                                
                    PreparedStatement pst6 = connect.prepareStatement("select * from servicios_asignados");
                    ResultSet rst6 = pst6.executeQuery();
                                
                                
                    while (rst6.next()) {

                    String fecha = rst6.getString("fechaCita");

                    String[] splits = fecha.split("-");

                    if (splits[1].equalsIgnoreCase("07")) {

                %>
                <div class="card border-primary mr-4 my-2" style="float: left; width: 31%; height: 450px">
                <div class="card-header text-center"><%= rst6.getString(4) + " // " + rst6.getString(5) + " - " + rst6.getString(6)%></div>
                <div class="card-body" id="bodyCard">
                    <div id="informacion" style="z-index: 2;">
                        <strong>Terminal: </strong><label class="ml-2"><%= rst6.getString(2)%></label><br>
                        <strong>Motonave: </strong><label class="ml-2"><%= rst6.getString(3)%></label><br>
                        <strong>Muelle: </strong><label class="ml-2"><%= rst6.getString(7)%></label><br>
                        <strong>Grua: </strong><label class="ml-2"><%= rst6.getString(8)%></label><br>
                        <strong>Fecha de cita: </strong><label class="ml-2"><%= rst6.getString(9)%></label><br>
                        <strong>Hora de cita: </strong><label class="ml-2"><%= rst6.getString(10)%></label><br>
                        <strong>Hrs. en operacion: </strong><label class="ml-2"><%= rst6.getString(11)%></label><br>
                        <strong>Fecha final: </strong><label class="ml-2"><%= rst6.getString(12)%></label><br>
                        <strong>Hora final: </strong><label class="ml-2"><%= rst6.getString(13)%></label><br>
                        <strong>Servicio: </strong><label class="ml-2"><%= rst6.getString(14)%></label><br>
                        <strong>Proveedor: </strong><label class="ml-2"><%= rst6.getString(15)%></label><br>
                        <strong>Cantidad: </strong><label class="ml-2"><%= rst6.getInt(16)%></label><br>
                        <strong>Observaciones: </strong><label class="ml-2"><%= rst6.getString(17)%></label><br>
                        <strong>Hrs. totales: </strong><label class="ml-2"><%= rst6.getInt(18)%></label>
                    </div>
                </div>

            </div>
            <% } } %>
            </div>
            <div class="carta">
                <%                                
                    PreparedStatement pst7 = connect.prepareStatement("select * from servicios_asignados");
                    ResultSet rst7 = pst7.executeQuery();
                                
                                
                    while (rst7.next()) {

                    String fecha = rst7.getString("fechaCita");

                    String[] splits = fecha.split("-");

                    if (splits[1].equalsIgnoreCase("08")) {

                %>
                <div class="card border-primary mr-4 my-2" style="float: left; width: 31%; height: 450px">
                <div class="card-header text-center"><%= rst7.getString(4) + " // " + rst7.getString(5) + " - " + rst7.getString(6)%></div>
                <div class="card-body" id="bodyCard">
                    <div id="informacion" style="z-index: 2;">
                        <strong>Terminal: </strong><label class="ml-2"><%= rst7.getString(2)%></label><br>
                        <strong>Motonave: </strong><label class="ml-2"><%= rst7.getString(3)%></label><br>
                        <strong>Muelle: </strong><label class="ml-2"><%= rst7.getString(7)%></label><br>
                        <strong>Grua: </strong><label class="ml-2"><%= rst7.getString(8)%></label><br>
                        <strong>Fecha de cita: </strong><label class="ml-2"><%= rst7.getString(9)%></label><br>
                        <strong>Hora de cita: </strong><label class="ml-2"><%= rst7.getString(10)%></label><br>
                        <strong>Hrs. en operacion: </strong><label class="ml-2"><%= rst7.getString(11)%></label><br>
                        <strong>Fecha final: </strong><label class="ml-2"><%= rst7.getString(12)%></label><br>
                        <strong>Hora final: </strong><label class="ml-2"><%= rst7.getString(13)%></label><br>
                        <strong>Servicio: </strong><label class="ml-2"><%= rst7.getString(14)%></label><br>
                        <strong>Proveedor: </strong><label class="ml-2"><%= rst7.getString(15)%></label><br>
                        <strong>Cantidad: </strong><label class="ml-2"><%= rst7.getInt(16)%></label><br>
                        <strong>Observaciones: </strong><label class="ml-2"><%= rst7.getString(17)%></label><br>
                        <strong>Hrs. totales: </strong><label class="ml-2"><%= rst7.getInt(18)%></label>
                    </div>
                </div>

            </div>
            <% } } %>
            </div>
            <div class="carta">
                <%                                
                    PreparedStatement pst8 = connect.prepareStatement("select * from servicios_asignados");
                    ResultSet rst8 = pst8.executeQuery();
                                
                                
                    while (rst8.next()) {

                    String fecha = rst8.getString("fechaCita");

                    String[] splits = fecha.split("-");

                    if (splits[1].equalsIgnoreCase("09")) {

                %>
                <div class="card border-primary mr-4 my-2" style="float: left; width: 31%; height: 450px">
                <div class="card-header text-center"><%= rst8.getString(4) + " // " + rst8.getString(5) + " - " + rst8.getString(6)%></div>
                <div class="card-body" id="bodyCard">
                    <div id="informacion" style="z-index: 2;">
                        <strong>Terminal: </strong><label class="ml-2"><%= rst8.getString(2)%></label><br>
                        <strong>Motonave: </strong><label class="ml-2"><%= rst8.getString(3)%></label><br>
                        <strong>Muelle: </strong><label class="ml-2"><%= rst8.getString(7)%></label><br>
                        <strong>Grua: </strong><label class="ml-2"><%= rst8.getString(8)%></label><br>
                        <strong>Fecha de cita: </strong><label class="ml-2"><%= rst8.getString(9)%></label><br>
                        <strong>Hora de cita: </strong><label class="ml-2"><%= rst8.getString(10)%></label><br>
                        <strong>Hrs. en operacion: </strong><label class="ml-2"><%= rst8.getString(11)%></label><br>
                        <strong>Fecha final: </strong><label class="ml-2"><%= rst8.getString(12)%></label><br>
                        <strong>Hora final: </strong><label class="ml-2"><%= rst8.getString(13)%></label><br>
                        <strong>Servicio: </strong><label class="ml-2"><%= rst8.getString(14)%></label><br>
                        <strong>Proveedor: </strong><label class="ml-2"><%= rst8.getString(15)%></label><br>
                        <strong>Cantidad: </strong><label class="ml-2"><%= rst8.getInt(16)%></label><br>
                        <strong>Observaciones: </strong><label class="ml-2"><%= rst8.getString(17)%></label><br>
                        <strong>Hrs. totales: </strong><label class="ml-2"><%= rst8.getInt(18)%></label>
                    </div>
                </div>

            </div>
            <% } } %>
            </div>
            <div class="carta">
                <%                                
                    PreparedStatement pst9 = connect.prepareStatement("select * from servicios_asignados");
                    ResultSet rst9 = pst9.executeQuery();
                                
                                
                    while (rst9.next()) {

                    String fecha = rst9.getString("fechaCita");

                    String[] splits = fecha.split("-");

                    if (splits[1].equalsIgnoreCase("10")) {

                %>
                <div class="card border-primary mr-4 my-2" style="float: left; width: 31%; height: 450px">
                <div class="card-header text-center"><%= rst9.getString(4) + " // " + rst9.getString(5) + " - " + rst9.getString(6)%></div>
                <div class="card-body" id="bodyCard">
                    <div id="informacion" style="z-index: 2;">
                        <strong>Terminal: </strong><label class="ml-2"><%= rst9.getString(2)%></label><br>
                        <strong>Motonave: </strong><label class="ml-2"><%= rst9.getString(3)%></label><br>
                        <strong>Muelle: </strong><label class="ml-2"><%= rst9.getString(7)%></label><br>
                        <strong>Grua: </strong><label class="ml-2"><%= rst9.getString(8)%></label><br>
                        <strong>Fecha de cita: </strong><label class="ml-2"><%= rst9.getString(9)%></label><br>
                        <strong>Hora de cita: </strong><label class="ml-2"><%= rst9.getString(10)%></label><br>
                        <strong>Hrs. en operacion: </strong><label class="ml-2"><%= rst9.getString(11)%></label><br>
                        <strong>Fecha final: </strong><label class="ml-2"><%= rst9.getString(12)%></label><br>
                        <strong>Hora final: </strong><label class="ml-2"><%= rst9.getString(13)%></label><br>
                        <strong>Servicio: </strong><label class="ml-2"><%= rst9.getString(14)%></label><br>
                        <strong>Proveedor: </strong><label class="ml-2"><%= rst9.getString(15)%></label><br>
                        <strong>Cantidad: </strong><label class="ml-2"><%= rst9.getInt(16)%></label><br>
                        <strong>Observaciones: </strong><label class="ml-2"><%= rst9.getString(17)%></label><br>
                        <strong>Hrs. totales: </strong><label class="ml-2"><%= rst9.getInt(18)%></label>
                    </div>
                </div>

            </div>
            <% } } %>
            </div>
            <div class="carta">
                <%                                
                    PreparedStatement pst10 = connect.prepareStatement("select * from servicios_asignados");
                    ResultSet rst10 = pst10.executeQuery();
                                
                                
                    while (rst10.next()) {

                    String fecha = rst10.getString("fechaCita");

                    String[] splits = fecha.split("-");

                    if (splits[1].equalsIgnoreCase("11")) {

                %>
                <div class="card border-primary mr-4 my-2" style="float: left; width: 31%; height: 450px">
                <div class="card-header text-center"><%= rst10.getString(4) + " // " + rst10.getString(5) + " - " + rst10.getString(6)%></div>
                <div class="card-body" id="bodyCard">
                    <div id="informacion" style="z-index: 2;">
                        <strong>Terminal: </strong><label class="ml-2"><%= rst10.getString(2)%></label><br>
                        <strong>Motonave: </strong><label class="ml-2"><%= rst10.getString(3)%></label><br>
                        <strong>Muelle: </strong><label class="ml-2"><%= rst10.getString(7)%></label><br>
                        <strong>Grua: </strong><label class="ml-2"><%= rst10.getString(8)%></label><br>
                        <strong>Fecha de cita: </strong><label class="ml-2"><%= rst10.getString(9)%></label><br>
                        <strong>Hora de cita: </strong><label class="ml-2"><%= rst10.getString(10)%></label><br>
                        <strong>Hrs. en operacion: </strong><label class="ml-2"><%= rst10.getString(11)%></label><br>
                        <strong>Fecha final: </strong><label class="ml-2"><%= rst10.getString(12)%></label><br>
                        <strong>Hora final: </strong><label class="ml-2"><%= rst10.getString(13)%></label><br>
                        <strong>Servicio: </strong><label class="ml-2"><%= rst10.getString(14)%></label><br>
                        <strong>Proveedor: </strong><label class="ml-2"><%= rst10.getString(15)%></label><br>
                        <strong>Cantidad: </strong><label class="ml-2"><%= rst10.getInt(16)%></label><br>
                        <strong>Observaciones: </strong><label class="ml-2"><%= rst10.getString(17)%></label><br>
                        <strong>Hrs. totales: </strong><label class="ml-2"><%= rst10.getInt(18)%></label>
                    </div>
                </div>

            </div>
            <% } } %>
            </div>
            <div class="carta">
                <%                                
                    PreparedStatement pst11= connect.prepareStatement("select * from servicios_asignados");
                    ResultSet rst11 = pst11.executeQuery();
                                
                                
                    while (rst11.next()) {

                    String fecha = rst11.getString("fechaCita");

                    String[] splits = fecha.split("-");

                    if (splits[1].equalsIgnoreCase("12")) {

                %>
                <div class="card border-primary mr-4 my-2" style="float: left; width: 31%; height: 450px">
                <div class="card-header text-center"><%= rst11.getString(4) + " // " + rst11.getString(5) + " - " + rst11.getString(6)%></div>
                <div class="card-body" id="bodyCard">
                    <div id="informacion" style="z-index: 2;">
                        <strong>Terminal: </strong><label class="ml-2"><%= rst11.getString(2)%></label><br>
                        <strong>Motonave: </strong><label class="ml-2"><%= rst11.getString(3)%></label><br>
                        <strong>Muelle: </strong><label class="ml-2"><%= rst11.getString(7)%></label><br>
                        <strong>Grua: </strong><label class="ml-2"><%= rst11.getString(8)%></label><br>
                        <strong>Fecha de cita: </strong><label class="ml-2"><%= rst11.getString(9)%></label><br>
                        <strong>Hora de cita: </strong><label class="ml-2"><%= rst11.getString(10)%></label><br>
                        <strong>Hrs. en operacion: </strong><label class="ml-2"><%= rst11.getString(11)%></label><br>
                        <strong>Fecha final: </strong><label class="ml-2"><%= rst11.getString(12)%></label><br>
                        <strong>Hora final: </strong><label class="ml-2"><%= rst11.getString(13)%></label><br>
                        <strong>Servicio: </strong><label class="ml-2"><%= rst11.getString(14)%></label><br>
                        <strong>Proveedor: </strong><label class="ml-2"><%= rst11.getString(15)%></label><br>
                        <strong>Cantidad: </strong><label class="ml-2"><%= rst11.getInt(16)%></label><br>
                        <strong>Observaciones: </strong><label class="ml-2"><%= rst11.getString(17)%></label><br>
                        <strong>Hrs. totales: </strong><label class="ml-2"><%= rst11.getInt(18)%></label>
                    </div>
                </div>

            </div>
            <% } } %>
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

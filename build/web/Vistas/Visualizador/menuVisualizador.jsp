<%-- 
    Document   : menuSeleccionador
    Created on : 4/04/2019, 03:16:21 PM
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
        <link rel="stylesheet" type="text/css" href="CSS/estilos.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

        <!-- SCRIPTS -->
        <script src="../../JS/jquery-3.1.1.min.js"></script>
        <script src="../../JS/bootstrap.min.js"></script>
        <script src="../../JS/sweetalert.min.js"></script>
        <script src="JS/appMenu.js"></script>

        <title>SeaPORT R&E</title>
    </head>
    <body>
        <!-- ////////////////////////////BARRA SUPERIOR//////////////////////////// -->
        <nav>
            <div id="empresa">
                <h1>SPRC</h1>
            </div>
            <div id="titulo">
                <h4 class="ml-4">Bienvenido al menu del visualizador</h4>
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
        <br><br><br><br><br>
        <!--//////////////////////////////// MENU SUPERIOR //////////////////////////////// -->
        <div class="container-fluid">
            <label class="activado" id="pri">Servicios generados</label>
            <label class="" id="seg">Servicios asignados</label>
        </div>
        <hr>
        <!--//////////////////////////////// MENU SUPERIOR //////////////////////////////// -->

        <!--///////////////////////////// SERVICIOS GENERADOS ///////////////////////////// -->
        <div class="container-fluid" id="serGenerados">

            <%
                Connection connect = ConexionBD.connect();
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
            </div>
            <%}%>
        </div>
        <!--///////////////////////////// SERVICIOS GENERADOS ///////////////////////////// -->

        <!--///////////////////////////// SERVICIOS ASIGNADOS ///////////////////////////// -->
        <div class="container-fluid" id="serAsignados">
            <%
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
                        <strong>Grua: </strong><label class="ml-2"><%= rs1.getString("grua")%></label><br>
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
            <%}%>
        </div>
        <!--///////////////////////////// SERVICIOS ASIGNADOS ///////////////////////////// -->
    </body>
</html>

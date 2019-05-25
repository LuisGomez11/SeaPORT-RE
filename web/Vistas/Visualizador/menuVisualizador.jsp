<%-- 
    Document   : menuSeleccionador
    Created on : 4/04/2019, 03:16:21 PM
    Author     : E201
--%>

<%@page import="Config.OpcionesServicios"%>
<%@page import="Config.OpcionesEntidades"%>
<%@page import="Modelos.Proveedores"%>
<%@page import="Config.OpcionesProveedor"%>
<%@page import="Config.OpcionesAsignados"%>
<%@page import="Modelos.serAsignados"%>
<%@page import="Modelos.serGenerados"%>
<%@page import="Config.OpcionesGenerados"%>
<%@page import="java.util.List"%>
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
        <nav style="z-index: 2000">
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
                
                List<serGenerados> listaGen = OpcionesGenerados.listar();
                   
                for (serGenerados dato : listaGen) {

                %>

                <div class="col-lg-4 my-2" id="carAsi">
                    <div class="card border-primary">
                        <div class="card-header text-center"><%= dato.getLloyd() + " // " + dato.getUvi() + " - " + dato.getReferencia()%></div>
                        <div class="card-body" id="bodyCard">
                            <strong>Terminal: </strong><label class="ml-2"><%= dato.getTerminal()%></label><br>
                            <strong>Id motonave: </strong><label class="ml-1"><%= dato.getId_entidadM() %></label><br>
                            <strong>Muelle: </strong><label class="ml-2"><%= dato.getMuelle()%></label><br>
                            <strong>Id grua: </strong><label class="ml-2"><%= dato.getId_entidadG() %></label><br>
                            <strong>Fecha de cita: </strong><label class="ml-2"><%= dato.getFechaCita()%></label><br>
                            <strong>Hora de cita: </strong><label class="ml-2"><%= dato.getHoraCita()%></label><br>
                            <strong>Hrs. en operacion: </strong><label class="ml-2"><%= dato.getHrsOpe()%></label><br>
                            <strong>Fecha final: </strong><label class="ml-2"><%= dato.getFechaFinal()%></label><br>
                            <strong>Hora final: </strong><label class="ml-2"><%= dato.getHoraFinal()%></label><br>
                            <strong>Id servicio: </strong><label class="ml-2"><%= dato.getId_servicio() %></label>
                        </div>
                    </div>
                </div>
                <%  }   %>
        </div>
        <!--///////////////////////////// SERVICIOS GENERADOS ///////////////////////////// -->

        <!--///////////////////////////// SERVICIOS ASIGNADOS ///////////////////////////// -->
        <div class="container-fluid" id="serAsignados">
            
                <%
                    List<serAsignados> listaAsi = OpcionesAsignados.listar();
                String ref = "";
                int pri = 1;
                int id_moto, id_grua, id_ser;

            String moto, grua, servi;

            %>

            <div class="row w-100 h-auto">

                <%                    
                    for (serAsignados dato : listaAsi) {

                        serGenerados gene = OpcionesGenerados.mostrarServi(dato.getReferencia());
                                Proveedores p = OpcionesProveedor.mostrarProv(dato.getCod_proveedor());
                                String fecha = gene.getFechaCita();
                                id_moto = gene.getId_entidadM();
                                id_grua = gene.getId_entidadG();
                                id_ser = gene.getId_servicio();
                                moto = OpcionesEntidades.mostrarEnti(id_moto);
                                grua = OpcionesEntidades.mostrarEnti(id_grua);
                                servi = OpcionesServicios.mostrarServi(id_ser);
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
                                <div class="card-header text-center"><%= gene.getLloyd() + " // " + gene.getUvi() + " - " + dato.getReferencia()%></div>
                                <div class="card-body" id="bodyCard">
                                    <strong>Terminal: </strong><label class="ml-2"><%= gene.getTerminal()%></label><br>
                                    <strong>Motonave: </strong><label class="ml-1"><%= moto %></label><br>
                                    <strong>Muelle: </strong><label class="ml-2"><%= gene.getMuelle()%></label><br>
                                    <strong>Grúa(s): </strong><label class="ml-2"><%= grua %></label><br>
                                    <strong>Fecha de cita: </strong><label class="ml-2"><%= gene.getFechaCita()%></label><br>
                                    <strong>Hora de cita: </strong><label class="ml-2"><%= gene.getHoraCita()%></label><br>
                                    <strong>Hrs. en operacion: </strong><label class="ml-2"><%= gene.getHrsOpe()%></label><br>
                                    <strong>Fecha final: </strong><label class="ml-2"><%= gene.getFechaFinal()%></label><br>
                                    <strong>Hora final: </strong><label class="ml-2"><%= gene.getHoraFinal()%></label><br>
                                    <strong>Servicio: </strong><label class="ml-2"><%= servi %></label><br>
                                    <strong>Proveedor: </strong><label class="ml-2"><%= p.getNombre() %></label><br>
                                    <strong>Cantidad de trabajadores: </strong><label class="ml-2"><%= dato.getCantidad()%></label><br>
                                    <strong>Observaciones: </strong><label class="ml-2"><%= dato.getObservaciones()%></label><br>
                                    <strong>Hrs. totales: </strong><label class="ml-2"><%= dato.getHorasTotales()%></label>
                                </div>

                            </div>
                        </div>
                <%}%>
            </div>
            </div>
        <!--///////////////////////////// SERVICIOS ASIGNADOS ///////////////////////////// -->
    </body>
</html>

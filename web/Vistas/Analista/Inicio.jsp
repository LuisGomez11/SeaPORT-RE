<%-- 
    Document   : Inicio
    Created on : 28/04/2019, 08:17:31 PM
    Author     : Luis Alberto Gomez
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Config.OpcionesAsignados"%>
<%@page import="Modelos.serAsignados"%>
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
        <script src="CSS - JS/JS/app.js"></script>

        <title>SeaPORT R&E</title>
    </head>
    <body>

        <%
          
            //LISTAS            
            List<serGenerados> listaGen = OpcionesGenerados.listar();
            List<serAsignados> listaAsi = OpcionesAsignados.listar();

            int numServicios = OpcionesGenerados.numGenerados();
            int numAsignaciones = OpcionesAsignados.numAsignados();
            
            int contador = 0;
            int contador1 = 0;
            
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
                <li><a href="#" class="activado" id="inicio"><i class="fas fa-home"></i><span>Inicio</span></a></li>
                <li><a href="Servicio.jsp" class="" id="primera"><i class="fas fa-plus-circle"></i><span>Agregar servicio</span></a></li>
                <li><a href="Entidades.jsp" class="" id="segunda"><i class="fas fa-truck"></i><span>Entidades fisicas</span></a></li>
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

        <!-- ////////////////////////////INICIO//////////////////////////// -->
        <div class="contenedor-inicio">
            <h3>Inicio</h3>
            <hr>
            <div class="container-fluid row">
                <div class="col-lg-6 mb-3">
                    <div class="serGenerados"><!--serGenerados-->
                        <div class="contImagen1"><i class="fas fa-clipboard"></i></div>
                        <div class="texto1">
                            <h1><%= numServicios%></h1>
                            <h5>Servicios Generados</h5>
                        </div>
                    </div>
                </div> 
                <div class="col-lg-6">
                    <div class="serAsignados"><!--serAsignados-->
                        <div class="contImagen2"><i class="fas fa-clipboard-check"></i></div>
                        <div class="texto2">
                            <h1><%= numAsignaciones%></h1>
                            <h5>Servicios Asignados</h5>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="ultNovedades">
                <h3>Ultimas novedades</h3>
                <br>
                <div class="container-fluid row">
                    <div class="col-lg-6 mb-4">
                        <div class="serGenerados1">
                            <h4>Servicios generados</h4>
                            <br>
                            <div class="table-responsive">
                                <center>
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
                                                for (serGenerados dato : listaGen) {
                                            %>
                                            <tr>
                                                <td><%= dato.getTerminal()%></td>
                                                <td><%= dato.getLloyd() + " // " + dato.getUvi() + " - " + dato.getReferencia()%></td>
                                                <td><%= dato.getHrsOpe()%></td>
                                                <td><%= dato.getId_servicio() %></td>
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
                                </center>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="serAsignados1">
                            <h4>Servicios asignados</h4>
                            <br>
                            <div class="table-responsive"  >
                                <center>
                                    <table class="table table-bordered tablaInicio">
                                        <thead>
                                            <tr>
                                                <th>Codigo</th>
                                                <th>Referencia</th>
                                                <th>Cod. Proveedor</th>
                                                <th>Hrs. Totales</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                for (serAsignados dato : listaAsi) {

                                            %>
                                            <tr>

                                                <td><%= dato.getCodigo()%></td>
                                                <td><%= dato.getReferencia() %></td>
                                                <td><%= dato.getCod_proveedor() %></td>
                                                <td><%= dato.getHorasTotales()%></td>
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
                                </center>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ////////////////////////////INICIO//////////////////////////// -->
    </body>
</html>

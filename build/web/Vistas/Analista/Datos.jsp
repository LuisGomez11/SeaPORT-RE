<%-- 
    Document   : Datos
    Created on : 28/04/2019, 09:44:01 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Config.OpcionesAsignados"%>
<%@page import="Modelos.serAsignados"%>
<%@page import="Modelos.serGenerados"%>
<%@page import="java.util.List"%>
<%@page import="Config.OpcionesGenerados"%>
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
        
            OpcionesAsignados.estado(listaGen, listaAsi);
            
            int enero = OpcionesAsignados.numInformes("01");
            int febre = OpcionesAsignados.numInformes("02");
            int marzp = OpcionesAsignados.numInformes("03");
            int abril = OpcionesAsignados.numInformes("04");
            int mayo = OpcionesAsignados.numInformes("05");
            int junio = OpcionesAsignados.numInformes("06");
            int julio = OpcionesAsignados.numInformes("07");
            int agosto = OpcionesAsignados.numInformes("08");
            int sept = OpcionesAsignados.numInformes("09");
            int oct = OpcionesAsignados.numInformes("10");
            int nov = OpcionesAsignados.numInformes("11");
            int dic = OpcionesAsignados.numInformes("12");
        
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
                <li><a href="Informes.jsp" class="" id="sexta"><i class="fas fa-calendar-alt"></i><span>Informes</span></a></li>
                <li><a href="#" class="activado" id="septima"><i class="fas fa-chart-pie"></i><span>Datos estadisticos</span></a></li>
                <li><a href="Proveedores.jsp" class="" id="octava"><i class="fas fa-address-book"></i><span>Consultar proveedores</span></a></li>
            </ul>
        </div>
        <!-- ////////////////////////////MENU LATERAL//////////////////////////// -->

        <a href="" class="btn-menu">Menu <i class="icon fas fa-bars"></i></a>
        
        <!-- ////////////////////////////DATOS ESTADISTICOS//////////////////////////// -->
        <div class="contenedor-estadisticos">
            <h3>Datos estadisticos</h3>
            <hr>
            <canvas id="myChart" width="400" height="400"></canvas>
        </div>
        
        <div>
                <input type="hidden" id="enero" value="<%= enero %>"><input type="hidden" id="febrero" value="<%= febre %>">
                <input type="hidden" id="marzo" value="<%= marzp %>"><input type="hidden" id="abril" value="<%= abril %>">
                <input type="hidden" id="mayo" value="<%= mayo %>"><input type="hidden" id="junio" value="<%= junio %>">
                <input type="hidden" id="julio" value="<%= julio %>"><input type="hidden" id="agosto" value="<%= agosto %>">
                <input type="hidden" id="septiembre" value="<%= sept %>"><input type="hidden" id="octubre" value="<%= oct %>">
                <input type="hidden" id="noviembre" value="<%= nov %>"><input type="hidden"  id="diciembre"value="<%= dic %>">
            </div>
        <!-- ////////////////////////////DATOS ESTADISTICOS//////////////////////////// -->

        <!-- SCRIPT GRAFICAS -->
        <script src="CSS - JS/JS/graficas.js"></script>
    </body>
</html>

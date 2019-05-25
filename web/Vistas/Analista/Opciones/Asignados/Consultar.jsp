<%-- 
    Document   : Consultar
    Created on : 23/05/2019, 02:19:53 PM
    Author     : Luis Alberto Gomez
--%>

<%@page import="Config.OpcionesProveedor"%>
<%@page import="Modelos.Proveedores"%>
<%@page import="Config.OpcionesServicios"%>
<%@page import="Config.OpcionesEntidades"%>
<%@page import="Config.OpcionesGenerados"%>
<%@page import="Modelos.serGenerados"%>
<%@page import="java.util.List"%>
<%@page import="Config.OpcionesAsignados"%>
<%@page import="Modelos.serAsignados"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <!-- METAS -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximun-scale=1.0, minimun-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <!-- ICONO VENTANA -->
        <link rel="icon" href="../../../../IMG/version-para-favicon.png">

        <!-- ESTILOS -->
        <link rel="stylesheet" href="../../../../CSS/animate.css">
        <link rel="stylesheet" type="text/css" href="../../../../CSS/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../../CSS - JS/CSS/styles.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

        <!-- SCRIPTS -->
        <script src="../../../../JS/jquery-3.1.1.min.js"></script>
        <script src="../../../../JS/bootstrap.min.js"></script>
        <script src="../../../../JS/sweetalert.min.js"></script>
        <script src="../../CSS - JS/JS/app.js"></script>

        <title>SeaPORT R&E</title>
    </head>
    <body>
        <img src="../../../../IMG/slider-background2.jpg">
        <%
        
            int cod = Integer.parseInt(request.getParameter("cod"));
            int id_moto;
            int id_grua;
            int id_ser;
            
            String moto,grua,servi;
            List<serAsignados> lista = OpcionesAsignados.mostrarAsi(cod);
            
            for(serAsignados dato : lista){
                
                serGenerados gen = OpcionesGenerados.mostrarServi(dato.getReferencia());
                Proveedores p = OpcionesProveedor.mostrarProv(dato.getCod_proveedor());
                id_moto = gen.getId_entidadM();
                id_grua = gen.getId_entidadG();
                id_ser = gen.getId_servicio();
                moto = OpcionesEntidades.mostrarEnti(id_moto);
                grua = OpcionesEntidades.mostrarEnti(id_grua);
                servi = OpcionesServicios.mostrarServi(id_ser);
        
        %>
        <div class="formOpcio container p-5">
            <h1 class="text-center">Informacion del servicio generado</h1><hr>
            <div class="row">
                    <div class="form-group col-md-4">
                        <label for="term">Terminal</label>
                        <input class="form-control" type="text" readonly value="<%= gen.getTerminal() %>">
                    </div>
                    <div class="form-group col-md-8">
                        <label for="moto">Motonave / Frente de servicio</label>
                        <input class="form-control" readonly type="text" value="<%= moto %>">
                    </div>
                    <div class="form-group col-md-4">
                        <label for="lloyd">Lloyd-Escala</label>
                        <input type="text" maxlength="5" class="form-control" value="<%= gen.getLloyd() %>" id="lloyd" name="lloyd" readonly>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="uvi">UVI</label>
                        <input type="text" maxlength="4" class="form-control" value="<%= gen.getUvi() %>" id="uvi" name="uvi" readonly>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="referencia">Referencia</label>
                        <input type="text" maxlength="4" class="form-control" readonly value="<%= gen.getReferencia() %>" id="referencia" name="referencia" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="muelle">Muelle</label>
                        <input class="form-control" type="text" readonly value="<%= gen.getMuelle() %>">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="grua">Grúa</label>
                        <input class="form-control" type="text" readonly value="<%= grua %>">
                    </div>
                    <div class="form-group col-md-4">
                        <label for="fechaCita">Fecha de citación</label>
                        <input type="text" class="form-control" name="fechaCita" value="<%= gen.getFechaCita() %>" id="fechaInicio" readonly>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="horaCita">Hora de citación</label>
                        <input type="text" class="form-control" name="horaCita" value="<%= gen.getHoraCita() %>" id="horaInicio" readonly>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="horasOp">Hrs. Operación</label>
                        <input type="text" id="hrsOp" class="form-control" value="<%= gen.getHrsOpe() %>" name="horasOp" readonly>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="fechaCita">Fecha de finalización</label>
                        <input type="text" class="form-control" name="fechaFinal" value="<%= gen.getFechaFinal() %>" id="fechaFinal" readonly>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="horaCita">Hora de finalización</label>
                        <input type="text" class="form-control" name="horaFinal" value="<%= gen.getHoraFinal() %>" id="horaFinal" readonly>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="servicio">Servicio</label>
                        <input class="form-control" readonly type="text" value="<%= servi %>">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="proveedor">Proveedor</label>
                        <input class="form-control" readonly type="text" value="<%= p.getNombre() %>">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="cantidad">Cantidad de trabajadores</label>
                        <input class="form-control" readonly type="text" value="<%= dato.getCantidad() %>">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="observaciones">Observaciones</label>
                        <input class="form-control" readonly type="text" value="<%= dato.getObservaciones() %>">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="hrsTotales">Horas totales</label>
                        <input class="form-control" readonly type="text" value="<%= dato.getHorasTotales() %>">
                    </div>
                </div>
                    <hr>
                <div class="botones1">
                    <a href="../../Asignados.jsp" class="btn btn-danger">VOLVER</a>
                </div>
        </div>
        <% } %>
    </body>
</html>

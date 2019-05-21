<%-- 
    Document   : Modificar
    Created on : 29/03/2019, 08:09:55 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="Config.OpcionesGenerados"%>
<%@page import="Modelos.serGenerados"%>
<%@page import="Config.OpcionesEntidades"%>
<%@page import="Modelos.Entidades"%>
<%@page import="Config.OpcionesServicios"%>
<%@page import="Modelos.Servicios"%>
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

            String ref = request.getParameter("ref");
            
            List<serGenerados> listaGen = OpcionesGenerados.mostrarSer(ref);
            List<Servicios> listaSer = OpcionesServicios.listar();
            List<Entidades> listaMoto = OpcionesEntidades.listarMoto();
            List<Entidades> listaGrua = OpcionesEntidades.listarGrua();
            
            for(serGenerados dato : listaGen){
                
                String gruas = dato.getGrua();
            
                String grua1 = "N/A";
                String grua2 = "N/A";
                String grua3 = "N/A";
                String grua4 = "N/A";

                String[]grua =gruas.split(" ");

                if(grua.length==1){
                    grua1 = grua[0];
                } else if(grua.length==2){
                    grua1 = grua[0];
                    grua2 = grua[1];
                } else if(grua.length==3){
                    grua1 = grua[0];
                    grua2 = grua[1];
                    grua3 = grua[2];
                } else{
                    grua1 = grua[0];
                    grua2 = grua[1];
                    grua3 = grua[2];
                    grua4 = grua[3];
                }

        %>
        <div class="formOpcio container p-5">
            <form method="POST" autocomplete="off" action="../../../../ControlServicios?opc=mod">
                <h1 class="text-center">Modificar servicio generado</h1><hr>
                <div class="row">
                    <div class="form-group col-md-4">
                        <label for="term">Terminal</label>
                        <select class="form-control" name="term">
                            <option><%= dato.getTerminal() %></option>
                            <option>SPRC</option>
                            <option>CTC</option>
                        </select>
                    </div>
                    <div class="form-group col-md-8">
                        <label for="moto">Motonave / Frente de servicio</label>
                        <select class="form-control" name="moto">
                            <option><%= dato.getMotonave() %></option>
                            <%
                                for (Entidades datom : listaMoto) {
                            %>
                            <option><%= datom.getNombre()%></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="lloyd">Lloyd-Escala</label>
                        <input type="text" maxlength="5" class="form-control" value="<%= dato.getLloyd() %>" id="lloyd" name="lloyd" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="uvi">UVI</label>
                        <input type="text" maxlength="4" class="form-control" value="<%= dato.getUvi() %>" id="uvi" name="uvi" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="referencia">Referencia</label>
                        <input type="text" maxlength="4" class="form-control" readonly value="<%= dato.getReferencia() %>" id="referencia" name="referencia" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="muelle">Muelle</label>
                        <select class="form-control" name="muelle">
                            <option><%= dato.getMuelle() %></option>
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
                            <option><%= grua1%></option>
                            <option>N/A</option>
                            <%
                                for (Entidades datog : listaGrua) {
                            %>
                            <option><%= datog.getNombre()%></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="grua">Grúa 2</label>
                        <select class="form-control" name="grua2">
                            <option><%= grua2%></option>
                            <option>N/A</option>
                            <%
                                for (Entidades datog : listaGrua) {
                            %>
                            <option><%= datog.getNombre()%></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="grua">Grúa 3</label>
                        <select class="form-control" name="grua3">
                            <option><%= grua3%></option>
                            <option>N/A</option>
                            <%
                                for (Entidades datog : listaGrua) {
                            %>
                            <option><%= datog.getNombre()%></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="grua">Grúa 4</label>
                        <select class="form-control" name="grua4">
                            <option><%= grua4%></option>
                            <option>N/A</option>
                            <%
                                for (Entidades datog : listaGrua) {
                            %>
                            <option><%= datog.getNombre()%></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="fechaCita">Fecha de citación</label>
                        <input type="date" class="form-control" name="fechaCita" value="<%= dato.getFechaCita() %>" id="fechaInicio" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="horaCita">Hora de citación</label>
                        <input type="time" class="form-control" name="horaCita" value="<%= dato.getHoraCita() %>" id="horaInicio" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="horasOp">Hrs. Operación</label>
                        <input type="number" id="hrsOp" class="form-control" value="<%= dato.getHrsOpe() %>" name="horasOp" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="fechaCita">Fecha de finalización</label>
                        <input type="date" class="form-control" name="fechaFinal" value="<%= dato.getFechaFinal() %>" id="fechaFinal" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="horaCita">Hora de finalización</label>
                        <input type="time" class="form-control" name="horaFinal" value="<%= dato.getHoraFinal() %>" id="horaFinal" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="servicio">Servicio</label>
                        <select class="form-control" name="servicio">
                            <option><%= dato.getServicio() %></option>
                            <%
                                for (Servicios datos : listaSer) {
                            %>
                            <option><%= datos.getNombre()%></option>
                            <% } %>
                        </select>
                    </div>
                </div>
                <br>
                <div class="botones1">
                    <a href="../../Generados.jsp" class="btn btn-danger">CANCELAR</a>
                    <input type="submit" value="MODIFICAR" class="btn btn-primary ml-2" id="modificar">
                </div>
            </form>
            
        </div>
        <%}%>
    </body>
</html>

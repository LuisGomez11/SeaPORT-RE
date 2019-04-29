<%-- 
    Document   : Modificar
    Created on : 29/03/2019, 08:09:55 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

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
        <link rel="stylesheet" type="text/css" href="../../CSS - JS/CSS/estilos.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

        <!-- SCRIPTS -->
        <script src="../../../../JS/jquery-3.1.1.min.js"></script>
        <script src="../../../../JS/bootstrap.min.js"></script>
        <script src="../../../../JS/sweetalert.min.js"></script>
        <script src="../../CSS - JS/JS/appMenu.js"></script>

        <title>SeaPORT R&E</title>
    </head>
    <body>
        <nav id="navMod">
            <div id="empresa">
                <h1>SPRC</h1>
            </div>
            <div id="titulo">
                <h4 class="ml-4">Modificar servicio</h4>
            </div>
        </nav>
        <!-- ////////////////////////////BARRA SUPERIOR//////////////////////////// -->
        <br><br><br><br><br>
        <%
            Connection connect = ConexionBD.connect();
            int ref = Integer.parseInt(request.getParameter("ref"));
            PreparedStatement ps = connect.prepareStatement("select * from servicios_generados where referencia=" + ref);
            ResultSet rs = ps.executeQuery();
            
            List<Servicios> listaSer = OpcionesServicios.listar();
            List<Entidades> listaMoto = OpcionesEntidades.listarMoto();
            List<Entidades> listaGrua = OpcionesEntidades.listarGrua();
            
            while(rs.next()){
                
                String gruas = rs.getString("grua");
            
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
        <div class="container">
            <form method="POST" autocomplete="off" action="../../../../ControlServicios?opc=mod">
                <div class="row">
                    <div class="form-group col-md-4">
                        <label for="term">Terminal</label>
                        <select class="form-control" name="term">
                            <option><%= rs.getString("terminal")%></option>
                            <option>SPRC</option>
                            <option>CTC</option>
                        </select>
                    </div>
                    <div class="form-group col-md-8">
                        <label for="moto">Motonave / Frente de servicio</label>
                        <select class="form-control" name="moto">
                            <option><%= rs.getString("motonave")%></option>
                            <%
                                for (Entidades dato : listaMoto) {
                            %>
                            <option><%= dato.getNombre()%></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="lloyd">Lloyd-Escala</label>
                        <input type="text" maxlength="5" class="form-control" value="<%= rs.getString("lloyd")%>" id="lloyd" name="lloyd" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="uvi">UVI</label>
                        <input type="number" maxlength="4" class="form-control" value="<%= rs.getInt("uvi")%>" id="uvi" name="uvi" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="referencia">Referencia</label>
                        <input type="number" maxlength="4" class="form-control" value="<%= rs.getInt("referencia")%>" id="referencia" name="referencia" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="muelle">Muelle</label>
                        <select class="form-control" name="muelle">
                            <option><%= rs.getString("muelle")%></option>
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
                                for (Entidades dato : listaGrua) {
                            %>
                            <option><%= dato.getNombre()%></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="grua">Grúa 2</label>
                        <select class="form-control" name="grua2">
                            <option><%= grua2%></option>
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
                            <option><%= grua3%></option>
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
                            <option><%= grua4%></option>
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
                        <input type="date" class="form-control" name="fechaCita" value="<%= rs.getString("fechaCita")%>" id="fechaInicio" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="horaCita">Hora de citación</label>
                        <input type="time" class="form-control" name="horaCita" value="<%= rs.getString("horaCita")%>" id="horaInicio" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="horasOp">Hrs. Operación</label>
                        <input type="number" id="hrsOp" class="form-control" value="<%= rs.getString("hrsOp")%>" name="horasOp" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="fechaCita">Fecha de finalización</label>
                        <input type="date" class="form-control" name="fechaFinal" value="<%= rs.getString("fechaFinal")%>" id="fechaFinal" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="horaCita">Hora de finalización</label>
                        <input type="time" class="form-control" name="horaFinal" value="<%= rs.getString("horaFinal")%>" id="horaFinal" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="servicio">Servicio</label>
                        <select class="form-control" name="servicio">
                            <option><%= rs.getString("servicio")%></option>
                            <%
                                for (Servicios dato : listaSer) {
                            %>
                            <option><%= dato.getNombre()%></option>
                            <% } %>
                        </select>
                    </div>
                </div>
                <br>
                <div class="botones1">
                    <a href="../../Generados.jsp" class="btn btn-danger ml-2">CANCELAR</a>
                    <input type="submit" value="MODIFICAR" class="btn btn-primary" id="modificar">
                </div>
            </form>
            
        </div>
        <%}%>
    </body>
</html>

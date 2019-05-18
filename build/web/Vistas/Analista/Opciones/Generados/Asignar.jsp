<%-- 
    Document   : Asignar
    Created on : 08/04/2019, 07:31:20 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="Modelos.Proveedores"%>
<%@page import="java.util.List"%>
<%@page import="Config.OpcionesProveedor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Clases.ConexionBD"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
    <script src="../../CSS - JS/JS/appAsignar.js"></script>

    <title>SeaPORT R&E</title>
</head>
<body>
    <!-- ////////////////////////////BARRA SUPERIOR//////////////////////////// -->
    <nav id="navAsi">
        <div id="empresa">
            <h1>SPRC</h1>
        </div>
        <div id="titulo">
            <h4 class="ml-4">Asigna proveedores al servicio</h4>
        </div>
    </nav>
    <!-- ////////////////////////////BARRA SUPERIOR//////////////////////////// -->
    <br><br><br><br><br>
    <!-- ////////////////////////////MENU PRINCIPAL//////////////////////////// -->
    
    <%
        
        int numero = 0;
        
        Connection connect = ConexionBD.connect();
        String ref = request.getParameter("ref");
        PreparedStatement ps = connect.prepareStatement("select * from servicios_generados where referencia=" + ref);
        ResultSet rs = ps.executeQuery();
            
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
            
            numero = Integer.parseInt(request.getParameter("num"));

    %>
    <form action="../../../../ControlAsignacion" method="POST" autocomplete="off">
    <div class="container-fluid">
        <div class="infoServicio"></div>
        <h3>Informacion del servicio</h3>
        <hr>
        <div class="row">
            <div class="form-group col-1">
                <label for="term">Terminal</label>
                <input type="text" value="<%= rs.getString("terminal")%>" class="form-control" name="terminal" readonly>
            </div>
            <div class="form-group col-3">
                <label for="term">Motonave / Frente de servicio</label>
                <input type="text" value="<%= rs.getString("motonave")%>" class="form-control" name="motonave" readonly>
            </div>
            <div class="form-group col-2">
                <label for="term">Lloyd</label>
                <input type="text" value="<%= rs.getString("lloyd")%>" class="form-control" name="lloyd" readonly>
            </div>
            <div class="form-group col-2">
                <label for="term">UVI</label>
                <input type="text" value="<%= rs.getString("uvi")%>" class="form-control" name="uvi" readonly>
            </div>
            <div class="form-group col-2">
                <label for="term">Referencia</label>
                <input type="text" value="<%= rs.getString("referencia")%>" class="form-control" name="referencia" readonly>
            </div>
            <div class="form-group col-2">
                <label for="term">Muelle</label>
                <input type="text" value="<%= rs.getString("muelle")%>" class="form-control" name="muelle" readonly>
            </div>
            <div class="form-group col-1">
                <label for="term">Grua 1</label>
                <input type="text" value="<%= grua1%>" class="form-control" name="grua1" readonly>
            </div>
            <div class="form-group col-1">
                <label for="term">Grua 2</label>
                <input type="text" value="<%= grua2%>" class="form-control" name="grua2" readonly>
            </div>
            <div class="form-group col-1">
                <label for="term">Grua 3</label>
                <input type="text" value="<%= grua3%>" class="form-control" name="grua3" readonly>
            </div>
            <div class="form-group col-1">
                <label for="term">Grua 4</label>
                <input type="text" value="<%= grua4%>" class="form-control" name="grua4" readonly>
            </div>
            <div class="form-group col-3">
                <label for="term">Fecha de cita</label>
                <input type="text" value="<%= rs.getString("fechaCita")%>" class="form-control" name="fechaCita" readonly>
            </div>
            <div class="form-group col-3">
                <label for="term">Hora cita</label>
                <input type="text" value="<%= rs.getString("horaCita")%>" class="form-control" name="horaCita" readonly>
            </div>
            <div class="form-group col-2">
                <label for="term">Hrs. Operacion</label>
                <input type="number" id="hrsOp" value="<%= rs.getString("hrsOp")%>" class="form-control" name="hrsOp" readonly>
            </div>
            <div class="form-group col-3">
                <label for="term">Fecha final</label>
                <input type="text" value="<%= rs.getString("fechaFinal")%>" class="form-control" name="fechaFinal" readonly>
            </div>
            <div class="form-group col-3">
                <label for="term">Hora final</label>
                <input type="text" value="<%= rs.getString("horaFinal")%>" class="form-control" name="horaFinal" readonly>
            </div>
            <div class="form-group col-6">
                <label for="term">Servicio</label>
                <input type="text" value="<%= rs.getString("servicio")%>" class="form-control" name="servicio" readonly>
            </div>
        </div>
        <%}%>
        <hr>
        <div class="proveedores">
            <div class="row">
                <h5 class="mt-2 col-3">Numero de proveedores: </h5>
                <input type="text" value="<%= numero%>" id="numPro" name="canPro" class="form-control col-1" readonly>
                <a href="numProveedores.jsp?ref=<%= ref%>" class="btn btn-outline-secondary ml-4 col-3 w-25">CAMBIAR # DE PROVEEDORES</a>
            </div>
            <hr>
            <% for (int i = 1; i <= numero; i++) { %>
            <div class="Proveedores">
                <div class="conProveedores mt-3 mr-3">
                    <h4>Proveedor <%=i%></h4>
                    <div class="row">
                    	<label class="mt-2 col-2">Seleccione el proveedor: </label>
                    	<select class="form-control col-3" name="prov<%=i%>" id="pro" class="pro">
                            <%
                                
		                List<Proveedores> lista = OpcionesProveedor.listar();

                                for (Proveedores pro : lista){
                            %>
                            <option><%= pro.getId()+" - "+ pro.getNombre() %></option>
                            <% } %>
                        </select>
                        <label class="ml-5 mt-2 col-2">Observaciones:</label>
                        <input type="text" name="obser<%=i%>" class="form-control col-4">
                    </div>
                    <br>
                    <div class="row">
                        <label class="mt-2 col-2" id="cantTra">Cantidad de trabajadores:</label>
                        <input type="number" id="cantTrab<%=i%>" name="cantidad<%=i%>" class="form-control col-3 cantTrabajadores">
                        <label class="ml-5 mt-2 col-2">Horas totales:</label>
                        <input type="number" id="hrsTotales<%=i%>" name="total<%=i%>" class="form-control col-3" readonly>
                    </div>
                <hr>
                <% } %>
                </div>
            </div>
            
        </div>
        <div class="botones2 my-5">
            <a class="btn btn-danger" href="../../Generados.jsp">CANCELAR</a>
            <button type="button" id="cal" class="btn btn-info mx-2">CALCULAR HORAS TOTALES</button>
            <input class="btn btn-primary ocultar" type="submit" id="btnAsignar" value="ASIGNAR">
         </div>
    </div>
    </form>
    <!-- ////////////////////////////MENU PRINCIPAL//////////////////////////// -->
</body>
</html>

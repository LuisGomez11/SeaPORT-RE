<%-- 
    Document   : numProveedores
    Created on : 16/04/2019, 03:58:00 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
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
        <script src="../../JS/chart.js"></script>
        <script src="JS/appMenu1.js"></script>

        <title>SeaPORT R&E</title>
    </head>
    <body>
        <%

            int numero = 0;
            
            String ref = request.getParameter("ref");

            Connection con = ConexionBD.connect();

            PreparedStatement ps = con.prepareStatement("select count(*) from proveedores");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                numero = rs.getInt(1);
            }

        %>
        <form action="numProveedores.jsp" method="POST">
            <div class="container-fluid p-5">
                <div class="form-group">
                    <h3>Servicio con referencia: <input type="text" readonly name="ref" value="<%= ref%>" class="form-control"></h3>
                    <h4>Digite el numero de proveedores que le asignará al servicio:</h4>
                    <div class="row">

                        <div class="col-6">
                            <select name="num" class="form-control">
                                <% for (int i = 1; i <= numero; i++) {

                                %>
                                <option><%= i%></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="col-2">
                            <input type="submit" name="btnAsignar" value="ASIGNAR" class="btn btn-info btn-block">

                        </div>
                        <div class="col-2">

                            <a class="btn btn-danger btn-block" href="menuAnalista.jsp">CANCELAR</a>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <%
            if (request.getParameter("btnAsignar") != null) {

                int num = Integer.parseInt(request.getParameter("num"));

                response.sendRedirect("Asignar.jsp?ref=" + ref + "&num=" + num);

            }

        %>
    </body>
</html>

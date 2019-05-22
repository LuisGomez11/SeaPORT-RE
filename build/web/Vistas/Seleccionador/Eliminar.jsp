<%-- 
    Document   : Eliminar
    Created on : 11/04/2019, 02:13:59 PM
    Author     : E201
--%>

<%@page import="Config.OpcionesProveedor"%>
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
        <link rel="stylesheet" type="text/css" href="CSS/estilos1.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

        <!-- SCRIPTS -->
        <script src="../../JS/jquery-3.1.1.min.js"></script>
        <script src="../../JS/bootstrap.min.js"></script>
        <script src="../../JS/sweetalert.min.js"></script>
        <script src="JS/app.js"></script>

        <title>SeaPORT R&E</title>
    </head>
    <body>
        <img src="../../IMG/slider-background2.jpg">
        <%

            int cod = Integer.parseInt(request.getParameter("cod"));

        %>
        <form action="Eliminar.jsp" method="POST">
            <div class="formOpcio1 container p-5">
                <div class="row">
                    <div class="form-group col-md-4">
                        <h3>Codigo del proveedor: </h3>
                        <input type="text" readonly name="cod" value="<%= cod%>" class="form-control">
                    </div>
                    <div class="form-group col-md-8">
                        <h3>Digite su contraseña para seguridad de eliminacion</h3>
                        <input type="password" name="contra" class="form-control">
                        <br>
                        <div class="d-flex">
                            <input type="submit" name="btnEliminar" value="ELIMINAR" class="btn btn-info col-6 mr-1">
                            <a class="btn btn-danger col-6 ml-1" href="Consultar.jsp">CANCELAR</a>
                        </div>
                    </div>
                </div>

            </div>
        </form>

        <%
            if(request.getParameter("btnEliminar")!=null){
                
                String contra = request.getParameter("contra");
                
                if(contra.equals("passseleccionador")){
                    OpcionesProveedor.Eliminar(cod);
                    response.sendRedirect("Consultar.jsp?valEli=correcto");
                }else{
                    out.print("<script>swal('Error!', 'Contraseña ingresada incorrecta, intente nuevamente', 'error');</script>");
                }
                
            }
            
        %>
    </body>
</html>

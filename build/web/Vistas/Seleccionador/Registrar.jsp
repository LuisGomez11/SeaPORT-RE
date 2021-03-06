<%-- 
    Document   : Registrar
    Created on : 20/05/2019, 05:36:23 PM
    Author     : User
--%>

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
        <script src="JS/app1.js"></script>
        
        <title>SeaPORT R&E</title>
    </head>
    <body>
        <!-- ////////////////////////////BARRA SUPERIOR//////////////////////////// -->
        <nav id="navPri">
            <div id="empresa">
                <h1>SPRC</h1>
            </div>
            <div id="titulo">
                <h4 class="ml-4">Bienvenido al menu del seleccionador</h4>
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

        <!-- ////////////////////////////MENU LATERAL//////////////////////////// -->

        <div class="contenedor-menu">
            <ul class="menu">
                <li><a href="#" class="activado" id="primera"><i class="fas fa-plus-circle"></i><span>Agregar proveedores</span></a></li>
                <li><a href="Consultar.jsp" class="" id="segunda"><i class="fas fa-search"></i><span>Consultar proveedor</span></a></li>
            </ul>
        </div>
        <!-- ////////////////////////////MENU LATERAL//////////////////////////// -->

        <a href="#" class="btn-menu">Menu <i class="icon fas fa-bars"></i></a>

        <!-- ////////////////////////////REGISTRAR PROVEEDOR//////////////////////////// -->
        <div class="contenedor-regProveedor">
            <h3>Ingresar datos del proveedor</h3>
            <hr>
            <br><br>
            <form autocomplete="off" method="POST" action="../../ControlProveedores?opc=agregar">
                <div class="row">
                    <div class="form-group col-md-12">
                        <label for="nombre">Nombre</label>
                        <input type="text" class="form-control" name="nombre" id="nombre">
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="telefono">Telefono</label>
                        <input type="number" class="form-control" name="telefono" id="telefono">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="movil">Movil</label>
                        <input type="number" class="form-control" name="movil" id="movil">
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label for="correo">Correo electronico</label>
                        <input type="email" class="form-control" name="correo" id="correo">
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="nit">NIT del proveedor</label>
                        <input type="text" class="form-control" name="nit" id="nit">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="cantTra">Cantidad de trabajadores</label>
                        <input type="number" class="form-control" name="cantTra" id="cantTra">
                    </div>
                </div>
                <br>
                <div class="botones mb-4">                   
                    <input type="submit" value="REGISTRAR" class="btn btn-outline-primary" id="guardar">
                    <button type="button" class="btn btn-outline-danger ml-2" id="limpiarCampos">CANCELAR</button>
                </div>
            </form>
        </div>
        <!-- ////////////////////////////REGISTRAR PROVEEDOR//////////////////////////// -->
    </body>
</html>

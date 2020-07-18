<%-- 
    Document   : Iniciar_sesion
    Created on : 22-jun-2020, 20:49:46
    Author     : PCGAMING
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.*, java.util.LinkedList" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="stylehome.css">
        <script type="text/javascript" src="/EXAMEN_T3/admin/js/validariniciar.js"></script>
        <title>JSP Page</title>
    </head>
    <% Reporte_cliente newcliente=new Reporte_cliente();
       LinkedList<Reporte_cliente> lista= newcliente.reporte_clientes();
       int nro=10;
         for (int i = 0; i <lista.size(); i++) {
                 if(nro==lista.get(i).getId()){
                     nro++;
                 }
         }
    %>
    <body>
        <form  name="iniciar" id="inciar" action="/EXAMEN_T3/mante_usuario" method="post">    
            <div class="modal-body">
                <div class="form-group">
                    <input type="hidden" class="form-control" value="<%=nro %>" name="id_usuario">   
                </div>
                <div id="alerta"></div>
                    
                <div class="form-group">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6" >
                            <label class="col-form-label">Username</label>
                            <input id="username" type="email" class="form-control"  name="username" placeholder="@example.com" required="true">
                        </div>
                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6" >
                            <label class="col-form-label">Password</label>
                            <input  id="claves" type="password" class="form-control"  name="clave" placeholder="Enter Password" required="true">
                        </div>
                    </div>   
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6" >
                            <label class="col-form-label">Nombre:</label>
                            <input id="nombre" type="text" class="form-control"  name="nombre" required="true"> 
                        </div>
                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6" >
                            <label class="col-form-label">Apellidos:</label>
                            <input id="apellido" type="text" class="form-control"  name="apellido" required="true">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6" >
                            <label  class="col-form-label">Tipo de documento:</label>
                            <select id="tipodocumento" name="tipodocumento" class="custom-select" required="true">
                                <option value=" " selected>Selecciona</option>
                                <option value="DNI">DNI</option>
                                <option value="Pasaporte">Pasaporte</option>
                            </select>
                        </div>
                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6" >
                            <label  class="col-form-label">Documento:</label>
                            <input id="nro_documento" type="text" class="form-control" name="nro_documento" required="true">
                        </div>
                    </div>
                </div>                
                <div class="form-group">
                   <div class="row">
                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6" >
                            <label  class="col-form-label" >Edad</label>
                            <input id="edad" type="number" class="form-control" name="edad" required="true">
                        </div>
                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6" style="padding-left: 6%;">
                            <div class="row" >
                               <label class="col-form-label">Genero</label> 
                            </div>
                            <div class="row" >
                                <img id="imgmas" src="EXAMEN_T3/admin/image/masculino.png">
                                <div id="lav">
                                    <input  id="genero" type="radio"  name="genero" value="Masculino" required="true">
                                </div>
                                <img id="imgmas" src="EXAMEN_T3/admin/image/femenino.png">
                                <div id="lav">
                                    <input  id="genero" type="radio"  name="genero" value="Femenino" required="true"> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>          
                <div class="form-group">
                    <label class="col-form-label">Direccion:</label>
                    <input id="direccion" type="text" class="form-control" name="direccion" required="true">
                </div>    
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-dismiss="modal">Cancelar</button>
                <input type="submit" class="btn btn-dark" name="registrar" value="Guardar" onclick="validariniciar()">
            </div>
        </form>
    </body>
</html>
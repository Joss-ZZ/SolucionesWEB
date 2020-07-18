<%-- 
    Document   : editarstock
    Created on : 15-jun-2020, 12:12:35
    Author     : PCGAMING
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="modelo.Marca"%>
<%@ include file="templates/header.jsp"%>
<%@ include file="templates/barra.jsp"%>
<%@ include file="templates/navegacion.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>



<div class="content-wrapper">
    <!-- /.card-header -->
    
    <div class="container">
    <form action="ControladorUnidad?accion=Editar" method="post">
            <h1>Editar Unidad</h1>
             <br>
             <input type="hidden" name="id" value="${id}">
             <br>
             <div class="row">
                  <label>Nombre Unidad:  </label><br>
                  <input  class="form-control" type="text" name="descripcion" value="${descripcion}"> 
             </div>
   
             <br>
           <button class="btn btn-success" type="submit">Actualizar</button>
    </form>
    </div>
 
             
 <%@ include file="templates/footer.jsp"%>
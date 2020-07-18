<%-- 
    Document   : editarmarca
    Created on : 15-jun-2020, 0:35:57
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
    
    <div class="card">      
    <div class="container">
    <form action="ControladorMarca?accion=Editar" method="post">
            <h1>Editar Categoria</h1>
             <br>
             
             <input type="hidden" name="id" value="${id}">
  
             <div class="row">
                  <label> Nombre Marca:   </label><br>
                  <input  class="form-control" type="text" name="descripcion" value="${descripcion}"> 
             </div>
            <br>
            <button class="btn btn-success" type="submit">Actualizar</button>
            <br>
    </form>
            <br>
    </div>
             <br>
    </div>
     
 <%@ include file="templates/footer.jsp"%>
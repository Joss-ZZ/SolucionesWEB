<%-- 
    Document   : unidad
    Created on : 22-jun-2020, 13:12:56
    Author     : PCGAMING
--%>

<%@page import="modelo.Unidad"%>
<%@page import="java.util.LinkedList"%>
<%@ include file="templates/header.jsp"%>
<%@ include file="templates/barra.jsp"%>
<%@ include file="templates/navegacion.jsp"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- /.card-header -->
    <script src="admin/js/validarunidad.js"> </script>

          <% 
                 Unidad un=new Unidad();
                 LinkedList<Unidad> listasunidad;
                 listasunidad=un.unilista();

          %>
    
    <div class="card-body">
    </div>
    <!-- /.card-body --><section class="content">

        <!-- Default box -->
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Mantener Unidad</h3>
            </div>
            
             <div class="container">
                <form name="form_unidad" action="ControladorUnidad?accion=Registrar" method="post">
                           <div id="alerta">

                            </div> 
                                    <br>
                                    <div class="row">
                                        <label>Nombre Unidad:</label><br>
                                        <input id="descripcion" class="form-control" type="text" name="descripcion" required="true"> 
                                    </div>
                            <br>
                              <input class="btn btn-primary" type="submit" value="Registrar" onclick="validarunidad();">
                    </form>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th class="text-center" >ID</th>
                            <th class="text-center" >Descripcion</th>
                            <th class="text-center" >Acciones</th>
                        </tr>
                    </thead>
                             
                     <tbody>
                         <%for (int i = 0; i < listasunidad.size(); i++) { %>  
                        <tr>    
                            <td class="text-center"><%=listasunidad.get(i).getId()%></td>
                            <td class="text-center"><%=listasunidad.get(i).getDescripcion()%></td>              
                            <td class="text-center">
                                <a class="btn btn-warning" href="ControladorUnidad?accion=Buscar&Id=<%=listasunidad.get(i).getId()%>&descripcion=<%=listasunidad.get(i).getDescripcion()%>">Editar</a>
                                <a class=" btn btn-danger" href="ControladorUnidad?accion=Eliminar&Id=<%=listasunidad.get(i).getId()%>">Eliminar</a>
                            </td>                       
                        </tr> 
                        <%}%>
                    </tbody>
                </table>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->


<%@ include file="templates/footer.jsp"%>
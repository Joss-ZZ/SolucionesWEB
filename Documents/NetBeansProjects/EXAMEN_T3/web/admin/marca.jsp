<%@page import="modelo.Marca"%>
<%@page import="java.util.LinkedList"%>
<%@ include file="templates/header.jsp"%>
<%@ include file="templates/barra.jsp"%>
<%@ include file="templates/navegacion.jsp"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- /.card-header -->
    <script src="admin/js/validarmarca.js"> </script>
<% 
                 Marca mar=new Marca();
                 LinkedList<Marca> listasmarca;
                 listasmarca=mar.marcalista();

%>
          
    
    <div class="card-body">
    </div>
    <!-- /.card-body --><section class="content">

        <!-- Default box -->
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Mantener Marca</h3>
            </div>
            
             <div class="container">
                <form name="form_marca"action="ControladorMarca?accion=Registrar" method="post">
                           <div id="alerta">

                            </div> 
                                    <br>
                                    <div class="row">
                                        <label>Nombre Marca:</label><br>
                                        <input id="descripcion" class="form-control" type="text" name="descripcion" required="true"> 
                                    </div>
                            <br>
                              <input class="btn btn-primary" type="submit" value="Registrar" onclick="validarmarca();">
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
                      <%for (int i = 0; i < listasmarca.size(); i++) { %>  
                          <tr>
                              <td><%=listasmarca.get(i).getId() %></td>
                              <td><%=listasmarca.get(i).getDescripcion() %></td>
                              <td class="text-center">
                                  <a class="btn btn-warning" href="ControladorMarca?accion=Buscar&Id=<%=listasmarca.get(i).getId()%>&descripcion=<%=listasmarca.get(i).getDescripcion()%>">Editar</a>
                                  <a class=" btn btn-danger" href="ControladorMarca?accion=Eliminar&Id=<%=listasmarca.get(i).getId()%>">Eliminar</a>
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
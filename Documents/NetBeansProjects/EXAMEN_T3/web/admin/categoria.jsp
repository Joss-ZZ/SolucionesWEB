<%@page import="java.util.LinkedList"%>
<%@page import="modelo.Categoria"%>
<%@ include file="templates/header.jsp"%>
<%@ include file="templates/barra.jsp"%>
<%@ include file="templates/navegacion.jsp"%>
 
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- /.card-header -->
    <script src="admin/js/validar.js"> </script>

      <% 
                 Categoria cat=new Categoria();
                 LinkedList<Categoria> listascategoria;
                 listascategoria=cat.categorialista();

      %>    
    
    <div class="card-body">
    </div>
    <!-- /.card-body --><section class="content">

        <!-- Default box -->
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Mantener Categoria</h3>
            </div>
            <div class="container">
                 <form name="form_categoria" action="ControladorCategoria?accion=Registrar" method="post">
                           <div id="alerta">

                            </div> 
                                    <br>
                                    <div class="row">
                                        <label>Nombre Categoria:</label><br>
                                        <input id="descripcion" class="form-control" type="text" name="descripcion" required="true"> 
                                    </div>
                            <br>
                            <input class="btn btn-primary" type="submit" value="Registrar" onclick="validar();">
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
                       <%for (int i = 0; i < listascategoria.size(); i++) { %>  
                        <tr>    
                            <td class="text-center"><%=listascategoria.get(i).getId()%></td>
                            <td class="text-center"><%=listascategoria.get(i).getDescripcion()%></td>              
                            <td class="text-center">
                                <a class="btn btn-warning" href="ControladorCategoria?accion=Buscar&Id=<%=listascategoria.get(i).getId()%>&descripcion=<%=listascategoria.get(i).getDescripcion()%>">Editar</a>
                                <a class=" btn btn-danger" href="ControladorCategoria?accion=Eliminar&Id=<%=listascategoria.get(i).getId()%>">Eliminar</a>
                            </td>                       
                        </tr> 
                        <%}%>
                    </tbody>
                </table>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->
</div>
<%@ include file="templates/footer.jsp"%>
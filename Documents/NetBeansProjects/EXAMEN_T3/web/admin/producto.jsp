<%@ include file="templates/header.jsp"%>
<%@ include file="templates/barra.jsp"%>
<%@ include file="templates/navegacion.jsp"%>
<%@ page    import="modelo.*,java.util.LinkedList"%> 
<!-- Content Wrapper. Contains page content -->
<% 
               String nom="",imagen="";
               int cont=0;
               float precio=0;
               int stock=0;
               producto newpro= new producto();
               Marca mar=new Marca();
               Categoria cat=new Categoria();
               Unidad und=new Unidad();
               LinkedList<producto> lista= newpro.prolista();
               LinkedList<Unidad> listasunid=und.unilista();
               LinkedList<Marca> listasmarca=mar.marcalista();
               LinkedList<Categoria> listascategoria=cat.categorialista();                       
               %>
<div class="content-wrapper">
    <!-- /.card-header -->
    <div class="card-body">
    </div>
    <!-- /.card-body --><section class="content">
         <script src="admin/js/validarproducto.js"> </script>
        <!-- Default box -->
        <div class="card">
            <div class="card-header">
              <h3 class="card-title">Mantener Producto</h3>
            </div>
            <div>
                <form  name="form_producto" action="mante_producto" method="post">
                   <div id="alerta"></div> 
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12" id="datospro">
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                            <span>ID</span>
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                            <span>Nombre</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                            <span>Caracteristicas</span>
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                            <span>Marca</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                            <span>Categoria</span>
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                            <span>Precio</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                            <span>Stock</span>
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                            <span>Unidad</span>
                                        </div>
                                    </div>
                                </div>
                            </div>    
                            <div class="row">
                                <% 
                                    if(lista.size()>=1)
                                    {   cont=lista.size();cont++;
                                        for (int i = 0; i <lista.size(); i++) {
                                            if(lista.get(i).getId_producto()==cont)cont++;
                                        }
                                    }else{
                                        cont++;
                                    }
                                %>
                                <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <input type="submit"  class="form-control btn btn-outline-dark" value="Registrar" name="registrar"  onclick="validarproducto();"> 
                                                </div>
                                                <input type="text" class="form-control" name="id_prod" value="<%=cont%>" readonly="readonly" >
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                            <input id="nombre" type="text" class="form-control" name="nombre" placeholder="Nombre" required="true" >
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                            <input  id="caract" type="text" class="form-control" name="caract" placeholder="Caracteristicas" required="true">
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                            <select id="id_marca" name="id_marca" class="custom-select" required="true">
                                                <option value=" " selected>Seleccionar</option>
                                                    <% for (int e = 0; e < listasmarca.size(); e++) {
                                                    String nommarca=listasmarca.get(e).getDescripcion();
                                                    int id_marca=listasmarca.get(e).getId(); %>
                                                    <option  value="<%=id_marca%>"><%=nommarca%></option>
                                                    <%}%>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                            <select id="id_categoria" name="id_categoria" class="custom-select" required="true">
                                                <option value=" " selected>Seleccionar</option>
                                                    <% for (int e = 0; e < listascategoria.size(); e++) {
                                                    String nomcategoria=listascategoria.get(e).getDescripcion();
                                                    int id_categoria=listascategoria.get(e).getId(); %>
                                                    <option  value="<%=id_categoria%>"><%=nomcategoria%></option>
                                                    <%}%>
                                            </select>
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                            <input id="precio" type="number" step="0.01" class="form-control" name="precio" value=" " required="true">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                            <input id="id_stock" type="number" class="form-control" name="id_stock" value=" "  required="true">
                                        </div>
                
                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                            <select id="id_unidad" name="id_unidad" class="custom-select" required="true">
                                                <option value=" " selected>Seleccionar</option>
                                                    <% for (int e = 0; e < listasunid.size(); e++) {
                                                    String unid=listasunid.get(e).getDescripcion();
                                                    int id_unid=listasunid.get(e).getId(); %>
                                                    <option  value="<%=id_unid%>"><%=unid%></option>
                                                    <%}%>
                                            </select>
                                        </div>
                                            
                                    </div>
                                    <div class="row pt-3">
                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                            
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                            <div class="custom-file mb-3">
                                                <input type="file" class="custom-file-input" id="customFile" name="filename">
                                                <label class="custom-file-label" for="customFile">Choose file</label>
                                            </div>
                                            <script>
                                            $(".custom-file-input").on("change", function() {
                                              var fileName = $(this).val().split("\\").pop();
                                              $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
                                            });
                                            </script>
                                        </div>
                                    </div>
                                </div>                                
                            </div>    
                        </div>
                    <div>    
                </form>  
            </div>
            <!-- /.card-header -->
            <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                          <th>Nombres</th>
                          <th>Caracteristicas</th>
                          <th>Marca</th>
                          <th>Categoria</th>
                          <th>Unidad</th>
                          <th>Precio</th>
                          <th>Editar</th>
                          <th>Eliminar</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%for (int i = 0; i < lista.size(); i++) { %>  
                        <tr>
                            <td><%=lista.get(i).getNombre() %></td>
                            <td><%=lista.get(i).getCaracteristicas() %></td>
                            <td><%=lista.get(i).getDes_marca() %></td>
                            <td><%=lista.get(i).getDes_categoria() %></td>
                            <td><%=lista.get(i).getDes_unidad()%></td>
                            <td><%=lista.get(i).getPrecio() %></td>
                            <td id="tdchiqui" class="text-center"><a href="ControladorProducto?accion=Editar&id=<%=lista.get(i).getId_producto()%>"><img id="edel" src="/EXAMEN_T3/admin/image/editar.png"></a></td>
                            <td id="tdchiqui" class="text-center" ><a href="mante_producto?id=<%=lista.get(i).getId_producto()%>"><img id="edel" src="/EXAMEN_T3/admin/image/eliminar.png"></a></td>
                        </tr>
                    <%}%>           
                    </tbody>
                </table>
            </div>
            <!-- /.card-body -->
        </div>
                    
<!-- /.card -->








<%@ include file="templates/footer.jsp"%>
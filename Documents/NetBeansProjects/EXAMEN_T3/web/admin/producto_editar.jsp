<%-- 
    Document   : producto_editar
    Created on : 16/06/2020, 03:39:19 PM
    Author     : Juxn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="templates/header.jsp"%>
<%@ include file="templates/barra.jsp"%>
<%@ include file="templates/navegacion.jsp"%>
<%@ page    import="modelo.*,java.util.LinkedList"%> 
<div class="content-wrapper">
    <!-- /.card-header -->
    <div class="card-body">
    </div>
    <!-- /.card-body --><section class="content">
        <div class="card">
            <div class="card-header">
              <h3 class="card-title">Editar Producto</h3>
            </div>
            <%  int id_produc=Integer.parseInt(String.valueOf(session.getAttribute("producto")));
                int id=0,stock=0;
                float precio=0;
                String nom=" ",caracter=" ",unidad=" ";
                producto pro=new producto();
                Marca mar=new Marca();
                Categoria cat=new Categoria();
                Unidad und=new Unidad();
                LinkedList<producto> lista=pro.prolista();
                LinkedList<Unidad> listasunid=und.unilista();
                LinkedList<Marca> listasmarca=mar.marcalista();
                LinkedList<Categoria> listascategoria=cat.categorialista();
               for (int i = 0; i < lista.size(); i++) {
                       if(id_produc==lista.get(i).getId_producto())
                       {
                           id=lista.get(i).getId_producto();
                           nom=lista.get(i).getNombre();
                           caracter=lista.get(i).getCaracteristicas();
                           precio=lista.get(i).getPrecio();
                           stock=lista.get(i).getStock();
                       }
                   }
                 
            %>
            <div>
                <form action="mante_producto" method="post">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12" id="datospro">
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2 p-2">
                                    <div class="row">
                                        <span>ID</span>
                                    </div>
                                    <div class="row">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                  <input type="submit"  class="form-control btn btn-dark" value="Actualizar" name="actualizar"> 
                                                </div>
                                            </div>
                                                <input type="text" class="form-control" name="id_prod" value="<%=id %>" readonly="readonly" >
                                        </div>
                                    </div>           
                                </div>
                                <div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 p-2">
                                            <div class="row">
                                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                                    <span>Nombre</span>
                                                </div>
                                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                                    <span>Caracteristicas</span>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                                    <input type="text" class="form-control" name="nombre" value="<%=nom %>" required>
                                                </div>
                                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                                    <input type="text" class="form-control" name="caract" value="<%=caracter %>" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 p-2" >
                                            <div class="row">
                                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                                    <span>Marca</span>
                                                </div>
                                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                                    <span>Categoria</span>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                
                                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                                    <select name="id_marca" class="custom-select">
                                                    <option selected>Seleccionar</option>
                                                    <%for (int a = 0; a <listasmarca.size() ; a++) {
                                                            String marca=listasmarca.get(a).getDescripcion();
                                                            int id_marca=listasmarca.get(a).getId();%>
                                                        <option value="<%=id_marca %>"><%=marca %></option>
                                                    <%}
                                                    %> 
                                                    </select>
                                                </div>
                                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                                    <select name="id_categoria" class="custom-select">
                                                        <option selected>Seleccionar</option>
                                                        <%for (int e = 0; e <listascategoria.size() ; e++) {
                                                            String categoria=listascategoria.get(e).getDescripcion();
                                                            int id_categoria=listascategoria.get(e).getId();%>
                                                        <option value="<%=id_categoria %>"><%=categoria %></option>
                                                        <%}
                                                        %>
                                                    </select>
                                                </div>    
                                            </div>
                                        </div>    
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 p-2">
                                            <div class="row">
                                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                                    <span>Precio</span>
                                                </div>
                                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                                    <span>Stock</span>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                                    <input type="number" step="0.01" class="form-control" name="precio" value="<%=precio %>" required>
                                                </div>
                                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                                    <input type="number" class="form-control" name="id_stock" value="<%=stock %>" required> 
                                                </div>
                                            </div>
                                        </div>    
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 p-2 ">
                                            <div class="row">
                                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                                    <span>Unidad</span>
                                                </div>
                                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                                    <span>Imagen</span> 
                                                </div>
                                            </div>    
                                            <div class="row">
                                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                                    <select name="id_unidad" class="custom-select">
                                                        <option selected>Seleccionar</option>
                                                        <%for (int p = 0; p <listasunid.size() ; p++) {
                                                            String unid=listasunid.get(p).getDescripcion();
                                                            int id_unid=listasunid.get(p).getId();%>
                                                        <option value="<%=id_unid %>"><%=unid %></option>
                                                        <%}
                                                        %>
                                                    </select>
                                                </div>
                                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                                    <div class="custom-file mb-3">
                                                        <input type="file" class="custom-file-input" id="customFile" name="filename" required>
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
                                <div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4"></div>
                            </div>
                                
                        </div>
                    <div>    
                </form>  
            </div>
        </div>    
<!-- /.card -->
<%@ include file="templates/footer.jsp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="jdk.nashorn.internal.runtime.ListAdapter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.*, java.util.LinkedList, java.util.Arrays"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="/EXAMEN_T3/admin/css/stylehome.css">
        <link rel="stylesheet" type="text/css" href="/EXAMEN_T3/admin/css/bar.css">
        <script type="text/javascript" src="/EXAMEN_T3/admin/js/progresbar.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Magra&display=swap" rel="stylesheet"> 
        <link href="https://fonts.googleapis.com/css2?family=Fredericka+the+Great&display=swap" rel="stylesheet"> 
        <title>Rapidfast</title>
        <link rel="shortcut icon" href="admin/image/tienda.png"/>
         <!---->
         <script src="https://cdn.rawgit.com/PascaleBeier/bootstrap-validate/v2.2.0/dist/bootstrap-validate.js" ></script>
    </head>2
    <script>
    function verproducto(idpro)
    {
        window.open("/EXAMEN_T3/admin/Modal_pro.jsp?id_pro="+idpro+"","_self");
    }
    function login()
    {
        document.getElementById("contenidologin").innerHTML="";
        $('#newloginn').modal('show');
        $("#contenidologin").load("/EXAMEN_T3/admin/login.jsp");
    }
    function registrar()
    {
        document.getElementById("contenidoregistro").innerHTML="";
        $('#newregistroo').modal('show');
        $("#contenidoregistro").load("/EXAMEN_T3/admin/Iniciar_sesion.jsp");
    }
    
     function recuperarcuenta()
    {
        document.getElementById("contenidorecuperarcuenta").innerHTML="";
        $('#newrecuperarcuentaa').modal('show');
        $("#contenidorecuperarcuenta").load("/EXAMEN_T3/admin/Recuperar_cuenta.jsp");
    }
    function pagina(id_user,id_ven){
        window.open("/EXAMEN_T3/admin/boucher.jsp?id_us="+id_user+"&id_ve="+id_ven+"");
    }
    function vista(cat){
      var testvalue = cat;
      document.cookie = "Cate=" + testvalue;
    }
    function Ulvisto(id_pro){
        var testvalue = id_pro;
        var mycookies=document.cookie.split(";");
        var id=mycookies.length;
        document.cookie = ""+id+"=" + testvalue; 
    }
    </script>
       
    <body>
        <div class="row ">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                <nav class="navbar navbar-expand-md  navbar-dark fixed-top" id="nv">
                    <a class="navbar-brand" href="#">
                        <img id="logo" src="admin/image/logo.png">
                    </a>
                    
                    <button class="navbar-toggler " type="button" data-toggle="collapse" data-target="#collap">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="collap">
                        <ul class="navbar-nav">
                            <li class="nav-item active" >
                                <a class="nav-link" href="#">Productos</a>
                            </li>
                        </ul>
                    </div>
                    <!-- alertaa****************************** -->
                    <div>
                        <%
                        Usuario user=(Usuario)session.getAttribute("usuario");
                        if(user==null){%>
                        <div id="message">
                            <div>
                                <div id="inner-message" class="alert alert-info alert-dismissible">
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                    <strong>Bienvenido</strong>
                                </div>
                            </div>
                        </div>
                        <%}else {
                        %>
                        <div id="message">
                            <div>
                                <div id="inner-message" class="alert alert-success alert-dismissible">
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                    <div><strong><h1 style="font-size: 31px;" class="display-4">Bienvenido: <%=user.getNombre() %></h1></strong></div>
                                </div>
                            </div>
                        </div> 
                        <%  }%>
                    </div>
                    <!--  *****************************************-->
                    <div>
                        <a href="" type="button" class="btn btn-light" data-toggle="modal" data-target="#mymodal">
                            <img id="carro" src="admin/image/carrito.png">
                        </a>
                    </div>
                    <div id="guiado">
                        <div class="btn-group">
                            <a class="btn btn-outline-info dropdown-toggle dropdown-right" data-toggle="dropdown"><img id="admin"src="admin/image/admin.png"></a>
                            <div class="dropdown-menu dropdown-menu-right text-center">
                                <input type="button" class="dropdown-item"  value="Login" onclick="login()" >
                                <input type="button" class="dropdown-item"  value="Registro" onclick="registrar()" >  
                                <input type="button" class="dropdown-item"  value="Olvidaste tu clave ?" onclick="recuperarcuenta()" >  
                                
                            </div>
                        </div>    
                    </div>
                    <div class="dropdown"id="guiado">
                       <button  style=" border:none"class="btn btn-outline-light dropdown-toggle dropdown-right" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                       </button>            
                        <div class="dropdown-menu dropdown-menu-right  text-center">
                             <a class="dropdown-item" href="#">
                                 <img src="admin/image/user.png" alt="60" width="60">
                             </a>
                             <div class="dropdown-divider"></div>
                              <a href="${pageContext.request.contextPath}/CerrarSesion" class="btn btn-success btn-flat">Cerrar Sesión</a>
                        </div>
                    </div>
                </nav>
            </div>
        </div> 
        <div class="row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                <div class="row" id="panel">
                    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                        <div id="vista" class="carousel slide" data-ride="carousel">
                            <ul class="carousel-indicators">
                                <li data-target="#vista" data-slide-to="0" class="active"></li>
                                <li data-target="#vista" data-slide-to="1"></li>
                                <li data-target="#vista" data-slide-to="2"></li>
                            </ul>
                            
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img id="spon" src="admin/image/manzana.jpg">
                                </div>
                                <div class="carousel-item">
                                    <img id="spon" src="admin/image/pollo.jpg">
                                </div>
                                <div class="carousel-item">
                                    <img id="spon" src="admin/image/todo.jpg">
                                </div>
                            </div>

                            <a class="carousel-control-prev" href="#vista" data-slide="prev">
                                <span class="carousel-control-prev-icon"></span>
                            </a>
                            <a class="carousel-control-next" href="#vista" data-slide="next">
                                <span class="carousel-control-next-icon"></span>
                            </a>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>    
                <% carrito car=new carrito();
                   LinkedList<carrito> carlista= car.carrolista();
                   int newid_usuario=0,newid_venta=0;
                %>
                <!-- **************************** modal de carrito ***********************************-->
                <div class="container">
                    <div class="modal fade" id="mymodal">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 id="carrito"class="modal-title display-4">Carrito</h1>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>  
                                </div>
                                <%if(user==null){}
                                else{%>
                                <div class="modal-header">
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                                            <div class="row">
                                                <div class="col-12 col-sm-6 col-md-6 col-lg-6 col-xl-6">
                                                    <a href="#" class="nav-link disabled" >E: Proceso</a>
                                                </div>
                                                <div class="col-12 col-sm-6 col-md-6 col-lg-6 col-xl-6" id="impedido">
                                                    <a href="/EXAMEN_T3/admin/pedidos.jsp" class="nav-link " ><img id="impedido" src="/EXAMEN_T3/admin/image/pedido.png"></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%}%>
                                <div class="modal-body">
                                <%if(user==null){%>
                                    <div class="row">
                                        <h1 class="display-4">Agrega Productos al Carrito</h1>
                                    </div>
                                <%}else{
                                    
                                    int id_venta=Integer.parseInt(String.valueOf(session.getAttribute("idventa")));
                                    String est="proceso";
                                    for (int p = 0; p <carlista.size(); p++) { 
                                    if(user.getId_usuario()==carlista.get(p).getId_usuario() && carlista.get(p).getId_venta()==id_venta && est.equals(carlista.get(p).getEstado()) )
                                    {   newid_usuario=user.getId_usuario(); newid_venta=carlista.get(p).getId_venta(); %> 
                                        
                                    <div id="st_first" class="row">
                                        <div id="stilo" class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
                                            <div id="im_2" class="row">
                                                <di>
                                                    <img id="immodel" src="<%=carlista.get(p).getImagen() %>"> 
                                                </di>
                                            </div>
                                        </div>
                                        <div  id="stilo" class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
                                            <div id="im_2" class="row">
                                                <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                                                    <p id="vistaproducto"><%=carlista.get(p).getNom_product()%> - <%=carlista.get(p).getCaracat() %></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div  id="stilo" class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
                                           <div id="im_2" class="row">
                                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                                    <p id="vistaproducto"><%=carlista.get(p).getDes_marca() %> / <%=carlista.get(p).getDes_categoria() %></p>
                                                </div>
                                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                                    <p id="vistaproducto"><%=carlista.get(p).getCantidad() %></p>
                                                </div>
                                            </div> 
                                        </div>
                                        <div id="stilo" class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
                                            <div id="im_2" class="row">
                                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                                    <p style="margin-bottom: 0%; " id="vistaproducto" >S\. <%=carlista.get(p).getPrecio_unidad() %></p>
                                                    <p id="vistaproducto" ><%=carlista.get(p).getUnidad() %></p>
                                                </div>
                                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                                    <p id="vistaproducto">S\. <%=carlista.get(p).getPrecio_total() %></p>
                                                </div>
                                            </div>
                                            <div  class="row" >
                                                <div id="modal_basura" class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                                                    <div>
                                                        <a type="button" class="close" href="mante_carrito?car=<%=carlista.get(p).getId_venta()%>&pro=<%=carlista.get(p).getId_product() %>"><img id="bt_basura" src="admin/image/basura.png"></a>        
                                                    </div>
                                                </div>    
                                            </div>    
                                        </div>
                                    </div>
                                <%  }
                                    }
                                    }
                                    %>
                                </div>
                                <div class="modal-footer">
                                    <%if(user!=null){%>
                                    <a href="mante_venta?id_user=<%=newid_usuario %>&id_ven=<%=newid_venta %>" type="button" class="btn btn-success" onclick="pagina(<%=newid_usuario %>,<%=newid_venta %>)">Comprar</a>
                                    <%}%>
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>
                            </div>    
                        </div>
                    </div>
                </div>
                <!-- **************************** ***********************************-->        
        <div class="row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">    
                <% producto pro= new producto();
                LinkedList<producto> lista=pro.prolista();%>
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 mt-5">
                        <div class="row" id="promit">
                            <% for (int i = 0; i < lista.size(); i++){ 
                                if(lista.get(i).getStock()>0){%>
                                <div  id="inprod" class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-3">
                                    <div id="margen">
                                        <img  class="img-thumbnail" id="cargaimagen" src="<%=lista.get(i).getImagen()%>">
                                        <p id="product" ><%=lista.get(i).getNombre() %> </p>
                                        <div id="produ"class="row">
                                            <div class="col-12 col-sm-12 col-md-8 col-lg-8 col-xl-8">
                                                <div class="container">
                                                    <input type="button" id="btn" class="btn btn-danger" value="Ver Producto" onclick="verproducto(<%=lista.get(i).getId_producto()%>),vista('<%=lista.get(i).getDes_categoria() %>'),Ulvisto(<%=lista.get(i).getId_producto()%>)">      
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                                                <div class="row">
                                                    <!-- agregasr-->
                                                        <a id="canasta" href="" class="btn btn-success disabled" ><img id="newc" src="admin/image/tienda.png"></a>
                                                    <!-- /////////////-->
                                                </div>
                                                <div id="stockkk">
                                                    <span style="color: white;"><%=lista.get(i).getStock()%></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>        
                                </div>
                            <%}}%>  
                        </div>
                    </div>
                </div>
            </div>            
        </div>                    
                   <!-- **************************** modal de login ***********************************-->
                        <div class="modal fade" id="newloginn" tabindex="-1" role="dialog" aria-labelledby="myModal" >
                            <div class="modal-dialog modal-dialog-centered " role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 id="logea"class="modal-title">Login</h1>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body " id="contenidologin" >
                                        <span>....</span>
                                    </div>
                 
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                    </div>
                                </div>    
                            </div>
                        </div> 
                    <!-- ***************************************************************************** --->

                    <!-- **************************** modal de registro ***********************************-->
                        <div class="modal fade" id="newregistroo" tabindex="-1" role="dialog" aria-labelledby="myModal" >
                            <div class="modal-dialog " role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 id="registra" class="modal-title display-4">Nuevo Usuario</h1>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body " id="contenidoregistro" >
                                        <span>....</span>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                    </div>
                                </div>    
                            </div>
                        </div> 
                    <!-- ***************************************************************************** --->
                    <!-- **************************** modal de recuperar cuenta ***********************************-->
                        <div class="modal fade" id="newrecuperarcuentaa" tabindex="-1" role="dialog" aria-labelledby="myModal" >
                            <div class="modal-dialog " role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 id="" class="modal-title display-4"></h1>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body " id="contenidorecuperarcuenta" >
                                        <span>....</span>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                    </div>
                                </div>    
                            </div>
                        </div> 
                    <!-- ***************************************************************************** --->
                    
           <!---------------------AQUIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII---------------->         
        <div class="row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12"> 
                <div id="product1" class="carousel slide" data-ride="carousel">
                    <ul class="carousel-indicators">
                        <li data-target="#product1" data-slide-to="0" class="active"></li>
                        <li data-target="#product1" data-slide-to="1"></li>
                        <li data-target="#product1" data-slide-to="2"></li>
                    </ul>
                    <%Cookie[] cookies =request.getCookies();
                    Reporteproducto_masvendido show=new Reporteproducto_masvendido();
                    LinkedList<Reporteproducto_masvendido> showlista=show.Reporte_productomasVendido();
                    if(cookies == null || cookies.length<2 ){%>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                                <div class="row">
                                    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 mt-5">
                                        <div class="row" id="promit">
                                            <span id="p_caro">Productos mas vendidos</span>  
                                        </div>
                                    </div>
                                </div>
                                <div class="row ">
                                    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 mt-5">
                                        <div class="row" id="promit">
                                            <%for (int m = 0; m < showlista.size() ; m++) {
                                                    if(showlista.get(m).getVeces_compra()>=5){%>
                                                       <div  id="inprod" class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-3">
                                                            <div id="margen">
                                                                <img  class="img-thumbnail" id="cargaimagen" src="<%=lista.get(m).getImagen()%>">
                                                                <p id="product" ><%=lista.get(m).getNombre() %> </p>
                                                                <div id="produ"class="row">
                                                                    <div class="col-12 col-sm-12 col-md-8 col-lg-8 col-xl-8">
                                                                        <div class="container">

                                                                            <input type="button" id="btn" class="btn btn-danger" value="Ver Producto" onclick="verproducto(<%=lista.get(m).getId_producto()%>),vista('<%=lista.get(m).getDes_categoria() %>'),Ulvisto(<%=lista.get(m).getId_producto()%>)">      
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                                                                        <div class="row">
                                                                            <!-- agregasr-->
                                                                                <a id="canasta" href="" class="btn btn-success disabled" ><img id="newc" src="admin/image/tienda.png"></a>
                                                                            <!-- /////////////-->
                                                                        </div>
                                                                        <div id="stockkk">
                                                                            <span style="color: white;"><%=lista.get(m).getStock()%></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>        
                                                        </div> 
                                              <%    }
                                                }
                                            %> 
                                        </div>
                                    </div>
                                </div>   
                        </div>
                    </div>  
                    <%}                   
                    else{%>           
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 mt-5">
                                    <div class="row" id="promit">
                                        <span id="p_caro">Productos que te podrian interesar</span>  
                                    </div>
                                </div>
                            </div>
                            <div class="row ">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 mt-5">
                                    <div class="row" id="promit">
                                        <%  String relacionado="";
                                            for (int j = 0; j < cookies.length ; j++) {
                                                if(cookies[j].getName().equals("Cate"))
                                                    relacionado=cookies[j].getValue();
                                            }   
                                            for (int i = 0; i < lista.size(); i++){ 
                                            if(lista.get(i).getStock()>0 && lista.get(i).getDes_categoria().equals(relacionado)){%>
                                            <div  id="inprod" class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-3">
                                                <div id="margen">
                                                    <img  class="img-thumbnail" id="cargaimagen" src="<%=lista.get(i).getImagen()%>">
                                                    <p id="product" ><%=lista.get(i).getNombre() %> </p>
                                                    <div id="produ"class="row">
                                                        <div class="col-12 col-sm-12 col-md-8 col-lg-8 col-xl-8">
                                                            <div class="container">

                                                                <input type="button" id="btn" class="btn btn-danger" value="Ver Producto" onclick="verproducto(<%=lista.get(i).getId_producto()%>),vista('<%=lista.get(i).getDes_categoria() %>'),Ulvisto(<%=lista.get(i).getId_producto()%>)">      
                                                            </div>
                                                        </div>
                                                        <div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                                                            <div class="row">
                                                                <!-- agregasr-->
                                                                    <a id="canasta" href="" class="btn btn-success disabled" ><img id="newc" src="admin/image/tienda.png"></a>
                                                                <!-- /////////////-->
                                                            </div>
                                                            <div id="stockkk">
                                                                <span style="color: white;"><%=lista.get(i).getStock()%></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>        
                                            </div>
                                        <%}}%>  
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 mt-5">
                                    <div class="row" id="promit">
                                        <span id="p_caro">Productos Vistos por Usted</span>  
                                    </div>
                                </div>
                            </div>
                            <div class="row ">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 mt-5">
                                    <div class="row" id="promit">
                                        <% 
                                            int p=0;
                                            ArrayList<Integer> list= new ArrayList();
                                            for (int i = 0; i < cookies.length; i++) {
                                                if(cookies[i].getName().equals("Cate")  | cookies[i].getName().equals("JSESSIONID")){   
                                                }else
                                                {
                                                    list.add(Integer.parseInt(cookies[i].getValue()));
                                                    p++;
                                                } 
                                            }
                                            if(user==null)
                                            {
                                            for (int j = 0; j < list.size(); j++) {
                                                for (int l = 0; l < lista.size(); l++) {
                                                    if(lista.get(l).getId_producto() == list.get(j)){%>
                                                        <div  id="inprod" class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-3">
                                                            <div id="margen">
                                                                <img  class="img-thumbnail" id="cargaimagen" src="<%=lista.get(l).getImagen()%>">
                                                                <p id="product" ><%=lista.get(l).getNombre() %> </p>
                                                                <div id="produ"class="row">
                                                                    <div class="col-12 col-sm-12 col-md-8 col-lg-8 col-xl-8">
                                                                        <div class="container">

                                                                            <input type="button" id="btn" class="btn btn-danger" value="Ver Producto" onclick="verproducto(<%=lista.get(l).getId_producto()%>),vista('<%=lista.get(l).getDes_categoria() %>')">      
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                                                                        <div class="row">
                                                                            <!-- agregasr-->
                                                                                <a id="canasta" href="" class="btn btn-success disabled" ><img id="newc" src="admin/image/tienda.png"></a>
                                                                            <!-- /////////////-->
                                                                        </div>
                                                                        <div id="stockkk">
                                                                            <span style="color: white;"><%=lista.get(l).getStock()%></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>        
                                                        </div>      
                                        <%          }
                                                }
                                            }
                                        }else{
                                        historial his=new historial(); 
                                        LinkedList<historial> his_lista=his.listaHistorial();
                                                for (int t = 0; t < his_lista.size(); t++) {
                                                    for (int n = 0; n < lista.size(); n++) {
                                                        if(lista.get(n).getId_producto() == his_lista.get(t).getId_producto() && his_lista.get(t).getId_usuario()==user.getId_usuario() ){%>
                                                        <div  id="inprod" class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-3">
                                                            <div id="margen">
                                                                <img  class="img-thumbnail" id="cargaimagen" src="<%=lista.get(n).getImagen()%>">
                                                                <p id="product" ><%=lista.get(n).getNombre() %> </p>
                                                                <div id="produ"class="row">
                                                                    <div class="col-12 col-sm-12 col-md-8 col-lg-8 col-xl-8">
                                                                        <div class="container">

                                                                            <input type="button" id="btn" class="btn btn-danger" value="Ver Producto" onclick="verproducto(<%=lista.get(n).getId_producto()%>),vista('<%=lista.get(n).getDes_categoria() %>')">      
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                                                                        <div class="row">
                                                                            <!-- agregasr-->
                                                                                <a id="canasta" href="" class="btn btn-success disabled" ><img id="newc" src="admin/image/tienda.png"></a>
                                                                            <!-- /////////////-->
                                                                        </div>
                                                                        <div id="stockkk">
                                                                            <span style="color: white;"><%=lista.get(n).getStock()%></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>        
                                                        </div>                                                         
                                                      <%} 
                                                    }
                                                }
                                            }        
                                        %>  
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                                <div class="row">
                                    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 mt-5">
                                        <div class="row" id="promit">
                                            <span id="p_caro">Productos mas vendidos</span>  
                                        </div>
                                    </div>
                                </div>
                                <div class="row ">
                                    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 mt-5">
                                        <div class="row" id="promit">
                                            <%
                                                for (int m = 0; m < showlista.size() ; m++) {
                                                    if(showlista.get(m).getVeces_compra()>=5){%>
                                                       <div  id="inprod" class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-3">
                                                            <div id="margen">
                                                                <img  class="img-thumbnail" id="cargaimagen" src="<%=lista.get(m).getImagen()%>">
                                                                <p id="product" ><%=lista.get(m).getNombre() %> </p>
                                                                <div id="produ"class="row">
                                                                    <div class="col-12 col-sm-12 col-md-8 col-lg-8 col-xl-8">
                                                                        <div class="container">

                                                                            <input type="button" id="btn" class="btn btn-danger" value="Ver Producto" onclick="verproducto(<%=lista.get(m).getId_producto()%>),vista('<%=lista.get(m).getDes_categoria() %>'),Ulvisto(<%=lista.get(m).getId_producto()%>)">      
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                                                                        <div class="row">
                                                                            <!-- agregasr-->
                                                                                <a id="canasta" href="" class="btn btn-success disabled" ><img id="newc" src="admin/image/tienda.png"></a>
                                                                            <!-- /////////////-->
                                                                        </div>
                                                                        <div id="stockkk">
                                                                            <span style="color: white;"><%=lista.get(m).getStock()%></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>        
                                                        </div> 
                                              <%    }
                                                }
                                            %> 
                                        </div>
                                    </div>
                                </div>             
                        </div>
                    </div><%}%>                    
                    <a class="carousel-control-prev" href="#product1" data-slide="prev">
                        <span id="icones" class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#product1" data-slide="next">
                        <span id="icones" class="carousel-control-next-icon"></span>
                    </a>
                </div>
            </div>                        
        </div>                            
                   
        <div class="row" id="foot">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                <footer>
                    <div class="container">
                        <h2>Contactos</h2><br>
                        <ul class="nav nav-tabs nav-justified" role="tablist">
                            <li class="nav-item" >
                                <a class="nav-link active" data-toggle="tab" href="#home">Home</a>
                            </li>
                            <li class="nav-item" >
                                <a class="nav-link " data-toggle="tab" href="#nosotros">Nosotros</a>
                            </li>
                            <li class="nav-item" >
                                <a class="nav-link " data-toggle="tab" href="#map">Ubicanos</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div id="home" class="container tab-pane active"><br>
                                <div class="row">
                                    <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <a class="btn btn-outline-success" href="mailto:someone@example.com">@</a>  
                                            </div>
                                            <input type="email" class="form-control" placeholder="@example.com">
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                        <span>Comunicate con nosotros para mas informacion </span><a href=""><u>Terminos y condiciones</u></a>
                                    </div>
                                </div>
                            </div>
                            <div id="nosotros" class="container tab-pane fade"><br>
                                <div class="row">
                                    <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                        <div class="row">
                                            <div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4 "id="rig">
                                                <img id="ndato" src="admin/image/google.png">
                                            </div>
                                            <div class="col-12 col-sm-12 col-md-8 col-lg-8 col-xl-8">
                                                <p id="sip">RapidFast@gmail.com</p>
                                                <p id="sip">servicio@RapidFast.com</p>
                                                <p id="sip">RapidFast@htmail.com</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                        <div class="row">
                                            <div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4 "id="rig">
                                                <img id="ndato" src="admin/image/what.png">
                                            </div>
                                            <div class="col-12 col-sm-12 col-md-8 col-lg-8 col-xl-8">
                                                <p id="sip">928745689</p>
                                                <p id="sip">982617425</p>
                                                <p id="sip">978569102</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>  
                            </div>
                            <div id="map" class="container tab-pane fade"><br>
                              <h3>Ubicanos</h3>
                              <iframe id="foot2" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5516.445867042784!2d-77.03057059787703!3d-12.13155461355248!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105b7e1b4b5a533%3A0xa549043226dcfb18!2sLarcomar!5e0!3m2!1ses-419!2spe!4v1592413023183!5m2!1ses-419!2spe" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                            </div>
                        </div>
                    </div>     
                </footer> 
            </div>        
        </div>
        <div class="row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                <nav class="navbar navbar-expand-md  navbar-dark fixed-bottom " id="nv">
                    <ul class="navbar-nav">
                        <li class="nav-item " >
                           <img id="logo2" src="admin/image/logo2.png">
                        </li>
                        <li class="nav-item " >
                            <a class="nav-link" href="https://www.facebook.com" target="_blank"><img  id="logoabajo" src="admin/image/face.png" class="rounded-circle"></a>
                        </li>
                        <li class="nav-item" >
                            <a class="nav-link" href="https://www.instagram.com/?hl=es-la" target="_blank"><img id="logoabajo" src="admin/image/insta.png" class="rounded-circle"></a>
                        </li>
                        <li class="nav-item" >
                            <a class="nav-link" href="https://twitter.com/login?lang=es" target="_blank"><img id="logoabajo" src="admin/image/twitter.png" class="rounded-circle"></a>
                        </li>
                        <li class="nav-item" >
                            <a class="nav-link" href="https://www.youtube.com/" target="_blank"><img id="logoabajo" src="admin/image/youtube.png" class="rounded-circle"></a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </body>
</html>

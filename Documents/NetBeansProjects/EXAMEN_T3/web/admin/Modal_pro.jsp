<%-- 
    Document   : Modal_pro
    Created on : 15/06/2020, 02:40:54 PM
    Author     : Juxn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.*, java.util.LinkedList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="/EXAMEN_T3/admin/css/bar.css">
        <script type="text/javascript" src="/EXAMEN_T3/admin/js/progresbar.js"></script>
        <link rel="stylesheet" type="text/css" href="/EXAMEN_T3/admin/css/stylehome.css">
        <link href="https://fonts.googleapis.com/css2?family=Magra&display=swap" rel="stylesheet"> 
        <link href="https://fonts.googleapis.com/css2?family=Fredericka+the+Great&display=swap" rel="stylesheet"> 
        <title>Productos</title>
    </head>
    <body>
        <script>
            function suma(){
                var num=document.getElementById('valor_coger').value;
                var tot=document.getElementById('valor_max').value;
                var precio=document.getElementById('valor_precio').value;
                if(tot>num)
                {
                    num++;
                    var total=precio*num;
                    document.getElementById('valor_coger').value=num; 
                    document.getElementById('show_precio').value="S/.  "+total; 
                }
            }
            function resta(){
                var num=document.getElementById('valor_coger').value;
                var precio=document.getElementById('valor_precio').value; 
                if(num>1){
                num--;
                var total=precio*num;
                    document.getElementById('valor_coger').value=num; 
                    document.getElementById('show_precio').value="S/.  "+total;
                }
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
            function comentarios(idpro)
            {
                document.getElementById("contenidocomentario").innerHTML="";
                $('#newcomentario').modal('show');
                $("#contenidocomentario").load("/EXAMEN_T3/admin/comentarios.jsp?id_pro="+idpro+"");
            }
            function califica(valor,id_pro,id_venta){
                alert(valor+" - "+id_pro+" - "+id_venta);
                window.open("/EXAMEN_T3/mante_califi?val="+valor+"&id_pro="+id_pro+"&id_venta="+id_venta+"","_self");
            }
            function pagina(id_user,id_ven){
            window.open("/EXAMEN_T3/admin/boucher.jsp?id_us="+id_user+"&id_ve="+id_ven+"");
            }
            function verproducto(idpro)
            {
                window.open("/EXAMEN_T3/admin/Modal_pro.jsp?id_pro="+idpro+"","_self");
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
            function favorito(id){
                
                alert(id);
            }
        </script>
        <%          boolean show=false;
                    int id_venta=0;
                    Object venta=session.getAttribute("idventa");
                    if(venta=="" || venta==null){
                    }else
                    {
                        id_venta=Integer.parseInt(String.valueOf(venta));
                        show=true;
                    }
                    
                    int id=Integer.parseInt(request.getParameter("id_pro"));
                   String nom="",imagen="",carac=" ",marca=" ",categoria=" ";
                   float precio=0;
                   int stock=0;
                   producto newpro= new producto();
                   LinkedList<producto> lista= newpro.prolista();
                   for (int i = 0; i < lista.size(); i++) {
                           if(id==lista.get(i).getId_producto()){
                                nom=lista.get(i).getNombre();
                                precio=lista.get(i).getPrecio();
                                stock=lista.get(i).getStock();
                                imagen=lista.get(i).getImagen();
                                carac=lista.get(i).getCaracteristicas();
                                marca=lista.get(i).getDes_marca();
                                categoria=lista.get(i).getDes_categoria();
                           }
                       }
                   
        %>
        <!-----nav inicio  --> 
        <div class="row ">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                <nav class="navbar navbar-expand-md  navbar-dark fixed-top" id="nv">
                    <a class="navbar-brand" href="#">
                        <img id="logo" src="/EXAMEN_T3/admin/image/logo.png">
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
                            <img id="carro" src="/EXAMEN_T3/admin/image/carrito.png">
                        </a>
                    </div>
                    <div id="guiado">
                        <div class="btn-group">
                            <a class="btn btn-outline-info dropdown-toggle dropdown-right" data-toggle="dropdown"><img id="admin"src="/EXAMEN_T3/admin/image/admin.png"></a>
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
                                 <img src="/EXAMEN_T3/admin/image/user.png" alt="60" width="60">
                             </a>
                             <div class="dropdown-divider"></div>
                              <a href="${pageContext.request.contextPath}/CerrarSesion" class="btn btn-success btn-flat">Cerrar Sesión</a>
                        </div>
                    </div>
                </nav>
            </div>
        </div> 
                        
        <!-----form de producto  -->     
        <form action="/EXAMEN_T3/mante_carrito" method="post">
            <div class="row" id="pre_forma">
                <div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
                    <div id="logo3">
                        <img class="img-thumbnail" id="pquelogo" src="<%=imagen %>"> 
                    </div>
                </div>
                <div class="col-12 col-sm-12 col-md-7 col-lg-7 col-xl-7">
                    <div class="row">
                        <span id="vistaproducto3"><%=nom%> <%=carac %></span>
                    </div>
                            <input type="hidden" name="id_product" value="<%=id %>">
                            <% if(show==true){%>
                            <input type="hidden" name="id_venta" value="<%=id_venta %>">
                            <%}%>
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                            <div class="row">
                                <span id="vistaproducto">NOMBRE: </span>
                            </div>        
                            <div class="row">
                                <span id="vistaproducto">MARCA: <%=marca %></span>
                            </div>
                            <div class="row">
                                <span id="vistaproducto">CATEGORÍA: <%=categoria %></span>
                            </div>
                            <div class="row">
                                <span id="vistaproducto">PRECIO: </span>
                                <input type="hidden" name="precio_uni" value="<%=precio %>"> 
                            </div>
                            <div class="row">
                                <span id="vistaproducto">STOCK: <%=stock%></span>
                            </div>
                        </div>
                        <div class="col-12 col-sm-12 col-md-8 col-lg-8 col-xl-8">
                            <div class="row" id="boxpeque">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                                    <div id="vistaproducto" class="row">
                                        <span>S/.  <%=precio%></span>
                                        <input type="hidden" name="precio_uni" id="valor_precio" value="<%=precio %>">
                                    </div>
                                    <div id="vistaproducto2" class="row">
                                        <span>PRECIO DE UNIDAD </span>
                                    </div>
                                    <div id="vistaproducto" class="row">
                                        <input id="show_precio" type="text" value="S/.<%=precio%>" >  
                                    </div>
                                    <div id="vistaproducto2" class="row">
                                        <span>PRECIO SUB-TOTAL </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <button class="btn btn-outline-primary" type="button" onclick="resta()"> - </button>
                            </div>
                            <div id="valor2">
                                <input class="form-control" type="text" id="valor_coger"  name="cantidad" value="1" >
                                <input type="hidden" id="valor_max" value="<%=stock %>">
                            </div>
                            <div class="input-group-append">
                                <button class="btn btn-outline-primary" type="button" onclick="suma()"> + </button>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <% 
                                venta ven=new venta();
                                LinkedList<venta> listaventa=ven.listasola();
                                    boolean paso=false;
                                    if(show==true){
                                    for (int k = 0; k < listaventa.size(); k++) {
                                    boolean estate=false;
                                    if(listaventa.get(k).getEstado().equals("pagado")  || listaventa.get(k).getEstado().equals("Enviado") || listaventa.get(k).getEstado().equals("Entregado")){
                                        estate=true;
                                    }
                                     if(user.getId_usuario()== listaventa.get(k).getId_usuario() && estate==true){
                                         paso=true;
                                     }   
                                    }
                                    }
                        %>
                        <div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
                            <p class="clasificacion">
                                <%if(paso==true){%>
                                <input id="radio1" type="radio" name="calificacion" value="5" onclick="califica(5,<%=id %>,<%=id_venta %>)"><!--
                                --><label for="radio1">★</label><!--
                                --><input id="radio2" type="radio" name="calificacion" value="4" onclick="califica(4,<%=id %>,<%=id_venta %>)"><!--
                                --><label for="radio2">★</label><!--
                                --><input id="radio3" type="radio" name="calificacion" value="3" onclick="califica(3,<%=id %>,<%=id_venta %>)"><!--
                                --><label for="radio3">★</label><!--
                                --><input id="radio4" type="radio" name="calificacion" value="2" onclick="califica(2,<%=id %>,<%=id_venta %>)"><!--
                                --><label for="radio4">★</label><!--
                                --><input id="radio5" type="radio" name="calificacion" value="1" onclick="califica(1,<%=id %>,<%=id_venta %>)"checked><!--
                                --><label for="radio5">★</label>
                                <%}
                                else{%>
                                <input id="radio1" type="radio" name="calificacion" value="5" onclick="califica(5,<%=id %>,<%=id_venta %>)" disabled><!--
                                --><label for="radio1" disabled>★</label><!--
                                --><input id="radio2" type="radio" name="calificacion" value="4" onclick="califica(4,<%=id %>,<%=id_venta %>)" disabled><!--
                                --><label for="radio2" disabled>★</label><!--
                                --><input id="radio3" type="radio" name="calificacion" value="3" onclick="califica(3,<%=id %>,<%=id_venta %>)" disabled><!--
                                --><label for="radio3" disabled>★</label><!--
                                --><input id="radio4" type="radio" name="calificacion" value="2" onclick="califica(2,<%=id %>,<%=id_venta %>)" disabled><!--
                                --><label for="radio4" disabled>★</label><!--
                                --><input id="radio5" type="radio" name="calificacion" value="1" onclick="califica(1,<%=id %>,<%=id_venta %>)"checked disabled><!--
                                --><label for="radio5" disabled>★</label>
                                <%}%>
                            </p> 
                        </div>
                        <div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                            <%if(paso==true){%>
                              <button type="button" class="btn btn-outline-info mt-2" onclick="comentarios(<%=id %>)">Escribir comentario</button>  
                            <%}
                            else{%>
                            <button type="button" class="btn btn-outline-info mt-2" disabled onclick="comentarios(<%=id %>)">Escribir comentario</button>
                            <%}%>
                        </div>
                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                            <p class="favorito">
                                <input id="radio8" type="radio" name="corazon" value=""  onclick="favorito(5)">
                                <label  for="radio8" id="lavel23">♥</label><span id="vistaproducto5">Añadir a Favoritos</span>
                            </p>
                        </div> 
                    </div>        
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                    <% if(show==true){%>
                                        <input type="submit" class="form-control btn btn-success" name="registrar"  value="Add Carrito" >
                                    <%}else{%>
                                        <input type="submit" class="form-control btn btn-success" name="registrar"  value="Add Carrito" disabled>
                                    <%}%>
                                </div>
                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                    <% if(show==true){%>
                                        <input type="submit" class="form-control btn btn-success" name="actualizar" value="Update Carrito">
                                    <%}else{%>
                                        <input type="submit" class="form-control btn btn-success" name="actualizar" value="Update Carrito" disabled>
                                    <%}%>  
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6"></div>
                    </div>       
                </div>
            </div>
        </form>
        <!--- first corousel productos comprados --->
        <div id="caroprocom" class="carousel slide" data-ride="carousel">
            
            <ul class="carousel-indicators">
                <li data-target="#caroprocom" data-slide-to="0" class="active"></li>
                <li data-target="#caroprocom" data-slide-to="1" ></li>
                <li data-target="#caroprocom" data-slide-to="2" ></li>
            </ul>
            <div class="carousel-inner">
                <%Reporteproducto_masvendido rp=new Reporteproducto_masvendido();
                  LinkedList<Reporteproducto_masvendido> listarp=rp.Reporte_productomasVendido();
                %>
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
                                <%
                                    for (int m = 0; m < listarp.size() ; m++) {
                                        if(listarp.get(m).getVeces_compra()>=5){%>
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
                                                                    <a id="canasta" href="" class="btn btn-success disabled" ><img id="newc" src="/EXAMEN_T3/admin/image/tienda.png"></a>
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
            <a class="carousel-control-prev" href="#caroprocom" data-slide="prev">
                <span  id="izq" class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#caroprocom" data-slide="next">
                <span id="izq" class="carousel-control-next-icon"></span>
            </a>                        
        </div>
        <!--- finsh corousel productos comprados --->                    
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
                                <div class="modal-header">
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                            <a href="#" class="nav-link disabled" >E: proceso</a>
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                            <a href="/EXAMEN_T3/admin/mispedidos.jsp" class="nav-link " >Mis pedidos</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-body">
                                <%if(user==null){%>
                                    <div class="row">
                                        <h1 class="display-4">Agrega Productos al Carrito</h1>
                                    </div>
                                <%}else{

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
                                                        <a type="button" class="close" href="/EXAMEN_T3/mante_carrito?car=<%=carlista.get(p).getId_venta()%>&pro=<%=carlista.get(p).getId_product() %>"><img id="bt_basura" src="/EXAMEN_T3/admin/image/basura.png"></a>        
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
                                    <a href="/EXAMEN_T3/mante_venta?id_user=<%=newid_usuario %>&id_ven=<%=newid_venta %>" type="button" class="btn btn-success" onclick="pagina(<%=newid_usuario %>,<%=newid_venta %>)">Comprar</a>
                                    <%}%>
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
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
                    
                    <!-- **************************** modal de comentario ***********************************-->
                        <div class="modal fade" id="newcomentario" tabindex="-1" role="dialog" aria-labelledby="myModal" >
                            <div class="modal-dialog " role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 id="" class="modal-title display-4">Comentarios</h1>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body " id="contenidocomentario" >
                                        <span>....</span>
                                    </div>
                                    
                                </div>    
                            </div>
                        </div> 
                    <!-- ***************************************************************************** --->
                    
        <!-----nav final  -->    
        <div class="row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                <nav class="navbar navbar-expand-md  navbar-dark fixed-bottom " id="nv">
                    <ul class="navbar-nav">
                        <li class="nav-item " >
                           <img id="logo2" src="/EXAMEN_T3/admin/image/logo2.png">
                        </li>
                        <li class="nav-item " >
                            <a class="nav-link" href="https://www.facebook.com" target="_blank"><img  id="logoabajo" src="/EXAMEN_T3/admin/image/face.png" class="rounded-circle"></a>
                        </li>
                        <li class="nav-item" >
                            <a class="nav-link" href="https://www.instagram.com/?hl=es-la" target="_blank"><img id="logoabajo" src="/EXAMEN_T3/admin/image/insta.png" class="rounded-circle"></a>
                        </li>
                        <li class="nav-item" >
                            <a class="nav-link" href="https://twitter.com/login?lang=es" target="_blank"><img id="logoabajo" src="/EXAMEN_T3/admin/image/twitter.png" class="rounded-circle"></a>
                        </li>
                        <li class="nav-item" >
                            <a class="nav-link" href="https://www.youtube.com/" target="_blank"><img id="logoabajo" src="/EXAMEN_T3/admin/image/youtube.png" class="rounded-circle"></a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </body>
</html>

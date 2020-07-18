<%-- 
    Document   : mispedidos
    Created on : 15/07/2020, 05:21:32 PM
    Author     : Juxn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.*, java.util.LinkedList" %>
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
        <link href="https://fonts.googleapis.com/css2?family=Magra&display=swap" rel="stylesheet"> 
        <link href="https://fonts.googleapis.com/css2?family=Fredericka+the+Great&display=swap" rel="stylesheet"> 
        <link href="https://fonts.googleapis.com/css2?family=Taviraj:wght@500&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=IM+Fell+Great+Primer+SC&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Josefin+Slab:ital,wght@0,600;0,700;1,600&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="/EXAMEN_T3/admin/css/bouch.css">
        <title>JSP Page</title>
    </head>
    <script>
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
            window.onload=function() {
                var num=document.getElementById('estateid').value;
                var progress=0;
                setInterval(function(){
                  if(num === "pagado"){
                      $("#dinamic1")
                        .css("width",25+"%")
                        .attr("aria-valuenow",progress);
                      $("#dinamic2")
                        .css("width",25+"%")
                        .attr("aria-valuenow",progress);
                      document.getElementById("newalerta").innerHTML='<div class="alert alert-info"><a href="" class="nav-link disabled">Su pedido se encuentra en <strong> Estado Pagado</strong> en poco tiempo se le enviara el Producto</a></div>';    
                  }
                  if(num === "Enviado"){
                      $("#dinamic1")
                        .css("width",25+"%")
                        .attr("aria-valuenow",progress);
                      $("#dinamic2")
                        .css("width",25+"%")
                        .attr("aria-valuenow",progress);
                      $("#dinamic3")
                        .css("width",25+"%")
                        .attr("aria-valuenow",progress);
                      document.getElementById("newalerta").innerHTML='<div class="alert alert-warning"><a href="" class="nav-link disabled">Su pedido se encuentra en <strong>Estado Enviado</strong> en poco tiempo le llegara su producto a su casa agradecemos su espera</a></div>';      
                      }
                   if(num === "Entregado"){
                      $("#dinamic1")
                        .css("width",25+"%")
                        .attr("aria-valuenow",progress);
                      $("#dinamic2")
                        .css("width",25+"%")
                        .attr("aria-valuenow",progress);
                      $("#dinamic3")
                        .css("width",25+"%")
                        .attr("aria-valuenow",progress);
                      $("#dinamic4")
                            .css("width",25+"%")
                            .attr("aria-valuenow",progress);
                    document.getElementById("newalerta").innerHTML='<div class="alert alert-success"><a href="" class="nav-link disabled">Su pedido se encuentra en <strong>Estado Entregado</strong>, su producto ya se entrego a su domicilio le agradecemos por utilizar nuestros servicios</a></div>';
                          }
                          
                });
            }
    </script>
    <body>
        
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
                    <a href="" class="nav-link disabled"></a>
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
        <!-----nav inicio  -->         
        <!---- cuerpo   -->   
        <div class="container" id="idcuerpopedido">
            <div class="progress" min="0" max="100">
                <div id="dinamic1" aria-valuenow="0" class="progress-bar bg-danger progress-bar-striped progress-bar-animated" style="width:0%">Proceso de compra</div>
                <div id="dinamic2" class="progress-bar bg-info progress-bar-striped progress-bar-animated" style="width:0%">Pagado</div>
                <div id="dinamic3" class="progress-bar bg-warning progress-bar-striped progress-bar-animated" style="width:0%">Enviado</div>
                <div id="dinamic4" class="progress-bar bg-success progress-bar-striped progress-bar-animated" style="width:0%">Entregado</div>
            </div>
        </div>
        <div class="row">
            <div id="alertanueva">
               <div id="newalerta"></div> 
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-sm-12 col-md-8 col-lg-8 col-xl-8" id="ptable">
                <table class="table table-striped">
                    <thead class="table-info">
                        <th id="id_t"></th>
                        <th id="id_t">Id del Producto</th>
                        <th id="id_t">Producto</th>
                        <th id="id_t">Cantidad</th>
                        <th id="id_t">Precion unitario</th>
                        <th id="id_t">Total</th>
                    </thead>
                    <tbody>
                        <%  
                            int id_venta1=Integer.parseInt(request.getParameter("id_venta"));
                            venta v=new venta();
                            LinkedList<venta> listav=v.ventalista();
                            float sub=0;
                            double total=0;
                            double totaltal=0;
                            String fecha="",hora="",estado="";
                            for (int i = 0; i <listav.size(); i++){
                                boolean estate=false;
                                if(listav.get(i).getEstado().equals("pagado")  || listav.get(i).getEstado().equals("Enviado") || listav.get(i).getEstado().equals("Entregado")){
                                    estate=true;
                                }
                                if(id_venta1==listav.get(i).getId_venta() && user.getId_usuario()==listav.get(i).getId_usuario() && estate== true)
                                  { sub=sub+listav.get(i).getPreciostotal(); 
                                    fecha= listav.get(i).getFecha();
                                    hora=listav.get(i).getHora();
                                    estado=listav.get(i).getEstado();%>
                            <tr>
                                <td id="id_d" ><img  id="srctable" src="<%=listav.get(i).getImagen() %>"></td>
                                <td id="id_d" ><%=listav.get(i).getId_producto() %></td>
                                <td id="id_d" ><%=listav.get(i).getNom_pro()  %><%=listav.get(i).getCarac() %></td>
                                <td id="id_d" ><%=listav.get(i).getC_comprada() %></td>
                                <td id="id_d" ><%=listav.get(i).getP_unitario() %></td>
                                <td id="id_d" ><%=listav.get(i).getPreciostotal() %></td>
                            </tr> 
                         <%}}%>
                            <tr>
                                <td id="p_s2" colspan="5">SUBTOTAL</td>
                                <td id="p_le2"><%=sub %></td>
                            </tr>
                            <tr><% total=sub*0.18;%>
                                <td id="p_s2" colspan="5">IGV(18%)</td>
                                <td id="p_le2"><%=total %></td>
                            </tr>
                            <tr>
                                <% totaltal=sub+total;%>
                                <td id="p_s2" class="table-danger" colspan="5">TOTAL</td>
                                <td id="p_le2" class="table-danger"><%=totaltal %></td>
                            </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                <div class="row">
                    <h1 class="display-4">Vista General</h1>
                </div>
                <div class="row">
                    <p>N- Pedido: <%=id_venta1 %></p>
                </div>
                <div class="row">
                    <p>Fecha: <%=fecha %> <%=hora %></p>
                </div>
                <div class="row">
                    <input type="hidden" id="estateid" value="<%=estado %>">
                    <p>Estado: <%=estado %></p>
                </div>
                <div class="row">
                    <h1 class="display-4">Datos del Usuario</h1>
                </div>
                <div class="row">
                    <p>Nombre: <%=user.getNombre() %> <%=user.getApellido() %></p>
                </div>
                <div class="row">
                    <p><%=user.getTipodocumento() %>: <%=user.getNro_documento() %>  </p>
                </div>
                <div class="row">
                    <h1 class="display-4">Direccion de entrega</h1>
                </div>
                <div class="row">
                    <p><%=user.getDireccion() %> </p>
                </div>
                <div class="row">
                    <iframe id="mapa" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5516.596317048841!2d-77.03327190354908!3d-12.124282995930237!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x4968160a9f272918!2sBeso%20Franc%C3%A9s%20Creper%C3%ADa!5e0!3m2!1ses-419!2spe!4v1594849939574!5m2!1ses-419!2spe" width="400" height="300" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                </div>
            </div>
        </div>                    
        <!---- cuerpo   --> 
        <!-- **************************** modal de carrito ***********************************-->
                <% carrito car=new carrito();
                   LinkedList<carrito> carlista= car.carrolista();
                   int newid_usuario=0,newid_venta=0;
                %>
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

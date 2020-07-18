<%-- 
    Document   : IngresarToken
    Created on : 06-jul-2020, 12:29:09
    Author     : PCGAMING
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
        
         <!---->
        <script src="https://cdn.rawgit.com/PascaleBeier/bootstrap-validate/v2.2.0/dist/bootstrap-validate.js" ></script>
        <title>Rapidfast</title>
        <%
         String recuperartoken = String.valueOf(session .getAttribute("token"));
         
        String recuperarnombre = String.valueOf(session .getAttribute("nombreusuario"));
        String recuperarapellido = String.valueOf(session .getAttribute("apellidousuario"));
        String recuperarid=String.valueOf(session .getAttribute("idusuario"));
        
        %>
  
    </head>
    <script src="admin/js/validartoken.js"> </script>
    <body>
           <header id="main-header">
                <nav class="navbar navbar-expand-md bg-secondary navbar-dark fixed-top">
                    <a class="navbar-brand" href="#">
                        <img id="logo" src="/EXAMEN_T3/admin/image/logo.png" >
                    </a>
                </nav>
           </header><!-- container -->
            
        <section id="recuperarusuario" class="padded">
        <div class="container">
         
        <div class="row">

            <article class="col-3">
                   <br>   <br>
            </article>
            <article class="col-6">
                <br><br><br><br><br>
                <h3 class="text-center">RECUPERAR CUENTA</h3>
                <div class="alert alert-info"><a href="#" class="close" data-dismiss="alert">&times;</a>Revise su correo electrónico , le hemos enviado un token de verificación. </div>
                <label><%=recuperarid   %></label>
                <label>Hola <%=recuperarnombre  %>   <%=recuperarapellido %></label><br>
               
             
                 <form action="/EXAMEN_T3/ControladorToken " id="form_token" name="form_token" role="form" method="post">
                      <div class="form-group">
                         
                          
                                   <div>
                                        <input id="tokenenviado" name="tokenenviado" type="hidden" value="<%=recuperartoken  %>" >
                                   </div>
                                   <div id="alerta"></div>
                                   <div class="input-group mb-4">
                                         <div class="input-group-prepend">
                                             <div class="input-group-text"><i class="fas fa-unlock-alt"></i></div>
                                         </div>
                                        
                                       <input id="tokencliente" type="text"  name="tokencliente"  class="form-control"  placeholder="Ingrese el token " required="" />
                                    </div> <!--input-group mb-4 -->
           
                                   <div class="text-center">
                                     <input class=" btn btn-success" type="submit" name="validar"  value="Validar"  onclick="validartoken();"> 
                                   </div>
                                   <div class="row" style="padding-top: 6%;">
                                     <a href="${pageContext.request.contextPath}/Principal" class="form-control btn btn-danger" style="width: auto; margin-left: auto">Ir Página Principal</a>
                                   </div>
                                   
                        </div> 
                 </form>
                <article class="col-3">

                </article>
                             <script src="bootstrap-validate.js"></script>
                            
                              <script>
                                        bootstrapValidate('#tokencliente', 'min:30:El token tiene un mínimo de 30 caracteres!')
                                              
                              </script>
        </div><!-- row -->
        </div><!-- container -->
    </section><!-- noticias -->    
   </body>
   
    
</html>

<%-- 
    Document   : newjsp
    Created on : 06-jul-2020, 14:06:01
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
     
     
    </head>
        <%
        String recuperarnombre = String.valueOf(session .getAttribute("nombreusuario"));
        String recuperarapellido = String.valueOf(session .getAttribute("apellidousuario"));
        String recuperarid=String.valueOf(session .getAttribute("idusuario"));
        
        %>
    
    <body>
      
           <header id="main-header">
                <nav class="navbar navbar-expand-md bg-secondary navbar-dark fixed-top">
                    <a class="navbar-brand" href="#">
                        <img id="logo" src="/EXAMEN_T3/admin/image/logo.png" >
                    </a>
                </nav>
           </header><!-- container -->
            
           
        <script src="admin/js/validar_clave.js"> </script>
        <section id="recuperarusuario" class="padded">
        <div class="container">
         
        <div class="row">

            <article class="col-3">
                   <br>   <br>
            </article>
            <article class="col-6">
             <br><br><br><br><br>
             <h3 class="text-center">RESTABLECER CONTRASEÑA</h3>
             <label>Para que su cuenta sea mas segura ingrese números y letras. </label><br>
             <label>Cliente: <%=recuperarnombre %></label>
             <br>
                 <form action="/EXAMEN_T3/ControladorRestablecerClave " id="form_validarclave" name="form_validarclave" role="form" method="post">
                      <div class="form-group">
                            
                                   <div id="alerta"></div>
                                   
                                   <div class="input-group mb-4">
                                         <div class="input-group-prepend">
                                             <div class="input-group-text"><i class="fas fa-unlock-alt"></i></div>
                                         </div>
                                        <label for="nueva_clavee"> </label>
                                        <input id="nueva_clavee" type="text"  name="nueva_clavee"  class="form-control" placeholder="Nueva contraseña " required="" >
                                    </div> <!--input-group mb-4 -->
                                    
                                    <div class="input-group mb-4">
                                         <div class="input-group-prepend">
                                             <div class="input-group-text"><i class="fas fa-unlock-alt"></i></div>
                                         </div>  
                                         <label for="repita_clavee"> </label>
                                         <input id="repita_clavee" type="password"  name="repita_clavee"  class="form-control" placeholder="Repita la nueva contraseña " required="" >
                                    </div> <!--input-group mb-4 -->
           
           
                                   <div class="text-center">
                                     <input class=" btn btn-success" type="submit" name="confirmar" id='confirmar' value="Confirmar"  onclick="validar_clave();" > 
                                   </div>
                                    
                                   <div class="row" style="padding-top: 6%;">
   <!--volver a la pagina principal-->   <a href="http://localhost:8080/EXAMEN_T3/index.jsp" class="form-control btn btn-danger" style="width: auto; margin-left: auto" >Salir</a>
                                   </div>
                        </div> 
                 </form>
               <article class="col-3">

               </article>
        </div><!-- row -->
        </div><!-- container -->
    </section><!-- noticias -->    
   </body>

  
     <script src="bootstrap-validate.js"></script>
                            
     <script>
          bootstrapValidate('#nueva_clavee', 'min:9: Mínimo 9 caracteres!')
          bootstrapValidate('#repita_clavee', 'min:9: Mínimo 9 caracteres!')
                                              
     </script>
    
</html>


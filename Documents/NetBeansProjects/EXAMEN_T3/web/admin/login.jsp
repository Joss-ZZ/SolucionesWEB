<%-- 
    Document   : login
    Created on : 08-jun-2020, 14:32:49
    Author     : PCGAMING
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:ital,wght@0,300;0,400;0,900;1,400&display=swap" rel="stylesheet">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script type="text/javascript" src="/EXAMEN_T3/admin/js/validar_login.js"></script>
    </head>
    <body>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                        <div id="alerta"></div>
                        <div class="card card-primary">
                            <div id="titulo" class="card-header text-center">
                                <h3>Ingresar al Sistema</h3>      
                            </div>
                            <div class="text-center">
                                <br>
                                <img src="/EXAMEN_T3/admin/img/iniciar_sesion.png" >
                            </div> 
                            <form action="/EXAMEN_T3/AutorizarUsuario" id="login1" name="login2" role="form" method="post">
                                <div class="card-body">
                                   <div class="input-group mb-4">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text"><i class="fas fa-user"></i></div>
                                        </div>
                                            <input id="correo" type="text"  name="user"  class="form-control" id="inlineFormInputGroup" placeholder="Nombre de Usuario" required="">                                     
                                    </div> <!--input-group mb-4 -->
                                    <div class="input-group mb-4">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text"><i class="fas fa-unlock-alt"></i></div>
                                        </div>
                                            <input id="password" type="password" name="password" class="form-control" id="inlineFormInputGroup" placeholder="Contraseña"  required="" >  
                                    </div> <!--input-group mb-4 -->
                                </div>
                                <div class="card-footer">
                                    <input class="form-control btn btn-success" type="submit" name="iniciar_sesion"  value="Ingresar" > 
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>               
        </section>
    </body>
</html>

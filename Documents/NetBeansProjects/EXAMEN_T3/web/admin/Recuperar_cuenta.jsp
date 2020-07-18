<%-- 
    Document   : Recuperar_cuenta
    Created on : 08-jul-2020, 17:10:43
    Author     : PCGAMING
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:ital,wght@0,300;0,400;0,900;1,400&display=swap" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
        <!---->
        <script src="https://cdn.rawgit.com/PascaleBeier/bootstrap-validate/v2.2.0/dist/bootstrap-validate.js" ></script>

        
    </head>
    <script src="admin/js/validar_recpcuenta.js"> </script>
    <body>

    <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                        <div id="alerta"></div>
                        <div class="card card-primary">
                            <div id="titulo" class="card-header text-center">
                                <h3>Recupera tu cuenta </h3>      
                            </div>
                            <div class="text-center">
                                <br>
                                <img src="/EXAMEN_T3/admin/image/logo.png" >
                            </div> 
                            <form action="/EXAMEN_T3/RecuperarCuenta" id="recuperarcuenta1" name="recuperarcuenta1"  method="post">
                                <div class="card-body">
                                   <div class="input-group mb-4">
                                         <div class="input-group-prepend">
                                             <div class="input-group-text"><i class="fas fa-user"></i></div>
                                         </div>
                                       	
                                       <input id="correo" type="text"  name="correo"  class="form-control"  placeholder="Ingrese su correo electrónico" required=""/>
                                    </div> <!--input-group mb-4 -->
                                       
                                   
                                </div>
                                <div class="card-footer">
                                    <input class="form-control btn btn-success" type="submit" name="btnEnviar"  id="btnEnviar" value="Enviar" onclick="validar_recpcuenta();"> 
                                </div>
                            </form>
                              <script src="bootstrap-validate.js"></script>
                            
                              <script>
                                        bootstrapValidate('#correo', 'email:Ingrese un correo válido!')
                                              
                              </script>
                              
                        </div>
                    </div>
                </div>
            </div>               
        </section>
    
    </body>
    
</html>
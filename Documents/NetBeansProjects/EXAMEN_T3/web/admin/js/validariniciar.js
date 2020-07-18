function validarTexto(parametro){
  // var patron=/^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]*$/; nombre que acepta caracteres especiales
var patron =/^[a-zA-Z\s]*$/;  // nombre que no acepta tildes ni la ñ  a con tilde  y lo demas
   //var patron=/^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$/g; // permite solo letras y con tildes 
    if(parametro.search(patron)){
        return false;
    }else{
       return  true;
    }
    
}
function validarNumero(parametro){
   //var patron=!/^([0-9])*$/; 
   if(!/^([0-9]{8})*$/.test(parametro)){
        return false;
    }else{
       return  true;
    }
    
}
function validarCorreo(parametro){
  // var patron = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
   
   //var patron =/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3,4})+$/;
  if (/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i.test(parametro)){
        return true;
  } else {
        return false;
  }
}
function  validariniciar(){

    var formulario =document.iniciar;// Agregarpersona viene del jsp es el name


       // correo
     if(formulario.username.value==="" ){
      
      document.getElementById("alerta").innerHTML='<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Ingrese el correo</div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
      formulario.username.focus();
        return false;
     }   
     else{
         document.getElementById("alerta").innerHTML="";
    }
    
    // clave 
     if(formulario.claves.value==="" ||  /^\s+$/.test(formulario.claves.value)){
      
      document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Ingrese la clave </div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
        formulario.claves.value=""; 
        formulario.claves.focus();
        return false;
      }else if( formulario.claves.value.length<6 || formulario.claves.value.length>14 ) {
      document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>El nombre del producto tiene un minimo de 6 caracteres y un maximo de 14 caracteres!</div>';
      formulario.claves.value="";     
      formulario.claves.focus();
      return false;
      }  
      else{
         document.getElementById("alerta").innerHTML="";
      }
    
    // nombre
     if(formulario.nombre.value==="" ||  /^\s+$/.test(formulario.nombre.value)){
      
      document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Ingrese su nombre</div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
        formulario.nombre.value=""; 
        formulario.nombre.focus();
        return false;
    }else if(validarTexto(formulario.nombre.value)=== false){
        
      document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>No se permite valores numericos ni caracteres especiales en el nombre </div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
      formulario.nombre.value="";      
      formulario.nombre.focus();
      return false;
        
    }else if( formulario.nombre.value.length<5 || formulario.nombre.value.length>26 ) {
      document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>El nombre tiene un minimo de 5 caracteres y un maximo de 26 caracteres!</div>';
      formulario.nombre.value="";     
      formulario.nombre.focus();
      return false;
    }
    else{
         document.getElementById("alerta").innerHTML="";
    }
      // apellido
      if(formulario.apellido.value==="" ||  /^\s+$/.test(formulario.apellido.value)){
      
      document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Ingrese su apellido</div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
        formulario.apellido.value=""; 
        formulario.apellido.focus();
        return false;
    }else if(validarTexto(formulario.apellido.value)=== false){
        
      document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>No se permite valores numericos ni caracteres especiales en el apellido</div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
      formulario.apellido.value="";      
      formulario.apellido.focus();
      return false;
        
    }else if( formulario.apellido.value.length<5 || formulario.apellido.value.length>26 ) {
      document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>El apellido tiene un minimo de 5 caracteres y un maximo de 26 caracteres!</div>';
      formulario.apellido.value="";     
      formulario.apellido.focus();
      return false;
    }
    else{
         document.getElementById("alerta").innerHTML="";
    }
    //tipo documento
       
    if(formulario.tipodocumento.value=== ""  || /^\s+$/.test(formulario.tipodocumento.value))
    { 
      //document.getElementById('tipo_documento').selected;  
      document.getElementById("alerta").innerHTML='<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Seleccione el tipo de documento</div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
       //
      formulario.tipodocumento.value="";
     // formulario.tipo_documento.focus();
      return false; 
    }else{
       document.getElementById("alerta").innerHTML="";
    }
      // DNI
    if(formulario.nro_documento.value==="" ){
      
      document.getElementById("alerta").innerHTML='<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Ingrese el dni</div>';
      formulario.nro_documento.focus();
      return false;
    }else if(validarNumero(formulario.nro_documento.value)===false){
       document.getElementById("alerta").innerHTML='<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>El dni consta de 8 digitos</div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
      formulario.nro_documento.value="";      
      formulario.nro_documento.focus();
      return false;
    } else{
       document.getElementById("alerta").innerHTML="";
    }
    // edad   
       
    if(formulario.edad.value=== ""  || /^\s+$/.test(formulario.edad.value))
    { 
      //document.getElementById('tipo_documento').selected;  
      document.getElementById("alerta").innerHTML='<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Ingrese su edad</div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
       //
      formulario.edad.value="";
      return false; 
    } else{
       document.getElementById("alerta").innerHTML="";
    } 
       
      // genero    
    if(formulario.genero.value=== ""  || /^\s+$/.test(formulario.genero.value))
    { 
      //document.getElementById('tipo_documento').selected;  
      document.getElementById("alerta").innerHTML='<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Marque su genero</div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
       //
      formulario.genero.value="";
      return false; 
    } else{
       document.getElementById("alerta").innerHTML="";
    }  
          
          // direccion    
    if(formulario.direccion.value=== ""  || /^\s+$/.test(formulario.direccion.value))
    { 
      //document.getElementById('tipo_documento').selected;  
      document.getElementById("alerta").innerHTML='<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Ingrese su dirección </div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
       //
      formulario.direccion.value="";
      return false; 
    }else if( formulario.direccion.value.length<8 || formulario.direccion.value.length>42 ) {
      document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>La direccion tiene un minimo de 8 caracteres y un maximo de 42 caracteres!</div>';
      formulario.direccion.value="";     
      formulario.direccion.focus();
      return false;
    } 
    
    else{
       document.getElementById("alerta").innerHTML="";
    }
    
    
    
       
       
    formulario.submit();
    
}



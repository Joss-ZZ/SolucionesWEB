
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
function  validarmarca(){

    var formulario =document.form_marca;// Agregarpersona viene del jsp es el name


    if(formulario.descripcion.value==="" ||  /^\s+$/.test(formulario.descripcion.value)){
      
      document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Ingrese el nombre de la marca</div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
        formulario.descripcion.value=""; 
        formulario.descripcion.focus();
        return false;
    }else if(validarTexto(formulario.descripcion.value)=== false){
        
      document.getElementById("alerta").innerHTML='<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>No se permite valores numericos ni caracteres especiales en el nombre de la marca</div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
      formulario.descripcion.value="";      
      formulario.descripcion.focus();
      return false;
        
    }else if( formulario.descripcion.value.length<5 || formulario.descripcion.value.length>24 ) {
      document.getElementById("alerta").innerHTML='<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>El nombre de la marca tiene un minimo de 5 caracteres y un maximo de 24 caracteres!</div>';
      formulario.descripcion.value="";     
      formulario.descripcion.focus();
      return false;
    }
    else{
         document.getElementById("alerta").innerHTML="";
    }
    

    formulario.submit();
    
}


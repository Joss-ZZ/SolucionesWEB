
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
   if(!/^([0-9]{5})*$/.test(parametro)){
        return false;
    }else{
       return  true;
    }
    
}
function  validarunidad(){

    var formulario =document.form_unidad;// Agregarpersona viene del jsp es el name


    if(formulario.descripcion.value==="" ||  /^\s+$/.test(formulario.descripcion.value)){
      
      document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Ingrese el nombre de la unidad</div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
        formulario.descripcion.value=""; 
        formulario.descripcion.focus();
        return false;
    }else if(validarTexto(formulario.descripcion.value)=== false){
        
      document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>No se permite valores numericos ni caracteres especiales en el nombre de la unidad</div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
      formulario.descripcion.value="";      
      formulario.descripcion.focus();
      return false;
        
    }else if( formulario.descripcion.value.length<3 || formulario.descripcion.value.length>24 ) {
      document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>El nombre de la unidad tiene un minimo de 3 caracteres y un maximo de 24 caracteres!</div>';
      formulario.descripcion.value="";     
      formulario.descripcion.focus();
      return false;
    }
    else{
         document.getElementById("alerta").innerHTML="";
    }
    // cantidad
    if(formulario.cantidad.value==="" ){
      
      document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Ingrese la cantidad </div>';
      formulario.cantidad.focus();
      return false;
    }else if(validarNumero(formulario.cantidad.value)===false){
       document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>La cantidad es hasta 5 digitos</div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
      formulario.cantidad.value="";      
      formulario.cantidad.focus();
      return false;
    } else{
       document.getElementById("alerta").innerHTML="";
    }

    formulario.submit();
    
    }
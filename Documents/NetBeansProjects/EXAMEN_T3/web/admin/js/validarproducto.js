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
   if(!/^([0-9])*$/.test(parametro)){
        return false;
    }else{
       return  true;
    }
    
}
function  validarproducto(){

    var formulario =document.form_producto;// Agregarpersona viene del jsp es el name


    if(formulario.nombre.value==="" ||  /^\s+$/.test(formulario.nombre.value)){
      
      document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Ingrese el nombre del producto</div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
        formulario.nombre.value=""; 
        formulario.nombre.focus();
        return false;
    }else if(validarTexto(formulario.nombre.value)=== false){
        
      document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>No se permite valores numericos ni caracteres especiales en el nombre del producto</div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
      formulario.nombre.value="";      
      formulario.nombre.focus();
      return false;
        
    }else if( formulario.nombre.value.length<3 || formulario.nombre.value.length>24 ) {
      document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>El nombre del producto tiene un minimo de 5 caracteres y un maximo de 24 caracteres!</div>';
      formulario.nombre.value="";     
      formulario.nombre.focus();
      return false;
    }
    else{
         document.getElementById("alerta").innerHTML="";
    }
    
    //  caracteristicas 
    
      if(formulario.caract.value==="" ||  /^\s+$/.test(formulario.caract.value)){
      
      document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Ingrese la caracteristica del producto</div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
        formulario.caract.value=""; 
        formulario.caract.focus();
        return false;
    }
    else if( formulario.caract.value.length<6 || formulario.caract.value.length>24 ) {
      document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>El nombre de la caracteristica del producto tiene un minimo de 5 caracteres y un maximo de 24 caracteres!</div>';
      formulario.caract.value="";     
      formulario.caract.focus();
      return false;
    }
    else{
         document.getElementById("alerta").innerHTML="";
    }
    
    // marca
    if(formulario.id_marca.value=== ""  || /^\s+$/.test(formulario.id_marca.value))
    { 
      //document.getElementById('tipo_documento').selected;  
      document.getElementById("alerta").innerHTML='<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Ingrese la  marca del producto</div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
       //
      formulario.id_marca.value="";
     // formulario.tipo_documento.focus();
      return false; 
    }
       // categoria 
    if(formulario.id_categoria.value=== ""  || /^\s+$/.test(formulario.id_categoria.value))
    { 
      //document.getElementById('tipo_documento').selected;  
      document.getElementById("alerta").innerHTML='<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Ingrese la  categoria del producto</div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
       //
      formulario.id_categoria.value="";
     // formulario.tipo_documento.focus();
      return false; 
    }
    
    
      //  precio
    
      if(formulario.precio.value==="" ||  /^\s+$/.test(formulario.precio.value)){
      
      document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Ingrese el precio del producto</div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
        formulario.precio.value=""; 
        formulario.precio.focus();
        return false;
    }
    
    
    
    // cantidad
    if(formulario.id_stock.value==="" ){
      
      document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Ingrese la cantidad en stock </div>';
      formulario.id_stock.focus();
      return false;
    }else if(validarNumero(formulario.id_stock.value)===false){
       document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>La cantidad es solo números</div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
      formulario.id_stock.value="";      
      formulario.id_stock.focus();
      return false;
    }else if( formulario.id_stock.value.length<1 || formulario.id_stock.value.length>5 ) {
      document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Tiene un minimo de 1 digito y un maximo de 5 digitos!</div>';
      formulario.id_stock.value="";     
      formulario.id_stock.focus();
      return false;
    } 
    else{
       document.getElementById("alerta").innerHTML="";
    }

   // unidad 

    if(formulario.id_unidad.value=== ""  || /^\s+$/.test(formulario.id_unidad.value))
    { 
      //document.getElementById('tipo_documento').selected;  
      document.getElementById("alerta").innerHTML='<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Ingrese la unidad del producto</div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
       //
      formulario.id_unidad.value="";
     // formulario.tipo_documento.focus();
      return false; 
    }









    formulario.submit();
    
    }

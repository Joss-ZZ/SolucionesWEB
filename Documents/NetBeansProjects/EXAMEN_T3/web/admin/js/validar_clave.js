function  validar_clave(){

    var formulario =document.form_validarclave;// Agregarpersona viene del jsp es el name

    if(formulario.nueva_clavee.value === "" ||  /^\s+$/.test(formulario.nueva_clavee.value)){
      
      document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>ingrese su clave. </div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
        formulario.nueva_clavee.value ="";  
        formulario.nueva_clavee.focus();
        return false;
    }else{
         document.getElementById("alerta").innerHTML="";
    }
    
    if(formulario.repita_clavee.value === "" || /^\s+$/.test(formulario.repita_clavee.value)){
      
      document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>ingrese su clave. </div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
        formulario.repita_clavee.value ="";  
        formulario.repita_clavee.focus();
        return false;
    }else{
         document.getElementById("alerta").innerHTML="";
    }
    
    
    if(formulario.nueva_clavee.value !== formulario.repita_clavee.value){
      
      document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Las claves no son iguales. </div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
        formulario.nueva_clavee.value =""; 
        formulario.repita_clavee.value =""; 
        formulario.nueva_clavee.focus();
        return false;
    }else{
         document.getElementById("alerta").innerHTML="";
    }
    
    
    formulario.submit();
    
}


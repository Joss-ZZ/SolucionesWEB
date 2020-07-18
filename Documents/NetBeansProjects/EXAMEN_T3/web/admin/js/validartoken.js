

function  validartoken(){

    var formulario =document.form_token;// Agregarpersona viene del jsp es el name


    if(formulario.tokenenviado.value  !== formulario.tokencliente.value){
      
      document.getElementById("alerta").innerHTML='<br><div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Token inválido. </div>';
      //accede al formulario para posicionar el cursor en la caja de texto 
        formulario.tokencliente.value=""; 
        formulario.tokencliente.focus();
        return false;
    }
    
    
    formulario.submit();
    
}


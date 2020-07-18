

const $btnImprimir = document.querySelector("#btnImprimir");

$btnImprimir.addEventListener("click", () => {
	let ocultos = document.querySelectorAll("p,strong,h1,h2,a,button,img,footer,card-body,select,label");
	ocultos.forEach(elemento => {
		elemento.classList.add("oculto-impresion");
	});
	let mostrados = document.querySelectorAll(".forzar-impresion");
	mostrados.forEach(elemento => {
		elemento.classList.remove("oculto-impresion");
	});
	window.print();
        /*
         $(document).ready(function(){
              $('.right-bloc-pub-1').find('script[src="admin/js/jquery.dataTables.min.js"]').remove();
                   
          });
     
         $("#desactivar") .addClass("disable") .click(function () { return false; }); 
         
               
    
     **/
    
               

        
    
});

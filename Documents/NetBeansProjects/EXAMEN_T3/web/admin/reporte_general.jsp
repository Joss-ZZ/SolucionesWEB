
<%@page import="modelo.Reporte_general"%>
<%@page import="java.util.LinkedList"%>

<%@ include file="templates/header.jsp"%>
<%@ include file="templates/barra.jsp"%>
<%@ include file="templates/navegacion.jsp"%>
 
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- /.card-header -->
   
   
      <style>
          @media print {
           .oculto-impresion,
           .oculto-impresion * {
             display: none !important;
           }
           
         }
       </style> 
    
    <div class="card-body">
    </div>
    <!-- /.card-body --><section class="content">

        <!-- Default box -->
        <div class="card">
            <div class="card-header parte1">
                <h3 class="card-title">Reporte General Ventas</h3>
            </div>
 
            
            <!-- /.card-header -->
            <div class="card-body">
           
                <table id="example1" class="table table-bordered table-striped forzar-impresion">
                    <thead>
                        <tr>
                            <th class="text-center" >N° VENTA</th>
                            <th class="text-center" >FECHA</th>
                            <th class="text-center" >HORA</th>
                            <th class="text-center" >PRODUCTO</th>         
                            <th class="text-center" >USUARIO</th>     
                            <th class="text-center" >NOMBRES</th>     
                            <th class="text-center" >APELLIDOS</th>     
                            <th class="text-center" >CANTIDAD</th>   
                            <th class="text-center" >TOTAL</th>   
                            <th class="text-center" >ESTADO</th>   
                        </tr>
                    </thead>
               <%
  
                Reporte_general reporte_generales = new Reporte_general();
                LinkedList<Reporte_general> Reporte_general;
                Reporte_general= reporte_generales.Reporte_general(); 
             

              %>
                 
                    <tbody>
                         <% for(int i=0; i< Reporte_general.size();i++){ %>
                        <tr>    
                            <td class="text-center"><%=Reporte_general.get(i).getId()%></td>
                            <td class="text-center"><%=Reporte_general.get(i).getFecha()%></td>        
                            <td class="text-center"><%=Reporte_general.get(i).getHora()%></td>  
                            <td class="text-center"><%=Reporte_general.get(i).getProductos()%></td>  
                            <td class="text-center"><%=Reporte_general.get(i).getUsuario()%></td>  
                            <td class="text-center"><%=Reporte_general.get(i).getNombre()%></td> 
                            <td class="text-center"><%=Reporte_general.get(i).getApellidos()%></td>  
                            <td class="text-center"><%=Reporte_general.get(i).getCantidad()%></td> 
                            <td class="text-center"><%=Reporte_general.get(i).getTotal()%></td>  
                            <td class="text-center"><%=Reporte_general.get(i).getEstado()%></td>  
                        </tr> 
                        <%}%>
                    </tbody>
                    
                </table>
                    <button id="btnImprimir" class="mt-2 btn btn-success">Imprimir</button>
                    <a href="/EXAMEN_T3/admin/R_Gene_excel.jsp" target="_bank" ><img id="exccc"src="admin/image/excel.png"></a>
               <script src="admin/js/script.js">   
               </script>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->
</div>
<%@ include file="templates/footer.jsp"%>




<!-- ./wrapper -->






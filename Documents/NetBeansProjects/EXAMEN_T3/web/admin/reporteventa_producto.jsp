<%-- 
    Document   : reporteventa_producto
    Created on : 21-jun-2020, 16:17:12
    Author     : PCGAMING
--%>

<%@page import="modelo.Reporte_general"%>
<%@page import="modelo.Reporteventa_producto"%>
<%@page import="java.util.LinkedList"%>

<%@ include file="templates/header.jsp"%>
<%@ include file="templates/barra.jsp"%>
<%@ include file="templates/navegacion.jsp"%>
 
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- /.card-header -->
    <script src="admin/js/validar.js"> </script>
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
            <div class="card-header">
                <h3 class="card-title">Reporte de Ventas Pagadas</h3>
            </div>
 
            <!-- /.card-header -->
            <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th class="text-center" >N° VENTA</th>
                            <th class="text-center" >FECHA</th>
                            <th class="text-center" >HORA</th>
                            <th class="text-center" >PRODUCTO</th>         
                            <th class="text-center" >ESTADO</th>     
                        </tr>
                    </thead>
               <%
  
                Reporteventa_producto reporte_vtaprod = new Reporteventa_producto();
                LinkedList<Reporteventa_producto> Reporte_ventasprod;
                Reporte_ventasprod= reporte_vtaprod.Reporte_ventaproductos(); 
             

              %>
                 
                    <tbody>
                         <% for(int i=0; i< Reporte_ventasprod.size();i++){ %>
                        <tr>    
                            <td class="text-center"><%=Reporte_ventasprod.get(i).getId()%></td>
                            <td class="text-center"><%=Reporte_ventasprod.get(i).getFecha()%></td>        
                            <td class="text-center"><%=Reporte_ventasprod.get(i).getHora()%></td>  
                            <td class="text-center"><%=Reporte_ventasprod.get(i).getProductos()%></td>  
                            <td class="text-center"><%=Reporte_ventasprod.get(i).getEstado()%></td>  
                        </tr> 
                        <%}%>
                    </tbody>
                </table>
                    <button id="btnImprimir" class="mt-2 btn btn-success">Imprimir</button>                   
                    <script src="admin/js/script.js"> </script>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->
</div>
<%@ include file="templates/footer.jsp"%>

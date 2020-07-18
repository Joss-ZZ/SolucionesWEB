<%-- 
    Document   : detalleproducto_admin
    Created on : 25-jun-2020, 14:23:36
    Author     : PCGAMING
--%>

<%@page import="modelo.Detalleproducto"%>
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
                <h3 class="card-title">Reporte Detalle de los carritos de compra</h3>
            </div>
 
            <!-- /.card-header -->
            <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th class="text-center" >N° VENTA</th>
                            <th class="text-center" >PRODUCTO</th>
                            <th class="text-center" >CANTIDAD</th>
                            <th class="text-center" >PRECIO</th>     
                            <th class="text-center" >SUBTOTAL</th>   
                        </tr>
                    </thead>
               <%
  
                Detalleproducto reporte_prcliente = new Detalleproducto();
                LinkedList<Detalleproducto> Reporte_prodclientes;
                Reporte_prodclientes=  reporte_prcliente.Detalleproductoss(); 
             

              %>
                 
                    <tbody>
                         <% for(int i=0; i< Reporte_prodclientes.size();i++){ %>
                        <tr>    
                            <td class="text-center"><%=Reporte_prodclientes.get(i).getId()%></td>
                            <td class="text-center"><%=Reporte_prodclientes.get(i).getProducto()%></td>        
                            <td class="text-center"><%=Reporte_prodclientes.get(i).getCantidad()%></td> 
                            <td class="text-center"><%=Reporte_prodclientes.get(i).getPrecio()%></td> 
                            <td class="text-center"><%=Reporte_prodclientes.get(i).getCantidad()*Reporte_prodclientes.get(i).getPrecio()%></td>       
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
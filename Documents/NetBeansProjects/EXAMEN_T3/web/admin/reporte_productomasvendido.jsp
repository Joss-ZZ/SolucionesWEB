<%-- 
    Document   : reporte_productomasvendido
    Created on : 21-jun-2020, 13:15:30
    Author     : PCGAMING
--%>
<%@page import="modelo.Reporteproducto_masvendido"%>
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
                <h3 class="card-title">Reporte Productos mas vendidos en la tienda</h3>
            </div>
 
            <!-- /.card-header -->
            <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th class="text-center" >ID</th>
                            <th class="text-center" >MARCA</th>
                            <th class="text-center" >CATEGORIA</th>
                            <th class="text-center" >PRODUCTO</th>         
                            <th class="text-center" >DESCRIPCION</th>  
                            <th class="text-center" >PRECIO</th>
                            <th class="text-center" >CANT_VENDIDAS</th>
                            <th class="text-center" >V_COMPRA</th>
                            <th class="text-center" >TOTAL</th>
                        </tr>
                    </thead>
               <%
  
                Reporteproducto_masvendido reporteprod_vendido = new Reporteproducto_masvendido();
                LinkedList<Reporteproducto_masvendido> Reporte_prodmasvendido;
                Reporte_prodmasvendido= reporteprod_vendido.Reporte_productomasVendido(); 
             

              %>
                 
                    <tbody>
                         <% for(int i=0; i< Reporte_prodmasvendido.size();i++){ %>
                        <tr>    
                            <td class="text-center"><%=Reporte_prodmasvendido.get(i).getId()%></td>
                            <td class="text-center"><%=Reporte_prodmasvendido.get(i).getMarca()%></td>        
                            <td class="text-center"><%=Reporte_prodmasvendido.get(i).getCategoria()%></td>  
                            <td class="text-center"><%=Reporte_prodmasvendido.get(i).getProducto()%></td>     
                            <td class="text-center"><%=Reporte_prodmasvendido.get(i).getDescripcion()%></td>    
                            <td class="text-center"><%=Reporte_prodmasvendido.get(i).getPrecio()%></td>     
                            <td class="text-center"><%=Reporte_prodmasvendido.get(i).getTotal_cantidad()%></td>     
                            <td class="text-center"><%=Reporte_prodmasvendido.get(i).getVeces_compra()%></td>     
                            <td class="text-center"><%=Reporte_prodmasvendido.get(i).getPrecio()*Reporte_prodmasvendido.get(i).getTotal_cantidad()%></td>     
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
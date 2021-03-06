<%-- 
    Document   : reporteproductos_tienda
    Created on : 20-jun-2020, 23:03:40
    Author     : PCGAMING
--%>


<%@page import="java.util.LinkedList"%>
<%@page import="modelo.Reporteproducto_Tienda"%>
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
                <h3 class="card-title">Reporte Productos de la Tienda</h3>
            </div>
 
            <!-- /.card-header -->
            <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th class="text-center" >N�PDTO</th>
                            <th class="text-center" >PRODUCTO</th>
                            <th class="text-center" >DESCRIPCION</th>
                            <th class="text-center" >CATEGORIA</th>
                            <th class="text-center" >MARCA</th>
                            <th class="text-center" >PRECIO</th>
                            <th class="text-center" >CANTIDAD</th>
                            <th class="text-center" >UNIDAD</th>
                        </tr>
                    </thead>
               <%
  
                Reporteproducto_Tienda reporteprodtda = new Reporteproducto_Tienda();
                LinkedList<Reporteproducto_Tienda> Reporte_prodtienda;
                Reporte_prodtienda= reporteprodtda.Reporte_productoTienda(); 

              %>
                 
                    <tbody>
                         <% for(int i=0; i< Reporte_prodtienda.size();i++){ %>
                        <tr>    
                            <td class="text-center"><%=Reporte_prodtienda.get(i).getId_producto()%></td>
                            <td class="text-center"><%=Reporte_prodtienda.get(i).getNombre_producto()%></td>        
                            <td class="text-center"><%=Reporte_prodtienda.get(i).getDescripcion()%></td>  
                            <td class="text-center"><%=Reporte_prodtienda.get(i).getCategoria()%></td>       
                            <td class="text-center"><%=Reporte_prodtienda.get(i).getMarca()%></td>     
                            <td class="text-center"><%=Reporte_prodtienda.get(i).getPrecio()%></td>     
                            <td class="text-center"><%=Reporte_prodtienda.get(i).getCantidad()%></td>     
                            <td class="text-center"><%=Reporte_prodtienda.get(i).getUnidad()%></td>     
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
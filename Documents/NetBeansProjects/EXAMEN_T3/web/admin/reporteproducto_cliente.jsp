

<%@page import="modelo.Reporteproducto_cliente"%>
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
                <h3 class="card-title">Reporte Venta con Cliente</h3>
            </div>
 
            <!-- /.card-header -->
            <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th class="text-center" >N° VENTA</th>
                            <th class="text-center" >FECHA</th>
                            <th class="text-center" >HORA</th>
                            <th class="text-center" >USUARIO</th>     
                            <th class="text-center" >NOMBRES</th>     
                            <th class="text-center" >APELLIDOS</th>     
                            <th class="text-center" >CANTIDAD</th>   
                            <th class="text-center" >TOTAL</th>   
                            <th class="text-center" >ESTADO</th>   
                        </tr>
                    </thead>
               <%
  
                Reporteproducto_cliente reporte_prcliente = new Reporteproducto_cliente();
                LinkedList<Reporteproducto_cliente> Reporte_prodclientes;
                Reporte_prodclientes=  reporte_prcliente.Reporte_productoClientes(); 
             

              %>
                 
                    <tbody>
                         <% for(int i=0; i< Reporte_prodclientes.size();i++){ %>
                        <tr>    
                            <td class="text-center"><%=Reporte_prodclientes.get(i).getId()%></td>
                            <td class="text-center"><%=Reporte_prodclientes.get(i).getFecha()%></td>        
                            <td class="text-center"><%=Reporte_prodclientes.get(i).getHora()%></td>  
                            <td class="text-center"><%=Reporte_prodclientes.get(i).getUsuario()%></td>  
                            <td class="text-center"><%=Reporte_prodclientes.get(i).getNombre()%></td> 
                            <td class="text-center"><%=Reporte_prodclientes.get(i).getApellido()%></td>  
                            <td class="text-center"><%=Reporte_prodclientes.get(i).getCantidad()%></td> 
                            <td class="text-center"><%=Reporte_prodclientes.get(i).getTotal()%></td>  
                            <td class="text-center"><%=Reporte_prodclientes.get(i).getEstado()%></td>  
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
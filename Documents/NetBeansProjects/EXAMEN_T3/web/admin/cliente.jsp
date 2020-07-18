

<%@page import="modelo.Reporte_cliente"%>
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
                <h3 class="card-title">Consultar cliente</h3>
            </div>
 
            
            <!-- /.card-header -->
            <div class="card-body">
           
                <table id="example1" class="table table-bordered table-striped forzar-impresion">
                    <thead>
                        <tr>
                            <th class="text-center" >ID</th>
                            <th class="text-center" >USUARIO</th>
                            <th class="text-center" >NOMBRES</th>
                            <th class="text-center" >APELLIDOS</th>         
                            <th class="text-center" >EDAD</th>     
                            <th class="text-center" >GENERO</th>     
                            <th class="text-center" >TPO-DOCTO</th>     
                            <th class="text-center" >NRO-DOCTO</th>   
                            <th class="text-center" >DIRECCION</th>   
                            <th class="text-center" >TPO-USUARIO</th>   
                       
                        </tr>
                    </thead>
               <%
  
                Reporte_cliente reporte_clientess = new Reporte_cliente();
                LinkedList<Reporte_cliente> Reporte_clientes;
                Reporte_clientes= reporte_clientess.reporte_clientes(); 
              %>
                 
                    <tbody>
                         <% for(int i=0; i< Reporte_clientes.size();i++){ %>
                        <tr>    
                            <td class="text-center"><%=Reporte_clientes.get(i).getId()%></td>
                            <td class="text-center"><%=Reporte_clientes.get(i).getUsuario()%></td>  
                            <td class="text-center"><%=Reporte_clientes.get(i).getNombre()%></td> 
                            <td class="text-center"><%=Reporte_clientes.get(i).getApellido()%></td>        
                            <td class="text-center"><%=Reporte_clientes.get(i).getEdad()%></td>  
                            <td class="text-center"><%=Reporte_clientes.get(i).getGenero()%></td>  
                            <td class="text-center"><%=Reporte_clientes.get(i).getTipo_documento()%></td>  
                            <td class="text-center"><%=Reporte_clientes.get(i).getNro_documento()%></td> 
                            <td class="text-center"><%=Reporte_clientes.get(i).getDireccion()%></td>  
                            <td class="text-center"><%=Reporte_clientes.get(i).getDescripcion()%></td>               
                        </tr> 
                        <%}%>
                    </tbody>
                    
                </table>
                    <button id="btnImprimir" class="mt-2 btn btn-success">Imprimir</button>
                    <script src="admin/js/script.js">   
               </script>
      
               
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->
</div>
<%@ include file="templates/footer.jsp"%>


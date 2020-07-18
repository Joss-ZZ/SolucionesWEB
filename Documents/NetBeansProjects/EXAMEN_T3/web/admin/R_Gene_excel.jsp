<%-- 
    Document   : R_Gene_excel
    Created on : 27/06/2020, 10:27:05 AM
    Author     : Juxn
--%>

<%@page contentType="application/vnd.ms-excel"%> 
<%@page import="modelo.*, java.util.LinkedList" %>
<!DOCTYPE html>
<%  String nombrearchivo="ReporteGeneral.xls";
    response.setHeader("Content-Disposition", "inline; filename="+nombrearchivo);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
         <div class="card-body">
                <table id="example1" class="table table-bordered table-striped forzar-impresion">
                    <thead>
                        <tr>
                            <th class="text-center" ></th>
                            <th class="text-center" style="background-color: yellow; border: solid 1px; color: #670d2e">N° VENTA</th>
                            <th class="text-center" style="background-color: yellow; border: solid 1px; color: #670d2e">FECHA</th>
                            <th class="text-center" style="background-color: yellow; border: solid 1px; color: #670d2e">HORA</th>
                            <th class="text-center" style="background-color: yellow; border: solid 1px; color: #670d2e">PRODUCTO</th>         
                            <th class="text-center" style="background-color: yellow; border: solid 1px; color: #670d2e">USUARIO</th>     
                            <th class="text-center" style="background-color: yellow; border: solid 1px; color: #670d2e">NOMBRES</th>     
                            <th class="text-center" style="background-color: yellow; border: solid 1px; color: #670d2e">APELLIDOS</th>     
                            <th class="text-center" style="background-color: yellow; border: solid 1px; color: #670d2e">CANTIDAD</th>   
                            <th class="text-center" style="background-color: yellow; border: solid 1px; color: #670d2e">TOTAL</th>   
                            <th class="text-center" style="background-color: yellow; border: solid 1px; color: #670d2e">ESTADO</th>   
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
                            <td class="text-center" ></td>
                            <td class="text-center" style="border-right: solid 1px; border-left:solid 1px; text-align: center;" ><%=Reporte_general.get(i).getId()%></td>
                            <td class="text-center" style="border-right: solid 1px; border-left:solid 1px; text-align: center;" ><%=Reporte_general.get(i).getFecha()%></td>        
                            <td class="text-center" style="border-right: solid 1px; border-left:solid 1px; text-align: center;" ><%=Reporte_general.get(i).getHora()%></td>  
                            <td class="text-center" style="border-right: solid 1px; border-left:solid 1px; text-align: center;" ><%=Reporte_general.get(i).getProductos()%></td>  
                            <td class="text-center" style="border-right: solid 1px; border-left:solid 1px; text-align: center;" ><%=Reporte_general.get(i).getUsuario()%></td>  
                            <td class="text-center" style="border-right: solid 1px; border-left:solid 1px; text-align: center;" ><%=Reporte_general.get(i).getNombre()%></td> 
                            <td class="text-center" style="border-right: solid 1px; border-left:solid 1px; text-align: center;" ><%=Reporte_general.get(i).getApellidos()%></td>  
                            <td class="text-center" style="border-right: solid 1px; border-left:solid 1px; text-align: center;" ><%=Reporte_general.get(i).getCantidad()%></td> 
                            <td class="text-center" style="border-right: solid 1px; border-left:solid 1px; text-align: center;" ><%=Reporte_general.get(i).getTotal()%></td>  
                            <td class="text-center" style="border-right: solid 1px; border-left:solid 1px; text-align: center;" ><%=Reporte_general.get(i).getEstado()%></td>  
                        </tr> 
                        <%}%>
                        <tr>
                            <td ></td>
                            <td style="border-right: solid 1px; border-left:solid 1px; border-bottom: solid 1px;"></td>
                            <td style="border-right: solid 1px; border-left:solid 1px; border-bottom: solid 1px;"></td>
                            <td style="border-right: solid 1px; border-left:solid 1px; border-bottom: solid 1px;"></td>
                            <td style="border-right: solid 1px; border-left:solid 1px; border-bottom: solid 1px;"></td>
                            <td style="border-right: solid 1px; border-left:solid 1px; border-bottom: solid 1px;"></td>
                            <td style="border-right: solid 1px; border-left:solid 1px; border-bottom: solid 1px;"></td>
                            <td style="border-right: solid 1px; border-left:solid 1px; border-bottom: solid 1px;"></td>
                            <td style="border-right: solid 1px; border-left:solid 1px; border-bottom: solid 1px;"></td>
                            <td style="border-right: solid 1px; border-left:solid 1px; border-bottom: solid 1px;"></td>
                            <td style="border-right: solid 1px; border-left:solid 1px; border-bottom: solid 1px;"></td>
                        </tr>
                    </tbody>
                    
                </table>
               </script>
            </div>
    </body>
</html>
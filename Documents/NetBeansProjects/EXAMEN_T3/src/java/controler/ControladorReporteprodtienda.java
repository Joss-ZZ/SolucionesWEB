/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Marca;

/**
 *
 * @author PCGAMING
 */
public class ControladorReporteprodtienda extends HttpServlet {

     protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
            
        if (accion.equals("Listar")) {
    
            request.getRequestDispatcher("admin/reporteproductos_tienda.jsp").forward(request, response);
        }

        if (accion.equals("Listar_marcacategoria")) {
    
           request.getRequestDispatcher("admin/detalleproducto_admin.jsp").forward(request, response);
        }    
        
        if (accion.equals("Listar_productomasvendido")) {
    
            request.getRequestDispatcher("admin/reporte_productomasvendido.jsp").forward(request, response);
        }

        if (accion.equals("Listar_reporteventaproducto")) {
    
            request.getRequestDispatcher("admin/reporteventa_producto.jsp").forward(request, response);
            
        }
        if (accion.equals("Listar_reporteproductocliente")) {
    
            request.getRequestDispatcher("admin/reporteproducto_cliente.jsp").forward(request, response);
        }
        
        
        if (accion.equals("Listar_reportegeneral")) {
    
            request.getRequestDispatcher("admin/reporte_general.jsp").forward(request, response);
        }
        
    }
}

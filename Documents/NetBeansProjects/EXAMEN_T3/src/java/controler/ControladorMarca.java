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
public class ControladorMarca extends HttpServlet {
   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String accion = request.getParameter("accion");
            
        if (accion.equals("Listar")) {
            Marca ma = new Marca();
            LinkedList<Marca> m = ma.Listar(0, accion);
            request.setAttribute("Marcas",m);
            request.getRequestDispatcher("admin/marca.jsp").forward(request, response);
        }

        if (accion.equals("Buscar")) {
            int id = Integer.parseInt(request.getParameter("Id"));
            String desc= request.getParameter("descripcion");
            request.setAttribute("id", id);
            request.setAttribute("descripcion",desc);
            request.getRequestDispatcher("admin/editarmarca.jsp").forward(request, response);
        }

        if (accion.equals("Eliminar")) {
            int id = Integer.parseInt(request.getParameter("Id"));
            Marca ma = new Marca();
            LinkedList<Marca> m= ma.Listar(id, accion);
            response.sendRedirect("ControladorMarca?accion=Listar");
        }        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion.equals("Registrar")) {
            Marca ma = new Marca();  
            ma.setDescripcion(request.getParameter("descripcion"));
   
            ma.MantenerMarca(ma, accion);
            response.sendRedirect("ControladorMarca?accion=Listar");
        }

        if (accion.equals("Editar")) {
            Marca ma = new Marca();
            
            ma.setId(Integer.parseInt(request.getParameter("id")));
            ma.setDescripcion(request.getParameter("descripcion"));
            ma.MantenerMarca(ma, accion);
            response.sendRedirect("ControladorMarca?accion=Listar");
        }        
    }

}

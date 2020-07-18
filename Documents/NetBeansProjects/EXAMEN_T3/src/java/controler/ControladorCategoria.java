/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Categoria;

/**
 *
 * @author JhoxiZZ
 */
public class ControladorCategoria extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String accion = request.getParameter("accion");
            
            System.out.println("----------------------------------------");

        if (accion.equals("Listar")) {
            Categoria cat = new Categoria();
            LinkedList<Categoria> ca = cat.Listar(0, accion);
            request.setAttribute("Categorias",ca);
            request.getRequestDispatcher("admin/categoria.jsp").forward(request, response);
        }

        if (accion.equals("Buscar")) {
            int id = Integer.parseInt(request.getParameter("Id"));
            String desc= request.getParameter("descripcion");
            request.setAttribute("id", id);
            request.setAttribute("descripcion",desc);
            request.getRequestDispatcher("admin/editarcategoria.jsp").forward(request, response);
        }

        if (accion.equals("Eliminar")) {
            int id = Integer.parseInt(request.getParameter("Id"));
            Categoria cat = new Categoria();
            LinkedList<Categoria> ca= cat.Listar(id, accion);
            response.sendRedirect("ControladorCategoria?accion=Listar");
        }        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion.equals("Registrar")) {
            Categoria cat = new Categoria();  
            cat.setDescripcion(request.getParameter("descripcion"));
   
            cat.MantenerCategoria(cat, accion);
            response.sendRedirect("ControladorCategoria?accion=Listar");
        }

        if (accion.equals("Editar")) {
            Categoria cat = new Categoria();
            
            cat.setId(Integer.parseInt(request.getParameter("id")));
            cat.setDescripcion(request.getParameter("descripcion"));
            cat.MantenerCategoria(cat, accion);
            response.sendRedirect("ControladorCategoria?accion=Listar");
        }        
    }

}

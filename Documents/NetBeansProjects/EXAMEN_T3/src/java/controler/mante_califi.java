/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.carrito;

/**
 *
 * @author Juxn
 */
@WebServlet(name = "mante_califi", urlPatterns = {"/mante_califi"})
public class mante_califi extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        carrito car=new carrito();
        try (PrintWriter out = response.getWriter()) {
            int valor=Integer.parseInt(request.getParameter("val"));
            int id_pro=Integer.parseInt(request.getParameter("id_pro"));
            int id_venta=Integer.parseInt(request.getParameter("id_venta"));
            System.out.println(valor+" - "+id_pro+" - "+id_venta+" este es el calificacion");
            car.EdiCarrCali(valor, id_venta, id_pro);
            request.getRequestDispatcher("admin/Modal_pro.jsp?id_pro="+id_pro+"").forward(request, response);
        }
    }

}

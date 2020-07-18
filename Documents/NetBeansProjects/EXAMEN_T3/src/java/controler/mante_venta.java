/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;
import modelo.*;
import java.util.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Juxn
 */
@WebServlet(name = "mante_venta", urlPatterns = {"/mante_venta"})
public class mante_venta extends HttpServlet {

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        venta v=new venta();
        producto p=new producto();
        LinkedList<venta> venn=v.ventalista();
        Date fecha_completa= new Date();
        DateFormat horaformat= new SimpleDateFormat("HH:mm");
        DateFormat fechaformat= new SimpleDateFormat("yyyy-MM-dd");
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
        boolean entro=false;
        int cont=0;
        int id_user=Integer.parseInt(request.getParameter("id_user"));
        int id_venta=Integer.parseInt(request.getParameter("id_ven"));
        String hora=horaformat.format(fecha_completa);
        String fecha=fechaformat.format(fecha_completa);
        String accion="pagado";
        v.updateventa(id_venta, id_user, fecha, hora, accion, id_venta, id_user);
        if(entro==false){
            venta ve=new venta();
            LinkedList<venta> listv=ve.listasola();
            cont=listv.size();
            cont++;
            for (int pro = 0; pro <listv.size(); pro++) {
                       if(cont==listv.get(pro).getId_venta()){
                           cont++;
                       }  
                    }
            hora=horaformat.format(fecha_completa);
            fecha=fechaformat.format(fecha_completa);
            int newuser=id_user;
            accion="proceso";
            System.out.println(cont+" "+newuser+" "+fecha+" "+hora+" "+accion+" este es cuando se crea ");
            v.Addventa(cont,newuser,fecha,hora,accion);
            session.setAttribute("idventa", cont);
        }
        if(entro==false)
        { System.out.println("entro  Cambio cantidad 1");
            v=new venta();
            LinkedList<venta> nven=v.ventalista();
            for (int k = 0; k <nven.size(); k++) {
                System.out.println("entro  Cambio cantidad 2"); 
                System.out.println(id_venta+" = "+nven.get(k).getId_venta()+" "+id_user+" = " +nven.get(k).getId_usuario()+" "+ nven.get(k).getEstado()+" = pagado" ); 
                if(id_venta==nven.get(k).getId_venta() && id_user==nven.get(k).getId_usuario() && nven.get(k).getEstado().equals("pagado")){
                    int cp_p=nven.get(k).getCanti_producto();
                    int cp_c=nven.get(k).getC_comprada();
                    int newcantidad=cp_p - cp_c;
                    int id_pro=nven.get(k).getId_producto(); 
                    if(newcantidad>=0){
                    p.Ediprocant(newcantidad, id_pro);
                    }
                    System.out.println("entro  Cambio cantidad  y  se fue ya viene"); 
                }
            }
        }
        request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

}

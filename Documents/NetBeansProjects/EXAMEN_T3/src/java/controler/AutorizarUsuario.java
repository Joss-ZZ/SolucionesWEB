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
import java.text.FieldPosition;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdk.nashorn.internal.runtime.ListAdapter;
import modelo.Conexion;
import modelo.Usuario;

/**
 *
 * @author PCGAMING
 */
public class AutorizarUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String mensaje = "";
        Date fecha_completa = new Date();
        DateFormat horaformat = new SimpleDateFormat("HH:mm");
        DateFormat fechaformat = new SimpleDateFormat("yyyy-MM-dd");
        String user = request.getParameter("user");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        Conexion conn = new Conexion();
        Usuario us = new Usuario(conn);
        Usuario use = new Usuario();
        use = us.AutorizaUsuario(user, password);
        RequestDispatcher rd;
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        //System.out.println(use.getNombre()+ use.getGenero());

        if (use != null && use.getIdtipo_usuario() == 1) {
            session.setAttribute("usuario", use);
            rd = request.getRequestDispatcher("admin/admin-area.jsp");
            rd.forward(request, response);
        } else if (use != null && use.getIdtipo_usuario() == 2 && use.getEstado().equalsIgnoreCase("habilitado")) {
            venta ven = new venta();
            LinkedList<venta> v = ven.listasola();
            boolean entro = false;
            int cont = 0;
            System.out.println(use.getId_usuario() + " u/ ");
            if (v.size() > 0) {
                for (int i = 0; i < v.size(); i++) {
                    if (use.getId_usuario() == v.get(i).getId_usuario()) {
                        System.out.println(use.getId_usuario() + " = " + v.get(i).getId_usuario());
                        if (v.get(i).getEstado().equals("proceso")) {
                            int id = v.get(i).getId_venta();
                            entro = true;
                            System.out.println(v.get(i).getEstado() + "= proceso");
                            session.setAttribute("idventa", id);
                        }
                    }
                }
                if (entro == false) {

                    cont = v.size();
                    cont++;
                    for (int p = 0; p < v.size(); p++) {
                        if (cont == v.get(p).getId_venta()) {
                            cont++;
                        }
                    }
                    String hora = horaformat.format(fecha_completa);
                    String fecha = fechaformat.format(fecha_completa);
                    int newuser = use.getId_usuario();
                    String accion = "proceso";
                    System.out.println(cont + " " + newuser + " " + fecha + " " + hora + " " + accion + " este es cuando se crea ");
                    ven.Addventa(cont, newuser, fecha, hora, accion);
                    session.setAttribute("idventa", cont);
                }
            } else {
                cont = v.size();
                cont++;
                for (int p = 0; p < v.size(); p++) {
                    if (cont == v.get(p).getId_venta()) {
                        cont++;
                    }
                }
                String hora = "13:00";
                String fecha = "2020-06-25";
                String accion = "proceso";
                int newuser = use.getId_usuario();
                ven.Addventa(cont, newuser, fecha, hora, accion);
                session.setAttribute("idventa", cont);
            }

            Cookie[] cookies = request.getCookies();
            int p = 0;
            if (cookies == null) {
            } else {
                historial his = new historial();
                ArrayList<Integer> list = new ArrayList();
                for (int i = 0; i < cookies.length; i++) {
                    if (cookies[i].getName().equals("Cate") | cookies[i].getName().equals("JSESSIONID")) {
                    } else {
                        list.add(Integer.parseInt(cookies[i].getValue()));
                        p++;
                    }
                }
                for (int t = 0; t < list.size(); t++) {
                    System.out.println(list.get(t) + " uno por uno");
                    his.Agregarhistorial(use.getId_usuario(), list.get(t));
                }
            }

            session.setAttribute("usuario", use);
            rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        } else if (use != null && use.getIdtipo_usuario() == 2 && use.getEstado().equalsIgnoreCase("inhabilitado")) {
            token TOKEN = new token();
            String enviartoken = TOKEN.generateString();// genera el token             
            mensaje = ": Su cuenta actualmente se encuentra inactiva, por favor revise su correo: " + use.getUsername();
            request.setAttribute("token", enviartoken);
            request.setAttribute("nombreusuario", use.getUsername());
            request.setAttribute("idusuario", use.getId_usuario());
            request.setAttribute("apellidousuario", use.getApellido());
            request.setAttribute("mensaje", mensaje);
            EnviarToken et = new EnviarToken();
            boolean validar = et.enviatoken(enviartoken, use.getNombre(), use.getApellido(), use.getUsername());
            if (validar == true) {
                rd = request.getRequestDispatcher("admin/validar_cuenta.jsp");
                rd.forward(request, response);
            }else{
            rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
            }
        } else {
            System.out.println("bbbbbbbbbbbbbbbbbbbbbbbbb");
            rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
    }
}

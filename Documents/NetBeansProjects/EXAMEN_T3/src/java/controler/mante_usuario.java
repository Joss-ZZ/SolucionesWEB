/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;
import modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.EnviarToken;
import modelo.token;

/**
 *
 * @author Juxn
 */
@WebServlet(name = "mante_usuario", urlPatterns = {"/mante_usuario"})
public class mante_usuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mensaje="";
        RequestDispatcher rd;
        Usuario user=new Usuario();
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        if(request.getParameter("registrar") != null){
            int id_usuario=Integer.parseInt(request.getParameter("id_usuario"));
            String username=request.getParameter("username");
            String clave=request.getParameter("clave");
            String nombre=request.getParameter("nombre");
            String apellido=request.getParameter("apellido");
            int edad=Integer.parseInt(request.getParameter("edad"));
            String genero=request.getParameter("genero");
            String tipodocumento=request.getParameter("tipodocumento");
            String nro_documento=request.getParameter("nro_documento");
            String direccion=request.getParameter("direccion");
            token TOKEN = new token();
            String enviartoken = TOKEN.generateString();// genera el token 
            EnviarToken et = new EnviarToken();
            boolean validar = et.enviatoken(enviartoken, nombre, apellido, username);
            mensaje=": Gracias por registrarte, se le envió un token de validación a: "+username;            
            request.setAttribute("token", enviartoken);
            request.setAttribute("nombreusuario", username);
            request.setAttribute("idusuario", id_usuario);
            request.setAttribute("apellidousuario", apellido);
            request.setAttribute("mensaje", mensaje);
            System.out.println(enviartoken);
            System.out.println(username);
            System.out.println(id_usuario);
            System.out.println(apellido);
            System.out.println(mensaje);
            int idtipo_usuario=2;
            user.Addusuario(id_usuario, username, clave, nombre, apellido, edad, genero, tipodocumento, nro_documento, direccion, idtipo_usuario);
            if (validar == true) {
                rd = request.getRequestDispatcher("admin/validar_cuenta.jsp");
                rd.forward(request, response);
            }else{
            rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
            }
            }   
        }
    }


}

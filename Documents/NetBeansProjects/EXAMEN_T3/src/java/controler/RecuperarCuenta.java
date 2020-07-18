/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Conexion;
import modelo.Usuario;
import modelo.token;

/**
 *
 * @author PCGAMING
 */
public class RecuperarCuenta extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
 
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

            token TOKEN =new token();
            String enviartoken= TOKEN.generateString();// genera el token 
        
            
            String remitente = "rapidfast2020@gmail.com";
            String claveempresa = "admin*123*";
            
            String destino = request.getParameter("correo");// cuenta del usuario que desea recuperar su cuenta
            Conexion conn = new Conexion();
            Usuario us = new Usuario(conn);
            Usuario use = new Usuario();
            HttpSession sesionusuario = request.getSession();
            
            use=us.Validarcorreo(destino); // se valida el correo electronico del usuario
            
            RequestDispatcher rd;
            
            System.out.println(use + "este esssssssssssss");
            if(use == null){ // cuando el usuario no existe
                System.out.println("entroooo");

                //request.getRequestDispatcher("index.jsp").forward(request, response); 
                rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
            else{// c
               
            sesionusuario.setAttribute("usuarioinformacion", use);
          //  sesionusuario.setAttribute("usuarioinformacion", use.getNombre()); // nombre del usuario
            String nombreusuario= use.getNombre(); // rescatando el nombre 
            String apellidousuario= use.getApellido();  // rescatando el apellido 
            String idusuario=Integer.toString(use.getId_usuario()); // EL ID DEL USUARIO
         
            String asunto="Recuperar tu cuenta de RAPIDFAST ";
            String mensajes="Bienvenido a RAPID FAST + <br> Sr.(ra.) "+nombreusuario+" "+apellidousuario+"<br>Para poder restablecer su cuenta,hemos enviado un token. <br> Su código de token:"+ enviartoken;
            Properties props = new Properties();
           // System.out.println(mensajes);
            props.setProperty("mail.smtp.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.starttls.enable", "true");
            props.setProperty("mail.smtp.port", "25");
            props.setProperty("mail.smtp.auth", "true");
            props.setProperty("mail.smtp.auth", remitente);
            props.setProperty("mail.smtp.auth", claveempresa);
       
            Session session = Session.getDefaultInstance(props); //
            MimeMessage mensaje = new MimeMessage(session);
      
            try { // si todo cumple ingresa 
             mensaje.addRecipient(Message.RecipientType.TO,new InternetAddress(destino));
             mensaje.setSubject(asunto);
             mensaje.setContent(mensajes,"text/html");
             Transport transport= session.getTransport("smtp");
             transport.connect("smtp.gmail.com",remitente,claveempresa);
             transport.sendMessage(mensaje, mensaje.getAllRecipients());
             transport.close();
             
             HttpSession sesion = request.getSession();//guardar sesion para el token 
             sesion.setAttribute("token",enviartoken);
              
            sesionusuario.setAttribute("nombreusuario", nombreusuario);
            sesionusuario.setAttribute("apellidousuario", apellidousuario);
            sesionusuario.setAttribute("idusuario", idusuario);
            
            request.getRequestDispatcher("admin/IngresarToken.jsp").forward(request, response);    // te direcciona al jsp
            
            } catch (Exception e) {
                e.printStackTrace();
          }
             
        }
        
    }

 
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

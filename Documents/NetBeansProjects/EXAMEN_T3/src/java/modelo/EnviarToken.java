/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author JhoxiZZ
 */
public class EnviarToken {

    boolean validacion;

    public boolean enviatoken(String enviartoken, String nombreusuario, String apellidousuario, String destino) {
        boolean validacion=false;

        String remitente = "rapidfast2020@gmail.com";
        String claveempresa = "admin*123*";


            String asunto = "Valida tu cuenta de RAPIDFAST ";
            String mensajes = "Bienvenido a RAPID FAST + <br> Sr.(ra.) " + nombreusuario + " " + apellidousuario + "<br>Para poder restablecer su cuenta,hemos enviado un token. <br> Su código de token:" + enviartoken;
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
                mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(destino));
                mensaje.setSubject(asunto);
                mensaje.setContent(mensajes, "text/html");
                Transport transport = session.getTransport("smtp");
                transport.connect("smtp.gmail.com", remitente, claveempresa);
                transport.sendMessage(mensaje, mensaje.getAllRecipients());
                transport.close();
                validacion = true;
                return validacion;
            } catch (Exception e) {
                e.printStackTrace();
            }
            return validacion;
    }
}

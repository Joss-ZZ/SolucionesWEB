/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author PCGAMING
 */
public class Usuario {

    private int id_usuario;
    private String username, clave, nombre, apellido;
    private int edad;
    private String genero, tipodocumento, nro_documento, direccion;
    private int idtipo_usuario;
    private String estado;
    Conexion conn = new Conexion();

    public Usuario() {
    }

    public Usuario(int id_usuario, String username, String clave, String nombre, String apellido, int edad, String genero, String tipodocumento, String nro_documento, String direccion, int idtipo_usuario) {
        this.id_usuario = id_usuario;
        this.username = username;
        this.clave = clave;
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
        this.genero = genero;
        this.tipodocumento = tipodocumento;
        this.nro_documento = nro_documento;
        this.direccion = direccion;
        this.idtipo_usuario = idtipo_usuario;
    }

    public Usuario(int id_usuario, String username, String clave, String nombre, String apellido, int edad, String genero, String tipodocumento, String nro_documento, String direccion, int idtipo_usuario, String estado) {
        this.id_usuario = id_usuario;
        this.username = username;
        this.clave = clave;
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
        this.genero = genero;
        this.tipodocumento = tipodocumento;
        this.nro_documento = nro_documento;
        this.direccion = direccion;
        this.idtipo_usuario = idtipo_usuario;
        this.estado = estado;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Usuario(Conexion conn) {
        this.conn = conn;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getTipodocumento() {
        return tipodocumento;
    }

    public void setTipodocumento(String tipodocumento) {
        this.tipodocumento = tipodocumento;
    }

    public String getNro_documento() {
        return nro_documento;
    }

    public void setNro_documento(String nro_documento) {
        this.nro_documento = nro_documento;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getIdtipo_usuario() {
        return idtipo_usuario;
    }

    public void setIdtipo_usuario(int idtipo_usuario) {
        this.idtipo_usuario = idtipo_usuario;
    }

    public Usuario AutorizaUsuario(String usr, String pass) {
        try {
            String sql = "SELECT * FROM USUARIO where username=? and  clave=?";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ps.setString(1, usr);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            Usuario us = null;
            if (rs.next()) {
                us = new Usuario(
                        rs.getInt("id_usuario"),
                        rs.getString("username"),
                        rs.getString("clave"),
                        rs.getString("nombre"),
                        rs.getString("apellido"),
                        rs.getInt("edad"),
                        rs.getString("genero"),
                        rs.getString("tipodocumento"),
                        rs.getString("nro_documento"),
                        rs.getString("direccion"),
                        rs.getInt("idtipo_usuario"),
                        rs.getString("estado")
                );
            }
            return us;
        } catch (Exception e) {
            System.out.println("Error en Usuario.AutorizaUsuario: " + e.getMessage());
        }
        return null;
    }

    public void Addusuario(int id_usuario, String username, String clave, String nombre, String apellido, int edad, String genero, String tipodocumento, String nro_documento, String direccion, int idtipo_usuario) {
        String estado="inhabilitado";
        try {
            String sql = "INSERT INTO USUARIO VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement nuevo = conn.getConnection().prepareStatement(sql);
            nuevo.setInt(1, id_usuario);
            nuevo.setString(2, username);
            nuevo.setString(3, clave);
            nuevo.setString(4, nombre);
            nuevo.setString(5, apellido);
            nuevo.setInt(6, edad);
            nuevo.setString(7, genero);
            nuevo.setString(8, tipodocumento);
            nuevo.setString(9, nro_documento);
            nuevo.setString(10, direccion);
            nuevo.setInt(11, idtipo_usuario);
            nuevo.setString(12, estado);
            nuevo.executeUpdate();
            nuevo.close();
            conn.desconectar();
        } catch (Exception e) {
            System.out.println("Problemas de insercion de usuario");
            System.out.println(e);
            System.out.println(id_usuario + " " + username + " " + clave + " " + nombre + " " + apellido + " " + edad + " " + genero + " " + tipodocumento + " " + nro_documento + " " + direccion + " " + idtipo_usuario + "est es fuera");
        }
    }

    // agregadoooooo---------------------------------------------------------
    public Usuario Validarcorreo(String usr) {
        try {
            String sql = "SELECT * FROM USUARIO where username=?  ";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ps.setString(1, usr);
            ResultSet rs = ps.executeQuery();
            Usuario us = null;
            if (rs.next()) {
                us = new Usuario(
                        rs.getInt("id_usuario"),
                        rs.getString("username"),
                        rs.getString("clave"),
                        rs.getString("nombre"),
                        rs.getString("apellido"),
                        rs.getInt("edad"),
                        rs.getString("genero"),
                        rs.getString("tipodocumento"),
                        rs.getString("nro_documento"),
                        rs.getString("direccion"),
                        rs.getInt("idtipo_usuario")
                );
            }
            return us;
        } catch (Exception e) {
            System.out.println("Error en Correo.Validado " + e.getMessage());
        }
        return null;
    }

    public void Editarclave(int id2, String clave, int id) {
        try {
            String query = "UPDATE usuario SET id_usuario=?, ";
            query = query + "clave=? ";
            query = query + "WHERE id_usuario=?; ";
            PreparedStatement sentencia = conn.getConnection().prepareStatement(query);
            sentencia.setInt(1, id2);
            sentencia.setString(2, clave);
            sentencia.setInt(3, id);
            sentencia.executeUpdate();
            sentencia.close();
            conn.desconectar();
        } catch (Exception e) {
            System.out.println("Problemas de actualizacion..en editar clave ");
        }
    }

    public Usuario HabilitarUsuario(int id) {
        String sql = "{CALL PRC_HABILITA_USUARIO(?)}";
        try {
            CallableStatement cs = conn.getConnection().prepareCall(sql);
            cs.setInt(1, id);
            ResultSet rs = cs.executeQuery();
            Usuario us = null;
            if (rs.next()) {
                us = new Usuario(
                        rs.getInt("id_usuario"),
                        rs.getString("username"),
                        rs.getString("clave"),
                        rs.getString("nombre"),
                        rs.getString("apellido"),
                        rs.getInt("edad"),
                        rs.getString("genero"),
                        rs.getString("tipodocumento"),
                        rs.getString("nro_documento"),
                        rs.getString("direccion"),
                        rs.getInt("idtipo_usuario")
                );
            }
            return us;
        } catch (SQLException ex) {
            System.out.println("Error en HabilitarUsuario: " + ex.getMessage());
        }
        return null;
    }

}

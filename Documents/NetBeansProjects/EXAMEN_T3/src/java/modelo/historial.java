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
import java.util.LinkedList;

/**
 *
 * @author Juxn
 */
public class historial {
    Conexion conn = new Conexion();
    private int id_usuario;
    private int id_producto;

    public historial() {
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }
    
         ////////listas historial
    public LinkedList<historial> listaHistorial(){
        try {
            String query =  "SELECT *FROM historial;";
            Statement sentencia = conn.getConnection().createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            LinkedList<historial> lista8;
            lista8 = new LinkedList<historial>();
            while(resultado.next()){
                historial his = new historial();
                his.setId_usuario(resultado.getInt("id_usuario"));
                his.setId_producto(resultado.getInt("id_producto"));
                lista8.add(his);
            }
            conn.desconectar();
            return lista8;
        } catch (Exception e) {
            System.out.println("Problema de conexion...");
        }
        return null;
    }
    ////////listas historial
      public void Agregarhistorial(int id_usuario,int id_producto){
         try {
             conn = new Conexion();
             String query = "INSERT INTO historial VALUES(?,?)";
             PreparedStatement sentencia = conn.getConnection().prepareStatement(query);
             sentencia.setInt(1, id_usuario);
             sentencia.setInt(2, id_producto);
             sentencia.executeUpdate();
             sentencia.close();
             conn.desconectar();
         } catch (Exception e) {
             System.out.println(e.getMessage()); 
             System.out.println("Problemas de insercion...");
         }
     }
}

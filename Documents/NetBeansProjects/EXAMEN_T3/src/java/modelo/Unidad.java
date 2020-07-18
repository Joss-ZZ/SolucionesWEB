/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

/**
 *
 * @author PCGAMING
 */
public class Unidad {
    private int id;
    private String descripcion;

    Conexion conn = new Conexion();
    public Unidad() {
    }

    public Unidad(int id, String descripcion) {
        this.id = id;
        this.descripcion = descripcion;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }


  
    
     public LinkedList<Unidad> Listar(int id, String accion) {
        LinkedList<Unidad> unidades = new LinkedList<Unidad>();
      //  String sql = "{CALL PRC_MANTE_STOCKS(?,'',0,?)}"; // el cero 
       String sql = "{CALL PRC_MANTE_UNIDADES(?,'',?)}";
      
        try {
            CallableStatement cs = conn.getConnection().prepareCall(sql);
            cs.setInt(1, id);
            cs.setString(2, accion);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                Unidad u = new Unidad();
                u.setId(rs.getInt("id_unidad"));
                u.setDescripcion(rs.getString("descripcion_unidad"));
                unidades.add(u);
            }
            conn.desconectar();
            return unidades;
        } catch (SQLException ex) {
            System.out.println("Error en Unidad.Listar: " + ex.getMessage());
        }
        return null;
    }
    
    
    
        public void MantenerUnidad(Unidad c, String accion) {
        String sql = "{CALL PRC_MANTE_UNIDADES(?,?,?)}";
        try {
            CallableStatement cs = conn.getConnection().prepareCall(sql);
            cs.setInt(1, c.getId());
            cs.setString(2, c.getDescripcion());
            cs.setString(3, accion);
            cs.execute();
            conn.desconectar();
        } catch (SQLException ex) {
            System.out.println("Error en Stock.MantenerStock: " + ex.getMessage());
        }
    }
    
        public LinkedList<Unidad> unilista(){
        try {
            String query =  "select * from unidad; ";
            Statement sentencia = conn.getConnection().createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            LinkedList<Unidad> lista6;
            lista6 = new LinkedList<Unidad>();
            while(resultado.next()){
                Unidad un = new Unidad();
                un.setId(resultado.getInt("id_unidad"));
                un.setDescripcion(resultado.getString("descripcion_unidad"));
                lista6.add(un);
            }
            conn.desconectar();
            return lista6;
        } catch (Exception e) {
            System.out.println("Problema de conexion...");
        }
        return null;
    }
}

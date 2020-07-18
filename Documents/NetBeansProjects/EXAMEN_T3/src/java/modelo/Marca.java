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
public class Marca {
    private int id;
    private String descripcion;
    Conexion conn = new Conexion();
    public Marca() {
    }

    public Marca(int id, String descripcion) {
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
    
    public LinkedList<Marca> Listar(int id, String accion) {
        LinkedList<Marca> marcas = new LinkedList<Marca>();
        String sql = "{CALL PRC_MANTE_MARCAS(?,'',?)}";
        try {
            CallableStatement cs = conn.getConnection().prepareCall(sql);
            cs.setInt(1, id);
            cs.setString(2, accion);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                Marca marca = new Marca();
                marca.setId(rs.getInt("id_marca"));
                marca.setDescripcion(rs.getString("descripcion_marca"));
                marcas.add(marca);
            }
            conn.desconectar();
            return marcas;
        } catch (SQLException ex) {
            System.out.println("Error en Marca.Listar: " + ex.getMessage());
        }
        return null;
    }
    
    
    
        public void MantenerMarca(Marca c, String accion) {
        String sql = "{CALL PRC_MANTE_MARCAS(?,?,?)}";
        try {
            CallableStatement cs = conn.getConnection().prepareCall(sql);
            cs.setInt(1, c.getId());
            cs.setString(2, c.getDescripcion());
            cs.setString(3, accion);
            cs.execute();
            conn.desconectar();
        } catch (SQLException ex) {
            System.out.println("Error en Marca.MantenerMarca: " + ex.getMessage());
        }
    }
        
   public LinkedList<Marca> marcalista(){
        try {
            String query =  "select * from marca; ";
            Statement sentencia = conn.getConnection().createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            LinkedList<Marca> lista6;
            lista6 = new LinkedList<Marca>();
            while(resultado.next()){
                Marca m = new Marca();
                m.setId(resultado.getInt("id_marca"));
                m.setDescripcion(resultado.getString("descripcion_marca"));
                lista6.add(m);
            }
            conn.desconectar();
            return lista6;
        } catch (Exception e) {
            System.out.println("Problema de conexion...");
        }
        return null;
    }
    
}

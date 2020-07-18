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
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author PCGAMING
 */
public class Categoria {
    private int id;
    private String descripcion;
    Conexion conn = new Conexion();
    public Categoria() {
    }

    public Categoria(int id, String descripcion) {
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
    
    public LinkedList<Categoria> Listar(int id, String accion) {
        LinkedList<Categoria> categorias = new LinkedList<Categoria>();
        String sql = "{CALL PRC_MANTE_CATEGORIAS(?,'',?)}";
        try {
            CallableStatement cs = conn.getConnection().prepareCall(sql);
            cs.setInt(1, id);
            cs.setString(2, accion);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                Categoria categoria = new Categoria();
                categoria.setId(rs.getInt("id_categoria"));
                categoria.setDescripcion(rs.getString("descripcion_categoria"));
                categorias.add(categoria);
            }
            conn.desconectar();
            return categorias;
        } catch (SQLException ex) {
            System.out.println("Error en Categoria.Listar: " + ex.getMessage());
        }
        return null;
    }
    
    
    
    public void MantenerCategoria(Categoria c, String accion) {
        String sql = "{CALL PRC_MANTE_CATEGORIAS(?,?,?)}";
        try {
            CallableStatement cs = conn.getConnection().prepareCall(sql);
            cs.setInt(1, c.getId());
            cs.setString(2, c.getDescripcion());
            cs.setString(3, accion);
            cs.execute();
            conn.desconectar();
        } catch (SQLException ex) {
            System.out.println("Error en Categoria.MantenerCategoria: " + ex.getMessage());
        }
    }
    
    public LinkedList<Categoria> categorialista(){
        try {
            String query =  "select * from categoria; ";
            Statement sentencia = conn.getConnection().createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            LinkedList<Categoria> lista6;
            lista6 = new LinkedList<Categoria>();
            while(resultado.next()){
                Categoria c = new Categoria();
                c.setId(resultado.getInt("id_categoria"));
                c.setDescripcion(resultado.getString("descripcion_categoria"));
                lista6.add(c);
            }
            conn.desconectar();
            return lista6;
        } catch (Exception e) {
            System.out.println("Problema de conexion...");
        }
        return null;
    }
}

    


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

/**
 *
 * @author PCGAMING
 */
public class Reportemarca_categoria {
    private int id_marca;
    private String marca;
    private String categoria;
    Conexion conn = new Conexion();
    public Reportemarca_categoria() {
    }

    public Reportemarca_categoria(int id_marca, String marca, String categoria) {
        this.id_marca = id_marca;
        this.marca = marca;
        this.categoria = categoria;
    }

    public int getId_marca() {
        return id_marca;
    }

    public void setId_marca(int id_marca) {
        this.id_marca = id_marca;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
    
    
     public LinkedList<Reportemarca_categoria> Reporte_marcaCategoria(){
        try {
            conn.getConnection();
            String query = "SELECT * FROM reporte_marcacategoria";
            Statement sentencia = conn.getConnection().createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            LinkedList<Reportemarca_categoria> reportesmarcacategoria;
            reportesmarcacategoria = new LinkedList<Reportemarca_categoria>();
            while(resultado.next()){
                Reportemarca_categoria r= new Reportemarca_categoria(); 
                r.setId_marca(Integer.parseInt(resultado.getString("id")));
                r.setMarca(resultado.getString("marca"));
                r.setCategoria(resultado.getString("categoria"));
                reportesmarcacategoria.add(r);
            }
            conn.desconectar();
            return reportesmarcacategoria;
        } catch (Exception e) {
            System.out.println("Problema de conexion...");
        }
        return null;
    }
    
    
}

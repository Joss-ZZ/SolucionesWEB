/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

/**
 *
 * @author PCGAMING
 */
public class Detalleproducto {
    private int id;
    private String producto;
    private int cantidad;
    private Double precio;
    Conexion conn = new Conexion();
    public Detalleproducto() {
    }

    public Detalleproducto(int id, String producto, int cantidad, Double precio) {
        this.id = id;
        this.producto = producto;
        this.cantidad = cantidad;
        this.precio = precio;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public Detalleproducto(Conexion conn) {
        this.conn = conn;
    }

       public LinkedList<Detalleproducto> Detalleproductoss(){
        try {
            conn.getConnection();
            String query = "SELECT * FROM reporte_productodet ";
            Statement sentencia = conn.getConnection().createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            LinkedList<Detalleproducto> reportesdetalles;
            reportesdetalles = new LinkedList<Detalleproducto>();
            while(resultado.next()){
                Detalleproducto r= new Detalleproducto(); 
                r.setId(Integer.parseInt(resultado.getString("id_venta")));
                r.setProducto(resultado.getString("productos"));
                r.setCantidad(Integer.parseInt(resultado.getString("cantidad")));
                r.setPrecio(Double.parseDouble(resultado.getString("precio")));
                reportesdetalles.add(r);
            }
            conn.desconectar();
            return reportesdetalles;
        } catch (Exception e) {
            System.out.println("Problema de conexion...");
        }
        return null;
    }
    
}

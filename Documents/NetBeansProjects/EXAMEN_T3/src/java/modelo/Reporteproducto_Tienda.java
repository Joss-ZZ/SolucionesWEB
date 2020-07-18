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
public class Reporteproducto_Tienda {
   private int id_producto;
   private String nombre_producto;
   private String descripcion;
   private String categoria;
   private String marca;
   private float precio;
   private int cantidad;
   private String unidad;
   
   Conexion conn = new Conexion();
    public Reporteproducto_Tienda() {
    }

    public Reporteproducto_Tienda(int id_producto, String nombre_producto, String descripcion, String categoria, String marca, float precio, int cantidad, String unidad) {
        this.id_producto = id_producto;
        this.nombre_producto = nombre_producto;
        this.descripcion = descripcion;
        this.categoria = categoria;
        this.marca = marca;
        this.precio = precio;
        this.cantidad = cantidad;
        this.unidad = unidad;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public String getNombre_producto() {
        return nombre_producto;
    }

    public void setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getUnidad() {
        return unidad;
    }

    public void setUnidad(String unidad) {
        this.unidad = unidad;
    }
   
    
       public LinkedList<Reporteproducto_Tienda> Reporte_productoTienda(){
        try {
            conn.getConnection();
            String query = "SELECT * FROM reporte_productotienda";
            Statement sentencia = conn.getConnection().createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            LinkedList<Reporteproducto_Tienda> reportesproductotienda;
            reportesproductotienda = new LinkedList<Reporteproducto_Tienda>();
            while(resultado.next()){
                Reporteproducto_Tienda r= new Reporteproducto_Tienda(); 
                r.setId_producto(Integer.parseInt(resultado.getString("id")));
                r.setNombre_producto(resultado.getString("nombre"));
                r.setDescripcion(resultado.getString("descripcion"));
                r.setCategoria(resultado.getString("categoria"));
                r.setMarca(resultado.getString("marca"));
                r.setPrecio(Float.parseFloat(resultado.getString("precio")));
                r.setCantidad(Integer.parseInt(resultado.getString("cantidad")));
                r.setUnidad(resultado.getString("unidad"));
                reportesproductotienda.add(r);
            }
            conn.desconectar();
            return reportesproductotienda;
        } catch (Exception e) {
            System.out.println("Problema de conexion...");
        }
        return null;
    }
    
    
    
    
    
}

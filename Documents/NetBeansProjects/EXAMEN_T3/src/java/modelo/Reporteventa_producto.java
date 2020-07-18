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
public class Reporteventa_producto {
    
    private String id;
    private String fecha;
    private String hora;
    private String productos;
    private String estado;
    
    Conexion conn = new Conexion();
    
    public Reporteventa_producto() {
    }

    public Reporteventa_producto(String id, String fecha, String hora, String productos, String estado) {
        this.id = id;
        this.fecha = fecha;
        this.hora = hora;
        this.productos = productos;
        this.estado = estado;
    }

 
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getProductos() {
        return productos;
    }

    public void setProductos(String productos) {
        this.productos = productos;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
         public LinkedList<Reporteventa_producto> Reporte_ventaproductos(){
        try {
            conn.getConnection();
            String query = "SELECT * FROM vista1";
            Statement sentencia = conn.getConnection().createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            LinkedList<Reporteventa_producto> reportesventasprod;
            reportesventasprod= new LinkedList<Reporteventa_producto>();
            while(resultado.next()){
                Reporteventa_producto r= new Reporteventa_producto(); 
                r.setId(resultado.getString("id_venta"));
                r.setFecha(resultado.getString("fec"));
                r.setHora(resultado.getString("hor"));
                r.setProductos(resultado.getString("productos"));
                r.setEstado(resultado.getString("est"));
                reportesventasprod.add(r);
            }
            conn.desconectar();
            return reportesventasprod;
        } catch (Exception e) {
            System.out.println("Problema de conexion...");
        }
        return null;
    }
    
    
    
    
}

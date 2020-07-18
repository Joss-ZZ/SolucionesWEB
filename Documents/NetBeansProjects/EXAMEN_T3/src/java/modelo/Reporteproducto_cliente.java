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
public class Reporteproducto_cliente {
    
    private int id;
    private String fecha;
    private String hora;
    private String usuario,nombre,apellido;
    private int cantidad;
    private double total;
    private String estado;
    Conexion conn = new Conexion();
    public Reporteproducto_cliente() {
    }

    public Reporteproducto_cliente(int id, String fecha, String hora, String usuario, String nombre, String apellido, int cantidad, double total, String estado) {
        this.id = id;
        this.fecha = fecha;
        this.hora = hora;
        this.usuario = usuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.cantidad = cantidad;
        this.total = total;
        this.estado = estado;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
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

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    public LinkedList<Reporteproducto_cliente> Reporte_productoClientes(){
        try {
            conn.getConnection();
            String query = "SELECT * FROM vista2 ";
            Statement sentencia = conn.getConnection().createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            LinkedList<Reporteproducto_cliente> reportesproductoclientes;
            reportesproductoclientes= new LinkedList<Reporteproducto_cliente>();
            while(resultado.next()){
                Reporteproducto_cliente r= new Reporteproducto_cliente(); 
                
                r.setId(Integer.parseInt(resultado.getString("id_venta")));
                r.setFecha(resultado.getString("fecha"));
                r.setHora(resultado.getString("hora"));
                r.setUsuario(resultado.getString("usuario"));
                r.setNombre(resultado.getString("cliente"));
                r.setApellido(resultado.getString("apellido"));
                r.setCantidad(Integer.parseInt(resultado.getString("cantidad_productos")));
                r.setTotal(Double.parseDouble(resultado.getString("total")));
                r.setEstado(resultado.getString("estado"));
                reportesproductoclientes.add(r);
                
            }
            conn.desconectar();
            return reportesproductoclientes;
        } catch (Exception e) {
            System.out.println("Problema de conexion...");
        }
        return null;
    }
    
    
}

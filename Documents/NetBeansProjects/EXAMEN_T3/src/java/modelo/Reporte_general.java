
package modelo;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;


public class Reporte_general {
    private String id;
    private String fecha;
    private String hora;
    private String productos;
    private String usuario;
    private String nombre,apellidos;
    private int cantidad ;
    private double total;
    private String estado;
    Conexion conn = new Conexion();
    public Reporte_general() {
    }

    public Reporte_general(String id, String fecha, String hora, String productos, String usuario, String nombre, String apellidos, int cantidad, double total, String estado) {
        this.id = id;
        this.fecha = fecha;
        this.hora = hora;
        this.productos = productos;
        this.usuario = usuario;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.cantidad = cantidad;
        this.total = total;
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

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
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
    
     public LinkedList<Reporte_general> Reporte_general(){
        try {
            conn.getConnection();
            String query = "SELECT * FROM reporte_general";
            Statement sentencia = conn.getConnection().createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            LinkedList<Reporte_general> reportesgenerales;
            reportesgenerales= new LinkedList<Reporte_general>();
            while(resultado.next()){
                Reporte_general r= new Reporte_general(); 
                r.setId(resultado.getString("id"));
                r.setFecha(resultado.getString("fecha"));
                r.setHora(resultado.getString("hora"));
                r.setProductos(resultado.getString("productos"));
                r.setUsuario(resultado.getString("usuario"));
                r.setNombre(resultado.getString("nombre"));
                r.setApellidos(resultado.getString("apellido"));
                r.setCantidad(Integer.parseInt(resultado.getString("cantidad")));
                r.setTotal(Double.parseDouble(resultado.getString("total")));
                r.setEstado(resultado.getString("estado"));
                reportesgenerales.add(r);
            }
            conn.desconectar();
            return reportesgenerales;
        } catch (Exception e) {
            System.out.println("Problema de conexion...");
        }
        return null;
    }
    
    
}

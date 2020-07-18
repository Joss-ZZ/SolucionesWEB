
package modelo;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;


public class Reporteproducto_masvendido {
   
    private int id;
    private String marca;
    private String categoria;
    private String producto;
    private String descripcion;
    private double precio;
    private int total_cantidad;
    private int veces_compra;

    Conexion conn = new Conexion();
    public Reporteproducto_masvendido() {
    }

    public Reporteproducto_masvendido(int id, String marca, String categoria, String producto, String descripcion, double precio, int total_cantidad, int veces_compra) {
        this.id = id;
        this.marca = marca;
        this.categoria = categoria;
        this.producto = producto;
        this.descripcion = descripcion;
        this.precio = precio;
        this.total_cantidad = total_cantidad;
        this.veces_compra = veces_compra;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getTotal_cantidad() {
        return total_cantidad;
    }

    public void setTotal_cantidad(int total_cantidad) {
        this.total_cantidad = total_cantidad;
    }

    public int getVeces_compra() {
        return veces_compra;
    }

    public void setVeces_compra(int veces_compra) {
        this.veces_compra = veces_compra;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }


    
        
       public LinkedList<Reporteproducto_masvendido> Reporte_productomasVendido(){
        try {
            conn.getConnection();
            String query = "SELECT * FROM reporte_productomasvendidos ";
            Statement sentencia = conn.getConnection().createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            LinkedList<Reporteproducto_masvendido> reportesproducto_masvendido;
            reportesproducto_masvendido= new LinkedList<Reporteproducto_masvendido>();
            while(resultado.next()){
                Reporteproducto_masvendido r= new Reporteproducto_masvendido(); 
                r.setId(Integer.parseInt(resultado.getString("id")));
                r.setMarca(resultado.getString("marca"));
                r.setCategoria(resultado.getString("categoria"));
                r.setProducto(resultado.getString("producto"));
                r.setDescripcion(resultado.getString("descripcion"));
                r.setPrecio(Double.parseDouble(resultado.getString("precio")));
                r.setTotal_cantidad(Integer.parseInt(resultado.getString("total_cantidad")));
                r.setVeces_compra(Integer.parseInt(resultado.getString("veces_compra")));
                reportesproducto_masvendido.add(r);
            }
            conn.desconectar();
            return reportesproducto_masvendido;
        } catch (Exception e) {
            System.out.println("Problema de conexion...");
        }
        return null;
    }
    
    
    
    
}

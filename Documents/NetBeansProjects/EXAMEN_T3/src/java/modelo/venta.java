/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

/**
 *
 * @author Juxn
 */
public class venta {
    private int id_venta;
    private int id_usuario;
    private int id_producto;
    private String nom_pro;
    private String carac;
    private String imagen;
    private float p_unitario;
    private int canti_producto;
    private int c_comprada;
    private float preciostotal;
    private String fecha;
    private String hora;
    private String estado;
    Conexion conn = new Conexion();
    
    public venta() {
    }

    public int getId_venta() {
        return id_venta;
    }

    public void setId_venta(int id_venta) {
        this.id_venta = id_venta;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public String getNom_pro() {
        return nom_pro;
    }

    public void setNom_pro(String nom_pro) {
        this.nom_pro = nom_pro;
    }

    public String getCarac() {
        return carac;
    }

    public void setCarac(String carac) {
        this.carac = carac;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public float getP_unitario() {
        return p_unitario;
    }

    public void setP_unitario(float p_unitario) {
        this.p_unitario = p_unitario;
    }

    public int getCanti_producto() {
        return canti_producto;
    }

    public void setCanti_producto(int canti_producto) {
        this.canti_producto = canti_producto;
    }

    public int getC_comprada() {
        return c_comprada;
    }

    public void setC_comprada(int c_comprada) {
        this.c_comprada = c_comprada;
    }

    public float getPreciostotal() {
        return preciostotal;
    }

    public void setPreciostotal(float preciostotal) {
        this.preciostotal = preciostotal;
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

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    

    
        ////////listas venta
public LinkedList<venta> ventalista(){
        try {
            conn = new Conexion();
            String query =  "select\n" +
                            "venta.id_venta as 'id_venta',\n" +
                            "venta.id_usuario as 'id_usuario',\n" +
                            "productos.id_producto as ' id_producto',\n" +
                            "productos.nombre as 'nom_pro', \n" +
                            "productos.caracteristica as 'carac',\n" +
                            "productos.precio as 'p_unitario',\n" +
                            "productos.stock as 'canti_producto',\n" +
                            "productos.img_producto as 'imagen',\n" +
                            "detalle.cantidad as 'c_comprada',\n" +
                            "detalle.precio_total as 'preciostotal',\n" +
                            "venta.fecha as 'fecha',\n" +
                            "venta.hora as 'hora',\n" +
                            "venta.estado as 'estado'\n" +
                            "from VENTA\n" +
                            "INNER JOIN detalle on venta.id_venta=detalle.id_venta\n" +
                            "INNER JOIN productos ON productos.id_producto=detalle.id_producto ;";
            Statement sentencia = conn.getConnection().createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            LinkedList<venta> lista6;
            lista6 = new LinkedList<venta>();
            while(resultado.next()){
                venta ven = new venta();
                ven.setId_venta(resultado.getInt("id_venta"));
                ven.setId_usuario(Integer.parseInt(resultado.getString("id_usuario")));
                ven.setId_producto(resultado.getInt("id_producto"));
                ven.setNom_pro(resultado.getString("nom_pro"));
                ven.setCarac(resultado.getString("carac"));
                ven.setImagen(resultado.getString("imagen"));
                ven.setP_unitario(resultado.getFloat("p_unitario"));
                ven.setCanti_producto(resultado.getInt("canti_producto"));
                ven.setC_comprada(resultado.getInt("c_comprada"));
                ven.setPreciostotal(resultado.getFloat("preciostotal"));
                ven.setFecha(resultado.getString("fecha"));
                ven.setHora(resultado.getString("hora"));
                ven.setEstado(resultado.getString("estado"));
                lista6.add(ven);
            }
            conn.desconectar();
            return lista6;
        } catch (Exception e) {
            System.out.println("Problema de conexion venta lista todo");
        }
        return null;
    }
  ////////////////////////////////////venta solo su valor
public LinkedList<venta> listasola(){
        try {
            conn = new Conexion();
            String query =  "select \n" +
                            "venta.id_venta as 'id_venta',\n" +
                            "venta.id_usuario as 'id_usuario',\n" +
                            "venta.fecha as 'fecha',\n" +
                            "venta.hora as 'hora',\n" +
                            "venta.estado as 'estado'\n" +
                            "from VENTA;";
            Statement sentencia = conn.getConnection().createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            LinkedList<venta> lista7;
            lista7 = new LinkedList<venta>();
            while(resultado.next()){
                venta v = new venta();
                v.setId_venta(resultado.getInt("id_venta"));
                v.setId_usuario(Integer.parseInt(resultado.getString("id_usuario")));
                v.setFecha(resultado.getString("fecha"));
                v.setHora(resultado.getString("hora"));
                v.setEstado(resultado.getString("estado"));
                lista7.add(v);
            }
            conn.desconectar();
            return lista7;
        } catch (Exception e) {
            System.out.println("Problema de conexion lista sola");
        }
        return null;
    }

      ////////////////AGREGAR VENTA
      public void Addventa(int id_venta, int id_usuario,String fecha,String hora,String estado){
          try {
                conn = new Conexion();
                String sql="INSERT INTO VENTA VALUES(?,?,?,?,?)";
                PreparedStatement von=conn.getConnection().prepareStatement(sql);
                von.setInt(1,id_venta);
                von.setInt(2,id_usuario);
                von.setString(3,fecha);
                von.setString(4,hora);
                von.setString(5,estado);
                von.executeUpdate();
                von.close();
                conn.desconectar();
          } catch (Exception e) {
              System.out.println(e.getMessage()); 
             System.out.println(id_venta+" "+id_usuario+" "+Date.valueOf(fecha)+" "+hora+" "+estado+" esto es en la clase");
             System.out.println("Problemas de insercion en venta");
          }
      }
      ////////////////EDITAR VENTA
      public void updateventa(int id_venta2, int id_usuario2,String fecha,String hora,String estado,int id_venta,int id_usuario){
          try {
                conn = new Conexion();
                String query = "UPDATE VENTA SET id_venta=?, ";
                query = query + "id_usuario=?, ";
                query = query + "fecha=?, ";
                query = query + "hora=?, ";
                query = query + "estado=? ";
                query = query + "WHERE id_venta=? ";
                query = query + "AND id_usuario=? ";
                PreparedStatement von=conn.getConnection().prepareStatement(query);
                von.setInt(1,id_venta2);
                von.setInt(2,id_usuario2);
                von.setString(3,fecha);
                von.setString(4,hora);
                von.setString(5,estado);
                von.setInt(6,id_venta);
                von.setInt(7,id_usuario);
                von.executeUpdate();
                von.close();
                conn.desconectar();
          } catch (Exception e) {
              System.out.println(e.getMessage()); 
             System.out.println("Problemas de actualizacion en venta");
          }
      }
}

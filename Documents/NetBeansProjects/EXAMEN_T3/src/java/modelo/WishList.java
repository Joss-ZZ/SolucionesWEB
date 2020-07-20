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
 * @author JhoxiZZ
 */
public class WishList {

    private int id_usuario, id_producto;
    private String imagen_pro, nombre_pro, caracteristica_pro;
    private Double precio_unidad;
    Conexion conn;

    public WishList(Conexion conn) {
        this.conn = conn;
    }

    public WishList() {
    }

    public WishList(int id_usuario, int id_producto, String imagen_pro, String nombre_pro, String caracteristica_pro, Double precio_unidad) {
        this.id_usuario = id_usuario;
        this.id_producto = id_producto;
        this.imagen_pro = imagen_pro;
        this.nombre_pro = nombre_pro;
        this.caracteristica_pro = caracteristica_pro;
        this.precio_unidad = precio_unidad;
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

    public String getImagen_pro() {
        return imagen_pro;
    }

    public void setImagen_pro(String imagen_pro) {
        this.imagen_pro = imagen_pro;
    }

    public String getNombre_pro() {
        return nombre_pro;
    }

    public void setNombre_pro(String nombre_pro) {
        this.nombre_pro = nombre_pro;
    }

    public String getCaracteristica_pro() {
        return caracteristica_pro;
    }

    public void setCaracteristica_pro(String caracteristica_pro) {
        this.caracteristica_pro = caracteristica_pro;
    }

    public Double getPrecio_unidad() {
        return precio_unidad;
    }

    public void setPrecio_unidad(Double precio_unidad) {
        this.precio_unidad = precio_unidad;
    }

    public void RegistrarWishList(int id_user, int id_pro) {
        try {
            String query = "INSERT INTO lista_deseos VALUES(?,?)";
            PreparedStatement sentencia = conn.getConnection().prepareStatement(query);
            sentencia.setInt(1, id_user);
            sentencia.setInt(2, id_pro);
            sentencia.executeUpdate();
            sentencia.close();
            conn.desconectar();
        } catch (Exception e) {
            System.out.println("Problemas de insercion en WishList.RegistrarWishList...");
        }
    }

    public LinkedList<WishList> ListarWishList(int id_usuario) {
        try {
            String query = "SELECT \n"
                    + "lista_deseos.id_usuario,\n"
                    + "lista_deseos.id_producto,\n"
                    + "productos.img_producto,\n"
                    + "productos.nombre,\n"
                    + "productos.caracteristica,\n"
                    + "productos.precio\n"
                    + "FROM  lista_deseos\n"
                    + "INNER JOIN productos ON productos.id_producto=lista_deseos.id_producto\n"
                    + "where id_usuario = ?"
                    + ";";
            PreparedStatement ps = conn.getConnection().prepareStatement(query);
            ps.setInt(1, id_usuario);
            ResultSet resultado = ps.executeQuery();
            LinkedList<WishList> lista7;
            lista7 = new LinkedList<WishList>();
            while (resultado.next()) {
                WishList wish = new WishList();
                wish.setId_usuario(resultado.getInt("lista_deseos.id_usuario"));
                wish.setId_producto(resultado.getInt("lista_deseos.id_producto"));
                wish.setImagen_pro(resultado.getString("productos.img_producto"));
                wish.setNombre_pro(resultado.getString("productos.nombre"));
                wish.setCaracteristica_pro(resultado.getString("productos.caracteristica"));
                wish.setPrecio_unidad(resultado.getDouble("productos.precio"));
                lista7.add(wish);
            }
            conn.desconectar();
            return lista7;
        } catch (Exception e) {
            System.out.println("Problema de conexion...");
        }
        return null;
    }

    public void BorrarProductoWishList(int id_user, int id_producto) {
        try {
            String query = "DELETE FROM lista_deseos WHERE id_usuario=? and id_producto=? ; ";
            PreparedStatement sentencia = conn.getConnection().prepareStatement(query);
            sentencia.setInt(1, id_user);
            sentencia.setInt(2, id_producto);
            sentencia.executeUpdate();
            sentencia.close();
            conn.desconectar();
        } catch (Exception e) {
            System.out.println("Problemas de eliminacion WishList.BorrarProductoWishList...");
        }
    }
}

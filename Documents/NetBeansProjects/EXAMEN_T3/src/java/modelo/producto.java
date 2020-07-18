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
public class producto {
 Conexion conn = new Conexion();
 private int id_producto;
 private String nombre;
 private String caracteristicas;
 private int id_marca;
 private String des_marca;
 private int id_categoria;
 private String des_categoria;
 private int stock;
 private float precio;
 private int id_unidad;
 private String des_unidad;
 private String imagen;

    public producto() {
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCaracteristicas() {
        return caracteristicas;
    }

    public void setCaracteristicas(String caracteristicas) {
        this.caracteristicas = caracteristicas;
    }

    public int getId_marca() {
        return id_marca;
    }

    public void setId_marca(int id_marca) {
        this.id_marca = id_marca;
    }

    public String getDes_marca() {
        return des_marca;
    }

    public void setDes_marca(String des_marca) {
        this.des_marca = des_marca;
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public String getDes_categoria() {
        return des_categoria;
    }

    public void setDes_categoria(String des_categoria) {
        this.des_categoria = des_categoria;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public int getId_unidad() {
        return id_unidad;
    }

    public void setId_unidad(int id_unidad) {
        this.id_unidad = id_unidad;
    }

    public String getDes_unidad() {
        return des_unidad;
    }

    public void setDes_unidad(String des_unidad) {
        this.des_unidad = des_unidad;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }


    ////////listas producto
public LinkedList<producto> prolista(){
        try {
            String query =  "select \n" +
                            "productos.id_producto as 'id_producto',\n" +
                            "productos.nombre as 'nombre',\n" +
                            "productos.caracteristica as 'caracteristicas',\n" +
                            "marca.id_marca as 'id_marca',\n" +
                            "marca.descripcion_marca as 'des_marca',\n" +
                            "categoria.id_categoria as 'id_categoria',\n" +
                            "categoria.descripcion_categoria  as 'des_categoria',\n" +
                            "productos.stock as 'stock',\n" +
                            "productos.precio as 'precio',\n" +
                            "unidad.id_unidad as 'id_unidad',\n" +
                            "unidad.descripcion_unidad as 'des_unidad',\n" +
                            "productos.img_producto as 'imagen'\n" +
                            "from productos\n" +
                            "inner join marca on productos.id_marca=marca.id_marca\n" +
                            "inner join categoria on productos.id_categoria=categoria.id_categoria\n" +
                            "inner join unidad on productos.id_unidad=unidad.id_unidad order by productos.id_producto; ";
            Statement sentencia = conn.getConnection().createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            LinkedList<producto> lista6;
            lista6 = new LinkedList<producto>();
            while(resultado.next()){
                producto pro = new producto();
                pro.setId_producto(resultado.getInt("id_producto"));
                pro.setNombre(resultado.getString("nombre"));
                pro.setCaracteristicas(resultado.getString("caracteristicas"));
                pro.setId_marca(Integer.parseInt(resultado.getString("id_marca")));
                pro.setDes_marca(resultado.getString("des_marca"));
                pro.setId_categoria(Integer.parseInt(resultado.getString("id_categoria")));
                pro.setDes_categoria(resultado.getString("des_categoria"));
                pro.setStock(Integer.parseInt(resultado.getString("stock")));
                pro.setPrecio(Float.valueOf(resultado.getString("precio")));
                pro.setId_unidad(Integer.parseInt(resultado.getString("id_unidad")));
                pro.setDes_unidad(resultado.getString("des_unidad"));
                pro.setImagen(resultado.getString("imagen"));
                lista6.add(pro);
            }
            conn.desconectar();
            return lista6;
        } catch (Exception e) {
            System.out.println("Problema de conexion...");
        }
        return null;
    }
////////////////AGREGAR PRODUCTO
      public void Agregarproducto(int id_produc,String nom,String caracte,float precio,int id_marca,int id_categoria,int stock,int id_unidad,String img_producto){
         try {
             String query = "INSERT INTO productos VALUES(?,?,?,?,?,?,?,?,?)";
             PreparedStatement sentencia = conn.getConnection().prepareStatement(query);
             sentencia.setInt(1, id_produc);
             sentencia.setString(2, nom);
             sentencia.setString(3, caracte);
             sentencia.setFloat(4, precio);
             sentencia.setInt(5, id_marca);
             sentencia.setInt(6, id_categoria);
             sentencia.setInt(7, stock);
             sentencia.setInt(8, id_unidad);
             sentencia.setString(9, img_producto);
             sentencia.executeUpdate();
             sentencia.close();
             conn.desconectar();
         } catch (Exception e) {
             System.out.println("Problemas de insercion...");
         }
     }
 ///////////////////editar cantidad///////////////////// agregarrrrrre
      public void Ediprocant(int stock,int  id_produc){
        try {
            conn = new Conexion();
            String query = "UPDATE productos SET stock=? ";
            query = query + "WHERE id_producto=?; ";
            PreparedStatement sentencia = conn.getConnection().prepareStatement(query);
            sentencia.setInt(1, stock);
            sentencia.setInt(2, id_produc);
            sentencia.executeUpdate();
            sentencia.close();
            conn.desconectar();
        } catch (Exception e) {
            System.out.println(e.getMessage()); 
            System.out.println("Problemas de actualizacion de cantidad...");
        }
        
    }
      ////////////////////////////////////////////////////////
 ////////////////EDITAR PRODUCTO 
      public void Editarproducto(int id_produc2,String nom,String caracte,float precio,int id_marca,int id_categoria,int stock,int id_unidad,String img_producto,int  id_produc){
        try {
            String query = "UPDATE productos SET id_producto=?, ";
            query = query + "nombre=?, ";
            query = query + "caracteristica=?, ";
            query = query + "precio=?, ";
            query = query + "id_marca=?, ";
            query = query + "id_categoria=?, ";
            query = query + "stock=?, ";
            query = query + "id_unidad=?, ";
            query = query + "img_producto=? ";
            query = query + "WHERE id_producto=?; ";
            PreparedStatement sentencia = conn.getConnection().prepareStatement(query);
            sentencia.setInt(1, id_produc2);
            sentencia.setString(2, nom);
            sentencia.setString(3, caracte);
            sentencia.setFloat(4, precio);
            sentencia.setInt(5, id_marca);
            sentencia.setInt(6, id_categoria);
            sentencia.setInt(7, stock);
            sentencia.setInt(8, id_unidad);
            sentencia.setString(9, img_producto);
            sentencia.setInt(10, id_produc);
            sentencia.executeUpdate();
            sentencia.close();
            conn.desconectar();
        } catch (Exception e) {
            System.out.println("Problemas de actualizacion...");
        }
        
    }
  //ELIMINAR VUELO
    public void Eliminarproducto(int id_produc){
        try {
            String query = "DELETE FROM productos WHERE id_producto=?; ";
            PreparedStatement sentencia = conn.getConnection().prepareStatement(query);
            sentencia.setInt(1, id_produc);
            sentencia.executeUpdate();
            sentencia.close();
            conn.desconectar();
        } catch (Exception e) {
            System.out.println("Problemas de eliminacion...");
        }
    }    
}

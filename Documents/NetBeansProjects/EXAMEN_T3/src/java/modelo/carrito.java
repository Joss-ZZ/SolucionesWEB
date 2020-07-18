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
public class carrito {
    Conexion conn = new Conexion();
private int id_venta;
private String estado;
private int id_product;
private String nom_product;
private String caracat;
 private String imagen;
private int id_usuario;
private String des_marca;
private String des_categoria;
private int cantidad;
private float precio_unidad;
private String unidad;
private float precio_total;
private int calificacion;
private String titulo;
private String comentario;

    public carrito() {
    }

    public int getId_venta() {
        return id_venta;
    }

    public void setId_venta(int id_venta) {
        this.id_venta = id_venta;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    public int getId_product() {
        return id_product;
    }

    public void setId_product(int id_product) {
        this.id_product = id_product;
    }

    public String getNom_product() {
        return nom_product;
    }

    public void setNom_product(String nom_product) {
        this.nom_product = nom_product;
    }

    public String getCaracat() {
        return caracat;
    }

    public void setCaracat(String caracat) {
        this.caracat = caracat;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getDes_marca() {
        return des_marca;
    }

    public void setDes_marca(String des_marca) {
        this.des_marca = des_marca;
    }

    public String getDes_categoria() {
        return des_categoria;
    }

    public void setDes_categoria(String des_categoria) {
        this.des_categoria = des_categoria;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public float getPrecio_unidad() {
        return precio_unidad;
    }

    public void setPrecio_unidad(float precio_unidad) {
        this.precio_unidad = precio_unidad;
    }

    public String getUnidad() {
        return unidad;
    }

    public void setUnidad(String unidad) {
        this.unidad = unidad;
    }

    public float getPrecio_total() {
        return precio_total;
    }

    public void setPrecio_total(float precio_total) {
        this.precio_total = precio_total;
    }

    public int getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(int calificacion) {
        this.calificacion = calificacion;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }
    

        ////////listas producto
    public LinkedList<carrito> carrolista(){
        try {
            String query =  "select\n" +
                            "detalle.id_venta as 'id_venta',\n" +
                            "venta.estado as 'estado',\n" +
                            "productos.id_producto as 'id_product',\n" +
                            "productos.nombre as 'nom_product',\n" +
                            "productos.caracteristica as 'caracat',\n" +
                            "productos.img_producto as 'imagen',\n" +
                            "usuario.id_usuario as 'id_usuario',\n" +
                            "marca.descripcion_marca as 'des_marca',\n" +
                            "categoria.descripcion_categoria  as 'des_categoria',\n" +
                            "detalle.cantidad as 'cantidad',\n" +
                            "productos.precio as 'precio_unidad',\n" +
                            "unidad.descripcion_unidad as 'unidad',\n" +
                            "detalle.precio_total as 'precio_total',\n" +
                            "detalle.calificacion as 'calificacion',\n" +
                            "detalle.titulo as 'titulo',\n" +
                            "detalle.comentario as 'comentario'\n" +
                            "from detalle\n" +
                            "INNER JOIN productos  ON  productos.id_producto =detalle.id_producto\n" +
                            "INNER JOIN unidad 	  ON  productos.id_unidad=unidad.id_unidad\n" +
                            "INNER JOIN categoria  ON  productos.id_categoria=categoria.id_categoria\n" +
                            "INNER JOIN marca      ON  productos.id_marca=marca.id_marca\n" +
                            "INNER JOIN venta      ON  venta.id_venta=detalle.id_venta\n" +
                            "INNER JOIN usuario    ON  usuario.id_usuario=venta.id_usuario;";
            Statement sentencia = conn.getConnection().createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            LinkedList<carrito> lista7;
            lista7 = new LinkedList<carrito>();
            while(resultado.next()){
                carrito carro = new carrito();
                carro.setId_venta(resultado.getInt("id_venta"));
                carro.setEstado(resultado.getString("estado"));
                carro.setId_product(resultado.getInt("id_product"));
                carro.setNom_product(resultado.getString("nom_product"));
                carro.setCaracat(resultado.getString("caracat"));
                carro.setImagen(resultado.getString("imagen"));
                carro.setId_usuario(resultado.getInt("id_usuario"));
                carro.setDes_marca(resultado.getString("des_marca"));
                carro.setDes_categoria(resultado.getString("des_categoria"));
                carro.setCantidad(resultado.getInt("cantidad"));
                carro.setPrecio_unidad(resultado.getFloat("precio_unidad"));
                carro.setUnidad(resultado.getString("unidad"));
                carro.setPrecio_total(resultado.getFloat("precio_total"));
                carro.setCalificacion(resultado.getInt("calificacion"));
                carro.setTitulo(resultado.getString("titulo"));
                carro.setComentario(resultado.getString("comentario"));
                lista7.add(carro);
            }
            conn.desconectar();
            return lista7;
        } catch (Exception e) {
            System.out.println("Problema de conexion...");
        }
        return null;
    }
    
    
    /////////////AGREGAR PRODUCTO
          public void agregarcarrito(int id_venta,int id_produc,int cantidad,float precio_total,int calificacion,String titulo,String comentario){
             try {
                 String query = "INSERT INTO detalle VALUES(?,?,?,?,?,?,?)";
                 PreparedStatement sentencia = conn.getConnection().prepareStatement(query);
                 sentencia.setInt(1, id_venta);
                 sentencia.setInt(2, id_produc);
                 sentencia.setInt(3, cantidad);
                 sentencia.setFloat(4, precio_total);
                 sentencia.setInt(5, calificacion);
                 sentencia.setString(6, titulo);
                 sentencia.setString(7, comentario);
                 sentencia.executeUpdate();
                 sentencia.close();
                 conn.desconectar();
             } catch (Exception e) {
                 System.out.println(e.getMessage());
                 System.out.println("Problemas de insercion...");
             }
         }

           ////////////////EDITAR PRODUCTO  
      public void Editarcarrito(int id_venta2,int id_produc2,int cantidad,float precio_total,int id_venta,int id_produc){
        try {
            String query = "UPDATE DETALLE SET id_venta=?, ";
            query = query + "id_producto=?, ";
            query = query + "cantidad=?, ";
            query = query + "precio_total=? ";
            query = query + "WHERE id_producto=? ";
            query = query + "AND id_venta=? " ;
            PreparedStatement sentencia = conn.getConnection().prepareStatement(query);
            sentencia.setInt(1, id_venta2);
            sentencia.setInt(2, id_produc2);
            sentencia.setInt(3, cantidad);
            sentencia.setFloat(4, precio_total);
            sentencia.setInt(5, id_produc);
            sentencia.setInt(6, id_venta);
            sentencia.executeUpdate();
            sentencia.close();
            conn.desconectar();
        } catch (Exception e) {
            System.out.println("Problemas de actualizacion...");
            System.out.println(e);
            System.out.println(id_venta2+" "+ id_venta+" - " + id_produc2+" - "  + cantidad+" - "  + precio_total+" - "  +id_produc);
        }
        
        }
         ////////////////EDITAR comentarios  
      public void EdiCarrComen(String titulo,String comentario,int id_venta,int id_produc){
        try {
            String query = "UPDATE DETALLE SET titulo=?, ";
            query = query + "comentario=? ";
            query = query + "WHERE id_producto=? ";
            query = query + "AND id_venta=? " ;
            PreparedStatement sentencia = conn.getConnection().prepareStatement(query);
            sentencia.setString(1, titulo);
            sentencia.setString(2, comentario);
            sentencia.setInt(3, id_produc);
            sentencia.setInt(4, id_venta);
            sentencia.executeUpdate();
            sentencia.close();
            conn.desconectar();
        } catch (Exception e) {
            System.out.println("Problemas de actualizacion comentarios...");
            System.out.println(e.getMessage());
            System.out.println(titulo+" "+ comentario+" - " + id_venta +" - " +id_produc);
        }
        
        }
      public void EdiCarrCali(int calificacion,int id_venta,int id_produc){
        try {
            String query = "UPDATE DETALLE SET calificacion=? ";
            query = query + "WHERE id_producto=? ";
            query = query + "AND id_venta=? " ;
            PreparedStatement sentencia = conn.getConnection().prepareStatement(query);
            sentencia.setInt(1, calificacion);
            sentencia.setInt(2, id_produc);
            sentencia.setInt(3, id_venta);
            sentencia.executeUpdate();
            sentencia.close();
            conn.desconectar();
        } catch (Exception e) {
            System.out.println("Problemas de actualizacion comentarios...");
            System.out.println(e.getMessage());
            System.out.println(calificacion+" - " + id_venta +" - " +id_produc);
        }
        
        }
     //ELIMINAR detalle
    public void Eliminardetalle(int id_venta,int id_product){
        try {
            String query = "DELETE FROM detalle WHERE id_venta=? and id_producto=? ; ";
            PreparedStatement sentencia = conn.getConnection().prepareStatement(query);
            sentencia.setInt(1, id_venta);
            sentencia.setInt(2, id_product);
            sentencia.executeUpdate();
            sentencia.close();
            conn.desconectar();
        } catch (Exception e) {
            System.out.println("Problemas de eliminacion...");
        }
    } 
}


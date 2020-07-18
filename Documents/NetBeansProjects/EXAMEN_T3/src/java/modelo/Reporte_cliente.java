
package modelo;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;


public class Reporte_cliente {
    private int id;
    private String usuario,nombre,apellido;
    private int edad;
    private String genero,tipo_documento,nro_documento,direccion,descripcion;
    Conexion conn = new Conexion();
    public Reporte_cliente() {
    }

    public Reporte_cliente(int id, String usuario, String nombre, String apellido, int edad, String genero, String tipo_documento, String nro_documento, String direccion, String descripcion) {
        this.id = id;
        this.usuario = usuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
        this.genero = genero;
        this.tipo_documento = tipo_documento;
        this.nro_documento = nro_documento;
        this.direccion = direccion;
        this.descripcion = descripcion;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getTipo_documento() {
        return tipo_documento;
    }

    public void setTipo_documento(String tipo_documento) {
        this.tipo_documento = tipo_documento;
    }

    public String getNro_documento() {
        return nro_documento;
    }

    public void setNro_documento(String nro_documento) {
        this.nro_documento = nro_documento;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public LinkedList<Reporte_cliente> reporte_clientes(){
        try {
            conn.getConnection();
            String query = "SELECT * FROM reporte_cliente";
            Statement sentencia = conn.getConnection().createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            LinkedList<Reporte_cliente> reportescliente;
            reportescliente= new LinkedList<Reporte_cliente>();
            while(resultado.next()){
                Reporte_cliente r= new Reporte_cliente(); 
                r.setId(Integer.parseInt(resultado.getString("id")));
                r.setUsuario(resultado.getString("usuario"));
                r.setNombre(resultado.getString("nombre"));
                r.setApellido(resultado.getString("apellido"));
                r.setEdad(Integer.parseInt(resultado.getString("edad")));
                r.setGenero(resultado.getString("genero"));
                r.setTipo_documento(resultado.getString("tipo_documento"));
                r.setNro_documento(resultado.getString("nro_documento"));
                r.setDireccion(resultado.getString("direccion"));
                r.setDescripcion(resultado.getString("tipousuario"));
                reportescliente.add(r);
            }
            conn.desconectar();
            return reportescliente;
        } catch (Exception e) {
            System.out.println("Problema de conexion...");
        }
        return null;
    }
}

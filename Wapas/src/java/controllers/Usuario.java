/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;
import java.sql.*;

/**
 *
 * @author Jade
 */
public class Usuario {
    private int idUsuario;
    private int idTipoUsuario;
    private String nombre;
    private String telefono;
    private String email;
    private String contrasena;
    private String nacimiento;

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdTipoUsuario() {
        return idTipoUsuario;
    }

    public void setIdTipoUsuario(int idTipoUsuario) {
        this.idTipoUsuario = idTipoUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getNacimiento() {
        return nacimiento;
    }

    public void setNacimiento(String nacimiento) {
        this.nacimiento = nacimiento;
    }
    
    public void registrarUsuario(int idTipoUsuario, String nombre, String telefono, String email, String contrasena, String nacimiento){
        Connection cn = null;
        PreparedStatement ps = null;
        
        Usuario usuario = null;
        
        try {
            cn= DBConnection.getConnection();
            ps = cn.prepareStatement("insert into Usuario(idTipoUsuario, nombre, telefono, email, "
                    + "contrasena, nacimiento) values (?,?,?,?,?,?);");
 
            ps.setInt(1,idTipoUsuario);
            ps.setString(2,nombre);
            ps.setString(3, telefono);
            ps.setString (4,email);
            ps.setString(5, contrasena);
            ps.setString(6, nacimiento);
            
            ps.executeUpdate();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        finally {
            try {
            cn.close();
            ps.close();
            
            } catch (SQLException e) {}
            
            
        }
    }
    
    public Usuario IniciarSesion (String email, String contrasena ) throws SQLException {
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        Usuario usuario = null;
        
        try {
            cn= DBConnection.getConnection();
            ps = cn.prepareStatement("select * from Usuario where email=? and contrasena=? ;");
            ps.setString(1, email);
            ps.setString(2, contrasena);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                usuario = new Usuario ();
                
                usuario.setIdTipoUsuario(rs.getInt("idTipoUsuario"));
                usuario.setIdUsuario(rs.getInt("idUsuario"));
                usuario.setNacimiento(rs.getString("nacimiento"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setTelefono(rs.getString("telefono"));
                usuario.setContrasena(rs.getString("contrasena"));
                usuario.setEmail(rs.getString("email"));
                
                System.out.println (rs.getString("nombre"));
            }
            
        }catch(SQLException e){
        }finally {
            cn.close();
            ps.close();
            rs.close();  
        }
        
        return usuario;
        
    }
    
    public void editarInformacion( String nombre, String telefono, int idUsuario) throws SQLException{
        Connection cn = null;
        PreparedStatement ps = null;
        
        try {
            cn= DBConnection.getConnection();
            ps = cn.prepareStatement("update Usuario set nombre=? ,email =? ,telefono=? where idUsuario=? ;");
            
            int idTipoUsuario= 1;
            
            ps.setString(1, nombre);
            ps.setString(2, email);
            ps.setString (3, telefono);
            ps.setInt (4, idUsuario );
            
            ps.executeUpdate();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        finally {
            cn.close();
            ps.close();  
        }
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Jade
 */
public class Cita {
    
    private int idCita;
    private int idUsuario;
    private String fecha;
    private int idEstado;

    public int getIdCita() {
        return idCita;
    }

    public void setIdCita(int idCita) {
        this.idCita = idCita;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getIdEstado() {
        return idEstado;
    }

    public void setIdEstado(int idEstado) {
        this.idEstado = idEstado;
    }
    
    public ArrayList <Cita> obtenerCitas (int idUsuario) {
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        ArrayList <Cita> lista_tiposerv = null;
        
        try {
            cn= DBConnection.getConnection();
            ps = cn.prepareStatement("select * from Cita where idUsuario = ?;");
            
            ps.setInt(1,idUsuario);
            rs = ps.executeQuery();
            
            lista_tiposerv = new ArrayList<Cita>();
            
            while (rs.next()) {
                
                Cita cita = new Cita();
                cita.setIdCita(rs.getInt("idCita"));
                cita.setIdUsuario(rs.getInt("idUsuario"));
                cita.setIdEstado(rs.getInt("idEstado"));
                cita.setFecha(rs.getString("fecha"));
                
                lista_tiposerv.add(cita);
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        finally {
            try {
            cn.close();
            ps.close();
            rs.close();
            } catch (SQLException e) {}
            
            
        }
        
        return lista_tiposerv;
        
    }
    
    public void registrarCita(int idUsuario, String fecha){
        Connection cn = null;
        PreparedStatement ps = null;
        
        try {
            cn= DBConnection.getConnection();
            
            ps = cn.prepareStatement("insert into Cita(idUsuario, fecha, idEstado) values (?, ?, ?);");
            ps.setInt(1, idUsuario);
            ps.setString(2, fecha);
            ps.setInt(3, 2);
            
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
    
    public void borrarCita(int idCita){
        Connection cn = null;
        PreparedStatement ps = null;
        
        try {
            cn= DBConnection.getConnection();
            
            ps = cn.prepareStatement("delete from Cita where idCita = ?;");
            ps.setInt(1, idCita);
            
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
    
    
}

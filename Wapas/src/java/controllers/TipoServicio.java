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
public class TipoServicio {
    
    private int idTipoServicio;
    private String nombre;

    public int getIdTipoServicio() {
        return idTipoServicio;
    }

    public void setIdTipoServicio(int idTipoServicio) {
        this.idTipoServicio = idTipoServicio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public ArrayList <TipoServicio> listaTipoServicio () {
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        ArrayList <TipoServicio> lista_tiposerv = null;
        
        try {
            cn= DBConnection.getConnection();
            ps = cn.prepareStatement("select * from TipoServicio;");
            rs = ps.executeQuery();
            
            lista_tiposerv = new ArrayList<TipoServicio>();
            
            while (rs.next()) {
                String ggg = rs.getString("nombre");
                int xd = rs.getInt("idTipoServicio");
                System.out.println(ggg);
                System.out.println(xd);
                
                TipoServicio tiposerv = new TipoServicio();
                
                tiposerv.setNombre(ggg);
                tiposerv.setIdTipoServicio(xd);
                
                lista_tiposerv.add(tiposerv);
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
    
}

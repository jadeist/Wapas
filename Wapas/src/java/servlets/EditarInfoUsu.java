/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controllers.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jade
 */
@WebServlet(name = "EditarInfoUsu", urlPatterns = {"/EditarInfoUsu"})
public class EditarInfoUsu extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF8");
        res.setContentType("text/html;charset=UTF-8");

        HttpSession s;
        Usuario u;

        s = req.getSession(true);
        u = (Usuario) s.getAttribute("user");
        
        if (u != null) {
            String nombre;
            String telefono;
            
            int idUsuario= u.getIdUsuario();
            
            nombre = req.getParameter("nuevonombre");
            telefono = req.getParameter("nuevotelefono");
            
            
            /*
            
            if (nombre.isEmpty() || nombre == nombre_s){
                nombre = u.getNombre();
            } else { 
                nombre = req.getParameter("nuevonombre");
            }
            
            if (telefono.isEmpty() || telefono == telefono_s){
                telefono = u.getTelefono();
            } else { 
                telefono = req.getParameter("nuevotelefono");
            }
            */
            
            try{
            
                u.editarInformacion(nombre, telefono, idUsuario);
                u.setNombre(nombre);
                u.setTelefono(telefono);
            
            }catch(SQLException e){
                
            }
            
            s.invalidate();
            
            s = req.getSession(true);
            s.setAttribute("user", u);
            
            res.sendRedirect("perfilUsuario.jsp");
            
        } 
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

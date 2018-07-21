<%-- 
    Document   : admincitas
    Created on : May 26, 2017, 2:07:12 PM
    Author     : merlyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="controllers.Cita, controllers.Usuario, java.util.ArrayList" %>

<%
    HttpServletRequest req;
    HttpServletResponse res;

    HttpSession s;
    Usuario u;

    req = request;
    res = response;
    s = req.getSession(true);
    u = (Usuario) s.getAttribute("user");
    
    if(u == null){
        response.sendRedirect("index.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/main.css" />
    </head>
    <body>
        
        
        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>
                            Id Cita
                        </th>
                        <th>
                            Fecha Cita
                        </th>
                        <th>
                            Eliminar Cita
                        </th>
                    </tr>
                </thead>
                <tbody>
                    
                    <%
                    
                    Cita cita = new Cita();
                    ArrayList<Cita> listaCitas = cita.obtenerCitas(u.getIdUsuario());
                    
                    for(int i = 0; i < listaCitas.size(); i ++){
                    
                    %>
                    
                    <tr>
                        <th>
                            <%= listaCitas.get(i).getIdCita() %>
                        </th>
                        <th>
                            <%= listaCitas.get(i).getFecha() %>
                        </th>
                        <th>
                            <form action="/Wapas/BorrarCita">
                                <input type="hidden" name="idCita" value = "<%= listaCitas.get(i).getIdCita() %>">
                                <input type ="submit" value="Eliminar">
                            </form>
                        </th>
                    </tr>
                    
                    <%
                    
                    }
                    %>
                    
                    
                    
                </tbody>
            </table>
        </div>
        
        
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <script src="assets/js/main.js"></script>
</html>

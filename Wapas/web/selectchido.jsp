<%-- 
    Document   : selectchido
    Created on : 22-may-2017, 15:05:47
    Author     : Jade
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="controllers.Test, java.util.ArrayList, controllers.TipoServicio" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1> Este es un select que se consulta de la base de datos y despliega la opcion seleccionada </h1>
        
        <form action="/Wapas/RegistrarServicio">
            <select name="selectTipoServicio">
                <% 
                        Test test = new Test();
                        
                        TipoServicio tipo_servicio = new TipoServicio();
                        
                        ArrayList<TipoServicio> lista = tipo_servicio.listaTipoServicio();
                        
                        
                        
                        for (int i = 0; i< lista.size() ; i++) {
                            
                        
                %> 
                <option value="<%= lista.get(i).getIdTipoServicio() %>"> <%= lista.get(i).getNombre() %> </option>
                <%
                        }
                %>
                
                
            </select>
                <input type="submit">
        </form>
    </body>
</html>

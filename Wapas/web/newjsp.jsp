<%-- 
    Document   : newjsp
    Created on : 21-may-2017, 21:25:49
    Author     : Jade
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="controllers.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Usuario usr = new Usuario();
            usr= usr.IniciarSesion("jadesita@gmail.com", "Alpaca123");
        %> 
        <h1>
            <%=usr.getNacimiento() %>
        </h1>
    </body>
</html>

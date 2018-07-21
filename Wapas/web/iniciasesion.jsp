<%-- 
    Document   : iniciasesion
    Created on : 22-may-2017, 17:30:36
    Author     : Jade
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="controllers.Usuario"%>
<%
    HttpServletRequest req;
    HttpServletResponse res;

    HttpSession s;
    Usuario u;

    req = request;
    res = response;
    s = req.getSession(true);
    u = (Usuario) s.getAttribute("user");

    if (u != null) {
        res.sendRedirect("index.jsp");
    } else {
        System.out.println("Hubo un error en el login");
    }

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Inicio de Sesion </title>
  <link rel='stylesheet prefetch' href='http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css'>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="wrapper">
    <form class="form-signin" action="/Wapas/IniciarSesion" method="post" target="_parent">       
      <h2 class="form-signin-heading">Inicia sesion para reservar: </h2>
      <input type="text" class="form-control" name="emaillogin" placeholder="Dirección de correo electronico (email)" required="" autofocus="" />
      <input type="password" class="form-control" name="passwordlogin" placeholder="Password" required=""/>      
      <button class="btn btn-lg btn-primary btn-block" type="submit"> INICIAR SESION </button>   
    </form>
  </div>
  
</body>
</html>
<%-- 
    Document   : editarifousu
    Created on : 23-may-2017, 4:49:25
    Author     : Jade
--%>


<%@page import="controllers.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpServletRequest req;
    HttpServletResponse res;

    HttpSession s;
    Usuario u;

    req = request;
    res = response;
    s = req.getSession(true);
    u = (Usuario) s.getAttribute("user");
    
    if (u == null) {
        response.sendRedirect("index.jsp");
    }

%>
<!DOCTYPE html>
<html>
	<head>
		<title> Mi Perfil | Wapa's </title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="landing">

		<!-- Header -->
			
			<header id="header" class="alt">
				<h1><strong><a href="index.html"> WAPAS </a></strong> </h1>
				<nav id="nav">
					<ul>
                                                <% if(u != null){

                                                        if (u.getIdTipoUsuario() == 1) {
                                                %>
                                                <li><a href="index.html">Servicios</a></li>
						<li><a href="generic.html">Contacto</a></li>
                                                <li> <a href="perfilUsuario.jsp"> Mi Perfil</a> </li>
                                                <%
                                                        } else {

                                                        if (u.getIdTipoUsuario() == 2) {
                                                %>
                                                <li><a href="index.html"> Citas </a></li>
						<li><a href="generic.html"> Editar Servicios</a></li>
                                                <%
                                                        }
                                                    }
                                                }
                                                %>
                                                
                                                
					</ul>
				</nav>
			</header>

			<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>
                       
                        <section id="one" class="wrapper style1">
					<div class="container 75%">
						<div class="row 200%">
							
                                                            <header>
                                                                <form action="/Wapas/EditarInfoUsu" method="POST">
                                                                <h4> MI PERFIL </h4>
                                                                <p> Nombre de usuario: </p>
                                                                <input type="text" name="nuevonombre" value="" placeholder="<%= u.getNombre()  %>">
                                                                
                                                                
                                                                <p> Telefono: </p>
                                                                <input type="text" name="nuevotelefono" value="" placeholder="<%= u.getTelefono()  %>">
                                                                
                                                                <input type="submit" value="Guardar Cambios" class="special">
                                                                </form>
                                                                
                                                            </header>
								
						</div>
					</div>
                                
			</section>

		<!-- Footer -->
			<footer id="footer">
				<div class="container">
					<ul class="icons">
						<li><a href="#" class="icon fa-facebook"></a></li>
						<li><a href="#" class="icon fa-instagram"></a></li>
					</ul>
					<ul class="copyright">
						<li>&copy; Wapa's S.A de S.V</li>
						<li>Design by: Jade Galicia</a></li>
					</ul>
				</div>
			</footer>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</
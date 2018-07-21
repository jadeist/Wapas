<%-- 
    Document   : inicioAdmin
    Created on : 22-may-2017, 17:13:40
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
                                                <%    if (u == null) {  %>
						<li><a href="index.html">Servicios</a></li>
						<li><a href="generic.html">Contacto</a></li>
						<li><a href="registroinicio.html">Reservaciones</a></li>
                                                <%
                                                      } else {

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
                        
                        <section id="banner">
				<h2> BIENVENID@!
                                    <%= u.getNombre() %>
                                </h2>
				<p> No dejes pasar mas tiempo, ¡haz una cita! </p>
				<ul class="actions">
					<li><a href="hacercita.jsp" class="button special big"> HACER UNA CITA </a></li>
				</ul>
			</section>
                        
                        <section id="one" class="wrapper style1">
					<div class="container 75%">
						<div class="row 200%">
							<div class="6u 12u$(medium)">
								<header class="major">
									<a class="button fit" name='editarinformacion' href="editarifousu.jsp"> EDITAR MI INFORMACION </a>
                                                                        <a class="button fit" name='admincitas' href="admincitas.jsp"> ADMINISTRAR CITAS </a>
                                                                    <form action='/Wapas/CerrarSesion'>
                                                                        <input type = "submit" class="special" value="Cerrar Sesion">
                                                                    </form>
								</header>
							</div>
							<div class="6u$ 12u$(medium)">
                                                            <header>
                                                                <h4> MI PERFIL </h4>
                                                                <p> Nombre de usuario: 
                                                                    <%= u.getNombre()  %>
                                                                </p>
                                                                <p> Email: 
                                                                    <%= u.getEmail()  %>
                                                                </p>
                                                                <p> Telefono: 
                                                                    <%= u.getTelefono()  %>
                                                                </p>
                                                                <p> Fecha de Nacimiento: 
                                                                    <%= u.getNacimiento()  %>
                                                                </p>
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
</html>
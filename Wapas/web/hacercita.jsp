<%-- 
    Document   : hacercita
    Created on : May 26, 2017, 1:19:55 PM
    Author     : merlyn
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
%>

<!DOCTYPE html>
<html>
	<head>
		<title> RESERVAR | Inicio </title>
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

		<!-- Banner -->
			<section id="banner">
				<h2> WAPA'S </h2>
				<p> NAIL BAR PROFESSIONAL SALON</p>
				<ul class="actions">
					<li><a href="#" class="button special big">¡RESERVA YA!</a></li>
				</ul>
			</section>

			<!-- One -->
				<section id="one" class="wrapper style1">
					<div class="container 75%">
						<div class="row 200%">
							<div class="6u 12u$(medium)">
								<header class="major">
									<h2>HAZ TU CITA HOY MISMO: </h2>
									<p> Podrás confirmarla o cancelarla despues en el modulo de "Administrar Citas" que se encuentra en tu perfil</p>
								</header>
							</div>
							<div class="6u$ 12u$(medium)">
                                                            <form method="post" action="/Wapas/RegistrarCita">
                                                            <p> Elige tu servicio: </p>
                                                            <select name="category" id="category">
                                                                <option> Uñas acrilicas </option>
                                                                <option> Gelish </option>
                                                                <option> Manicure </option>
                                                                <option> Esmalte </option>
                                                            </select>
                                                            <br>
                                                            <p> Elige la fecha: </p>
                                                            <input type="text" name="fechacita" placeholder="DD/MM/AAAA" pattern="/[0-9]{2}-[0-9]{2}-[0-9]{4}/">
                                                            <br> <br>
                                                            <input type="submit" value="RESERVAR"lass="special">
                                                            </form> 
							</div>
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
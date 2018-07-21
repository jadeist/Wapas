<%-- 
    Document   : index
    Created on : 22-may-2017, 1:31:31
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
%>

<!DOCTYPE html>
<html>
	<head>
		<title> Wapa's | Inicio </title>
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
						<li><a href="servicios.jsp">Servicios</a></li>
						<li><a href="registroinicio.html">Reservaciones</a></li>
                                                <%
                                                      } else {

                                                        if (u.getIdTipoUsuario() == 1) {
                                                %>
                                                <li><a href="servicios.jsp">Servicios</a></li>
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
					<li><a href="registroinicio.html" class="button special big">¡RESERVA YA!</a></li>
				</ul>
			</section>

			<!-- One -->
				<section id="one" class="wrapper style1">
					<div class="container 75%">
						<div class="row 200%">
							<div class="6u 12u$(medium)">
								<header class="major">
									<h2>¿Quienes somos?</h2>
									<p> "La elegancia es la unica belleza que nunca se desvanece" <br /> -Audrey Hepburn </p>
								</header>
							</div>
							<div class="6u$ 12u$(medium)">
								<p> En Wapas Nail Salon somos líderes en el mercado de salon de belleza y spa especializado para tus manos, siempre una empresa distingada por su servicio al cliente y diseños exclusivos altamente personalizados en decoracion y aplicacion de uñas. Ademas, impartimos cursos y clases de lso servicios que brindamos.</p>
							</div>
						</div>
					</div>
				</section>

			<!-- Two -->
				<section id="two" class="wrapper style2 special">
					<div class="container">
					<!--- slider -->
					<div class="carrusel">
            			<ul>
			                <li> <img src="images/carrusel1.jpg" alt="" class="imagenc"> </li>
			                <li> <img src="images/carrusel2.jpg" alt="" class="imagenc"> </li>
                                        <li> <a href="registroinicio.html"> <img src="images/carrusel3.jpg" alt="" class="imagenc"> </a> </li>
			                <li> <img src="images/carrusel4.jpg" alt="" class="imagenc"> </li>
            			</ul>
        			</div>

					</div>
				</section>

			<!-- Three -->
				<section id="three" class="wrapper style1">
					<div class="container">
						<header class="major special">
							<h2> CARACTERISTICAS QUE ENCONTRARÁS EN WAPAS:</h2>
							<p>Los mejores precios, el mejor servicio, exclusividad y vanguardia</p>
						</header>
						<div class="feature-grid">
							<div class="feature">
								<div class="image rounded"><img src="images/pic04.jpg" alt="" /></div>
								<div class="content">
									<header>
										<h4> El mejor lugar para aprender</h4>
										<p> CLASES Y CURSOS TECNICOS</p>
									</header>
									<p> Contamos con los mejores especialistas que te enseñaran todo lo que debes saber si buscas adentrarte en el mundo de la belleza.</p>
								</div>
							</div>
							<div class="feature">
								<div class="image rounded"><img src="images/pic05.jpg" alt="" /></div>
								<div class="content">
									<header>
										<h4>Tenemos todo lo que necesitas </h4>
										<p> LAS ULTIMAS TENDENCIAS EN DISEÑO Y MODA</p>
									</header>
									<p> Solo lo ultimo en diseño y decoracion en uñas está en WAPA'S , ¡no te aburrirás nunca de tus uñas!</p>
								</div>
							</div>
							<div class="feature">
								<div class="image rounded"><img src="images/pic06.jpg" alt="" /></div>
								<div class="content">
									<header>
										<h4> Servicio a tu medida </h4>
										<p> TE SENTIRÁS COMO EN CASA</p>
									</header>
									<p> En Wapa`s puesdes disfrutar de un café y un ambiente acogedor durante tu estancia.</p>
								</div>
							</div>
							<div class="feature">
								<div class="image rounded"><img src="images/pic07.jpg" alt="" /></div>
								<div class="content">
									<header>
										<h4> Nuestro trabajo está garantizado</h4>
										<p>NO HAY EXCUSAS PARA NO VOLVER</p>
									</header>
									<p>Contamos con servicio gratuito por garantia en caso de accidentes (uñas acrilicas).</p>
								</div>
							</div>
						</div>
					</div>
				</section>

			<!-- Four -->
				<section id="four" class="wrapper style3 special">
					<div class="container">
						<header class="major">
							<h2>¿Tienes algo que decirnos?</h2>
							<p>CONTRATACIONES, MEDIOS, NETWORKING, INFORMACION DE CURSOS</p>
						</header>
						<ul class="actions">
							<li><a href="#" class="button special big">CONTACTANOS</a></li>
						</ul>
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
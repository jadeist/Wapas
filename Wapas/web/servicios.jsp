<%-- 
    Document   : servicios
    Created on : 26-may-2017, 11:56:02
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
		<title> Servicios | Wapa's </title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
                
                <script>
            function clicito() {
            var imagen = document.getElementById('pepe');
            var maxlength = 400;
            var maxwidth = 400;
            var left = 0;
            
            var anchito= window.innerWidth;
            var larguito = window.innerHeight;
            
            
            function stop(){
                clearInterval(loop);
            }
            
            var loop = setInterval(function(){
                
                if (imagen.width < maxwidth)
                {
                    imagen.width = imagen.width + 10;
                    imagen.height = imagen.height + 10; 
                }
                
                
                if (left < ((anchito/2)-(imagen.width/2)) )
                {
                    left += 10;
                    imagen.style.left = left + 'px';
                }

                //imagen.height += 30;
                //imagen.width += 30;
            },40);
            
                    }
            
        </script>
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
                        
                        <section id="main" class="wrapper">
                            <div class="container"> 
                                <div class="box-alt">
                                <h2> ¡Estos son los servicios que tenemos para ti! </h2>
                                <br>
                                <h4> Aplicacion de uñas acrilicas </h4>
                                <blockquote>
                                    Tenemos todos los colores que quieras y gustes a tu alcance, todos los diseños
                                    y las nuevas tendencias en uñas cada semana!
                                    Trae tu propio diseño y nosotros conseguimos hacerlo!
                                </blockquote>
                                <div class="12u$">
                                <span class="image fit">
                                    <img src="images/images.jpeg" style=" width='200px' ; heigth= '200px'; ">
                                </span>
                                </div>
                                <br>
                                <h4> Esmalte de larga duracion: GELISH</h4>
                                <blockquote>
                                    Siempre lo suficientemente sofisticado, pero nunca 
                                    aburrido! No te preocupes por tu esmalte, siempre estará perfecto!
                                    El esmalte de larga duracion -GELISH- dura lo mismo que las uñas acrilicas
                                    (20-30 dias) y deja un efecto pulcro y natural, ¡menos es mas!
                                </blockquote>
                                <div class="12u$">
                                <span class="image fit">
                                    <img src="images/gelish.jpg" style=" width="200px" ; heigth="200px"; ">
                                </span>
                                </div>
                                </div>
                                <br>
                                </section>
                                <section class="wrapper">
                                <div class="container">
                                    <span class="image-fit">
                                    <a href="azar.html">
                                    <img src="images/publi-ipad.gif" id="pepe" onclick="clicito();" style="position: absolute;">
                                    </a>
                                    </span>
                                </div>
                                            <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
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
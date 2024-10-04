<!DOCTYPE html>
<!--[if IE 9]> <html lang="es" class="ie9"> <![endif]--><!--[if !IE]><!--><html lang="es"><!--<![endif]--><head><meta charset="utf-8" /><%id=request("id")%>
<%if id=1 or id="" then'HOME%>
<title>CURSIT | CRM para cursos de idiomas</title>
<meta name="description" content="Cursit es el CRM más completo para la gestión de cursos de idiomas en el extranjero, campamentos de inglés en España y academias.">
<meta name="keywords" content="crm,web,cursos idiomas,agencias idiomas, gestión de alumnos">
<meta name="author" content="Wishing Well Online">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%end if%>
<%if id=2 then'QUe es%>
<title>CURSIT | Qué es el nuevo CRM para cursos de idiomas Cursit </title>
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="Wishing Well Online">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%end if%>
<%if id=3 then'FUNCIONAMIENTO%>
<title>CURSIT | Funcionamiento del CRM para cursos de idiomas Cursit</title>
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="Wishing Well Online">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%end if%>
<%if id=4 then'FAQS%>
<title>CURSIT | Preguntas frecuentes sobre el CRM Cursit</title>
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="Wishing Well Online">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%end if%>
<%if id=5 then'RESPUESTA%>
<title>CURSIT | Contacto con administrativos Cursit realizado</title>
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="Wishing Well Online">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%end if%>
<%if id=6 then'RESPUESTA%>
<title>CURSIT | Contacto con administrativos Cursit realizado</title>
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="Wishing Well Online">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%end if%>
<%if id=7 then'PRIVACIDAD%>
<title>CURSIT | política de privacidad de Cursit</title>
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="Wishing Well Online">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%end if%>
<%if id=8 then'CONTACTO%>
<title>CURSIT | Contacto con equipo Cursit</title>
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="Wishing Well Online">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%end if%>
<link rel="apple-touch-icon" sizes="57x57" href="fav/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="fav/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="fav/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="fav/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="fav/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="fav/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="fav/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="fav/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="fav/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"  href="fav/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32" href="fav/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="fav/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="fav/favicon-16x16.png">
<meta property="og:locale" content="es_ES" />
<meta property="og:title" content="Cursit | CRM para Cursos de Idiomas">
<meta property="og:url" content="http://www.cursit.com/">
<meta property="og:type" content="website">
<meta property="og:site_name" content="Cursit | CRM para cursos de idiomas">
<meta property="og:image" content="http://www.cursit.com/fav/icono.jpg" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<!--#include file="estilos.asp"-->
<link rel="shortcut icon" href="favicon.ico" /> </head><body class="c-layout-header-fixed c-layout-header-mobile-fixed"><header class="c-layout-header c-layout-header-4 c-bordered c-layout-header-default-mobile" data-minimize-offset="80"><div class="c-navbar">
<div class="container">
<div class="c-navbar-wrapper clearfix">
<div class="c-brand c-pull-left">
<a href="http://www.cursit.com/" class="c-logo">
<img src="<%=r%>img/logo-cursit.png"  class="c-desktop-logo" style="position:absolute;margin-top:-25px"><img src="<%=r%>img/logo-cursit-2.png" alt="Cursit" class="c-desktop-logo-inverse" style="margin-top:-15px"><img src="<%=r%>img/logo-cursit-2.png" alt="Cursit" class="c-mobile-logo" style="margin-top:-10px"></a><button class="c-hor-nav-toggler" type="button" data-target=".c-mega-menu"><span class="c-line"></span><span class="c-line"></span><span class="c-line"></span></button>
</div>
<nav class="c-mega-menu c-pull-right c-mega-menu-dark c-mega-menu-dark-mobile c-fonts-uppercase c-fonts-bold"><ul class="nav navbar-nav c-theme-nav">
<li <%if id=2 then%>class="c-active"<%end if%>><a href="<%=r%>crm-cursos-idiomas-cursit" class="c-link dropdown-toggle">¿Qué es Cursit?</a></li>
<li <%if id=3 then%>class="c-active"<%end if%>><a href="<%=r%>crm-cursos-idiomas-funcionamiento" class="c-link dropdown-toggle">Funcionamiento</a></li>
<li <%if id=6 then%>class="c-active"<%end if%>><a href="<%=r%>crm-demo" class="c-link dropdown-toggle">Demo</a></li>
<li class="c-menu-type-classic"><a href="javascript:;" class="c-link dropdown-toggle">Soporte<span class="c-arrow c-toggler"></span></a>
<ul class="dropdown-menu c-menu-type-classic c-pull-left">
<li class="dropdown-submenu"><a href="javascript:;" data-toggle="modal" data-target="#login-form" >on line</a></li>
<li class="dropdown-submenu"><a href="#" data-toggle="modal" data-target="#login-form" >manuales</a></li>
</ul>
</li>
<li <%if id=4 then%>class="c-active"<%end if%>><a href="crm-faqs" class="c-link dropdown-toggle">FAQ's</a></li>
<li <%if id=8 or id=5 then%>class="c-active"<%end if%>><a href="crm-contacto" class="c-link dropdown-toggle">Contacto</a></li>
<li><a href="javascript:;" data-toggle="modal" data-target="#login-form" class="c-btn-border-opacity-04 c-btn btn-no-focus c-btn-header btn btn-sm c-btn-border-1x c-btn-green c-btn-circle c-btn-uppercase c-btn-sbold"><i class="icon-user"></i> clientes</a></li>
</ul>
</nav></div></div></div></header>
<div class="modal fade c-content-login-form" id="signup-form" role="dialog">
<div class="modal-dialog"><div class="modal-content c-square"><div class="modal-header c-no-border"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div></div></div></div>
<div class="modal fade c-content-login-form" id="login-form" role="dialog">
<div class="modal-dialog">
<div class="modal-content c-square">
<div class="modal-header c-no-border"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>
<div class="modal-body">
<h3 class="c-font-24 c-font-sbold">Hola!</h3>
<p>Hoy va a ser un gran dia!</p>
<form>
<div class="form-group">
<label for="login-email" class="hide">eMail</label>
<input type="email" class="form-control input-lg c-square" id="login-email" placeholder="Email"> </div>
<div class="form-group">
<label for="login-password" class="hide">Contraseña</label>
<input type="password" class="form-control input-lg c-square" id="login-password" placeholder="Password"> </div>
<div class="form-group">
<div class="c-checkbox">
<input type="checkbox" id="login-rememberme" class="c-check">
<label for="login-rememberme" class="c-font-thin c-font-17">
<span></span>
<span class="check"></span>
<span class="box"></span> Recordar usuario</label></div>
</div>
<div class="form-group"><button type="submit" class="btn c-theme-btn btn-md c-btn-uppercase c-btn-bold c-btn-square c-btn-login">Acceder</button></div>
</form>
</div></div></div></div>
<div class="c-layout-page">
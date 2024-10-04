<!DOCTYPE html><!--[if IE 9]> html lang="es" class="ie9"> <![endif]--><!--[if !IE]><!--><html lang="es-es"><!--<![endif]--><head><meta charset="utf-8" /><%rd=request("rd")
r=request("r")%><!--#include file="../../conex/conex.asp"--><!--#include file="../comun/comun.asp"--><!--#include file="../comun/titles_metas.asp"--><script type="text/javascript">
//var _smartsupp = _smartsupp || {};_smartsupp.key = 'dbec43f07faf420f4adf1850c7f9b5e2ccef3944';window.smartsupp||(function(d) {  var s,c,o=smartsupp=function(){ o._.push(arguments)};o._=[];  s=d.getElementsByTagName('script')[0];c=d.createElement('script');  c.type='text/javascript';c.charset='utf-8';c.async=true;  c.src='https://www.smartsuppchat.com/loader.js?';s.parentNode.insertBefore(c,s);})(document);
</script></head><!--#include file="../lib/estilos.asp"--><script src="<%=r%>web/lib/js/jquery.min.js" type="text/javascript"></script><script src="<%=r%>web/lib/app/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<body class="c-layout-header-fixed c-layout-header-6-topbar"><header class="c-layout-header c-layout-header-6 c-navbar-fluid" data-minimize-offset="80" id="men_sup"><div class="c-topbar"><div class="container"><nav class="c-top-menu"><ul class="c-links c-theme-ul"><%Sql= "SELECT menu, posicion, id_general, id_categoria FROM menus WHERE menu = 1 order by posicion" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
if ob_rs("id_categoria")<>0 then
Sql2= "SELECT id_categoria, titulo_esp, url_esp, visible FROM categorias WHERE id_categoria = "&ob_rs("id_categoria")&" and visible='si'" 
else
Sql2= "SELECT id_general, titulo_esp, url_esp, visible FROM generales WHERE id_general = "&ob_rs("id_general")&" and visible='si'" 
end if
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<li><a href="<%=r%><%=ob_rs2("url_esp")%>" class="c-font-uppercase c-font-bold"><%=ob_rs2("titulo_esp")%></a></li>
<li class="c-divider"></li>
<%end if
ob_rs2.close
ob_rs.movenext
loop
end if
ob_rs.close%><ul class="nav navbar-nav navbar-right col-lg-5 col-xs-5 usuarios_men" id="no_logueado">
<li><a href="#" class="btn c-theme-btn c-btn-square c-btn-uppercase c-btn-bold" data-toggle="dropdown" style="margin-top:-3px;">Usuarios <b class="caret"></b></a>
<ul class="dropdown-menu usuario_login">
<li><div class="row"><div class="col-md-12">
<form class="form" role="form" method="post" action="<%=r%>login" id="login" name="login"><input name="form_op" type="hidden" value="loginSup"><div class="form-group">
<input type="email" class="form-control" id="log_usuario" name="log_usuario" placeholder="email/usuario"></div><div class="form-group"><input type="password" class="form-control" id="log_pass" name="log_pass" placeholder="contraseña"></div><div class="form-group"><button type="button" class="btn btn-primary btn-block" onclick="log_acceder();">Acceder</button></div></form></div></div></li>
<li class="divider"></li>
<li><div class="form-group"><a href="<%=r%>registro" class="btn btn-default btn-block">Quiero registrarme</a></div></li>
<li><div class="form-group"><a href="<%=r%>recuperar-pass" class="btn btn-default btn-block">He perdido mi contraseña</a></div></li></ul></li>
</ul>
<ul class="nav navbar-nav navbar-right col-lg-5 col-xs-5" id="logueado">
<li style="width:100%;min-width:150px;max-width:150px;"> Hola, <a href="<%=r%>zona-privada" id="log_usuario" style="display:inline;text-align:left;padding:0;text-decoration:underline"><%=session("us_nombre")%></a></li></ul></ul></nav>
<div class="c-brand"><a href="<%=url_web%>" class="c-logo">
<img src="<%=r%>web/lib/img/logos/logo-h.png" alt="<%=titulo_esp_web%>" class="c-desktop-logo" style="margin:0 auto;">
<img src="<%=r%>web/lib/img/logos/logo-2.png" alt="<%=titulo_esp_web%>" class="c-desktop-logo-inverse">
<img src="<%=r%>web/lib/img/logos/logo-1.png" alt="<%=titulo_esp_web%>" class="c-mobile-logo">
</a>
<ul class="c-icons c-theme-ul" id="ico_res">
<%if rd_facebook<>""then%><li><a href="<%=rd_facebook%>"><i class="icon-social-facebook"></i></a></li><%end if%>
<%if rd_twitter<>""then%><li><a href="<%=rd_twitter%>"><i class="icon-social-twitter"></i></a></li><%end if%>
<%if rd_youtube<>""then%><li><a href="<%=rd_youtube%>"><i class="icon-social-youtube"></i></a></li><%end if%>
<%if rd_pinterest<>""then%><li><a href="<%=rd_pinterest%>"><i class="fa fa-pinterest"></i></a></li><%end if%>
<%if rd_blog<>""then%><li><a href="<%=rd_blog%>"><i class="fa fa-wordpress"></i></a></li><%end if%>
<%if rd_linkedin<>""then%><li><a href="<%=rd_linkedin%>"><i class="fa fa-linkedin"></i></a></li><%end if%>
<%if rd_instagram<>""then%><li><a href="<%=rd_instagram%>"><i class="fa fa-instagram"></i></a></li><%end if%>
<%if rd_tumblr<>""then%><li><a href="<%=rd_tumblr%>"><i class="fa fa-tumblr"></i></a></li><%end if%>
<%if rd_flickr<>""then%><li><a href="<%=rd_flickr%>"><i class="fa fa-flickr"></i></a></li><%end if%>
<%if rd_reddit<>""then%><li><a href="<%=rd_reddit%>"><i class="fa fa-reddit"></i></a></li><%end if%>
<%if rd_google_plus<>""then%><li><a href="<%=rd_google_plus%>"><i class="fa fa-google-plus"></i></a></li><%end if%>
</ul><button class="c-hor-nav-toggler" type="button" data-target=".c-mega-menu"><span class="c-line"></span><span class="c-line"></span><span class="c-line"></span></button>
</div>
</div><%if h1_title<>""then
h1_title=replace(h1_title,"<p>","")
h1_title=replace(h1_title,"</p>","")
%><div class="h1_index"><a href="<%=url_web%>" title="<%=h1_title%>"><h1><%=h1_title%></h1></a></div><%end if%></div>
<div class="pre-menu"><div id="elmenu"></div><span class="pretexto">
<div class="bubbles-wrapper">
<div class="bubbles" id="b1"></div>
<div class="bubbles" id="b2"></div>
<div class="bubbles" id="b3"></div>
<div class="bubbles" id="b4"></div>
<div class="bubbles" id="b5"></div>
</div>
<p><ul><li><a href="http://www.cursit.com/web-demo">Cursos de idiomas en el extranjero</a></li></ul></p>
</span>
</div>
</div>
</header>
<div class="c-layout-page">
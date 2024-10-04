<!DOCTYPE html><!--[if IE 8]><html lang="es-es" class="ie8 no-js"><![endif]--><!--[if IE 9]><html lang="es-es" class="ie9 no-js"><![endif]--><!--[if !IE]><!--><html lang="es-es"><!--<![endif]--><head><meta charset="utf-8" />
<!--#INCLUDE file="../lib/asp/cifra.asp"-->
<title>Cursit | CRM </title>
<meta http-equiv="X-UA-Compatible" content="IE=edge"><meta content="width=device-width, initial-scale=1" name="viewport" /><meta content="" name="description" /><meta content="" name="author" />
<!--#include file="estilos.asp"-->
<link href="<%=r%>lib/css/loader.css" rel="stylesheet" type="text/css" />
<%if rd=""then
rd=request("rd")
if rd ="" then rd = request_equerystring("rd") 'end if
end if
n=request("n")'ACADEMIA
if n ="" then n = request_equerystring("n") end if'ACADEMIA
if session("user_crm_schol")<>"1527" and session("admin")="" then
response.redirect(rd&"gestor/")
end if%>
<!--#include file="../../conex/conex.asp"-->
<%Dim Ob_connb, ob_commandb%>
<!--#include file="../../conex/conex_back.asp"-->
<!--#include file="../lib/asp/comun.asp"-->
<script src="<%=r%>lib/js/jquery.min.js" type="text/javascript"></script><script src="<%=r%>lib/app/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link rel="shortcut icon" href="<%=r%>lib/favicon.ico" /></head>
<div class="se-pre-con"></div>
<body class="page-header-fixed page-sidebar-closed-hide-logo <%if edi="rap" then%>bg_blanco<%end if%>" >
<div class="wrapper">
<%if edi<>"rap"then%>
<header class="page-header"><nav class="navbar mega-menu" role="navigation"><div class="container-fluid"><div class="clearfix navbar-fixed-top">
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse"><span class="sr-only">Toggle navigation</span><span class="toggle-icon"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></span></button><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a id="index" class="page-logo" href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>"><img src="<%=r%>images/login/logo.png" alt="Logo"></a>
<div class="topbar-actions"><div class="btn-group-img btn-group"><button type="button" class="btn btn-sm md-skip dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"><span>Hola, <%=nombre_us%></span><img src="<%if imagen_us<>""then%><%=rd%>up_docs/admins/<%=imagen_us%><%else%><%=rd%>gestor/images/user-def-top.gif<%end if%>"> </button><ul class="dropdown-menu-v2" role="menu">
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos=&cod="&session("admin")))%>
<li><a href="<%=r%>admins/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=&cod="&session("admin"))%>"><i class="icon-user"></i> Mi perfil</a></li>
<li style="display:none"><a href="<%=r%>lib/app_calendar.html"><i class="icon-calendar"></i> Mi calendario </a></li>
<li class="divider"> </li>
<li><a href="<%=r%>../gestor-out/"><i class="icon-key"></i> Cerrar sesión </a></li>
</ul></div></div></div>
<div class="nav-collapse collapse navbar-collapse navbar-responsive-collapse">
<ul class="nav navbar-nav">
<li class="dropdown dropdown-fw<%if lev="dash" then%> active open selected<%end if%>">
<a href="javascript:;" class="text-uppercase"><i class="icon-home"></i></a>
<ul class="dropdown-menu  dropdown-menu-fw">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos=muestra_dash"))%>
<a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=muestra_dash")%>"><i class="fa fa-television" aria-hidden="true" style="margin-right:6px;"></i>Escritorio</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat="))%>
<a href="<%=r%>preinscripciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=pi&ndos=&ntres=s&ncuat=")%>"><i class="fa fa-pencil-square-o" aria-hidden="true" style="margin-right:6px;"></i>Preinscripciones</a></li>
</ul>
</li><%if pr_alumnos_ad="si" then%><li class="dropdown dropdown-fw<%if lev="al_jov" then%> active open selected<%end if%>"><a href="javascript:;" class="text-uppercase"><i class="fa fa-users" aria-hidden="true"></i>
Alumnos</a>
<ul class="dropdown-menu dropdown-menu-fw">
<%Sql= "SELECT id_categoria,titulo_crm_esp from categorias order by orden" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
men=1
do while not ob_rs.eof
n2=a&num%>
<li class="dropdown"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos="&ndos&"&ntres=gs&ncuat=&cod_cat="&ob_rs("id_categoria")))%>
<a href="<%=r%>alumnos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos="&ndos&"&ntres=gs&ncuat=&cod_cat="&ob_rs("id_categoria"))%>"><i class="fa fa-graduation-cap" aria-hidden="true"></i> Gestión de <%=ob_rs("titulo_crm_esp")%></a></li>
<ul class="dropdown-menu" style="display:none;">
<li></li><li style="display:none;"><a href="#"> Listados alumnos <%=ob_rs("titulo_crm_esp")%></a></li><li style="display:none;"><a href="#"> Seguimiento alumnos <%=ob_rs("titulo_crm_esp")%></a></li></ul>
<%ob_rs.movenext
men=men+1
loop
end if
ob_rs.close%>
<li class="dropdown"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=al&ndos="&ndos&"&ntres=gu&ncuat="))%><a href="<%=r%>usuariosWeb/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=al&ndos="&ndos&"&ntres=gu&ncuat=")%>"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Gestión de usuarios</a></li>
<li class="dropdown"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=al&ndos="&ndos&"&ntres=ls&ncuat=&proc=alumnos"))%><a href="<%=r%>listados/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=al&ndos="&ndos&"&ntres=ls&ncuat=&proc=alumnos")%>"><i class="fa fa-list" aria-hidden="true"></i> Listados</a></li>
<li class="dropdown"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=al&ndos="&ndos&"&ntres=do&ncuat="))%><a href="<%=r%>documentacion/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=al&ndos="&ndos&"&ntres=do&ncuat=")%>"><i class="fa fa-folder-open-o" aria-hidden="true"></i> Documentación alumnos</a></li>
</ul></li><%end if%>
<% if pr_cursos_ad="si" or  pr_datos_comunes_ad="si" or pr_cat_sec_ad="si" or pr_fluctuaciones_ad="si" then%><li class="dropdown dropdown-fw"><a href="javascript:;" class="text-uppercase"><i class="fa fa-graduation-cap" aria-hidden="true"></i> Cursos </a>
<ul class="dropdown-menu dropdown-menu-fw">
<%if pr_cursos_ad="si" then
Sql= "SELECT id_categoria,titulo_crm_esp from categorias order by orden" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
men=1
do while not ob_rs.eof
n2=c&num%>
<li class="dropdown more-dropdown-sub"><a href="javascript:;"><i class="fa fa-graduation-cap" aria-hidden="true"></i> <%=ob_rs("titulo_crm_esp")%> </a>
<ul class="dropdown-menu">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos="&ndos&"&ntres=gs&ncuat=&cod_cat="&ob_rs("id_categoria")))%>
<a href="<%=r%>items/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos="&ndos&"&ntres=gs&ncuat=&cod_cat="&ob_rs("id_categoria"))%>"> <i class="fa fa-sliders" aria-hidden="true"></i> Gestión programas </a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos="&ndos&"&ntres=pk&ncuat=&cod_cat="&ob_rs("id_categoria")))%>
<li><a href="<%=r%>packs/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos="&ndos&"&ntres=pk&ncuat=&cod_cat="&ob_rs("id_categoria"))%>"><i class="fa fa-files-o" aria-hidden="true"></i> Packs generales </a></li>
<li style="display:none"><a href="#"><i class="fa fa-list-alt" aria-hidden="true"></i> Listados programas</a></li>
</ul>
</li>
<%ob_rs.movenext
men=men+1
loop
end if
ob_rs.close
end if%>
<%if pr_datos_comunes_ad="si" then%><li class="dropdown more-dropdown-sub">
<a href="javascript:;"> <i class="fa fa-tasks" aria-hidden="true"></i> Datos comunes </a>
<ul class="dropdown-menu">
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=ar&ncuat="))%>
<li><a href="<%=r%>aeropuertos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=ar&ncuat=")%>"><i class="fa fa-plane" aria-hidden="true"></i> Aeropuertos </a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=ar&ncuat="))%>
<li><a href="<%=r%>idiomas/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=id&ncuat=")%>"><i class="fa fa-flag-o" aria-hidden="true"></i> Idiomas </a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=ar&ncuat="))%>
<li><a href="<%=r%>destinos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=dt&ncuat=")%>"><i class="fa fa-globe" aria-hidden="true"></i> Destinos (países) </a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=ci&ncuat="))%>
<li><a href="<%=r%>ciudades/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=ci&ncuat=")%>"><i class="fa fa-map-marker" aria-hidden="true"></i> Ciudades </a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=ta&ncuat="))%>
<li><a href="<%=r%>tiposAlojamiento/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=ta&ncuat=")%>"><i class="fa fa-home" aria-hidden="true"></i> Tipos de alojamiento </a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=oa&ncuat="))%>
<li><a href="<%=r%>opcionesAlojamiento/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=oa&ncuat=")%>"><i class="fa fa-bed" aria-hidden="true"></i> Opciones alojamiento </a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=qu&ncuat="))%>
<li><a href="<%=r%>quincenas/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=qu&ncuat=")%>"><i class="fa fa-calendar" aria-hidden="true"></i> Quincenas </a></li>
</ul>
</li><%end if%>
<%if pr_cat_sec_ad="si" then%><li class="dropdown more-dropdown-sub"><a href="javascript:;"><i class="fa fa-graduation-cap" aria-hidden="true"></i> Categorías y secciones </a>
<ul class="dropdown-menu">
<%if subseccion_on="si"then%><li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=ss&ncuat="))%><a href="<%=r%>subsecciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=ss&ncuat=")%>"><i class="fa fa-graduation-cap" aria-hidden="true"></i> Subsecciones Cursos </a></li><%end if%>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat="))%><a href="<%=r%>secciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat=")%>"><i class="fa fa-graduation-cap" aria-hidden="true"></i> Secciones Cursos </a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=c&ncuat="))%><a href="<%=r%>categorias/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=c&ncuat=")%>"><i class="fa fa-graduation-cap" aria-hidden="true"></i> Gestionar Categorías </a></li>
</ul>
</li><%end if%>
<%if pr_fluctuaciones_ad="si" then%><li class="dropdown"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=fl&ntres=&ncuat="))%><a href="<%=r%>fluctuaciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=fl&ntres=&ncuat=")%>"><i class="fa fa-area-chart" aria-hidden="true"></i> Fluctuaciones </a></li><%end if%>
</ul>
</li><%end if%>
<%if pr_contabilidad_ad="si" then%><li class="dropdown dropdown-fw"><a href="javascript:;" class="text-uppercase"><i class="icon-briefcase"></i> Contabilidad </a>
<ul class="dropdown-menu dropdown-menu-fw">
<li class="dropdown more-dropdown-sub">
<a href="javascript:;"><i class="fa fa-list" aria-hidden="true"></i> Preinscripciones </a>
<ul class="dropdown-menu">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat="))%>
<a href="<%=r%>preinscripciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=pi&ndos=&ntres=s&ncuat=")%>"><i class="fa fa-users" aria-hidden="true" style="margin-right:6px;"></i>Todas</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat=&t=fuera_pago"))%>
<a href="<%=r%>preinscripciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=pi&ndos=&ntres=s&ncuat=&t=fuera_pago")%>"><i class="fa fa-clock-o" aria-hidden="true" style="margin-right:6px;"></i>Fuera periodo pago</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat=&t=pago_pendiente"))%>
<a href="<%=r%>preinscripciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=pi&ndos=&ntres=s&ncuat=&t=pago_pendiente")%>"><i class="fa fa-money" aria-hidden="true" style="margin-right:6px;"></i>Pagos pendientes</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat=&t=pago_compl"))%>
<a href="<%=r%>preinscripciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=pi&ndos=&ntres=s&ncuat=&t=pago_compl")%>"><i class="fa fa-check" aria-hidden="true" style="margin-right:6px;"></i>Pagos completados</a></li>
</ul>
</li>
<li class="dropdown more-dropdown-sub">
<a href="javascript:;"><i class="fa fa-graduation-cap" aria-hidden="true"></i> Alumnos </a>
<ul class="dropdown-menu">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat=&t=cont"))%>
<a href="<%=r%>listados/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=pi&ndos=&ntres=s&ncuat=&t=cont")%>"><i class="fa fa-calculator" aria-hidden="true" style="margin-right:6px;"></i>Listados contabilidad</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat=&t=refPago"))%>
<a href="<%=r%>listados/listado_ref.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=pi&ndos=&ntres=s&ncuat=&t=refPago")%>"><i class="fa fa-search" aria-hidden="true" style="margin-right:6px;"></i>Buscar referencia pago</a></li>
</ul>
</li>
<li class="dropdown more-dropdown-sub">
<a href="javascript:;"><i class="fa fa-money" aria-hidden="true"></i> Facturación </a>
<ul class="dropdown-menu">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat=&t=fact"))%>
<a href="<%=r%>listados/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=pi&ndos=&ntres=s&ncuat=&t=fact")%>"><i class="fa fa-search" aria-hidden="true" style="margin-right:6px;"></i>Listar facturas</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat=&t=lst_fact"))%>
<a href="<%=r%>listados/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=pi&ndos=&ntres=s&ncuat=&t=lst_fact")%>"><i class="fa fa-list" aria-hidden="true" style="margin-right:6px;"></i>Listados facturacion</a></li>
</ul>
</li>
<li class="dropdown more-dropdown-sub">
<a href="javascript:;"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Pagos</a>
<ul class="dropdown-menu">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat=&t=lst_all"))%><a href="<%=r%>pagos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=pi&ndos=&ntres=s&ncuat=&t=lst_all")%>"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Todos los pagos </a></li>
<li class="divider"></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat=&t=lst_ko"))%><a href="<%=r%>pagos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=pi&ndos=&ntres=s&ncuat=&t=lst_ko")%>"><i class="fa fa-times"></i> Pagos Fallidos </a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat=&t=lst_ok"))%><a href="<%=r%>pagos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=pi&ndos=&ntres=s&ncuat=&t=lst_ok")%>"><i class="fa fa-check"></i> Pagos Correctos </a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat=&t=refPago"))%><a href="<%=r%>listados/listado_ref.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=pi&ndos=&ntres=s&ncuat=&t=refPago")%>"><i class="fa fa-search" aria-hidden="true"></i> Buscar referencia </a></li>
<li class="divider"></li> 
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat=&t=lst_all&verp=arch"))%><a href="<%=r%>pagos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=pi&ndos=&ntres=s&ncuat=&t=lst_all&verp=arch")%>"><i class="fa fa-archive"></i> Ver archivados </a></li>
</ul>
</li>
<li class="dropdown more-dropdown-sub hidden"><a href="javascript:;"><i class="fa fa-graduation-cap" aria-hidden="true"></i> Academia (c)</a>
<ul class="dropdown-menu">
<li><a href="../lib/table_datatables_managed.html"> Pagos pendientes </a></li>
<li><a href="../lib/table_datatables_buttons.html"> Facturación </a></li>
</ul>
</li>
<li class="dropdown more-dropdown-sub hidden">
<a href="javascript:;"><i class="fa fa-graduation-cap" aria-hidden="true"></i> Extraescolares (c)</a>
<ul class="dropdown-menu">
<li><a href="../lib/table_datatables_managed.html"> Pagos pendientes </a></li>
<li><a href="../lib/table_datatables_buttons.html"> Facturación </a></li>
</ul>
</li>

</ul>
</li><%end if%>
<%if pr_proveedores_ad="si" then%><li class="dropdown dropdown-fw"><a href="javascript:;" class="text-uppercase"><i class="icon-layers"></i> Proveedores </a>
<ul class="dropdown-menu dropdown-menu-fw">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=pr&ndos=ag&ntres=ag&ncuat="))%><a href="<%=r%>usuariosWeb/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=pr&ndos=ag&ntres=ag&ncuat=")%>"><i class="fa fa fa-suitcase" aria-hidden="true"></i> Agentes</a></li>
<li class="dropdown"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=pr&ndos=es&ntres=&ncuat="))%><a href="<%=r%>proveedores/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=pr&ndos=es&ntres=&ncuat=")%>"><i class="fa fa-university" aria-hidden="true"></i> Escuelas </a></li>
<li class="dropdown"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=pr&ndos=dl&ntres=&ncuat="))%><a href="<%=r%>proveedores/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=pr&ndos=dl&ntres=&ncuat=")%>"><i class="fa fa-suitcase" aria-hidden="true"></i> Delegados </a></li>
<li class="dropdown"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=pr&ndos=mn&ntres=&ncuat="))%><a href="<%=r%>proveedores/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=pr&ndos=mn&ntres=&ncuat=")%>"><i class="fa fa-male" aria-hidden="true"></i> Monitores </a></li>
<li class="dropdown"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=pr&ndos=fm&ntres=&ncuat="))%><a href="<%=r%>proveedores/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=pr&ndos=fm&ntres=&ncuat=")%>"><i class="fa fa-users" aria-hidden="true"></i> Familias </a></li>
<li class="dropdown more-dropdown-sub">
<a href="javascript:;"><i class="fa fa-bus" aria-hidden="true"></i> Transporte</a>
<ul class="dropdown-menu">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=pr&ndos=au&ntres=&ncuat="))%><a href="<%=r%>proveedores/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=pr&ndos=au&ntres=&ncuat=")%>"><i class="fa fa-bus" aria-hidden="true"></i> Autobuses </a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=pr&ndos=ae&ntres=&ncuat="))%><a href="<%=r%>proveedores/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=pr&ndos=ae&ntres=&ncuat=")%>"><i class="fa fa-plane" aria-hidden="true"></i> Compañías Aéreas </a></li>
</ul>
</li>
</ul>
</li><%end if%>
<li class="dropdown dropdown-fw  "><a href="javascript:;" class="text-uppercase"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Marketing </a>
<ul class="dropdown-menu dropdown-menu-fw">
<%if pr_menu_ad="si" then%><li class="dropdown"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=mk&ndos=mn&ntres=&ncuat="))%><a href="<%=r%>mkt/menus_gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=mk&ndos=mn&ntres=&ncuat=")%>"><i class="fa fa-bars" aria-hidden="true"></i> Menús </a></li><%end if%>
<%if pr_paginas_ad="si" then%><li class="dropdown more-dropdown-sub">
<a href="javascript:;"><i class="fa fa-file-text-o" aria-hidden="true"></i> Páginas </a>
<ul class="dropdown-menu">
<li class="divider"></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=mk&ndos=pg&ntres=&ncuat="))%>
<li><a href="<%=r%>generales/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=mk&ndos=pg&ntres=&ncuat=")%>"><i class="fa fa-plus" aria-hidden="true"></i> Crear Página</a></li>
<li class="divider"></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=mk&ndos=pg&ntres=hm&ncuat="))%>
<li><a href="<%=r%>generales/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=mk&ndos=pg&ntres=hm&ncuat=")%>"><i class="fa fa-home" aria-hidden="true"></i> Página Home</a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=mk&ndos=pg&ntres=bh&ncuat="))%>
<li><a href="<%=r%>bannersHome/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=mk&ndos=pg&ntres=bh&ncuat=")%>"><i class="fa fa-picture-o" aria-hidden="true"></i> Banners Home</a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=mk&ndos=pg&ntres=nt&ncuat="))%>
<li><a href="<%=r%>generales/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=mk&ndos=pg&ntres=nt&ncuat=")%>"><i class="fa fa-newspaper-o" aria-hidden="true"></i> Página Noticias</a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=mk&ndos=pg&ntres=ct&ncuat="))%>
<li><a href="<%=r%>generales/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=mk&ndos=pg&ntres=ct&ncuat=")%>"><i class="fa fa-envelope" aria-hidden="true"></i> Página Contacto</a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=mk&ndos=pg&ntres=al&ncuat="))%>
<li><a href="<%=r%>generales/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=mk&ndos=pg&ntres=al&ncuat=")%>"><i class="fa fa-gavel" aria-hidden="true"></i> Página Aviso Legal</a></li>
<li><a href="<%=r%>generales/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=mk&ndos=pg&ntres=cc&ncuat=")%>"><i class="fa fa-pencil" aria-hidden="true"></i> Condiciones de Contratación</a></li>
<li><a href="<%=r%>generales/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=mk&ndos=pg&ntres=td&ncuat=")%>"><i class="fa fa-database" aria-hidden="true"></i> Claúsula tratamiento datos</a></li>
<li><a href="<%=r%>generales/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=mk&ndos=pg&ntres=ck&ncuat=")%>"><i class="fa fa-database" aria-hidden="true"></i> Cookies</a></li>
<li><a href="<%=r%>generales/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=mk&ndos=pg&ntres=tn&ncuat=")%>"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Test de nivel</a></li>
<li><a href="<%=r%>generales/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=mk&ndos=pg&ntres=mp&ncuat=")%>"><i class="fa fa-map" aria-hidden="true"></i> Mapa web</a></li>
<li class="divider"></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=mk&ndos=pg&ntres=&ncuat="))%>
<li><a href="<%=r%>generales/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=mk&ndos=pg&ntres=&ncuat=")%>"><i class="fa fa-list" aria-hidden="true"></i> Listar Páginas Creadas</a></li>
</ul>
</li><%end if%>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=mk&ndos=nt&ntres=&ncuat="))%>
<li class="dropdown" ><a href="<%=r%>noticias/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=mk&ndos=nt&ntres=&ncuat=")%>"><i class="fa fa-newspaper-o" aria-hidden="true"></i> Noticias </a></li>
<%if pr_comunicados_ad="si" then%><li class="dropdown"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=mk&ndos=nt&ntres=&ncuat="))%>
<a href="<%=r%>circulares/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=mk&ndos=nt&ntres=&ncuat=")%>"><i class="fa fa-bullhorn" aria-hidden="true"></i> Comunicados </a>
</li><%end if%>
<%if pr_datos_gestion_ad="si" then%><li class="dropdown more-dropdown-sub">
<a href="javascript:;"><i class="fa fa-cog" aria-hidden="true"></i> Datos gestión </a>
<ul class="dropdown-menu">
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=mk&ndos=rs&ntres=&ncuat="))%>
<li class="dropdown" ><a href="<%=r%>mkt/redes.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=mk&ndos=rs&ntres=&ncuat=")%>"><i class="fa fa-share-square-o" aria-hidden="true"></i> Redes Sociales </a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=mk&ndos=rs&ntres=ar&ncuat="))%>
<li><a href="<%=r%>mkt/datComunes.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=mk&ndos=rs&ntres=ar&ncuat=")%>"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
 Ajustes registro </a></li>
<li style="display:none"><a href="../lib/table_datatables_managed.html"> Newsletter </a></li>
<li><a href="https://www.getup.com/blog-cursos-idiomas"> <i class="fa fa-wordpress" aria-hidden="true"></i> Blog </a></li>
</ul>
</li><%end if%>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=mk&ndos=dsc&ntres=&ncuat="))%>
<li class="dropdown" ><a href="<%=r%>descuentos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=mk&ndos=dsc&ntres=&ncuat=")%>"><i class="fa fa-tags" aria-hidden="true"></i> Descuentos </a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=mk&ndos=frm&ntres=&ncuat="))%>
<li class="dropdown" ><a href="<%=r%>formularios/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=mk&ndos=frm&ntres=&ncuat=")%>"><i class="fa fa-file-text-o" aria-hidden="true"></i> Formularios </a></li>
<li class="dropdown more-dropdown-sub">
<a href="javascript:;"><i class="fa fa-users" aria-hidden="true"></i> Contactos </a>
<ul class="dropdown-menu">
<li class="divider"></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=mk&ndos=cnt&ntres=&ncuat="))%>
<li class="dropdown" ><a href="<%=r%>contactos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=mk&ndos=cnt&ntres=&ncuat=")%>"><i class="fa fa-user" aria-hidden="true"></i> Listado </a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=mk&ndos=catcnt&ntres=&ncuat="))%>
<li class="dropdown" ><a href="<%=r%>contactosCategorias/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=mk&ndos=catcnt&ntres=&ncuat=")%>"><i class="fa fa-list" aria-hidden="true"></i> Categorías </a></li>
</ul>
</li>
</ul>
</li>
<%if pr_academia_ad="hj" then%><li class="dropdown dropdown-fw"><a href="javascript:;" class="text-uppercase"><i class="icon-layers"></i> Academia</a>
<ul class="dropdown-menu dropdown-menu-fw">
<li class="dropdown more-dropdown-sub" style="">
<a href="javascript:;"><i class="fa fa-university "></i>  Gestión Academia </a>
<ul class="dropdown-menu">
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=../&rd="&rd&"&n=academia&ndos=acalu&ntres=&ncuat="))%>
<li><a href="<%=r%>academiaAlumnos/listado.jpk2?enc=<%=EnCrypt("?r=../&rd="&rd&"&n=academia&ndos=acalu&ntres=&ncuat=")%>"> <i class="fa fa-graduation-cap"></i> Alumnos academia</a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=../&rd="&rd&"&n=academia&ndos=summer&ntres=&ncuat="))%>
<li><a href="<%=r%>academiaAlumnos/listado.jpk2?enc=<%=EnCrypt("?r=../&rd="&rd&"&n=academia&ndos=summer&ntres=&ncuat=")%>"><i class="fa fa-university"></i> Summer school </a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=../&rd="&rd&"&n=academia&ndos=prof&ntres=&ncuat="))%>
<li><a href="<%=r%>academiaProfesores/listado.jpk2?enc=<%=EnCrypt("?r=../&rd="&rd&"&n=academia&ndos=prof&ntres=&ncuat=")%>"><i class="fa fa-user"></i> Profesores </a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=../&rd="&rd&"&n=academia&ndos=&ntres=&ncuat="))%>
<li><a href="<%=r%>academiaPrecios/listado.jpk2?enc=<%=EnCrypt("?r=../&rd="&rd&"&n=academia&ndos=&ntres=&ncuat=")%>"><i class="fa fa-euro "></i>  Precios </a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=../&rd="&rd&"&n=academia&ndos=aca&ntres=&ncuat="))%>
<li><a href="<%=r%>academiaListados/listado.jpk2?enc=<%=EnCrypt("?r=../&rd="&rd&"&n=academia&ndos=aca&ntres=&ncuat=")%>"><i class="fa fa-list"></i>  Listados </a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=../&rd="&rd&"&n=academia&ndos=cir&ntres=&ncuat="))%>
<li><a href="<%=r%>academiaCirculares/listado.jpk2?enc=<%=EnCrypt("?r=../&rd="&rd&"&n=academia&ndos=cir&ntres=&ncuat=")%>"><i class="fa fa-envelope "></i>  Circulares </a></li>
</ul></li>
<li class="dropdown more-dropdown-sub" style="">
<a href="javascript:;"><i class="fa fa-university "></i>  Gestión Extraescolares </a>
<ul class="dropdown-menu">
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=../&rd="&rd&"&n=academia&ndos=exalu&ntres=&ncuat="))%>
<li><a href="<%=r%>academiaExtAlumnos/listado.jpk2?enc=<%=EnCrypt("?r=../&rd="&rd&"&n=academia&ndos=exalu&ntres=&ncuat=")%>"> <i class="fa fa-graduation-cap"></i> Alumnos </a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=../&rd="&rd&"&n=academia&ndos=excol&ntres=&ncuat="))%>
<li><a href="<%=r%>academiaExtColegios/listado.jpk2?enc=<%=EnCrypt("?r=../&rd="&rd&"&n=academia&ndos=excol&ntres=&ncuat=")%>"><i class="fa fa-university"></i> Gestión colegios </a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=../&rd="&rd&"&n=academia&ndos=exact&ntres=&ncuat="))%>
<li><a href="<%=r%>academiaExtActividades/listado.jpk2?enc=<%=EnCrypt("?r=../&rd="&rd&"&n=academia&ndos=exact&ntres=&ncuat=")%>"><i class="fa fa-bullseye"></i> Actividades </a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=../&rd="&rd&"&n=academia&ndos=moni&ntres=&ncuat="))%>
<li><a href="<%=r%>academiaProfesores/listado.jpk2?enc=<%=EnCrypt("?r=../&rd="&rd&"&n=academia&ndos=moni&ntres=&ncuat=")%>"><i class="fa fa-user"></i> Monitores </a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=../&rd="&rd&"&n=academia&ndos=ext&ntres=&ncuat="))%>
<li><a href="<%=r%>academiaListados/listado.jpk2?enc=<%=EnCrypt("?r=../&rd="&rd&"&n=academia&ndos=ext&ntres=&ncuat=")%>"> <i class="fa fa-list "></i> Listados </a></li>
</ul></li>
</ul>
</li>
<%end if%>
<%if pr_admin_ad="si" then%><li class="dropdown dropdown-fw"><a href="javascript:;" class="text-uppercase"><i class="fa fa-unlock-alt" aria-hidden="true"></i>
 Admin </a>
<ul class="dropdown-menu dropdown-menu-fw">
<li class="dropdown more-dropdown-sub">
<a href="javascript:;"><i class="fa fa-sliders" aria-hidden="true"></i> Configuración </a>
<ul class="dropdown-menu">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ad&ndos=con&ntres=dn&ncuat="))%><a href="<%=r%>divisiones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ad&ndos=con&ntres=dn&ncuat=")%>"><i class="fa fa-building-o" aria-hidden="true"></i> Divisiones Negocio </a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ad&ndos=con&ntres=w&ncuat="))%><a href="<%=r%>webs/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ad&ndos=con&ntres=w&ncuat=")%>"><i class="fa fa-link" aria-hidden="true"></i> Webs </a></li>
</ul></li><%if pr_usuarios_crm_ad="si" then%><li class="dropdown"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ad&ndos=usu&ntres=&ncuat="))%><a href="<%=r%>admins/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ad&ndos=usu&ntres=&ncuat=")%>"><i class="fa fa-users" aria-hidden="true"></i> Usuarios</a></li><%end if%>
<li class="dropdown more-dropdown-sub" style="display:none">
<a href="javascript:;"><i class="fa fa-list" aria-hidden="true"></i> Listados</a>
<ul class="dropdown-menu">
<li><a href="../lib/table_datatables_managed.html"><i class="fa fa-list-alt" aria-hidden="true"></i> Facturación real (c) </a></li>
<li><a href="../lib/table_datatables_managed.html"><i class="fa fa-list-alt" aria-hidden="true"></i> Beneficio neto por curso (c)</a></li>
</ul>
</li>
<li class="dropdown"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ad&ndos=mp&ntres=&ncuat="))%><a href="<%=r%>mkt/metodos_pago.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ad&ndos=mp&ntres=&ncuat=")%>"><i class="fa fa-money" aria-hidden="true"></i> Métodos de pago </a></li>
<li class="dropdown"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ad&ndos=mp&ntres=&ncuat="))%><a href="<%=r%>listados/listado3.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ad&ndos=mp&ntres=&ncuat=")%>"><i class="fa fa-user" aria-hidden="true"></i> Alumnos sin programa </a></li>
</ul>
</li><%end if%>
</ul>
</div>
<!-- END HEADER MENU -->
</div>
<!--/container-->
</nav>
</header>
<%end if%>
<!-- END HEADER -->
<div class="container-fluid">
<div class="page-content" <%if edi<>"rap"then%>style="padding-top:35px"<%end if%><%if edi="rap"then%>style="padding-top:0px"<%end if%>>
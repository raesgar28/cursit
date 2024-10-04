<!--#include file="comun/menu_sup.asp"-->
<%'session.abandon()%>
<!--#include file="comun/z_check_user.asp"-->
<%if session("id_usuario")<>"" then
Sql= "SELECT u_telefono,u_email,u_movil,u_direccion,u_ciudad, u_provincia, u_pais,u_empresa from usuarios where id_usuario= "&session("id_usuario")&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
u_email=ob_rs("u_email")
u_telefono=ob_rs("u_telefono")
u_movil=ob_rs("u_movil")
u_direccion=ob_rs("u_direccion")
u_ciudad=ob_rs("u_ciudad")
u_provincia=ob_rs("u_provincia")
u_pais=ob_rs("u_pais")
u_empresa=ob_rs("u_empresa")
end if
ob_rs.close
else
response.redirect(r&"login")
end if%>
<div class="c-layout-breadcrumbs-1 c-subtitle c-fonts-uppercase c-fonts-bold c-bordered c-bordered-both"><div class="container"><div class="c-page-title c-pull-left">
<h3 class="c-font-uppercase c-font-sbold"><%=titulo_esp_web%></h3><h4 class=""><%=titulo_esp_div%></h4></div><ul class="c-page-breadcrumbs c-theme-nav c-pull-right c-fonts-regular"><li>
<a href="<%=r%>zona-privada">Zona usuario</a></li><li>/</li><li class="c-state_active">Escritorio</li></ul></div></div>
<div class="container">
<!--#include file="comun/z_menu.asp"-->
<div class="c-layout-sidebar-content ">
<div class="c-content-title-1">
<h3 class="">Zona Privada</h3>
<div class="c-line-left"></div>
<p class=""> Hola, bienvenido a tu zona privada <%=session("us_nombre")%>. Por favor, selecciona del menú de la izquierda la opción que desees.<br>Si necesitas ayuda, no dudes en contactar con nosotros.<br><br>Un saludo!<br /></p>
</div>
<div class="row">
<div class="col-md-6 col-sm-6 col-xs-12 c-margin-b-20">
<h3 class="c-font-uppercase c-font-bold"><%=session("us_nombre")%>&nbsp;<%=session("us_apellidos")%></h3>
<ul class="list-unstyled">
<li><%=u_direccion%>&nbsp;<%=u_ciudad%>&nbsp;<%=u_provincia%></li>
<li><%=u_telefono%>&nbsp;<%=u_movil%></li>
<li><%=u_email%></li>
<li><%=u_empresa%></li>
</ul>
</div>
</div>
</div>
</div>
<!--#include file="comun/menu_inf.asp"-->
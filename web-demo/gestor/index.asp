<% Response.Buffer = True %><!DOCTYPE html><!--[if IE 8]> <html lang="es-es" class="ie8 no-js"> <![endif]--><!--[if IE 9]> <html lang="es-es" class="ie9 no-js"> <![endif]--><!--[if !IE]><!--><html lang="es-es"><!--<![endif]--><head><meta charset="utf-8" /><title>Cursit | CRM </title><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta content="width=device-width, initial-scale=1" name="viewport" /><meta content="" name="description" /><meta content="" name="author" /><%n="log"%><!--#include file="comun/estilos.asp"--><link rel="shortcut icon" href="favicon.ico"/></head><body class=" login"><div class="user-login-5"><div class="row bs-reset"><div class="col-md-6 bs-reset"><div class="login-bg" style="background-image:url(<%=r%>images/login/bg1.jpg)"><img class="login-logo" src="<%=r%>images/login/logo.png" /> </div></div><div class="col-md-6 login-container bs-reset"><div class="login-content">
<h1>Cursit Acceso CRM</h1><p>Bienvenido al CRM/CMS de Cursit Idiomas</p>
<%salir=request("salir")
if salir="si" then
session.Abandon()
session("admin")=""
session("user_crm_schol")=""
response.redirect("../gestor/")
end if
'session("user_crm_schol")="" 'LUEGO SE COMILLA
if session("user_crm_schol")="1527" then
response.redirect("dash/")
end if
rd="../"
ms=request("ms")
p=request("p")'pass
cod=request("cod")%>
<script src="<%=r%>lib/js/jquery.min.js" type="text/javascript"></script>
<style>.spinner {position: fixed; top: 50%; left: 50%;margin-left: -125px;margin-top: -50px;text-align:center;z-index:1234;overflow: hidden;width: 350px;height: 140px;background:rgba(0,0,0,0.5);padding-top:50px;color:#fff;font-weight:bold;}
#spinner_back{position: fixed; background:rgba(1,1,1,0.1);position: fixed; top: 0; left: 0;width:100%;height:100%;overflow: hidden;text-align:center;z-index:1233;}
</style><div id="spinner_back" style="display:none;"><div id="spinner" class="spinner" ><img src="<%=r%>images/ajax-loader.gif" width="220" height="27"><br><br>Accediendo...(un momento)</div></div>
<!--#include file="../conex/conex.asp"--><!--#include file="../conex/conex_back.asp"--><!--#include file="comun/pass_sha256.asp"--><!--#include file="comun/limpia.asp"-->
<%if Request.Cookies ("cookuser_crm_schol")("usuario")<>"" and Request.Cookies ("cookuser_crm_schol")("contrasena")<>""then checa="si" end if
if request("username")<>"" and request("password")<>"" then
Sql= "SELECT user_m, pass, id_admin FROM admins" 'VEMOS SI ES EL PRIMERO
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
'HAY ALGUNO Y NO HACEMOS NADA
else
fecha_in=date
mySQL="INSERT INTO admins (user_m, pass,pr_academia,pr_cursos,pr_alumnos,pr_contabilidad,pr_precio_real,pr_datos_comunes,pr_cat_sec,pr_fluctuaciones,pr_proveedores,pr_admin,pr_menu,pr_paginas,pr_comunicados,pr_datos_gestion,pr_usuarios_crm,fecha_in,habilitado,pr_factura,pr_opciones,principal)" 	         '[INSERTAMOS Y CREAMOS EL PRIMERO]			
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "'" & request("username") & "',"
mySQL=mySQL & "'" & sha256(request("password")) & "',"
mySQL=mySQL & "'si',"
mySQL=mySQL & "'si',"
mySQL=mySQL & "'si',"
mySQL=mySQL & "'si',"
mySQL=mySQL & "'si',"
mySQL=mySQL & "'si',"
mySQL=mySQL & "'si',"
mySQL=mySQL & "'si',"
mySQL=mySQL & "'si',"
mySQL=mySQL & "'si',"
mySQL=mySQL & "'si',"
mySQL=mySQL & "'si',"
mySQL=mySQL & "'si',"
mySQL=mySQL & "'si',"
mySQL=mySQL & "'si',"
mySQL=mySQL & "'" & fecha_in & "',"
mySQL=mySQL & "'si',"
mySQL=mySQL & "'si',"
mySQL=mySQL & "'si',"
mySQL=mySQL & "'si'"
mySQL=mySQL & ");"
set ob_rs2=Ob_Connb.execute(mySQL)
set ob_rs2 = Ob_Connb.execute("select MAX(id_admin) from admins") 
cod = ob_rs2(0)
ob_rs2.close
session("admin")=cod
session("user_crm_schol")="1527"
response.redirect("dash/")
end if
Sql= "SELECT user_m, pass, id_admin FROM admins where user_m='"&request("username")&"' and pass='"&sha256(request("password"))&"' and habilitado='si'" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
if request("remember")="1"then
Response.Cookies ("cookuser_crm_schol")("usuario") = request("username")
Response.Cookies ("cookuser_crm_schol")("contrasena") = request("password")
Response.Cookies ("cookuser_crm_schol")("remember") = "1"
Response.Cookies ("cookuser_crm_schol").Expires = DATE + 365
checa="si"
end if
if Request.Cookies ("cookuser_crm_schol")("remember")="1" and request("remember")<>"1" then
Response.Cookies ("cookuser_crm_schol")("usuario") = ""
Response.Cookies ("cookuser_crm_schol")("contrasena") = ""
Response.Cookies ("cookuser_crm_schol")("remember") = ""
Response.Cookies ("cookuser_crm_schol").Expires = DATE + 365
checa="no"
end if
session("admin")=ob_rs("id_admin")
session("user_crm_schol")="1527"
'response.redirect("dash/")
%><form action="dash/" id="entra_dash" name="entra_dash" method="post"></form>
<script>$('#spinner_back').show();$('#spinner').show();$('#spinner').show();
//setTimeout(function(){ window.location.href = "dash/"; }, 200);
setTimeout(function(){ document.entra_dash.submit(); }, 300);</script><%
else
response.redirect("../gestor-ko/")
end if
ob_rs.close
ob_connb.close
end if
if p="pass-ch" then '////////////////////////////////  CAMBIAR CONTRASEÑA TRAS RECUPERAR
id_admin=request("id_admin")
pass=request("pass_n")
pass=sha256(pass)
if id_admin<>""then
mySQL2="UPDATE admins SET "
mySQL2=mySQL2 & "pass = '" & pass & "'"
mySQL2=mySQL2 & " WHERE id_admin = " & id_admin & "" 
set ob_rs2=Ob_Connb.execute(mySQL2)
end if%>
<div class="alert alert-success" style="display:block;float:left;margin-top:0px;width:100%;"><button class="close" data-close="alert"  style="margin-left:12px;margin-top:5px"></button>Datos de usuario modificados con éxito! </div>
<%end if
if cod<>""then
id_admin=Mid(cod,10,200)
if id_admin<>""then
Sql= "SELECT * from admins where codigo_activacion='"&cod&"' and id_admin="&id_admin&" "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
u_nombre=ob_rs("nombre")
id_admin=ob_rs("id_admin")
usuario_ok="si"
end if
ob_rs.close
if usuario_ok="si" then%>
<form action="../gestor-pass-ch/" class="login-form" method="post" name="login_p" id="login_p">
<input name="id_admin" type="hidden" value="<%=id_admin%>">
<div class="row"><div class="col-xs-6"><input class="form-control form-control-solid placeholder-no-fix form-group" type="password" autocomplete="off" placeholder="Contraseña" name="pass_n" id="pass_n" required /></div><div class="col-xs-6"><input class="form-control form-control-solid placeholder-no-fix form-group" type="password" autocomplete="off" placeholder="Repite Contraseña" name="pass_n_r" id="pass_n_r" required/></div></div><div class="row"><div class="col-sm-4"><button class="btn" type="submit">volver</button></div><div class="col-sm-8 text-right"><button class="btn green" type="button" onClick="u_compara_pass();">Cambiar contraseña</button></div></div></form>
<script>
function u_compara_pass(){
if(document.login_p.pass_n.value == ""){$('#alerta_txt').html('Introduce una contraseña.');$('#alerta_tit').html('La contraseña no puede estar vacía.');$('#alerta').modal('show');}else{
if(document.login_p.pass_n.value == document.login_p.pass_n_r.value)
document.login_p.submit();
else
$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> La Contraseña del usuario repetida no coincide.');$('#alerta_tit').html('Contraseña del usuario incorrecta.');$('#alerta').modal('show');}}
</script>
<div id="alerta" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content c-square">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
<span aria-hidden="true">×</span>
</button>
<h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-exclamation-triangle" aria-hidden="true" style="margin-right:15px;"></i> <span id="alerta_tit"></span></h4>
</div>
<div class="modal-body"><p><span id="alerta_txt"></span></p></div>
<div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal">Aceptar</button></div>
</div>
</div>
</div>
<%else%>
<div class="alert alert-danger" style="display:block;float:left;margin-top:0px;width:100%;"><button class="close" data-close="alert"  style="margin-left:12px;margin-top:5px"></button>Codigo de activacion incorrecto</div>
<form action="#" class="login-form" method="post"><div class="row"><div class="col-sm-4"><a href="../gestor/" class="btn green" >volver</a></div></div></form>
<%end if
else%>
<div class="alert alert-danger" style="display:block;float:left;margin-top:0px;width:100%;"><button class="close" data-close="alert"  style="margin-left:12px;margin-top:5px"></button>Codigo de activacion incorrecto</div>
<form action="#" class="login-form" method="post"><div class="row"><div class="col-sm-4"><button class="btn green" type="submit">volver</button></div></div></form>
<%end if
else 'cod activa%>
<form action="../gestor/" class="login-form" method="post">
<%if p="pass"then
Sql= "SELECT user_m, pass, mail, id_admin, user_m FROM admins where mail='"&request("email")&"'" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
u_email=ob_rs("mail")
id_admin=ob_rs("id_admin")
u_usuario=ob_rs("user_m")
envio="ok"
end if
ob_rs.close
if envio="ok" and id_admin<>"" then' ENVIAMOS MAIL SELECTIVO
Sql= "SELECT * FROM webs WHERE principal='si'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Conn,adOpenStatic, adCmdText
if not ob_rs.eof then
nombre_empresa=ob_rs("titulo_esp")
id_web=ob_rs("id_web")
f_smtp=ob_rs("f_smtp")
f_usuario=ob_rs("f_usuario")
f_pass=ob_rs("f_pass")
f_email=ob_rs("f_email")
f_puerto=ob_rs("f_puerto")
f_texto_legal=ob_rs("f_texto_legal")
email=ob_rs("email")
direccion=ob_rs("direccion")
cod_postal=ob_rs("cod_postal")
ciudad=ob_rs("ciudad")
provincia=ob_rs("provincia")
pais=ob_rs("pais")
if pais="es" then pais="España" end if
telefono=ob_rs("telefono")
url=ob_rs("url")
url_c=ob_rs("url")
if url <>"" then
url=replace(url,"https://","")
url=replace(url,"http://","")
end if
end if
ob_rs.close
if id_web<>""then
Sql= "SELECT nombre, alt FROM rel, archivos WHERE id_web="&id_web&" and rel.id_archivo<>0 and rel.id_archivo=archivos.id_archivo"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Conn,adOpenStatic, adCmdText
if not ob_rs.eof then
nombre_img=ob_rs("nombre")
nombre_img=url_c&nombre_img
alt=ob_rs("alt")
end if
ob_rs.close
end if
function RandomString()
Randomize()
dim CharacterSetArray
CharacterSetArray = Array(_
Array(7, "abcdefghijklmnopqrstuvwxyz"), _
Array(1, "0123456789") _
)
dim i
dim j
dim Count
dim Chars
dim Index
dim Temp
for i = 0 to UBound(CharacterSetArray)
Count = CharacterSetArray(i)(0)
Chars = CharacterSetArray(i)(1)
for j = 1 to Count
Index = Int(Rnd() * Len(Chars)) + 1
Temp = Temp & Mid(Chars, Index, 1)
next
next
dim TempCopy
do until Len(Temp) = 0
Index = Int(Rnd() * Len(Temp)) + 1
TempCopy = TempCopy & Mid(Temp, Index, 1)
Temp = Mid(Temp, 1, Index - 1) & Mid(Temp, Index + 1)
loop
RandomString = TempCopy
end function
Set Mail = Server.CreateObject("Persits.MailSender")
Mail.CharSet = "iso-8859-1"
Mail.ContentTransferEncoding = "Quoted-Printable"
Mail.Host = f_smtp
Mail.Port = f_puerto
Mail.Username = f_usuario
Mail.Password = f_pass
Mail.From = f_email
Mail.FromName = "Cursit - Cursos de Idiomas"
Sql= "SELECT mail, nombre, apellidos FROM admins WHERE id_admin="&id_admin&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
u_email=ob_rs("mail")
u_nombre=ob_rs("nombre")
u_apellidos=ob_rs("apellidos")
codigo_activacion=RandomString()&"-"&id_admin
enlace_activacion= url_c&"/recover-crm/"&codigo_activacion
if session("mail_en")="" then
mySQL2="UPDATE admins SET "
mySQL2=mySQL2 & "codigo_activacion = '" & codigo_activacion & "'"
mySQL2=mySQL2 & " WHERE id_admin = " & id_admin & "" 
set ob_rs2=Ob_Connb.execute(mySQL2)
end if
end if
ob_rs.close
Mail.AddAddress u_email
asunto = deslimpia(u_nombre) &" "& deslimpia(u_apellidos) & " - Recuperar clave de usuario "
Mail.Subject =  Mail.EncodeHeader(asunto, "Windows-1250")
texto="<br><br>"
texto=texto& "<font size=""23"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>Hola "&u_nombre&"!</i></font><br><br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">Para poder recuperar tu clave de acceso, generando una nueva, deberás clicar sobre el siguiente enlace (si no funcionara copia y pega en el navegador el enlace):<br /><br /><a href="&enlace_activacion&">"&enlace_activacion&"</a><br /><br />Te recordamos que tu usuario es <strong>"&u_usuario&"</strong></font><br><br><hr color=""#999999"" align=""center"" width=""100%""/>"
texto=texto &"<br><br>Te recordamos que puedes realizar varias gestiones desde el &aacute;rea de usuario, con el mail y la contrase&ntilde;a introducidos en el registro."
texto=texto &"<br><br>Ante cualquier duda o problema ponte en contacto con nosotros a trav&eacute;s del mail <strong>"&email&"</strong> o bien del tel&eacute;fono "&telefono&".<br><br><hr color=""#32C5D2"" align=""center"" width=""20%""/><br><br>"
Mail.Body = "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#CCCCCC""><tr><td width=""80%"" valign=""top"" bgcolor=""#FFFFFF""><img src="""&nombre_img&""" alt="""&alt&"""  width=""127"" height=""69"" hspace=""8"" vspace=""12"" /><br /></td><td width=""20%"" align=""right"" bgcolor=""#FFFFFF""><font size=""1.5"" face=""Arial, Helvetica, sans-serif"">"&direccion&"<br>"&cod_postal&" - "&ciudad&" <br>Tel. "&telefono&"<br>"&email&"&nbsp;&nbsp; //&nbsp; "& url &" </font></td></tr></table><br><font size=""2"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"& texto &"</font><br><br><font size=""1"" face=""Arial, Helvetica, sans-serif"" color=""#999999"">"&f_texto_legal&"</font><br />"
Mail.IsHTML = True 
On Error Resume Next
Mail.Send%>
<div class="alert alert-info"><button class="close" data-close="alert"></button><span>Email enviado con detalles. </span></div>
<%else%>
<div class="alert alert-danger" role="alert"> El mail introducido no pertenece a ningún usuario.</div>
<%end if
end if%>
<%if ms="ko"then%><div class="alert alert-danger"><button class="close" data-close="alert"></button><span>Usuario o contraseña inválidos. </span></div><%end if%>
<div class="alert alert-danger display-hide"><button class="close" data-close="alert"></button><span>Introduce tu usuario y contraseña. </span></div>
<div class="row"><div class="col-xs-6"><input class="form-control form-control-solid placeholder-no-fix form-group" type="text" autocomplete="off" placeholder="Usuario" name="username" id="username" required value="<%=Request.Cookies ("cookuser_crm_schol")("usuario")%>"/></div>
<div class="col-xs-6"><input class="form-control form-control-solid placeholder-no-fix form-group" type="password" autocomplete="off" placeholder="Contraseña" name="password" id="password" required value="<%=Request.Cookies ("cookuser_crm_schol")("contrasena")%>"/></div>
</div>
<div class="row"><div class="col-sm-4"><div class="rem-password"><label class="rememberme mt-checkbox mt-checkbox-outline"><input type="checkbox" name="remember" value="1" <%if checa="si"then%>checked<%end if%>/> Recordarme<span></span></label></div></div>
<div class="col-sm-8 text-right"><div class="forgot-password"><a href="javascript:;" id="forget-password" class="forget-password">Olvidaste tu contraseña?</a></div><button class="btn green" type="submit">Acceder</button></div></div>
</form>
<form class="forget-form" action="../gestor-pass/" method="post"><h3 class="font-green">Olvidaste tu contraseña ?</h3><p> Introduce tu email para proceder. </p><div class="form-group"><input class="form-control placeholder-no-fix form-group" type="text" autocomplete="off" placeholder="Email" name="email" required /> </div><div class="form-actions"><button type="button" id="back-btn" class="btn green btn-outline">Atrás</button><button type="submit" class="btn btn-success uppercase pull-right">Enviar</button></div></form>
<%end if'cod activa%>
</div>
<%Sql= "SELECT * FROM redes" 'REDES /////////////////////
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
rd_facebook=ob_rs("rd_facebook")
rd_twitter=ob_rs("rd_twitter")
rd_youtube=ob_rs("rd_youtube")
rd_pinterest=ob_rs("rd_pinterest")
rd_blog=ob_rs("rd_blog")
rd_linkedin=ob_rs("rd_linkedin")
rd_instagram=ob_rs("rd_instagram")
rd_tumblr=ob_rs("rd_tumblr")
rd_flickr=ob_rs("rd_flickr")
rd_reddit=ob_rs("rd_reddit")
rd_google_plus=ob_rs("rd_google_plus")
end if
ob_rs.close%><div class="login-footer"><div class="row bs-reset"><div class="col-xs-5 bs-reset"><ul class="login-social"><%if rd_facebook<>""then%><li><a href="<%=rd_facebook%>"><i class="icon-social-facebook"></i></a></li><%end if%><%if rd_twitter<>""then%><li><a href="<%=rd_twitter%>"><i class="icon-social-twitter"></i></a></li><%end if%><%if rd_youtube<>""then%><li><a href="<%=rd_youtube%>"><i class="icon-social-youtube"></i></a></li><%end if%><%if rd_pinterest<>""then%><li><a href="<%=rd_pinterest%>"><i class="fa fa-pinterest"></i></a></li><%end if%><%if rd_blog<>""then%><li><a href="<%=rd_blog%>"><i class="fa fa-wordpress"></i></a></li><%end if%><%if rd_linkedin<>""then%><li><a href="<%=rd_linkedin%>"><i class="fa fa-linkedin"></i></a></li><%end if%><%if rd_instagram<>""then%><li><a href="<%=rd_instagram%>"><i class="fa fa-instagram"></i></a></li><%end if%><%if rd_tumblr<>""then%><li><a href="<%=rd_tumblr%>"><i class="fa fa-tumblr"></i></a></li><%end if%><%if rd_flickr<>""then%><li><a href="<%=rd_flickr%>"><i class="fa fa-flickr"></i></a></li><%end if%><%if rd_reddit<>""then%><li><a href="<%=rd_reddit%>"><i class="fa fa-reddit"></i></a></li><%end if%><%if rd_google_plus<>""then%><li><a href="<%=rd_google_plus%>"><i class="fa fa-google-plus"></i></a></li><%end if%></ul></div><div class="col-xs-7 bs-reset"><div class="login-copyright text-right"><p>Copyright &copy; Wishingwell <%=year(date)%></p></div></div></div></div></div></div></div><script src="<%=r%>lib/app/bootstrap/js/bootstrap.min.js" type="text/javascript"></script><script src="<%=r%>lib/app/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script><script src="<%=r%>lib/app/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script><script src="<%=r%>lib/app/backstretch/jquery.backstretch.min.js" type="text/javascript"></script><script src="<%=r%>lib/js/app.min.js" type="text/javascript"></script><script>var Login=function(){var r=function(){$(".login-form").validate({errorElement:"span",errorClass:"help-block",focusInvalid:!1,rules:{username:{required:!0},password:{required:!0},remember:{required:!1}},messages:{username:{required:"Username is required."},password:{required:"Password is required."}},invalidHandler:function(r,e){$(".alert-danger",$(".login-form")).show()},highlight:function(r){$(r).closest(".form-group").addClass("has-error")},success:function(r){r.closest(".form-group").removeClass("has-error"),r.remove()},errorPlacement:function(r,e){r.insertAfter(e.closest(".input-icon"))},submitHandler:function(r){r.submit()}}),$(".login-form input").keypress(function(r){if(13==r.which)return $(".login-form").validate().form()&&$(".login-form").submit(),!1}),$(".forget-form input").keypress(function(r){if(13==r.which)return $(".forget-form").validate().form()&&$(".forget-form").submit(),!1}),$("#forget-password").click(function(){$(".login-form").hide(),$(".forget-form").show()}),$("#back-btn").click(function(){$(".login-form").show(),$(".forget-form").hide()})};return{init:function(){r(),$(".login-bg").backstretch(["<%=r%>images/login/bg1.jpg","<%=r%>images/login/bg2.jpg","<%=r%>images/login/bg3.jpg"],{fade:1e3,duration:8e3}),$(".forget-form").hide()}}}();jQuery(document).ready(function(){Login.init()});</script></body></html>
<!--#include file="comun/menu_sup.asp"-->
<!--#include file="../conex/conex_back.asp"-->
<!--#include file="comun/limpia.asp"-->
<%form_op=request("form_op")%>
<link href="<%=r%>web/lib/css/reserva-steps.css" rel="stylesheet" type="text/css" />
<script src="<%=r%>web/lib/js/custom.js"></script>
<div class="c-layout-breadcrumbs-1 c-bgimage c-subtitle c-fonts-uppercase c-fonts-bold c-bg-img-center" style="background-image: url(<%=ruta_banner%>)">
<div class="container"><div class="c-page-title c-pull-left"><h3 class="c-font-uppercase c-font-bold c-font-white c-font-20 c-font-slim"><%=titulo_esp_web%> | <%=titulo_esp_div%></h3>
<h4 class="c-font-white c-font-thin c-opacity-07">Por si te pierdes...</h4></div><ul class="c-page-breadcrumbs c-theme-nav c-pull-right c-fonts-regular"><li><a href="<%=url_web%>" class="c-font-white"><%=titulo_esp_web%></a></li><li class="c-font-white">/</li><li class="c-state_active c-font-white">Recuperar contraseña</li></ul></div></div><div class="c-content-box c-size-md c-bg-white"><div class="container"><div class="row reserva_check">
<div class="col-md-12 acceso reserva_check">
<%if form_op=""then
session("mail_en")=""%>
Introduce tu email o usuario.<br><br>
<form class="form" role="form" method="post" action="<%=r%>recuperar-pass" id="login_p" name="login_p">
<input name="form_op" type="hidden" value="recupera">
<div class="acceso_in"><div class="acceso_in_in"><div class="form-group"><i class="fa fa-user"></i><input type="text" placeholder="Usuario/Email*" onclick="this.placeholder = ''" onblur="this.placeholder = 'Usuario/Email*'" class="form-control c-square c-theme input-lg inp" name="log_usuario" id="log_usuario"></div>
<span class="btn_acceso"><button type="button" class="btn c-theme-btn c-btn-border-1x c-btn-square c-btn-uppercase c-btn-bold" onCLick="javascript:recupera_pass();" style="width:100%">Recuperar contraseña<i class="fa fa-share" aria-hidden="true" style="margin-left:8px"></i></button></span>
</div>
</div>
</form>
<%else
if form_op="recupera" then
u_email=trim(request("log_usuario"))
Sql= "SELECT u_email, id_usuario from usuarios where u_email= '"&u_email&"'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
u_email=ob_rs("u_email")
id_usuario=ob_rs("id_usuario")
envio="ok"
end if
ob_rs.close
if envio="ok" and id_usuario<>"" then
' ENVIAMOS MAIL SELECTIVO
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
Sql= "SELECT u_email, u_nombre, u_apellidos FROM usuarios WHERE id_usuario="&id_usuario&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
u_email=ob_rs("u_email")
u_nombre=ob_rs("u_nombre")
u_apellidos=ob_rs("u_apellidos")
codigo_activacion=RandomString()&"-"&id_usuario
enlace_activacion= url_c&"/recover/"&codigo_activacion
if session("mail_en")="" then
mySQL2="UPDATE usuarios SET "
mySQL2=mySQL2 & "codigo_activacion = '" & codigo_activacion & "'"
mySQL2=mySQL2 & " WHERE id_usuario = " & id_usuario & "" 
set ob_rs2=Ob_Connb.execute(mySQL2)
end if
end if
ob_rs.close
Mail.AddAddress u_email
asunto = deslimpia(u_nombre) &" "& deslimpia(u_apellidos) & " - Recuperar clave de usuario "
Mail.Subject =  Mail.EncodeHeader(asunto, "Windows-1250")
texto="<br><br>"
texto=texto& "<font size=""23"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>Hola "&u_nombre&"!</i></font><br><br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">Para poder recuperar tu clave de acceso, generando una nueva, deberás clicar sobre el siguiente enlace (si no funcionara copia y pega en el navegador el enlace):<br /><br /><a href="&enlace_activacion&">"&enlace_activacion&"</a><br /><br />Te recordamos que tu usuario es <strong>"&u_email&"</strong></font><br><br><hr color=""#999999"" align=""center"" width=""100%""/>"
texto=texto &"<br><br>Te recordamos que puedes realizar varias gestiones desde el &aacute;rea de usuario, con el mail y la contrase&ntilde;a introducidos en el registro."
texto=texto &"<br><br>Ante cualquier duda o problema ponte en contacto con nosotros a trav&eacute;s del mail <strong>"&email&"</strong> o bien del tel&eacute;fono "&telefono&".<br><br><hr color=""#32C5D2"" align=""center"" width=""20%""/>"
texto=texto &"<br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><p align=""center""><i>Muchas gracias por confiar en "&nombre_empresa&" y muy feliz viaje!!!</i></p></font>"
texto=texto &"<br><br>"
Mail.Body = "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#CCCCCC""><tr><td width=""80%"" valign=""top"" bgcolor=""#FFFFFF""><img src="""&nombre_img&""" alt="""&alt&"""  width=""127"" height=""69"" hspace=""8"" vspace=""12"" /><br /></td><td width=""20%"" align=""right"" bgcolor=""#FFFFFF""><font size=""1.5"" face=""Arial, Helvetica, sans-serif"">"&direccion&"<br>"&cod_postal&" - "&ciudad&" <br>Tel. "&telefono&"<br>"&email&"&nbsp;&nbsp; //&nbsp; "& url &" </font></td></tr></table><br><font size=""2"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"& texto &"</font><br><br><font size=""1"" face=""Arial, Helvetica, sans-serif"" color=""#999999"">"&f_texto_legal&"</font><br />"
Mail.IsHTML = True 
On Error Resume Next
if session("mail_en")<>"ok" then
Mail.Send'If Err <> 0 Then env_mail_res_alu="ko"end If 
end if%>
<div class="alert alert-success alert-dismissible" role="alert"> Instrucciones para recuperación de contraseña enviadas. Revisa tu carpeta de spam, por favor.</div>
<%session("mail_en")="ok"
else%>
<div class="alert alert-danger alert-dismissible" role="alert"> El mail introducido no pertenece a ningún usuario. <a href="<%=r%>recuperar-pass">Vuelve a introducir mail </a></div>
<%end if
end if
end if%>
</div></div></div></div>
<div id="alerta" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog"><div class="modal-content c-square"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Cerrar"><span aria-hidden="true">×</span></button><h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-exclamation-triangle" aria-hidden="true" style="margin-right:15px;"></i> <span id="alerta_tit"></span></h4></div><div class="modal-body"><p><span id="alerta_txt"></span></p></div><div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal">Aceptar</button></div></div></div></div>
<div id="spinner_back" ><div id="spinner" class="spinner" ><img src="<%=r%>web/lib/img/carga.gif" width="128" height="128"><br><br>Recibiendo datos...</div></div>
<!--#include file="comun/menu_inf.asp"-->
<script>
function log_usuario() {Ctrl = login_p.log_usuario;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el mail o usuario.');$('#alerta_tit').html('Usuario o mail no introducidos.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function recupera_pass(){if (!log_usuario()) return;$('#spinner_back').fadeIn(100, function(){setTimeout(function(){ document.login_p.submit(); }, 0);});}
</script>
<!--#include file="../../conex/conex_back.asp"-->
<!--#include file="pass_sha256.asp"-->
<%form_op=request("form_op")
log_usuario=request("log_usuario")
log_pass=request("log_pass")
if session("id_usuario")<>""then
id_usuario=session("id_usuario")
if session("ok_log_"&id_usuario)<>"ok" then
'response.redirect(r&"zona-privada")
end if
if id_usuario=""then
response.redirect(r&"zona-privada")
end if
else
log_pass=sha256(log_pass)
Sql= "SELECT u_usuario,u_email,u_pass,habilitado,id_usuario, u_nombre, u_apellidos, u_agente from usuarios where (u_usuario='"&log_usuario&"' or u_email='"&log_usuario&"') AND u_pass='"&log_pass&"' and u_email<>''"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
if ob_rs("habilitado") ="si" then
session("id_usuario")=ob_rs("id_usuario")
id_usuario=ob_rs("id_usuario")
session("us_nombre")=ob_rs("u_nombre")
session("us_apellidos")=ob_rs("u_apellidos")
session("ok_log_"&id_usuario)="ok"
session("u_agente")=ob_rs("u_agente")
response.redirect(r&"zona-privada")
else
session.Abandon()
session("id_usuario")=""
msg="Usuario deshabilitado. Contacta con nosotros por favor."
end if
else
session.Abandon()
session("id_usuario")=""
msg="Usuario o contraseña incorrectos. Vuelve a intentarlo, por favor."
end if
ob_rs.close
end if%>
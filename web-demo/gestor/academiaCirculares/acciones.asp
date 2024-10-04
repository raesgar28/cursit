<!DOCTYPE html><!--[if IE 8]><html lang="es-es" class="ie8 no-js"><![endif]--><!--[if IE 9]><html lang="es-es" class="ie9 no-js"><![endif]--><!--[if !IE]><!--><html lang="es-es"><!--<![endif]--><head><meta charset="utf-8" /></head><body class="fuente2">
<%r=request("r")
rd=request("rd")
n=request("n")
ndos=request("ndos")
ntres=request("ntres")
ncuat=request("ncuat")
op=request("op")
cod=request("cod")
check=request("check")
accion=request("accion")
cod_cat=request("cod_cat")
check=check&", 0"  'EL CERO LO PONGO PARA QUE FUNCIONE EL SPLIT
pks = split(check,",")
id_usuario_ctrl=0%>
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../../conex/conex_back.asp"-->
<!--#include file="../../web/comun/limpia.asp"-->
<link href="../../web/lib/app/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="../../web/lib/app/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="../../web/lib/css/custom.css" rel="stylesheet" type="text/css" />
<link href="../../web/lib/css/reserva-steps.css" rel="stylesheet" type="text/css" />
<div class="centra_panel">
<div class="panel panel-default pagos_pasarela" style="width:100%;max-width:750px;margin:0 auto;margin-top:55px">
<div class="panel-heading">
<h3 class="panel-title" ><i class="fa fa-envelope" aria-hidden="true" style="margin-right:10px"></i>Resultado envío mails</h3></div>
<div class="panel-body">
<div class="nota_tpv">Resultado en el envío de mails</div>
<%num=0
For i=0 to ubound(pks)-1
if accion="del_gest" then  '////////////   ELIMINAR SELECCIONADOS
mySQL="DELETE FROM mailGrupo_tmp where id_mail_grupo_tmp =" & pks(i) & " "
set ob_rs=Ob_Connc.execute(mySQL)
'[REDIRECCIONAMOS]
Response.Redirect ("ren_mail.jpk2?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=del_gest&pos=del_gest&pos=grupo&cod="&cod&"&proc=del_gest&accion="&accion)
end if  '//////////// FIN  ELIMINAR SELECCIONADOS
if accion="del_comunicado" or accion="del" then '////////////////// ELIMINAR
if accion="del_comunicado" then
Sql_p= "SELECT id_mail_grupo, id_mail from mail where id_mail_grupo="&cod&""                             
else
Sql_p= "SELECT id_mail_grupo, id_mail from mail where id_mail_grupo="&pks(i)&""                             
end if
Set ob_rs_p = Server.CreateObject("ADODB.Recordset")
ob_rs_p.Open Sql_p, ob_connc,adOpenStatic, adCmdText
if not ob_rs_p.eof then
Sql= "SELECT nombre from mailArchivos where id_mail="&ob_rs_p("id_mail")&""                             
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connc,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
if  ob_rs("nombre") <> "" then
Set fso = CreateObject("Scripting.FileSystemObject")
if fso.FileExists (Server.MapPath("../../up_docs/circulares/" & ob_rs("nombre"))) then
Set f2 = fso.GetFile(Server.MapPath("../../up_docs/circulares/" & ob_rs("nombre")))
f2.Delete
end if
end if
ob_rs.movenext
loop
end if
ob_rs.close
mySQL="DELETE FROM mailArchivos where id_mail =" & ob_rs_p("id_mail") & " "
set ob_rs=Ob_Connc.execute(mySQL)
ob_rs_p.close
end if
if accion="del_comunicado" then
mySQL="DELETE FROM mail where id_mail_grupo =" & cod & " "
else
mySQL="DELETE FROM mail where id_mail_grupo =" & pks(i) & " "
end if
set ob_rs=Ob_Connc.execute(mySQL)
if accion="del_comunicado" then
mySQL="DELETE FROM mailGrupo where id_mail_grupo =" & cod & " "
else
mySQL="DELETE FROM mailGrupo where id_mail_grupo =" & pks(i) & " "
end if
set ob_rs=Ob_Connc.execute(mySQL)

if accion="del_comunicado" then
mySQL="DELETE FROM mailRel where id_mail_grupo =" & cod & " "
else
mySQL="DELETE FROM mailRel where id_mail_grupo =" & pks(i) & " "
end if
set ob_rs=Ob_Connc.execute(mySQL)
if accion="del_comunicado" then
mySQL="DELETE FROM mailGrupo_tmp where id_mail_grupo =" & cod & " "
else
mySQL="DELETE FROM mailGrupo_tmp where id_mail_grupo =" & pks(i) & " "
end if
set ob_rs=Ob_Connc.execute(mySQL)
end if                                      '////////////////// ELIMINAR 



if accion="env" or accion="env_mail" or accion="env_mail_lst"then

Sql4= "SELECT id_mail, asunto_mail, texto_mail, n_letter, prueba FROM mail WHERE id_mail_grupo="&cod&""
Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
Ob_RS4.Open Sql4, Ob_Connc,adOpenStatic, adCmdText
if not ob_rs4.eof then
id_mail=ob_rs4("id_mail")
asunto_mail=ob_rs4("asunto_mail")
texto_mail=ob_rs4("texto_mail")
prueba=ob_rs4("prueba")
n_letter=ob_rs4("n_letter")
end if
ob_rs4.close

if n_letter="si" then
Sql= "SELECT * FROM webs WHERE principal<>'si'"
else
Sql= "SELECT * FROM webs WHERE principal='si'"

end if
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


Sql3= "SELECT nombre, alt FROM rel, archivos WHERE id_web="&id_web&" and rel.id_archivo<>0 and rel.id_archivo=archivos.id_archivo"
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, Ob_Conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
nombre=ob_rs3("nombre")
nombre=url_c&nombre
alt=ob_rs3("alt")
end if
ob_rs3.close
if prueba<>"si" then
if accion="env_mail" or accion="env_mail_lst" then
Sql_p= "SELECT id_alumno from mailGrupo_tmp where id_mail_grupo="&cod&"" 
else
Sql_p= "SELECT id_alumno from mailGrupo_tmp where id_mail_grupo_tmp="&pks(i)&" and id_mail_grupo="&cod&"" 
end if
Set ob_rs_p = Server.CreateObject("ADODB.Recordset")
ob_rs_p.Open Sql_p, ob_connc,adOpenStatic, adCmdText
if not ob_rs_p.eof then
do while not ob_rs_p.eof
Set Mail = Server.CreateObject("Persits.MailSender")
id_alumno=ob_rs_p("id_alumno")

Sql= "SELECT nombre, apellidos, mail_contacto FROM academia_alumnos WHERE id_alumno="&id_alumno&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connc,adOpenStatic, adCmdText
if not ob_rs.eof then
a_email=ob_rs("mail_contacto")
a_nombre=ob_rs("nombre")
a_apellidos=ob_rs("apellidos")
else
falla_alumno_tmp="si"
end if
ob_rs.close


mail_1=a_email
Mail.CharSet = "iso-8859-1"
Mail.ContentTransferEncoding = "Quoted-Printable"
Mail.Host = f_smtp
Mail.Port = f_puerto
Mail.Username = f_usuario
Mail.Password = f_pass
Mail.From = f_email
Mail.FromName = "Schola - Cursos de Idiomas"
Mail.AddAddress mail_1

%>Mail: <%=mail_1%> <%if mail_1 ="" then%> 
<span style="color:#F00;font-weight:bold">ERROR</span>
<%else
num=num+1
end if%><%
Mail.AddAddress mail_1
%><br><br><%

'num=num+1
'if email<>"" then Mail.AddCC email  end if
if id_mail<>""then
Sql4= "SELECT nombre FROM mailArchivos WHERE id_mail="&id_mail&" "
Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
Ob_RS4.Open Sql4, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs4.eof then
strPath = Server.MapPath("..\..\up_docs\circulares")
do while not ob_rs4.eof
Mail.AddAttachment strPath & "\"& ob_rs4("nombre") & ""
ob_rs4.movenext
loop
end if
ob_rs4.close
end if
asunto = limpia_mail(asunto_mail)
Mail.Subject =  Mail.EncodeHeader(asunto, "utf-8")
texto=""
texto=texto& "<br><br><font size=""2"" face=""Arial, Helvetica, sans-serif"">"&texto_mail&"</font><br><br>"
Mail.Body = "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#CCCCCC""><tr><td width=""80%"" valign=""top"" bgcolor=""#FFFFFF""><img src="""&nombre&""" alt="""&alt&"""  width=""127"" height=""69"" hspace=""8"" vspace=""12"" /><br /></td><td width=""20%"" align=""right"" bgcolor=""#FFFFFF""><font size=""1.5"" face=""Arial, Helvetica, sans-serif"">"&direccion&"<br>"&cod_postal&" - "&ciudad&" <br>Tel. "&telefono&"<br>"&email&"&nbsp;&nbsp; //&nbsp; "& url &" </fo nt></td></tr></table><br><font size=""2"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"& texto &"</font><br><br><font size=""1"" face=""Arial, Helvetica, sans-serif"" color=""#999999"">"&f_texto_legal&"</font><br />"
Mail.IsHTML = True 
On Error Resume Next
Mail.Send



If Err <> 0 Then%>
Hubo error en el envío a <strong><%=a_nombre%>&nbsp;<%=a_apellidos%></strong><br> Razón:" <%= Err.Description %> "<br>Una o todas las cuentas mail asociadas al alumnno fallaron<br>
<%End If  
mail_1=""
mail_2=""
mail_3=""
mail_4=""
id_usuario_ctrl=id_usuario
ob_rs_p.movenext
loop
end if
'ob_rs.close
end if
end if
Next



if accion="env" or accion="env_mail" or accion="env_mail_lst" then
estado="Mail enviado "&date
mySQL3="UPDATE mail SET "
mySQL3=mySQL3 & "estado =  '"& estado &"'"
mySQL3=mySQL3 & " WHERE id_mail_grupo = " & cod & "" 
set ob_rs3=Ob_Connc.execute(mySQL3)
Set Mail2 = Server.CreateObject("Persits.MailSender")
Mail2.CharSet = "iso-8859-1"
Mail2.ContentTransferEncoding = "Quoted-Printable"
Mail2.Host = f_smtp
Mail2.Port = f_puerto
Mail2.Username = f_usuario
Mail2.Password = f_pass
Mail2.From = f_email
Mail2.FromName = "Schola - Academia de Idiomas"
mail_1=""
mail_2=""
mail_3=""
mail_4=""
Mail2.AddAddress f_email 
if id_mail<>""then
Sql4= "SELECT nombre FROM mailArchivos WHERE id_mail="&id_mail&" "
Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
Ob_RS4.Open Sql4, Ob_Connc,adOpenStatic, adCmdText
if not ob_rs4.eof then
strPath = Server.MapPath("..\..\up_docs\circulares")
do while not ob_rs4.eof
Mail2.AddAttachment strPath & "\"& ob_rs4("nombre") & ""
ob_rs4.movenext
loop
end if
ob_rs4.close
end if
asunto = "Comunicado enviado - " &limpia_mail(asunto_mail)
Mail2.Subject =  Mail2.EncodeHeader(asunto, "utf-8")
texto=""
texto=texto& "<font size=""2"" face=""Arial, Helvetica, sans-serif"">El siguiente comunicado ha sido enviado a "&num&" direcciones de email.</font><br><br><font size=""2"" face=""Arial, Helvetica, sans-serif"">"&texto_mail&"</font><br><br>"
Mail2.Body = "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#CCCCCC""><tr><td width=""80%"" valign=""top"" bgcolor=""#FFFFFF""><img src="""&nombre&""" alt="""&alt&"""  width=""127"" height=""69"" hspace=""8"" vspace=""12"" /><br /></td><td width=""20%"" align=""right"" bgcolor=""#FFFFFF""><font size=""1.5"" face=""Arial, Helvetica, sans-serif"">"&direccion&"<br>"&cod_postal&" - "&ciudad&" <br>Tel. "&telefono&"<br>"&email&"&nbsp;&nbsp; //&nbsp; "& url &" </font></td></tr></table><br><font size=""2"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"& texto &"</font><br><br><font size=""1"" face=""Arial, Helvetica, sans-serif"" color=""#999999"">"&f_texto_legal&"</font><br />"
Mail2.IsHTML = True 
'On Error Resume Next
Mail2.Send
%><br><br>Mail desde el que se envia: <%=f_email%><br>Mails enviados: <%=num%> <br><br>

<%'[REDIRECCIONAMOS]

if accion="env_mail_lst" or accion="env_mail" or accion="env" then
'if Err = 0 then
'Response.Redirect ("ren_mail.jpk2?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_env_mail&pos=del_gest&pos=grupo&cod="&cod&"&proc=env_mail_lst&accion=env_mail_lst")
'else
'%><br><a href="ren_mail.jpk2?r=<%=r%>&rd=<%=rd%>&n=<%=n%>&ndos=<%=ndos%>&ntres=<%=ntres%>&ncuat=<%=ncuat%>&ms=ok_env_mail&pos=del_gest&pos=grupo&cod=<%=cod%>&proc=env_mail_lst" class="btn-primary" style="padding:8px;margin-top:25px;margiin:0 auto"><i class="fa fa-reply" aria-hidden="true"></i> Volver al listado</a><br><br><%
'end if
else


if Err = 0 then
'Response.Redirect ("ren_mail.jpk2?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_env_mail&pos=del_gest&pos=grupo&cod="&cod&"&proc=env_mail_lst")
else
%><br><a href="ren_mail.jpk2?r=<%=r%>&rd=<%=rd%>&n=<%=n%>&ndos=<%=ndos%>&ntres=<%=ntres%>&ncuat=<%=ncuat%>&ms=ok_env_mail&pos=del_gest&pos=grupo&cod=<%=cod%>&proc=env_mail_lst" class="btn-primary" style="padding:8px;margin-top:25px;margiin:0 auto"><i class="fa fa-reply" aria-hidden="true"></i> Volver al listado</a><%
end if
end if
end if%>
</div>
</div>
</div>
</body>
<%if accion="del" or accion ="del_comunicado" then
Response.Redirect ("ren_mail.jpk2?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_del&pos=del_gest&pos=grupo&cod="&cod&"&accion="&accion)
end if
ob_connc.close%>
</body></html>
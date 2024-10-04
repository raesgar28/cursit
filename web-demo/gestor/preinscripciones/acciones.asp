<!DOCTYPE html><!--[if IE 9]> html lang="es" class="ie9"> <![endif]--><!--[if !IE]><!--><html lang="es-es"><!--<![endif]--><head><meta charset="utf-8" />
<!--#INCLUDE file="../lib/asp/cifra.asp"-->
<%r=request("r")
rd=request("rd")
n=request("n")
ndos=request("ndos")
ntres=request("ntres")
ncuat=request("ncuat")
op=request("op")
cod=request("check")
check=request("check")
accion=request("accion")
ver=request("ver")
ren_mail=request("ren_mail")
crm="si"
if r ="" then r = request_equerystring("r")
if rd ="" then rd = request_equerystring("rd")
if n ="" then n = request_equerystring("n")
if ndos ="" then ndos = request_equerystring("ndos")
if ntres ="" then ntres = request_equerystring("ntres")
if ncuat ="" then ncuat = request_equerystring("ncuat")
if op ="" then op = request_equerystring("op")
if cod ="" then cod = request_equerystring("check")
if check ="" then check = request_equerystring("check")
if accion ="" then accion = request_equerystring("accion")
if ver ="" then ver = request_equerystring("ver")
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&op="&op&"&check="&check&"&accion="&accion&"&ver="&ver))
check=check&", 0"  'EL CERO LO PONGO PARA QUE FUNCIONE EL SPLIT
pks = split(check,",")%>
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../lib/asp/comun.asp"-->
<!--#include file="../../conex/conex_back.asp"-->
<!--#include file="../../web/comun/limpia.asp"-->
<%For i=0 to ubound(pks)-1
if accion="del"then                            '////////////   SI ELEGIMOS ELIMINAR
Sql2= "SELECT id_programa, id_alumno FROM programas_tmp WHERE id_programa="&pks(i)&" "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then 
id_programa_t=ob_rs2("id_programa")
id_alumno=ob_rs2("id_alumno")
end if
ob_rs2.close
if id_programa_t<>""then
mySQL="DELETE FROM programasOp_tmp where id_programa =" & id_programa_t & ""
set ob_rs=Ob_Connb.execute(mySQL)
mySQL="DELETE FROM programas_tmp where id_programa =" & id_programa_t & ""
set ob_rs=Ob_Connb.execute(mySQL)
end if
if id_alumno<>""then
mySQL="DELETE FROM alumnos_tmp where id_alumno =" & id_alumno & ""
set ob_rs=Ob_Connb.execute(mySQL)
mySQL="DELETE FROM programas_tmp where id_alumno =" & id_alumno & ""
set ob_rs=Ob_Connb.execute(mySQL)
Sql2= "SELECT id_archivo FROM alumnos_archivos_tmp WHERE id_alumno="&id_alumno&" "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then 
do while not ob_rs2.eof
mySQL="DELETE FROM archivos_tmp where id_archivo =" & ob_rs2("id_archivo") & ""
set ob_rs=Ob_Connb.execute(mySQL)
ob_rs2.movenext
loop
end if
ob_rs2.close
end if
end if                                      '////////////   FIN SI ELEGIMOS ELIMINAR



if ren_mail<>"enviado" and accion="env_mail" then
id_programa=pks(i)
response.redirect("ren_mail.asp?accion=env_mail&id_programa="&id_programa&"&r="&r&"&rd="&rd)
end if


if accion="bloq"then                            '////////////   SI ELEGIMOS BLOQUEAR
mySQL3="UPDATE programas_tmp SET "
mySQL3=mySQL3 & "bloqueada =  'si' "
mySQL3=mySQL3 & " WHERE id_programa = " & pks(i) & "" 
set ob_rs=Ob_Connb.execute(mySQL3)
end if                                   '////////////   FIN SI ELEGIMOS BLOQUEAR
if accion="desbloq"then                            '////////////   SI ELEGIMOS NO DESBLOQUEAR
mySQL3="UPDATE programas_tmp SET "
mySQL3=mySQL3 & "bloqueada =  'no' "
mySQL3=mySQL3 & " WHERE id_programa = " & pks(i) & "" 
set ob_rs=Ob_Connb.execute(mySQL3)
id_programa=pks(i)
crm="si"
Sql= "SELECT id_item, nom_item, id_curso, id_alumno, pr_cancelacion_pr, id_usuario, mail_env, nom_item, id_curso, precioReserva,refPresupuesto, refPago, nom_item FROM programas_tmp WHERE id_programa="&id_programa&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
id_item=ob_rs("id_item")
id_alumno=ob_rs("id_alumno")
id_usuario=ob_rs("id_usuario")
mail_env=ob_rs("mail_env")
nom_item=ob_rs("nom_item")
id_curso=ob_rs("id_curso")
precioReserva=ob_rs("precioReserva")
refPresupuesto=ob_rs("refPresupuesto")
refPago=ob_rs("refPago")
pr_cancelacion_pr=ob_rs("pr_cancelacion_pr")
titulo_esp=ob_rs("nom_item")
end if
ob_rs.close
Sql= "SELECT a_email, a_p_email, a_m_email, a_nombre, a_apellidos FROM alumnos_tmp WHERE id_alumno="&id_alumno&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
a_email=ob_rs("a_email")
a_p_email=ob_rs("a_p_email")
a_m_email=ob_rs("a_m_email")
a_nombre=ob_rs("a_nombre")
a_apellidos=ob_rs("a_apellidos")
else
falla_alumno_tmp="si"
end if
ob_rs.close
Sql= "SELECT u_email FROM usuarios WHERE id_usuario="&id_usuario&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
u_email=ob_rs("u_email")
else
falla_usuario="si"
end if
ob_rs.close
mail_1=a_email
mail_2=a_p_email
mail_3=a_m_email
mail_4=u_email


if u_email=a_email then mail_1= u_email end if
if u_email=a_p_email then mail_1= u_email end if
if u_email=a_m_email then mail_1= u_email end if
if u_email=a_email then mail_2= u_email end if
if u_email=a_p_email then mail_2= u_email end if
if u_email=a_m_email then mail_2= u_email end if
if u_email=a_email then mail_3= u_email end if
if u_email=a_p_email then mail_3= u_email end if
if u_email=a_m_email then mail_3= u_email end if


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
Sql= "SELECT nombre, alt FROM rel, archivos WHERE id_web="&id_web&" and rel.id_archivo<>0 and rel.id_archivo=archivos.id_archivo"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Conn,adOpenStatic, adCmdText
if not ob_rs.eof then
nombre=ob_rs("nombre")
nombre=url_c&nombre
alt=ob_rs("alt")
end if
ob_rs.close%>
<!--#include file="../../web/pr_pdf_preins_mail.asp"-->
<%Set Mail = Server.CreateObject("Persits.MailSender")
Mail.CharSet = "iso-8859-1"
Mail.ContentTransferEncoding = "Quoted-Printable"
Mail.Host = f_smtp
Mail.Port = f_puerto
Mail.Username = f_usuario
Mail.Password = f_pass
Mail.From = f_email
Mail.FromName = "Cursit - Cursos de Idiomas"
if mail_1<>mail_4 and mail_1<>""  then Mail.AddAddress mail_1 end if
if mail_2<>mail_4 and mail_2<>"" then Mail.AddAddress mail_2 end if
if mail_3<>mail_4 and mail_3<>"" then Mail.AddAddress mail_3 end if
Mail.AddAddress mail_4
Mail.AddBCC f_email 
if email<>"" then Mail.AddCC email  end if
strPath = Server.MapPath("..\..\up_docs\temp")
Mail.AddAttachment strPath & "\"& archivo & ""
asunto = "Aviso plaza DESBLOQUEADA en curso de idiomas " '& deslimpia(titulo_esp)
Mail.Subject =  Mail.EncodeHeader(asunto, "Windows-1250")
texto="<br><br>"
texto=texto& "<font size=""20"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>Hola "&a_nombre&"!</i></font><br><br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>Tu plaza para el curso <strong>"&titulo_esp&"</strong> con "&nombre_empresa&"</i> ha sido DESBLOQUEADA debido al vencimiento del abono de la reserva.</font><br><br><hr color=""#999999"" align=""center"" width=""100%""/><br><br>Desde este momento tu plaza queda libre, pudiendo ser utilizada por otro alumno."
texto=texto &"<br><br><br><p align=""center"">Te recordamos que los datos la cuenta bancaria para hacer efectiva la transferencia son:<br><br><strong>"&datos_transferencia&"</p></strong>"
texto=texto &"<br><br>Ante cualquier duda o problema ponte en contacto con nosotros a trav&eacute;s del mail <strong>"&email&"</strong> o bien del tel&eacute;fono "&telefono&".<br><br>En el documento adjunto encontrar&aacute;s la referencia de la preisncripci&oacute;n desbloqueada.<br><br><br><hr color=""#32C5D2"" align=""center"" width=""20%""/>"
texto=texto &"<br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><p align=""center""><i>Muchas gracias por confiar en "&nombre_empresa&" y muy feliz viaje!!!</i></p></font>"
texto=texto &"<br><br>"
Mail.Body = "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#CCCCCC""><tr><td width=""80%"" valign=""top"" bgcolor=""#FFFFFF""><img src="""&nombre&""" alt="""&alt&"""  width=""127"" height=""69"" hspace=""8"" vspace=""12"" /><br /></td><td width=""20%"" align=""right"" bgcolor=""#FFFFFF""><font size=""1.5"" face=""Arial, Helvetica, sans-serif"">"&direccion&"<br>"&cod_postal&" - "&ciudad&" <br>Tel. "&telefono&"<br>"&email&"&nbsp;&nbsp; //&nbsp; "& url &" </fo nt></td></tr></table><br><font size=""2"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"& texto &"</font><br><br><font size=""1"" face=""Arial, Helvetica, sans-serif"" color=""#999999"">"&f_texto_legal&"</font><br />"
Mail.IsHTML = True 
On Error Resume Next
Mail.Send
If Err <> 0 Then
env_mail_res="ko"%>k<%
end If 
Set fso = CreateObject("Scripting.FileSystemObject")
if fso.FileExists (Server.MapPath("../../up_docs/temp/" & archivo)) then
Set f2 = fso.GetFile(Server.MapPath("../../up_docs/temp/" & archivo))
f2.Delete
end if
end if                                   '////////////   FIN SI ELEGIMOS NO BLOQUEAR





Next
ob_conn.close
'[REDIRECCIONAMOS]
if accion="del"then
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_del" 
end if
if accion="env_mail"then
if env_mail_res="ko" then
Encryption_String = "?r="&r&"&rd=../../&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko_env_mail&ver="&ver
else
Encryption_String = "?r="&r&"&rd=../../&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_env_mail&ver="&ver
end if
end if
if accion="bloq"then
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_bloq&ver="&ver 
end if
if accion="desbloq"then 
Encryption_String = "?r="&r&"&rd=../"&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_desbloq&ver="&ver
end if
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len(Encryption_String)) 
redirecciona = "enc=" & EnCrypt(Encryption_String) 
Response.Redirect "listado.jpk2?" & redirecciona%>
</body></html>
<%r=request.QueryString("r")
rd=request.QueryString("rd")
cod=request.QueryString("id_programa")
accion=request.QueryString("accion")
mail_aviso_txt=request.QueryString("mail_aviso_txt")
mail_aviso_final_txt=request.QueryString("mail_aviso_final_txt")
mail_presup_txt=request.QueryString("mail_presup_txt")
accion="env_mail"
tipo="pre_medida"
%>
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../../conex/conex_back.asp"-->
<!--#include file="../../web/comun/limpia.asp"-->
<%if accion="env_mail"then                             '////////////   SI ELEGIMOS REENVIAR MAIL
id_programa=cod
crm="si"
Sql= "SELECT id_item, nom_item, id_curso, id_alumno, pr_cancelacion_pr, id_usuario, mail_env, nom_item, id_curso, precioReserva,refPresupuesto, refPago, nom_item,metodoPago, estadoPago FROM programas_tmp WHERE id_programa="&cod&""
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
precioReserva_txt=ob_rs("precioReserva")
refPresupuesto=ob_rs("refPresupuesto")
refPago=ob_rs("refPago")
pr_cancelacion_pr=ob_rs("pr_cancelacion_pr")
titulo_esp=ob_rs("nom_item")
metodoPago_m=ob_rs("metodoPago")
valor_total=pr_cancelacion_pr + precioReserva
estadoPago=ob_rs("estadoPago")
end if
ob_rs.close

crm="si"
Sql= "SELECT id_item, nom_item, id_curso, id_alumno, pr_cancelacion_pr, id_usuario, mail_env, nom_item, id_curso, precioReserva,refPresupuesto, refPago, nom_item, hab_pago, hab_descarga FROM programas_tmp WHERE id_programa="&cod&""
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
precioReserva_txt=ob_rs("precioReserva")
refPresupuesto=ob_rs("refPresupuesto")
refPago=ob_rs("refPago")
pr_cancelacion_pr=ob_rs("pr_cancelacion_pr")
titulo_esp=ob_rs("nom_item")
hab_pago=ob_rs("hab_pago")
hab_descarga=ob_rs("hab_descarga")
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

Sql= "SELECT datos_transferencia FROM metodosPago"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Conn,adOpenStatic, adCmdText
if not ob_rs.eof then
datos_transferencia=ob_rs("datos_transferencia")
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
'Mail.AddBCC f_email 
if email<>"" then Mail.AddCC email  end if
if mail_presup_txt="si" then
strPath = Server.MapPath("..\..\up_docs\temp")
Mail.AddAttachment strPath & "\"& archivo & ""
end if
if mail_aviso_txt="si" then
asunto = "Presupuesto Modificado en curso de idiomas"
end if
if mail_aviso_final_txt="si" then
asunto = "Presupuesto Finalizado en curso de idiomas"
end if

Mail.Subject =  Mail.EncodeHeader(asunto, "Windows-1250")
texto="<br><br>"
if mail_aviso_txt="si" then
texto=texto& "<font size=""20"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>Hola "&a_nombre&"!</i></font><br><br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>En referencia a tu curso de idiomas <strong>"&titulo_esp&"</strong> con "&nombre_empresa&",</i> te informamos</font><br><br><hr color=""#999999"" align=""center"" width=""100%""/><br>El presupuesto ha sido <strong>MODIFICADO, sin estar finalizado</strong>."

if hab_descarga="si" then
texto=texto& "<br><br>Puedes verlo y descargarlo desde tu zona de usuario."
end if'HAB DESCARGA

end if'mail_aviso_txt

if mail_aviso_final_txt="si" then
texto=texto& "<font size=""20"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>Hola "&a_nombre&"!</i></font><br><br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>En referencia a tu curso de idiomas <strong>"&titulo_esp&"</strong> con "&nombre_empresa&"</i>, te informamos: </font><br><br><hr color=""#999999"" align=""center"" width=""100%""/><br>"
texto=texto& " <br>El presupuesto ya est&aacute; FINALIZADO"

if hab_pago="si" then
texto=texto& " , pudiendo desde este momento, y en un plazo de 72 horas, abonar el precio de la reserva de <strong>"&FormatNumber(ccur(precioReserva_txt),2)&" &euro;</strong>"
if pr_cancelacion_pr<>"No incluido*" then
texto=texto& " y del seguro de cancelaci&oacute;n con un importe de <strong>"&pr_cancelacion_pr&" &euro;.</strong>"
end if'PR CANCELA
end if'HAB PAGO
texto=texto& "."


if hab_pago="si" then
texto=texto &"<br><br><br><p align=""center"">Te recordamos que los datos la cuenta bancaria para hacer efectiva la transferencia son:<br><br><strong>"&datos_transferencia&"<br><br>Recuerda que desde tu zona usuario tendr&aacute;s otras formas de pago. <br><br>Para finalizar el proceso de inscripci&oacute;n deber&aacute;s FORMALIZAR la reserva y continuar el proceso que se indica.</p></strong>"
end if'HAB PAGO


end if 'mail_aviso_final_txt

texto=texto &"<br><br>Ante cualquier duda o problema ponte en contacto con nosotros a trav&eacute;s del mail <strong>"&email&"</strong> o bien del tel&eacute;fono "&telefono&".<br><br><hr color=""#32C5D2"" align=""center"" width=""20%""/>"
texto=texto &"<br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><p align=""center""><i>Muchas gracias por confiar en "&nombre_empresa&" y muy feliz viaje!!!</i></p></font>"
texto=texto &"<br><br>"
Mail.Body = "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#CCCCCC""><tr><td width=""80%"" valign=""top"" bgcolor=""#FFFFFF""><img src="""&nombre&""" alt="""&alt&"""  width=""127"" height=""69"" hspace=""8"" vspace=""12"" /><br /></td><td width=""20%"" align=""right"" bgcolor=""#FFFFFF""><font size=""1.5"" face=""Arial, Helvetica, sans-serif"">"&direccion&"<br>"&cod_postal&" - "&ciudad&" <br>Tel. "&telefono&"<br>"&email&"&nbsp;&nbsp; //&nbsp; "& url &" </fo nt></td></tr></table><br><font size=""2"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"& texto &"</font><br><br><font size=""1"" face=""Arial, Helvetica, sans-serif"" color=""#999999"">"&f_texto_legal&"</font><br />"

Mail.IsHTML = True 
'On Error Resume Next
Mail.Send
If Err <> 0 Then
env_mail_res="ko"%>k<%
end If 
Set fso = CreateObject("Scripting.FileSystemObject")
if fso.FileExists (Server.MapPath("../../up_docs/temp/" & archivo)) then
Set f2 = fso.GetFile(Server.MapPath("../../up_docs/temp/" & archivo))
f2.Delete
end if
end if                                   '////////////   FIN SI


response.redirect("guardar_presupuesto.asp?accion=env_mail&cod="&id_programa&"&r="&r&"&rd=../../&ren_mail=enviado")%>
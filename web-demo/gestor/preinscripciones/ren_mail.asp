<%r=request.QueryString("r")
rd=request.QueryString("rd")
id_programa=request.QueryString("id_programa")
accion=request.QueryString("accion")%>
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../../conex/conex_back.asp"-->
<!--#include file="../../web/comun/limpia.asp"-->
<%if accion="env_mail"then                             '////////////   SI ELEGIMOS REENVIAR MAIL
id_programa=id_programa
crm="si"
Sql= "SELECT id_item, nom_item, id_curso, id_alumno, pr_cancelacion_pr, id_usuario, mail_env, nom_item, id_curso, precioReserva,refPresupuesto, refPago, nom_item,metodoPago, estadoPago FROM programas_tmp WHERE id_programa="&id_programa&""
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
metodoPago_m=ob_rs("metodoPago")
valor_total=pr_cancelacion_pr + precioReserva
estadoPago=ob_rs("estadoPago")
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
asunto = limpia_mail(a_nombre) &" "& limpia_mail(a_apellidos) & " - Preinscrito en curso de idiomas - Recordatorio "& limpia_mail(titulo_esp)
Mail.Subject =  Mail.EncodeHeader(asunto, "utf-8")
texto="<br><br>"
texto=texto& "<font size=""20"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>Hola "&a_nombre&"!</i></font><br><br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>Muchas gracias por realizar la preinscripci&oacute;n para el curso <strong>"&titulo_esp&"</strong> con "&nombre_empresa&".</i></font><br><br><hr color=""#999999"" align=""center"" width=""100%""/><br><br>"
if estadoPago="Aceptada"then
texto= texto& " Desde este momento tu plaza queda reservada y confirmada. Hemos recibido el pago de "&FormatNumber(ccur(valor_total),2)&" "&mon_pdf&"."
else'estadoPago
texto= texto& " Desde este momento tu plaza queda reservada, pero recuerda que tienes un <u>plazo de 72 horas</u> para hacer"
if metodoPago_m="pag_transferencia" then
texto= texto& " efectiva la transferencia por valor de <strong>"&FormatNumber(ccur(valor_total),2)&" "&mon_pdf&"</strong> en concepto de <strong>Reserva</strong>"
end if
if metodoPago_m="pag_oficina" then
texto= texto& " efectivo el abono por valor de "&FormatNumber(ccur(valor_total),2)&" euros en concepto de <strong>Reserva</strong> en cualquiera de nuestras oficinas o delegaciones"
end if
if metodoPago_m<>"pag_transferencia" and metodoPago_m<>"pag_oficina" then
texto= texto& " efectivo el abono por valor de "&FormatNumber(ccur(valor_total),2)&" en concepto de <strong>Reserva</strong>"
end if
if pr_cancelacion_pr<>"0" and pr_cancelacion_pr<>"No incluido*" then
texto=texto &" y <strong>Seguro de Cancelaci&oacute;n</strong>"
end if
texto=texto &" antes de que &eacute;sta quede libre."
if metodoPago_m="pag_transferencia" then
texto=texto &"<br><br><br><p align=""center"">Te recordamos que los datos la cuenta bancaria para hacer efectiva la transferencia son:<br><br><strong>"&datos_transferencia&"</p></strong>"
end if
end if'estadoPago
texto=texto &"<br><br>Es necesario tambi&eacute;n que nos remitas a la mayor brevedad posible fotocopia escaneada del <strong>NIF</strong> y, para cursos fuera de la UE, <strong>Pasaporte</strong> del alumno inscrito en el curso al mail <strong>"&email&"</strong>."
texto=texto &"<br><br>Puedes realizar estas gestiones y muchas otras desde el &aacute;rea de usuario, con el mail y la contrase&ntilde;a introducidos en el registro."
texto=texto &"<br><br>Ante cualquier duda o problema ponte en contacto con nosotros a trav&eacute;s del mail <strong>"&email&"</strong> o bien del tel&eacute;fono "&telefono&".<br><br>En el documento adjunto encontrar&aacute;s la referencia de la preisncripci&oacute;n.<br><br><br><hr color=""#32C5D2"" align=""center"" width=""20%""/>"
texto=texto &"<br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><p align=""center""><i>Muchas gracias por confiar en "&nombre_empresa&" y muy feliz viaje!!!</i></p></font>"
texto=texto &"<br><br>"
Mail.Body = "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#CCCCCC""><tr><td width=""80%"" valign=""top"" bgcolor=""#FFFFFF""><img src="""&nombre&""" alt="""&alt&"""  width=""127"" height=""69"" hspace=""8"" vspace=""12"" /><br /></td><td width=""20%"" align=""right"" bgcolor=""#FFFFFF""><font size=""1.5"" face=""Arial, Helvetica, sans-serif"">"&direccion&"<br>"&cod_postal&" - "&ciudad&" <br>Tel. "&telefono&"<br>"&email&"&nbsp;&nbsp; //&nbsp; "& url &" </fo nt></td></tr></table><br><font size=""2"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"& texto &"</font><br><br><font size=""1"" face=""Arial, Helvetica, sans-serif"" color=""#999999"">"&f_texto_legal&"</font><br />"
Mail.IsHTML = True 
On Error Resume Next
Mail.Send
If Err <> 0 Then
env_mail_res="ko"
end If 
Set fso = CreateObject("Scripting.FileSystemObject")
if fso.FileExists (Server.MapPath("../../up_docs/temp/" & archivo)) then
Set f2 = fso.GetFile(Server.MapPath("../../up_docs/temp/" & archivo))
f2.Delete
end if
end if 'if accion="env_mail"then
response.redirect("acciones.asp?accion=env_mail&id_programa="&id_programa&"&r="&r&"&rd=../../&ren_mail=enviado")%>
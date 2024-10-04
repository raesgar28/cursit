<!DOCTYPE html>
<!--[if IE 9]> html lang="es" class="ie9"> <![endif]--><!--[if !IE]><!--><html lang="es-es"><!--<![endif]-->
<head>
<meta charset="utf-8" />
<body>
<%rd="../"%>
<!--#include file="../conex/conex.asp"-->
<!--#include file="../conex/conex_back.asp"-->
<%refPago=request("cm") 
'estadoPago=request("st")   Pending, Completed, Denied
refPagoPay=Request("txn_id")
metodoPago="Paypal"
if refPago="" then refPago=request("custom") end if
estadoPago=request("payment_status") 'Pending, Completed, Denied
Select case estadoPago
case "Pending"
estadoPago="Denegada"
case "Completed"
estadoPago="Aceptada"
pagado="si"
case "Denied"
estadoPago="Denegada"
case else
estadoPago="Denegada"
end select

'estadoPago=request("payment_status")
'pagado="si"

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
nombre=ob_rs("nombre")
nombre=url_c&nombre
alt=ob_rs("alt")
end if
ob_rs.close
end if
mySQL="UPDATE programasAnticipos SET "
mySQL=mySQL & "estadoPago = '"&estadoPago&"',"
mySQL=mySQL & "refPagoPay = '"&refPagoPay&"',"
mySQL=mySQL & "pagado = '"&pagado&"'"
mySQL=mySQL & " WHERE refPago = '" & refPago & "'" 
set ob_rs=Ob_Connb.execute(mySQL)
estadoPago="Aceptada"
if estadoPago="Aceptada" then
Sql= "SELECT * FROM programasAnticipos WHERE refPago='"&refPago&"'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
id_programa=ob_rs("id_programa")
precio=ob_rs("precio")
end if
ob_rs.close
if id_programa<>"" then
Sql= "SELECT id_item, nom_item, id_curso, id_alumno, pr_cancelacion_pr, id_usuario, mail_env FROM programas WHERE id_programa="&id_programa&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
id_item=ob_rs("id_item")
id_alumno=ob_rs("id_alumno")
id_usuario=ob_rs("id_usuario")
mail_env=ob_rs("mail_env")
end if
ob_rs.close
Sql= "SELECT falta_pagar, id_alumno, id_usuario FROM programas WHERE id_programa="&id_programa&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
'precio=FormatNumber(ccur(precio/10),2)
falta_pagar=ob_rs("falta_pagar")-precio
id_alumno=ob_rs("id_alumno")
id_usuario=ob_rs("id_usuario")
end if
ob_rs.close
mySQL="UPDATE programas SET "
mySQL=mySQL & "falta_pagar = '"&falta_pagar&"'"
mySQL=mySQL & " WHERE id_programa = " & id_programa & "" 
set ob_rs=Ob_Connb.execute(mySQL)
end if
if id_alumno<>"" then
Sql= "SELECT a_email, a_p_email, a_m_email, a_nombre, a_apellidos FROM alumnos WHERE id_alumno="&id_alumno&""
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
else
falla_alumno="si"
end if
if id_usuario<>"" then
Sql= "SELECT u_email FROM usuarios WHERE id_usuario="&id_usuario&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
u_email=ob_rs("u_email")
else
falla_usuario="si"
end if
ob_rs.close
else
falla_usuario="si"
end if
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
valor_total= pr_reserva+ pr_cancelacion_pr
refPresupuesto=id_programa
if len(refPresupuesto) = 6 then ceros = "0"
if len(refPresupuesto) = 5 then ceros = "00"
if len(refPresupuesto) = 4 then ceros = "000"
if len(refPresupuesto) = 3 then ceros = "0000"
if len(refPresupuesto) = 2 then ceros = "00000"
if len(refPresupuesto) = 1 then ceros = "000000"
refPresupuesto = "P" &ceros & refPresupuesto &"-" &year(date)%>
<!--#include file="comun/fluctuaciones.asp"-->
<!--#include file="comun/moneda.asp"-->
<!--#include file="comun/limpia.asp"-->
<%if mail_env="no" or mail_env="" or ISNULL(mail_env) then%>
<!--#include file="pr_pdf_preins_mail.asp"-->
<%Set Mail = Server.CreateObject("Persits.MailSender")
Mail.CharSet = "iso-8859-1"
Mail.ContentTransferEncoding = "Quoted-Printable"
Mail.Host = f_smtp
if IsNumeric(f_puerto) then f_puerto=f_puerto else f_puerto="587" end if
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
'strPath = Server.MapPath(rd&"up_docs\temp")
'Mail.AddAttachment strPath & "\"& archivo & ""
asunto = limpia_mail(a_nombre) &" "& limpia_mail(a_apellidos) & " - Pago anticipo en Curso de Idiomas " & limpia_mail(titulo_esp)
Mail.Subject =  Mail.EncodeHeader(asunto, "utf-8")
texto="<br><br>"
texto=texto& "<font size=""23"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>Hola "&a_nombre&"!</i></font><br><br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>Muchas gracias por realizar el pago del anticipo de <striong>"&precio&" euros</strong> para el curso <strong>"&titulo_esp&"</strong> con "&nombre_empresa&".</i></font><br><br><hr color=""#999999"" align=""center"" width=""100%""/><br><br>Desde este momento tu plaza queda reservada."
texto=texto &""
texto=texto &"<br><br>Ante cualquier duda o problema ponte en contacto con nosotros a través del mail <strong>"&email&"</strong> o bien del teléfono "&telefono&".<br><br><hr color=""#32C5D2"" align=""center"" width=""20%""/>"
texto=texto &"<br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><p align=""center""><i>Muchas gracias por confiar en "&nombre_empresa&" y muy feliz viaje!!!</i></p></font>"
texto=texto &"<br><br>"
Mail.Body = "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#CCCCCC""><tr><td width=""80%"" valign=""top"" bgcolor=""#FFFFFF""><img src="""&nombre&""" alt="""&alt&"""  width=""127"" height=""69"" hspace=""8"" vspace=""12"" /><br /></td><td width=""20%"" align=""right"" bgcolor=""#FFFFFF""><font size=""1.5"" face=""Arial, Helvetica, sans-serif"">C/Bordellet, 8 - Bajo<br>"&cod_postal&" - "&ciudad&" - "&provincia&" <br>Tel. "&telefono&"<br>"&email&"&nbsp;&nbsp; //&nbsp; "& url &" </fo nt></td></tr></table><br><font size=""2"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"& texto &"</font><br><br><font size=""1"" face=""Arial, Helvetica, sans-serif"" color=""#999999"">"&f_texto_legal&"</font><br />"
Mail.IsHTML = True 
On Error Resume Next
Mail.Send
'Set fso = CreateObject("Scripting.FileSystemObject")
'if fso.FileExists (Server.MapPath("../up_docs/temp/" & archivo)) then
'Set f2 = fso.GetFile(Server.MapPath("../up_docs/temp/" & archivo))
'f2.Delete
'end if
mySQL="UPDATE programasAnticipos SET "
mySQL=mySQL & "mail_env = 'si'"
mySQL=mySQL & " WHERE refPago = '" & refPago & "'" 
set ob_rs=Ob_Connb.execute(mySQL)
end if 'mail_env<>"si" then
end if 'estadoPago="Aceptada"%>
</body>
</head>
</html>
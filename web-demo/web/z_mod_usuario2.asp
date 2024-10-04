<meta charset="utf-8" />
<%rd="../"%>
<!--#include file="../conex/conex.asp"-->
<!--#include file="../conex/conex_back.asp"-->
<!--#include file="comun/pass_sha256.asp"-->
<!--#include file="comun/limpia.asp"-->
<%function capit(thetext)
outtext=""
intext=(lcase(thetext))
do while instr(intext," ")>0
chunk = left(intext, instr(intext," "))
outtext=outtext & " " & left(ucase(chunk),1) & right(chunk,len(chunk)-1)
intext= right(intext,len(intext)-instr(intext," "))
loop
outtext=outtext & " " & left(ucase(intext),1) & right(intext,len(intext)-1)
capit=outtext
end function
u_nombre=trim(safeSTR(request("u_nombre")))
u_apellidos=trim(safeSTR(request("u_apellidos")))
u_email=trim(request("u_email"))
u_pass=request("u_pass")
if u_pass<>""then u_pass=sha256(request("u_pass")) end if
u_telefono=trim(request("u_telefono"))
u_movil=trim(request("u_movil"))
u_direccion=trim(safeSTR(request("u_direccion")))
u_ciudad=trim(safeSTR(request("u_ciudad")))
u_c_postal=request("u_c_postal")
u_provincia=request("u_provincia")
u_pais=request("u_pais")
u_agente=request("u_agente")
u_nif=trim(request("u_nif"))
u_empresa=trim(safeSTR(request("u_empresa")))
u_mail_empresa=trim(safeSTR(request("u_mail_empresa")))
u_nif=trim(safeSTR(request("u_nif")))
u_cif=trim(safeSTR(request("u_cif")))
n_letter=request("n_letter")
fecha_mod=now   
id_usuario= session("id_usuario")
if u_nombre<>"" then u_nombre=trim(capit(u_nombre)) end if
if u_apellidos<>"" then u_apellidos=trim(capit(u_apellidos)) end if
if u_nombre<>"" then u_nombre=replace(u_nombre,"  "," ") end if
if u_apellidos<>"" then u_apellidos=replace(u_apellidos,"  "," ") end if
if u_nombre<>"" then u_nombre=replace(u_nombre,"   "," ") end if
if u_apellidos<>"" then u_apellidos=replace(u_apellidos,"   "," ") end if
u_email=lcase(u_email)
u_nif=ucase(u_nif)
'1 COMPROBAMOS QUE USU NO DENTRO
Sql= "Select u_email FROM usuarios WHERE trim(u_email) ='" & u_email & "'  AND id_usuario<>"&id_usuario&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
ch_email="ko"
response.redirect(r&"modificar-datos-mail-ko")
end if
ob_rs.close
Sql= "Select u_nif FROM usuarios WHERE trim(u_nif)  ='" & u_nif & "'  AND id_usuario<>"&id_usuario&" "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
ch_nif="ko"
response.redirect(r&"modificar-datos-nif-ko")
end if
ob_rs.close
if ch_email<>"ko" and ch_nif<>"ko" then




Sql= "SELECT rd_mailchimp_api, rd_mailchimp_id FROM webs WHERE principal='si'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Conn,adOpenStatic, adCmdText
if not ob_rs.eof then
rd_mailchimp_api=ob_rs("rd_mailchimp_api")
rd_mailchimp_id=ob_rs("rd_mailchimp_id")
end if
ob_rs.close


if n_letter="si" then
Dim IP
IP = Request.ServerVariables("HTTP_X_FORWARDED_FOR") ' se chequea si hay un proxy
If IP ="" Then IP = Request.ServerVariables("REMOTE_ADDR") ' si no hay proxy se toma la IP original

id_lista="65f9c0eb1e"
api_key="88a9ce444eb5c72ce87ab2b65740bf4d-us10"%>

<iframe src="web/lib/mailchimp/mcapi_listSubscribe.php?email=<%=safeSTR(u_email)%>&id_lista=<%=rd_mailchimp_id%>&api_key=<%=rd_mailchimp_api%>&nombre=<%=safeSTR(u_nombre)%>&apellidos=<%=safeSTR(u_apellidos)%>" style="visibility:hidden" width="1" height="1"></iframe> 

<%else

id_lista="65f9c0eb1e"
api_key="88a9ce444eb5c72ce87ab2b65740bf4d-us10"%>

<iframe src="web/lib/mailchimp/mcapi_listUnsubscribe.php?email=<%=safeSTR(u_email)%>&id_lista=<%=rd_mailchimp_id%>&api_key=<%=rd_mailchimp_api%>&nombre=<%=safeSTR(u_nombre)%>&apellidos=<%=safeSTR(u_apellidos)%>" style="visibility:hidden" width="1" height="1"></iframe> 


<%end if


mySQL="UPDATE usuarios SET "
mySQL=mySQL & "u_nombre = '" & u_nombre & "',"
mySQL=mySQL & "u_apellidos = '" & u_apellidos & "',"
mySQL=mySQL & "u_email = '" & u_email & "',"
mySQL=mySQL & "u_telefono = '" & u_telefono & "',"
mySQL=mySQL & "u_movil = '" & u_movil & "',"
mySQL=mySQL & "u_nif = '" & u_nif & "',"
mySQL=mySQL & "u_direccion = '" & u_direccion & "',"
mySQL=mySQL & "u_ciudad = '" & u_ciudad & "',"
mySQL=mySQL & "u_provincia = '" & u_provincia & "',"
mySQL=mySQL & "u_pais = '" & u_pais & "',"
mySQL=mySQL & "u_c_postal = '" & u_c_postal & "',"
mySQL=mySQL & "u_empresa = '" & u_empresa & "',"
mySQL=mySQL & "u_mail_empresa = '" & u_mail_empresa & "',"
mySQL=mySQL & "u_cif = '" & u_cif & "',"
mySQL=mySQL & "n_letter = '" & n_letter & "',"
if u_pass<>""then 
mySQL=mySQL & "u_pass = '" & u_pass & "',"
end if
mySQL=mySQL & "fecha_mod = '" & fecha_mod & "'"
mySQL=mySQL & " WHERE id_usuario = " & id_usuario & "" 
set ob_rs=Ob_Connb.execute(mySQL)

' ENVIAMOS MAIL SELECTIVO
cambio="Los datos de tu usuario han sido modificados."
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
end if
ob_rs.close
Mail.AddAddress u_email
asunto = limpia_mail(u_nombre) &" "& limpia_mail(u_apellidos) & " - Datos modificados "
Mail.Subject =  Mail.EncodeHeader(asunto, "utf-8")
texto="<br><br>"
texto=texto& "<font size=""20"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>Hola "&u_nombre&"!</i></font><br><br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"&cambio&"</font><br><br><hr color=""#999999"" align=""center"" width=""100%""/>"
texto=texto &"<br><br>Te recordamos que puedes realizar varias gestiones desde el &aacute;rea de usuario, con el mail y la contrase&ntilde;a introducidos en el registro."
texto=texto &"<br><br>Ante cualquier duda o problema ponte en contacto con nosotros a trav&eacute;s del mail <strong>"&email&"</strong> o bien del tel&eacute;fono "&telefono&".<br><br><hr color=""#32C5D2"" align=""center"" width=""20%""/>"
texto=texto &"<br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><p align=""center""><i>Muchas gracias por confiar en "&nombre_empresa&" y muy feliz viaje!!!</i></p></font>"
texto=texto &"<br><br>"
Mail.Body = "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#CCCCCC""><tr><td width=""80%"" valign=""top"" bgcolor=""#FFFFFF""><img src="""&nombre_img&""" alt="""&alt&"""  width=""127"" height=""69"" hspace=""8"" vspace=""12"" /><br /></td><td width=""20%"" align=""right"" bgcolor=""#FFFFFF""><font size=""1.5"" face=""Arial, Helvetica, sans-serif"">"&direccion&"<br>"&cod_postal&" - "&ciudad&" <br>Tel. "&telefono&"<br>"&email&"&nbsp;&nbsp; //&nbsp; "& url &" </fo nt></td></tr></table><br><font size=""2"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"& texto &"</font><br><br><font size=""1"" face=""Arial, Helvetica, sans-serif"" color=""#999999"">"&f_texto_legal&"</font><br />"
Mail.IsHTML = True 
On Error Resume Next

Mail.Send'If Err <> 0 Then env_mail_res_alu="ko"end If 
response.redirect(r&"modificar-datos-ok")
end if%>
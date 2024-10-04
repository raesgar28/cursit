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
id_item=request("id_item")
id_itemSub=request("id_itemSub")
semanas_p=request("semanas_p")
u_nombre=trim(safeSTR(request("u_nombre")))
u_apellidos=trim(safeSTR(request("u_apellidos")))
u_email=trim(request("u_email"))
u_pass=sha256(request("u_pass"))
u_telefono=trim(request("u_telefono"))
u_movil=trim(request("u_movil"))
u_direccion=trim(safeSTR(request("u_direccion")))
u_ciudad=trim(safeSTR(request("u_ciudad")))
u_c_postal=request("u_c_postal")
u_provincia=request("u_provincia")
u_pais=request("u_pais")
u_agente=request("u_agente")
n_letter=request("n_letter")
u_nif=trim(request("u_nif"))
if u_nombre<>"" then u_nombre=trim(capit(u_nombre)) end if
if u_apellidos<>"" then u_apellidos=trim(capit(u_apellidos)) end if
if u_nombre<>"" then u_nombre=replace(u_nombre,"  "," ") end if
if u_apellidos<>"" then u_apellidos=replace(u_apellidos,"  "," ") end if
u_email=lcase(u_email)
u_nif=ucase(u_nif)
fecha_in=date
habilitado="si"
form_op=request("form_op")
'1 COMPROBAMOS QUE MAIL NO DENTRO
Sql= "Select u_nombre, u_apellidos FROM usuarios WHERE trim(lcase(StrConv(u_nombre, 2, 1042)))  ='" & deslimpia(u_nombre) & "' AND trim(lcase(StrConv(u_apellidos, 2, 1042)))  ='" & deslimpia(u_apellidos) & "' "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
ch_nombre="ko"
end if
ob_rs.close
Sql= "Select u_email FROM usuarios WHERE trim(u_email) ='" & u_email & "' "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
ch_email="ko"
end if
ob_rs.close

Sql= "Select u_nif FROM usuarios WHERE trim(u_nif)  ='" & u_nif & "' "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
ch_nif="ko"
end if
ob_rs.close

if ch_nif="ko" then
Sql= "Select nifClave FROM datComunes WHERE trim(nifClave)  ='" & u_nif & "' "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
ch_nif="ok"
else
ch_nif="ko"
end if
ob_rs.close
end if

if ch_email <>"ko" and ch_nif<>"ko" then 'METEMOS DATOS  


if n_letter="si" then

Sql= "SELECT rd_mailchimp_api, rd_mailchimp_id FROM webs WHERE principal='si'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Conn,adOpenStatic, adCmdText
if not ob_rs.eof then
rd_mailchimp_api=ob_rs("rd_mailchimp_api")
rd_mailchimp_id=ob_rs("rd_mailchimp_id")
end if
ob_rs.close


Dim IP
IP = Request.ServerVariables("HTTP_X_FORWARDED_FOR") ' se chequea si hay un proxy
If IP ="" Then IP = Request.ServerVariables("REMOTE_ADDR") ' si no hay proxy se toma la IP original%>

<iframe src="web/lib/mailchimp/mcapi_listSubscribe.php?email=<%=safeSTR(u_email)%>&id_lista=<%=rd_mailchimp_id%>&api_key=<%=rd_mailchimp_api%>&nombre=<%=safeSTR(u_nombre)%>&apellidos=<%=safeSTR(u_apellidos)%>" style="visibility:hidden" width="1" height="1"></iframe> 

<%end if

mySQL="INSERT INTO usuarios (u_nombre,u_apellidos,u_email,u_usuario,u_pass,u_telefono,u_movil,u_direccion,u_ciudad,u_c_postal,u_provincia,u_pais,fecha_in,u_agente,habilitado,u_nif,n_letter,n_letter_ip,n_letter_hora)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "'" & u_nombre & "',"
mySQL=mySQL & "'" & u_apellidos & "',"
mySQL=mySQL & "'" & u_email & "',"
mySQL=mySQL & "'" & u_email & "',"
mySQL=mySQL & "'" & u_pass & "',"
mySQL=mySQL & "'" & u_telefono & "',"
mySQL=mySQL & "'" & u_movil & "',"
mySQL=mySQL & "'" & u_direccion & "',"
mySQL=mySQL & "'" & u_ciudad & "',"
mySQL=mySQL & "'" & u_c_postal & "',"
mySQL=mySQL & "'" & u_provincia & "',"
mySQL=mySQL & "'" & u_pais & "',"
mySQL=mySQL & "'" & fecha_in & "',"
mySQL=mySQL & "'" & u_agente & "',"
mySQL=mySQL & "'" & habilitado & "',"
mySQL=mySQL & "'" & u_nif & "',"
mySQL=mySQL & "'" & n_letter & "',"
mySQL=mySQL & "'" & n_letter_ip & "',"
mySQL=mySQL & "'" & now & "'"
mySQL=mySQL & ");" 
set ob_rs=Ob_Connb.execute(mySQL)
set ob_rs = Ob_Connb.execute("select MAX(id_usuario) from usuarios") 
id_usuario = ob_rs(0)
session("id_usuario")=id_usuario
session("us_nombre")=u_nombre
session("us_apellidos")=u_apellidos
' ENVIAMOS MAIL SELECTIVO
cambio="Has sido dado de alta como nuevo usuario."
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
asunto = deslimpia(u_nombre) &" "& deslimpia(u_apellidos) & " - Nuevo usuario "
Mail.Subject =  Mail.EncodeHeader(asunto, "Windows-1250")
texto="<br><br>"
texto=texto& "<font size=""23"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>Hola "&u_nombre&"!</i></font><br><br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"&cambio&"</font><br><br><hr color=""#999999"" align=""center"" width=""100%""/>"
texto=texto &"<br><br>Te recordamos que puedes realizar varias gestiones desde el &aacute;rea de usuario, con el mail y la contrase&ntilde;a introducidos en el registro."
texto=texto &"<br><br>Ante cualquier duda o problema ponte en contacto con nosotros a trav&eacute;s del mail <strong>"&email&"</strong> o bien del tel&eacute;fono "&telefono&".<br><br><hr color=""#32C5D2"" align=""center"" width=""20%""/>"
texto=texto &"<br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><p align=""center""><i>Muchas gracias por confiar en "&nombre_empresa&" y muy feliz viaje!!!</i></p></font>"
texto=texto &"<br><br>"
Mail.Body = "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#CCCCCC""><tr><td width=""80%"" valign=""top"" bgcolor=""#FFFFFF""><img src="""&nombre_img&""" alt="""&alt&"""  width=""127"" height=""69"" hspace=""8"" vspace=""12"" /><br /></td><td width=""20%"" align=""right"" bgcolor=""#FFFFFF""><font size=""1.5"" face=""Arial, Helvetica, sans-serif"">"&direccion&"<br>"&cod_postal&" - "&ciudad&" <br>Tel. "&telefono&"<br>"&email&"&nbsp;&nbsp; //&nbsp; "& url &" </fo nt></td></tr></table><br><font size=""2"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"& texto &"</font><br><br><font size=""1"" face=""Arial, Helvetica, sans-serif"" color=""#999999"">"&f_texto_legal&"</font><br />"
Mail.IsHTML = True 
On Error Resume Next
Mail.Send'If Err <> 0 Then env_mail_res_alu="ko"end If 
'end if%>
<input type="hidden" name="id_usuario" value="<%=id_usuario%>">
<script>reg_ok();</script>
<div class="user_in_ok"><i class="fa fa-user" aria-hidden="true"></i><i class="fa fa-check" aria-hidden="true"></i><span>Usuario registrado con éxito!!</span><span><%if form_op<>"regi"then%>Introduce los datos del alumno que realizará el curso más abajo</span><i class="fa fa-arrow-down" aria-hidden="true" style="font-size:2em;color:#ddd;margin-top:15px"></i><%end if%></div>
<input type="hidden" name="u_nombre" id="u_nombre" value="<%=u_nombre%>">
<input type="hidden" name="u_apellidos" id="u_apellidos" value="<%=u_apellidos%>">
<input type="hidden" name="u_email" id="u_email" value="<%=u_email%>">
<input type="hidden" name="u_telefono" id="u_telefono" value="<%=u_telefono%>">
<input type="hidden" name="u_movil" id="u_movil" value="<%=u_movil%>">
<input type="hidden" name="u_direccion" id="u_direccion" value="<%=u_direccion%>">
<input type="hidden" name="u_ciudad" id="u_ciudad" value="<%=u_ciudad%>">
<input type="hidden" name="u_c_postal" id="u_c_postal" value="<%=u_c_postal%>">
<input type="hidden" name="u_provincia" id="u_provincia" value="<%=u_provincia%>">
<input type="hidden" name="u_pais" id="u_pais" value="<%=u_pais%>">
<script>reg_dentro3('<%=session("us_nombre")%>');</script>
<%Session.Timeout = 60
else%>
<script>reg_ko();</script>
<%end if%>

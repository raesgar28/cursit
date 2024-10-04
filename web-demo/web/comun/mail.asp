<meta charset="utf-8" />
<%Dim Ob_conn, ob_command
rd="../../"
Set Ob_Conn = Server.CreateObject ("ADODB.Connection")
Set Ob_Command = Server.CreateObject ("ADODB.Command")
Ob_Conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Database Password=p; Data Source=" & Server.MapPath(rd&"data/front.mdb")
Ob_Command.ActiveConnection = Ob_Conn
Const adCmdText = &H0001
Const adOpenStatic = 3
nombre = request.form("nombre")
apellidos = request.form("apellidos")
n_letter = request.form("n_letter")
telefono = request.form("telefono")
a_email = request.form("email")
comentario = request.form("comentario")
rn = request.form("rn")
pr=request.form("pr")   'contacto > formulario
Sql= "SELECT * FROM webs WHERE principal='si'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Conn,adOpenStatic, adCmdText
if not ob_rs.eof then
nombre_empresa=ob_rs("titulo_esp")
f_smtp=ob_rs("f_smtp")
f_usuario=ob_rs("f_usuario")
f_pass=ob_rs("f_pass")
f_email=ob_rs("f_email")
f_puerto=ob_rs("f_puerto")
email=ob_rs("email")
rd_mailchimp_api=ob_rs("rd_mailchimp_api")
rd_mailchimp_id=ob_rs("rd_mailchimp_id")
end if
ob_rs.close
Set Mail = Server.CreateObject("Persits.MailSender")
Mail.CharSet = "iso-8859-1"
Mail.ContentTransferEncoding = "Quoted-Printable"
Mail.Host = email_smtp
if email_ssl="si" then Mail.TLS = True
Mail.Port = email_puerto
Mail.Host = f_smtp
Mail.Port = f_puerto
Mail.Username = f_usuario
Mail.Password = f_pass
Mail.From = f_email
Mail.FromName = "Cursit - Cursos de Idiomas"
Mail.AddAddress f_email 
Mail.AddBCC email 
if rn="si" then
asunto = nombre &" "& apellidos & " - Reunión Informativa "
else
asunto = nombre &" "& apellidos & " - Formulario de Consulta "
end if
Mail.Subject = Mail.EncodeHeader(asunto, "utf-8")
Mail.Body = "NOMBRE Y APELLIDOS: " & nombre & vbCrLf & "TELEFONO: " & telefono & vbCrLf & "MAIL: " & a_email & vbCrLf & "COMENTARIOS: " & comentario
Mail.Send
If Err <> 0 Then
Response.Write "Ocurrió un error: " & Err.Description
End If 


function safeSTR(str)
dim output'output =server.HTMLEncode(str)
output = str
output = replace( output, "´", "&acute;" ) '"
output = replace( output, "á", "&aacute;" ) '"
output = replace( output, "é", "&eacute;" ) '"
output = replace( output, "í", "&iacute;" ) '"
output = replace( output, "ó", "&oacute;" ) '"
output = replace( output, "ú", "&uacute;" ) '"
output = replace( output, "Á", "&Aacute;" ) '"
output = replace( output, "É", "&Eacute;" ) '"
output = replace( output, "Í", "&Iacute;" ) '"
output = replace( output, "Ó", "&Oacute;" ) '"
output = replace( output, "Ú", "&Uacute;" ) '"
output = replace( output, "ñ", "&ntilde;" ) '"
output = replace( output, "Ñ", "&Ntilde;" ) '"
output = replace( output, "`", "&#96;" ) '"
output = replace( output, "à", "&agrave;" ) '"
output = replace( output, "è", "&egrave;" ) '"
output = replace( output, "ì", "&igrave;" ) '"
output = replace( output, "ò", "&ograve;" ) '"
output = replace( output, "ù", "&ugrave;" ) '"
output = replace( output, "ü", "&uuml;" ) '"
output = replace( output, "Ü", "&Uuml;" ) '"
output = replace( output, "ö", "&ouml;" ) '"
output = replace( output, "Ö", "&Ouml;" ) '"
output = replace( output, "¿", "&iquest;" ) '"
output = replace( output, "&#34;", chr(34) ) '"
output = replace( output, chr(34), "&#34;" ) '"
output = replace( output, chr(39), "&#39;" )  '
output = replace( output, chr(63), "&#63;" ) '?
output = replace( output, "ª", "&ordf;" ) '?
output = replace( output, "º", "&deg;" ) '?
safeSTR= output
end function

if n_letter="si" then
Dim IP
IP = Request.ServerVariables("HTTP_X_FORWARDED_FOR") ' se chequea si hay un proxy
If IP ="" Then IP = Request.ServerVariables("REMOTE_ADDR") ' si no hay proxy se toma la IP original

Set Ob_Connb = Server.CreateObject ("ADODB.Connection")
Set Ob_Commandb = Server.CreateObject ("ADODB.Command")
Ob_Connb.Open "Provider=Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Database Password=p; Data Source=" & Server.MapPath(rd&"data/back.mdb")
Ob_Commandb.ActiveConnection = Ob_Connb
fecha=date
cero=0
mySQL="INSERT INTO contactos (nombre,apellidos,eMail,telefono,comentario,estado,n_letter,ip,fecha_in,id_admin,id_categoria,id_item,id_contactoCategoria)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "'" & safeSTR(nombre) & "',"
mySQL=mySQL & "'" & safeSTR(apellidos) & "',"
mySQL=mySQL & "'" & safeSTR(a_email) & "',"
mySQL=mySQL & "'" & safeSTR(telefono) & "',"
mySQL=mySQL & "'" & safeSTR(comentario) & "',"
mySQL=mySQL & "'formulario',"
mySQL=mySQL & "'" & n_letter & "',"
mySQL=mySQL & "'" & IP & "',"
mySQL=mySQL & "'" & fecha & "',"
mySQL=mySQL & "" & cero & ","
mySQL=mySQL & "" & cero & ","
mySQL=mySQL & "" & cero & ","
mySQL=mySQL & "" & cero & ""
mySQL=mySQL & ");" 
set ob_rs2=Ob_Connb.execute(mySQL)%>

<iframe src="web/lib/mailchimp/mcapi_listSubscribe.php?email=<%=safeSTR(a_email)%>&id_lista=<%=rd_mailchimp_id%>&api_key=<%=rd_mailchimp_api%>&nombre=<%=safeSTR(nombre)%>&apellidos=<%=safeSTR(apellidos)%>" style="visibility:hidden" width="1" height="1"></iframe> 

<%end if

response.redirect("respuesta")%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<%function limpia_mail(str)
dim output'output =server.HTMLEncode(str)
output = str
output = replace( output, "&aacute;", "á" ) '"
output = replace( output, "&eacute;", "é" ) '"
output = replace( output, "&iacute;", "í" ) '"
output = replace( output, "&oacute;", "ó" ) '"
output = replace( output, "&uacute;", "ú" ) '"
output = replace( output, "&Aacute;", "Á" ) '"
output = replace( output, "&Eacute;", "É" ) '"
output = replace( output, "&Iacute;", "Í" ) '"
output = replace( output, "&Oacute;", "Ó" ) '"
output = replace( output, "&Uacute;", "Ú" ) '"
output = replace( output, "&agrave;", "a" ) '"
output = replace( output, "&egrave;", "e" ) '"
output = replace( output, "&igrave;", "i" ) '"
output = replace( output, "&ograve;", "o" ) '"
output = replace( output, "&ugrave;", "u" ) '"
output = replace( output, "&Agrave;", "A" ) '"
output = replace( output, "&Egrave;", "E" ) '"
output = replace( output, "&Igrave;", "I" ) '"
output = replace( output, "&Ograve;", "O" ) '"
output = replace( output, "&Ugrave;", "U" ) '"
output = replace( output, "&uuml;", "u" ) '"
output = replace( output, "&Uuml;", "U" ) '"
output = replace( output, "&ntilde;", "ñ" ) '"
output = replace( output, "&Ntilde;", "Ñ" ) '"
limpia_mail= output
end function
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
Dim Ob_conn, ob_command,Ob_connb, ob_commandb
rd="../../"
Set Ob_Connb = Server.CreateObject ("ADODB.Connection")
Set Ob_Commandb = Server.CreateObject ("ADODB.Command")
Ob_Connb.Open "Provider=Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Database Password=p; Data Source=" & Server.MapPath(rd&"data/back.mdb")
Ob_Commandb.ActiveConnection = Ob_Connb
Set Ob_Conn = Server.CreateObject ("ADODB.Connection")
Set Ob_Command = Server.CreateObject ("ADODB.Command")
Ob_Conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Database Password=p; Data Source=" & Server.MapPath(rd&"data/front.mdb")
Ob_Command.ActiveConnection = Ob_Conn
Const adCmdText = &H0001
Const adOpenStatic = 3
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
end if
ob_rs.close
id_formulario=request("id_formulario")
Sql= "SELECT * FROM formularios WHERE id_formulario="&id_formulario&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Conn,adOpenStatic, adCmdText
if not ob_rs.eof then
formu_email=ob_rs("email")
a_nl=ob_rs("a_nl")
a_bd=ob_rs("a_bd")
asunto=ob_rs("asunto")
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
Mail.AddAddress formu_email 
Mail.Subject = Mail.EncodeHeader(limpia_mail(asunto), "utf-8")
if a_bd="si" then
Sql3= "SELECT id_respuesta FROM formulariosRes order by id_respuesta desc"
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
id_respuesta=ob_rs3("id_respuesta")+1
else
id_respuesta=1
end if
if id_respuesta="" or ISNULL(id_respuesta) then id_respuesta=1 end if
end if
Sql= "SELECT * FROM formulariosCampos WHERE id_formulario="&id_formulario&" order by orden"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Conn,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
nombre_nombre=ob_rs("nombre_nombre")
nombre_nombre=request(nombre_nombre)
cuerpo= cuerpo&ob_rs("nombre")&": "&nombre_nombre&"<br>"
if a_bd="si" then
if ob_rs("tipo_dato")="num" then 
res_nm=nombre_nombre 
else 
res_nm=0 
res_txt=nombre_nombre
end if
mySQL="INSERT INTO formulariosRes (id_formulario,input_txt,res_txt,res_nm,id_respuesta)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & id_formulario & ","
mySQL=mySQL & "'" & ob_rs("nombre_nombre") & "',"
mySQL=mySQL & "'" & safeSTR(res_txt) & "',"
mySQL=mySQL & "" & res_nm & ","
mySQL=mySQL & "" & id_respuesta & ""
mySQL=mySQL & ");" 
set ob_rs2=Ob_Connb.execute(mySQL)
end if
nombe_nombre=""
res_nm=""
res_txt=""
ob_rs.movenext
loop
end if
ob_rs.close
Mail.Body = cuerpo
Mail.IsHTML = True 
Mail.Send
If Err <> 0 Then
'Response.Write "Ocurrió un error: " & Err.Description
End If 
response.redirect("respuesta")%>
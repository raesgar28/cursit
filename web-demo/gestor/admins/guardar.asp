<!DOCTYPE html><!--[if IE 8]><html lang="es-es" class="ie8 no-js"><![endif]--><!--[if IE 9]><html lang="es-es" class="ie9 no-js"><![endif]--><!--[if !IE]><!--><html lang="es-es"><!--<![endif]--><head><meta charset="utf-8" /></head><body>
<!--#INCLUDE file="../lib/asp/cifra.asp"-->
<%function safeSTR(str)
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
function safeSTR2(str)
dim output
output = server.HTMLEncode(str)
output = str
safeSTR2=output
end function
function limpia_url(cadena_url)
nombre_lk = server.HTMLEncode(cadena_url)
nombre_lk = cadena_url
s1 = "ÁÀÉÈÍÏÓÒÚÜáàèéíïóòúüÑñ"
s2 = "AAEEIIOOUUaaeeiioouuNn"
if len(nombre_lk) <> 0 then
For i2 = 1 to Len(s1)
nombre_lk = replace(nombre_lk,mid(s1,i2,1),mid(s2,i2,1))
nombre_lk = replace(nombre_lk, " · ","-")
nombre_lk = replace(nombre_lk, " - ","-")
nombre_lk = replace(nombre_lk, " ","-")
nombre_lk = replace(nombre_lk, "&#241;","n")
nombre_lk = replace(nombre_lk, "&#209;","n")
nombre_lk = replace( nombre_lk, chr(39), "" )  '
nombre_lk = replace( nombre_lk, "&#39;", "" ) 
nombre_lk = replace(nombre_lk, "-/-","-")
nombre_lk = replace(nombre_lk, "/","-")
nombre_lk = replace(nombre_lk, ".","-")
nombre_lk = replace( nombre_lk, "´", "" ) '"
nombre_lk = replace( nombre_lk, "&aacute;", "a" ) '"
nombre_lk = replace( nombre_lk, "&eacute;", "e" ) '"
nombre_lk = replace( nombre_lk, "&iacute;", "i" ) '"
nombre_lk = replace( nombre_lk, "&oacute;", "o" ) '"
nombre_lk = replace( nombre_lk, "&uacute;", "u" ) '"
nombre_lk = replace( nombre_lk, "&Aacute;", "" ) '"
nombre_lk = replace( nombre_lk, "&Eacute;", "" ) '"
nombre_lk = replace( nombre_lk, "&Iacute;", "" ) '"
nombre_lk = replace( nombre_lk, "&Oacute;", "" ) '"
nombre_lk = replace( nombre_lk, "&Uacute;", "" ) '"
nombre_lk = replace( nombre_lk, "&ntilde;", "n" ) '"
nombre_lk = replace( nombre_lk, "&Ntilde;", "N" ) '"
nombre_lk = replace( nombre_lk, "&#96;", "" ) '"
nombre_lk = replace( nombre_lk, "&agrave;", "a" ) '"
nombre_lk = replace( nombre_lk, "&egrave;", "e" ) '"
nombre_lk = replace( nombre_lk, "igrave;", "i" ) '"
nombre_lk = replace( nombre_lk, "&ograve;", "o" ) '"
nombre_lk = replace( nombre_lk, "&ugrave;", "u" ) '"
nombre_lk = replace( nombre_lk, "&uuml;", "u" ) '"
nombre_lk = replace( nombre_lk, "&Uuml;", "U" ) '"
nombre_lk = replace( nombre_lk, "¿", "" ) '"
nombre_lk = replace( nombre_lk, "&iquest;", "" ) '"
nombre_lk = replace( nombre_lk, "?", "" ) '"
nombre_lk = replace( nombre_lk, "&#34;", chr(34) ) '"
nombre_lk = replace( nombre_lk, chr(34), "" ) '"
nombre_lk = replace( nombre_lk, chr(63), "" ) '?
nombre_lk = replace(nombre_lk, "&","y")
nombre_lk = replace(nombre_lk, "&amp;","y")
nombre_lk = lcase(nombre_lk)
next
end if
limpia_url=nombre_lk
end function
function deslimpia(str)
dim output'output =server.HTMLEncode(str)
output = str
output = replace( output, "´", "" ) '"
output = replace( output, "á", "a" ) '"
output = replace( output, "é", "e" ) '"
output = replace( output, "í", "i" ) '"
output = replace( output, "ó", "o" ) '"
output = replace( output, "ú", "u" ) '"
output = replace( output, "Á", "A" ) '"
output = replace( output, "É", "E" ) '"
output = replace( output, "Í", "I" ) '"
output = replace( output, "Ó", "O" ) '"
output = replace( output, "Ú", "U" ) '"
output = replace( output, "ñ", "n" ) '"
output = replace( output, "Ñ", "N" ) '"
output = replace( output, "`", "" ) '"
output = replace( output, "à", "a" ) '"
output = replace( output, "è", "e" ) '"
output = replace( output, "ì", "i" ) '"
output = replace( output, "ò", "o" ) '"
output = replace( output, "ù", "u" ) '"
output = replace( output, "ü", "u" ) '"
output = replace( output, "Ü", "U" ) '"
output = replace( output, "ö", "o" ) '"
output = replace( output, "Ö", "O" ) '"
output = replace( output, "&aacute;", "a" ) '"
output = replace( output, "&eacute;", "e" ) '"
output = replace( output, "&iacute;", "i" ) '"
output = replace( output, "&oacute;", "o" ) '"
output = replace( output, "&uacute;", "u" ) '"
output = replace( output, "&Aacute;", "A" ) '"
output = replace( output, "&Eacute;", "E" ) '"
output = replace( output, "&Iacute;", "I" ) '"
output = replace( output, "&Oacute;", "O" ) '"
output = replace( output, "&Uacute;", "U" ) '"
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
deslimpia= output
end function
Set Upload = Server.CreateObject("Persits.Upload.1")
'Upload.CodePage = 65001
Upload.OverwriteFiles = False
Upload.SetMaxSize 1048576	' Limit files to 1MB
Upload.Save
r=upload.Form("r")
rd=upload.Form("rd")
n=upload.Form("n")
ndos=upload.Form("ndos")
ntres=upload.Form("ntres")
ncuat=upload.Form("ncuat")
op=upload.Form("op")
cod=upload.Form("cod")%>
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../../conex/conex_back.asp"-->
<%nombre=trim(safeSTR(upload.Form("u_nombre")))
apellidos=trim(safeSTR(upload.Form("u_apellidos")))
mail=trim(safeSTR(upload.Form("u_email")))
user_m=trim(safeSTR(upload.Form("u_usuario")))
if user_m=""then user_m=mail end if
telefono=trim(safeSTR(upload.Form("u_telefono")))
division=0
habilitado=upload.Form("habilitado")
pr_academia=upload.Form("pr_academia")
pr_cursos=upload.Form("pr_cursos")
pr_alumnos=upload.Form("pr_alumnos")
pr_contabilidad=upload.Form("pr_contabilidad")
pr_precio_real=upload.Form("pr_precio_real")
pr_datos_comunes=upload.Form("pr_datos_comunes")
pr_cat_sec=upload.Form("pr_cat_sec")
pr_fluctuaciones=upload.Form("pr_fluctuaciones")
pr_proveedores=upload.Form("pr_proveedores")
pr_admin=upload.Form("pr_admin")
pr_menu=upload.Form("pr_menu")
pr_paginas=upload.Form("pr_paginas")
pr_comunicados=upload.Form("pr_comunicados")
pr_datos_gestion=upload.Form("pr_datos_gestion")
pr_usuarios_crm=upload.Form("pr_usuarios_crm")
pr_factura=upload.Form("pr_factura")
pr_opciones=upload.Form("pr_opciones")
pr_observaciones=upload.Form("pr_observaciones")
pr_team=upload.Form("pr_team")
pr_team_od=upload.Form("pr_team_od")
If IsNumeric(pr_team_od) Then pr_team_od=pr_team_od else pr_team_od=0 end if
puesto=upload.Form("puesto")
fecha_in=now
fecha_mod=now     
del_1=upload.form("del_1")
if op="up" then
Sql= "SELECT mail from admins where (mail='"&mail&"' or user_m='"&user_m&"') and id_admin<>"&cod&""     '[CHEQUEAMOS QUE NO DENTRO UP]
else
Sql= "SELECT mail from admins where mail='"&mail&"' or user_m='"&user_m&"' "                              '[CHEQUEAMOS QUE NO DENTRO IN]
end if
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
if op="up" then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&cod_mail="&cod_mail&"&ms=ko")) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&cod_mail="&cod_mail&"&ms=ko") 
end if
if op="in" then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod_cat="&cod_cat)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod_cat="&cod_cat) 
end if
end if													'[FIN CHEQUEAMOS QUE NO DENTRO IN]
if op="in"then											 '[OPCION INSERTAR]
mySQL="INSERT INTO admins (nombre,apellidos,mail,user_m,telefono,division,pr_academia,pr_cursos,pr_alumnos,pr_contabilidad,pr_precio_real,pr_datos_comunes,pr_cat_sec,pr_fluctuaciones,pr_proveedores,pr_admin,pr_menu,pr_paginas,pr_comunicados,pr_datos_gestion,pr_usuarios_crm,fecha_in,puesto,habilitado,pr_factura,pr_opciones,pr_team,pr_team_od,pr_observaciones)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "'" & nombre & "',"
mySQL=mySQL & "'" & apellidos & "',"
mySQL=mySQL & "'" & mail & "',"
mySQL=mySQL & "'" & user_m & "',"
mySQL=mySQL & "'" & telefono & "',"
mySQL=mySQL & "" & division & ","
mySQL=mySQL & "'" & pr_academia & "',"
mySQL=mySQL & "'" & pr_cursos & "',"
mySQL=mySQL & "'" & pr_alumnos & "',"
mySQL=mySQL & "'" & pr_contabilidad & "',"
mySQL=mySQL & "'" & pr_precio_real & "',"
mySQL=mySQL & "'" & pr_datos_comunes & "',"
mySQL=mySQL & "'" & pr_cat_sec & "',"
mySQL=mySQL & "'" & pr_fluctuaciones & "',"
mySQL=mySQL & "'" & pr_proveedores & "',"
mySQL=mySQL & "'" & pr_admin & "',"
mySQL=mySQL & "'" & pr_menu & "',"
mySQL=mySQL & "'" & pr_paginas & "',"
mySQL=mySQL & "'" & pr_comunicados & "',"
mySQL=mySQL & "'" & pr_datos_gestion & "',"
mySQL=mySQL & "'" & pr_usuarios_crm & "',"
mySQL=mySQL & "'" & fecha_in & "',"
mySQL=mySQL & "'" & puesto & "',"
mySQL=mySQL & "'" & habilitado & "',"
mySQL=mySQL & "'" & pr_factura & "',"
mySQL=mySQL & "'" & pr_opciones & "',"
mySQL=mySQL & "'" & pr_team & "',"
mySQL=mySQL & "'" & pr_team_od & "',"
mySQL=mySQL & "'" & pr_observaciones & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
set ob_rs = Ob_Connb.execute("select MAX(id_admin) from admins") 
cod = ob_rs(0)
ob_rs.close
end if                                                            '[FIN OPCION INSERTAR]
if op="up" then                                                    '[OPCION MODIFICAR]
mySQL="UPDATE admins SET "
mySQL=mySQL & "nombre = '" & nombre & "',"
mySQL=mySQL & "apellidos = '" & apellidos & "',"
mySQL=mySQL & "mail = '" & mail & "',"
mySQL=mySQL & "user_m = '" & user_m & "',"
mySQL=mySQL & "telefono = '" & telefono & "',"
mySQL=mySQL & "division = " & division & ","
mySQL=mySQL & "pr_academia = '" & pr_academia & "',"
mySQL=mySQL & "pr_cursos = '" & pr_cursos & "',"
mySQL=mySQL & "pr_alumnos = '" & pr_alumnos & "',"
mySQL=mySQL & "pr_contabilidad = '" & pr_contabilidad & "',"
mySQL=mySQL & "pr_precio_real = '" & pr_precio_real & "',"
mySQL=mySQL & "pr_datos_comunes = '" & pr_datos_comunes & "',"
mySQL=mySQL & "pr_cat_sec = '" & pr_cat_sec & "',"
mySQL=mySQL & "pr_fluctuaciones = '" & pr_fluctuaciones & "',"
mySQL=mySQL & "pr_proveedores = '" & pr_proveedores & "',"
mySQL=mySQL & "pr_admin = '" & pr_admin & "',"
mySQL=mySQL & "pr_menu = '" & pr_menu & "',"
mySQL=mySQL & "pr_paginas = '" & pr_paginas & "',"
mySQL=mySQL & "pr_comunicados = '" & pr_comunicados & "',"
mySQL=mySQL & "pr_datos_gestion = '" & pr_datos_gestion & "',"
mySQL=mySQL & "pr_usuarios_crm = '" & pr_usuarios_crm & "',"
mySQL=mySQL & "puesto = '" & puesto & "',"
mySQL=mySQL & "habilitado = '" & habilitado & "',"
mySQL=mySQL & "pr_factura = '" & pr_factura & "',"
mySQL=mySQL & "pr_opciones = '" & pr_opciones & "',"
mySQL=mySQL & "pr_team = '" & pr_team & "',"
mySQL=mySQL & "pr_team_od = '" & pr_team_od & "',"
mySQL=mySQL & "pr_observaciones = '" & pr_observaciones & "'"
mySQL=mySQL & " WHERE id_admin = " & cod & "" 
set ob_rs=Ob_Connb.execute(mySQL)
end if                                                           '[FIN OPCION MODIFICAR]
For Each File in Upload.Files
nombre=limpia_url(File.FileName)
File.SaveAs  Server.MapPath("..\..\up_docs\admins\adm-\") & nombre  & File.ext 'NO ENTIENDO PQ SE RENOMBRA CON ALUPACKS!!!
nombre=File.FileName
arch_extension=File.Ext
arch_peso=File.Size
if arch_extension=".pdf" or arch_extension=".doc" or arch_extension=".docx" or arch_extension=".xls" or arch_extension=".txt" then tipo="documento" else tipo="imagen" end if
mySQL="INSERT INTO adminsArchivos (id_admin,nombre,tipo,extension,peso)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & cod & ","
mySQL=mySQL & "'" & nombre & "',"
mySQL=mySQL & "'" & tipo & "',"
mySQL=mySQL & "'" & arch_extension & "',"
mySQL=mySQL & "" & arch_peso & ""
mySQL=mySQL & ");" 
set ob_rs=Ob_Connb.execute(mySQL)
Next										     '[FIN METEMOS ARCVHVOS]
if del_1<> "" then
Sql= "SELECT nombre from adminsArchivos where id_admin_archivo="&del_1&""                             
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
if  ob_rs("nombre") <> "" then
Set fso = CreateObject("Scripting.FileSystemObject")
if fso.FileExists (Server.MapPath("../../up_docs/admins/" & ob_rs("nombre"))) then
Set f2 = fso.GetFile(Server.MapPath("../../up_docs/admins/" & ob_rs("nombre")))
f2.Delete
end if
end if
end if
mySQL="DELETE FROM adminsArchivos where id_admin_archivo =" & del_1 & " "
set ob_rs2=Ob_Connb.execute(mySQL)
end if
if op="in" then
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
function RandomString()
Randomize()
dim CharacterSetArray
CharacterSetArray = Array(_
Array(7, "abcdefghijklmnopqrstuvwxyz"), _
Array(1, "0123456789") _
)
dim i
dim j
dim Count
dim Chars
dim Index
dim Temp
for i = 0 to UBound(CharacterSetArray)
Count = CharacterSetArray(i)(0)
Chars = CharacterSetArray(i)(1)
for j = 1 to Count
Index = Int(Rnd() * Len(Chars)) + 1
Temp = Temp & Mid(Chars, Index, 1)
next
next
dim TempCopy
do until Len(Temp) = 0
Index = Int(Rnd() * Len(Temp)) + 1
TempCopy = TempCopy & Mid(Temp, Index, 1)
Temp = Mid(Temp, 1, Index - 1) & Mid(Temp, Index + 1)
loop
RandomString = TempCopy
end function
Set Mail = Server.CreateObject("Persits.MailSender")
Mail.CharSet = "iso-8859-1"
Mail.ContentTransferEncoding = "Quoted-Printable"
Mail.Host = f_smtp
Mail.Port = f_puerto
Mail.Username = f_usuario
Mail.Password = f_pass
Mail.From = f_email
Mail.FromName = "Cursit - Cursos de Idiomas"
Sql= "SELECT mail, nombre, apellidos, user_m FROM admins WHERE id_admin="&cod&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
u_email=ob_rs("mail")
u_usuario=ob_rs("user_m")
u_nombre=ob_rs("nombre")
u_apellidos=ob_rs("apellidos")
codigo_activacion=RandomString()&"-"&cod
enlace_activacion= url_c&"/recover-crm/"&codigo_activacion
if session("mail_en")="" then
mySQL2="UPDATE admins SET "
mySQL2=mySQL2 & "codigo_activacion = '" & codigo_activacion & "'"
mySQL2=mySQL2 & " WHERE id_admin = " & cod & "" 
set ob_rs2=Ob_Connb.execute(mySQL2)
end if
end if
ob_rs.close
Mail.AddAddress u_email
asunto = deslimpia(u_nombre) &" "& deslimpia(u_apellidos) & " - Alta usuario CRM "
Mail.Subject =  Mail.EncodeHeader(asunto, "Windows-1250")
texto="<br><br>"
texto=texto& "<font size=""23"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>Hola "&u_nombre&"!</i></font><br><br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">Para poder acceder a tu CRM debes crear una clave de acceso. Para ello debes clicar sobre el siguiente enlace (si no funcionara copia y pega en el navegador el enlace):<br /><br /><a href="&enlace_activacion&">"&enlace_activacion&"</a><br /><br />Te recordamos que tu usuario es <strong>"&u_usuario&"</strong></font><br><br><hr color=""#999999"" align=""center"" width=""100%""/>"
texto=texto &"<br><br>Ante cualquier duda o problema ponte en contacto con nosotros a trav&eacute;s del mail <strong>"&email&"</strong> o bien del tel&eacute;fono "&telefono&".<br><br><hr color=""#32C5D2"" align=""center"" width=""20%""/><br><br>"
Mail.Body = "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#CCCCCC""><tr><td width=""80%"" valign=""top"" bgcolor=""#FFFFFF""><img src="""&nombre_img&""" alt="""&alt&"""  width=""127"" height=""69"" hspace=""8"" vspace=""12"" /><br /></td><td width=""20%"" align=""right"" bgcolor=""#FFFFFF""><font size=""1.5"" face=""Arial, Helvetica, sans-serif"">"&direccion&"<br>"&cod_postal&" - "&ciudad&" <br>Tel. "&telefono&"<br>"&email&"&nbsp;&nbsp; //&nbsp; "& url &" </font></td></tr></table><br><font size=""2"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"& texto &"</font><br><br><font size=""1"" face=""Arial, Helvetica, sans-serif"" color=""#999999"">"&f_texto_legal&"</font><br />"
Mail.IsHTML = True 
On Error Resume Next
if habilitado="si" then
Mail.Send
end if
end if
'REDIRECCIONAMOS
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&cod_mail="&cod_mail&"&ms=ok&pos=mail")) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&cod_mail="&cod_mail&"&ms=ok&pos=mail") 
'ob_rs.close	
'ob_conn.close%>
</body></html>
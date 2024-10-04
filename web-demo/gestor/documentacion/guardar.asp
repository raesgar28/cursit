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
output = replace( output, "Ö", "U" ) '"
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
cod=upload.Form("cod")
del=upload.Form("del_1")
email=trim(upload.Form("email"))%>
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../../conex/conex_back.asp"-->
<%titulo_esp=trim(safeSTR(upload.Form("titulo_esp")))                          '[REQUEST]
texto_esp=trim(safeSTR2(upload.Form("texto_esp")))
disponible=upload.Form("disponible")
fecha_in=now
fecha_mod=now         
Dim id_categoria_(40)
For Each Item in upload.Form
If Item.Name = "id_categoria" Then
id_categoria = Item.Value & "," & id_categoria
End If
Next
if id_categoria<>""then
id_categoria = Left( id_categoria, (Len(id_categoria)-1))
cadena_rel = id_categoria
cadena_rel = split(cadena_rel, ",")
for i=0 to ubound(cadena_rel)
execute("id_categoria_("&i&")=cadena_rel("&i&")")
execute("if id_categoria_("&i&")="""" then id_categoria_("&i&")=0")
next
end if
Dim id_seccion_(40)
For Each Item in upload.Form
If Item.Name = "id_seccion" Then
id_seccion = Item.Value & "," & id_seccion
End If
Next
if id_seccion<>""then
id_seccion = Left( id_seccion, (Len(id_seccion)-1))
cadena_rel = id_seccion
cadena_rel = split(cadena_rel, ",")
for i=0 to ubound(cadena_rel)
execute("id_seccion_("&i&")=cadena_rel("&i&")")
execute("if id_seccion_("&i&")="""" then id_seccion_("&i&")=0")
next
end if
Dim id_destino_(40)
For Each Item in upload.Form
If Item.Name = "id_destino" Then
id_destino = Item.Value & "," & id_destino
End If
Next
if id_destino<>""then
id_destino = Left( id_destino, (Len(id_destino)-1))
cadena_rel = id_destino
cadena_rel = split(cadena_rel, ",")
for i=0 to ubound(cadena_rel)
execute("id_destino_("&i&")=cadena_rel("&i&")")
execute("if id_destino_("&i&")="""" then id_destino_("&i&")=0")
next
end if
Dim id_item_(40)
For Each Item in upload.Form
If Item.Name = "id_item" Then
id_item = Item.Value & "," & id_item
End If
Next
if id_item<>""then
id_item = Left( id_item, (Len(id_item)-1))
cadena_rel = id_item
cadena_rel = split(cadena_rel, ",")
for i=0 to ubound(cadena_rel)
execute("id_item_("&i&")=cadena_rel("&i&")")
execute("if id_item_("&i&")="""" then id_item_("&i&")=0")
next
end if
Dim id_alumno_(40)
For Each Item in upload.Form
If Item.Name = "id_alumno" Then
id_alumno = Item.Value & "," & id_alumno
End If
Next
if id_alumno<>""then
id_alumno = Left( id_alumno, (Len(id_alumno)-1))
cadena_rel = id_alumno
cadena_rel = split(cadena_rel, ",")
for i=0 to ubound(cadena_rel)
execute("id_alumno_("&i&")=cadena_rel("&i&")")
execute("if id_alumno_("&i&")="""" then id_alumno_("&i&")=0")
next
end if
Dim id_usuario_(40)
For Each Item in upload.Form
If Item.Name = "id_usuario" Then
id_usuario = Item.Value & "," & id_usuario
End If
Next
if id_usuario<>""then
id_usuario = Left( id_usuario, (Len(id_usuario)-1))
cadena_rel = id_usuario
cadena_rel = split(cadena_rel, ",")
for i=0 to ubound(cadena_rel)
execute("id_usuario_("&i&")=cadena_rel("&i&")")
execute("if id_usuario_("&i&")="""" then id_usuario("&i&")=0")
next
end if
'Dim id_subseccion_(40)
'For Each Item in upload.Form
'If Item.Name = "id_subseccion" Then
'id_subseccion = Item.Value & "," & id_subseccion
'End If
'Next
'if id_subseccion<>""then
'id_subseccion = Left( id_subseccion, (Len(id_subseccion)-1))
'cadena_rel = id_subseccion
'cadena_rel = split(cadena_rel, ",")
'for i=0 to ubound(cadena_rel)
'execute("id_subseccion_("&i&")=cadena_rel("&i&")")
'execute("if id_subseccion_("&i&")="""" then id_subseccion("&i&")=0")
'next
'end if
                                        '[FIN REQUEST]
if op="up" then
Sql= "SELECT titulo_esp from catDocumentacion where titulo_esp='"&titulo_esp&"' and id_catDocumentacion <>"&cod&""     '[CHEQUEAMOS QUE URL NO DENTRO UP]
else
Sql= "SELECT titulo_esp from catDocumentacion where titulo_esp='"&titulo_esp&"'"                              '[CHEQUEAMOS QUE URL NO DENTRO IN]
end if
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
if op="up" then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko")) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko") 
end if
if op="in" then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko")) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko") 
end if
end if													'[FIN CHEQUEAMOS QUE URL NO DENTRO IN]
if op="in" then															 '[OPCION INSERTAR]
mySQL="INSERT INTO catDocumentacion (titulo_esp,texto_esp,disponible,fecha_in,email)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "'" & titulo_esp & "',"
	mySQL=mySQL & "'" & texto_esp & "',"
	mySQL=mySQL & "'" & disponible & "',"
	mySQL=mySQL & "'" & fecha_in & "',"
	mySQL=mySQL & "'" & email & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
set ob_rs = Ob_Conn.execute("select MAX(id_catDocumentacion) from catDocumentacion") 
cod = ob_rs(0)
ob_rs.close
end if                                                            '[FIN OPCION INSERTAR]
if op="up" then                                                    '[OPCION MODIFICAR]
mySQL="UPDATE catDocumentacion SET "
mySQL=mySQL & "titulo_esp = '" & titulo_esp & "',"
mySQL=mySQL & "texto_esp = '" & texto_esp & "',"
mySQL=mySQL & "disponible = '" & disponible & "',"
mySQL=mySQL & "fecha_mod = '" & fecha_mod & "',"
mySQL=mySQL & "email = '" & email & "'"
mySQL=mySQL & " WHERE id_catDocumentacion = " & cod & "" 
set ob_rs=Ob_Conn.execute(mySQL)
end if                                                           '[FIN OPCION MODIFICAR]
mySQL="DELETE FROM catDocumentacion_rel where Id_catDocumentacion =" & cod & " " 
set ob_rs=Ob_conn.execute(mySQL)
for i=0 to 40
if id_categoria_(i)<>0 then
mySQL="INSERT INTO catDocumentacion_rel (id_categoria,Id_catDocumentacion)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & id_categoria_(i) & ","
	mySQL=mySQL & "'" & cod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
end if
if id_seccion_(i)<>0 then
mySQL="INSERT INTO catDocumentacion_rel (id_seccion,Id_catDocumentacion)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & id_seccion_(i) & ","
	mySQL=mySQL & "'" & cod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
end if
if id_destino_(i)<>0 then
mySQL="INSERT INTO catDocumentacion_rel (id_destino,Id_catDocumentacion)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & id_destino_(i) & ","
	mySQL=mySQL & "'" & cod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
end if
if id_item_(i)<>0 then
mySQL="INSERT INTO catDocumentacion_rel (id_item,Id_catDocumentacion)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & id_item_(i) & ","
	mySQL=mySQL & "'" & cod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
end if
if id_usuario_(i)<>0 then
mySQL="INSERT INTO catDocumentacion_rel (id_usuario,Id_catDocumentacion)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & id_usuario_(i) & ","
	mySQL=mySQL & "'" & cod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
end if




if id_alumno_(i)<>0 then
mySQL="INSERT INTO catDocumentacion_rel (id_alumno,Id_catDocumentacion)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & id_alumno_(i) & ","
	mySQL=mySQL & "'" & cod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
end if
'if id_subseccion_(i)<>0 then
'mySQL="INSERT INTO catDocumentacion_rel (id_subseccion,Id_catDocumentacion)" 				
'	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
'	mySQL=mySQL & "" & id_subseccion_(i) & ","
'	mySQL=mySQL & "'" & cod & "'"
'	mySQL=mySQL & ");"
'set ob_rs=Ob_Conn.execute(mySQL)
'end if
next
if del<> "" then
Sql= "SELECT nombre from catDocumentacion_arch where id_catDocumentacion="&cod&""                             
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
if  ob_rs("nombre") <> "" then
Set fso = CreateObject("Scripting.FileSystemObject")
if fso.FileExists (Server.MapPath("../../up_docs/alu_docs/" & ob_rs("nombre"))) then
Set f2 = fso.GetFile(Server.MapPath("../../up_docs/alu_docs/" & ob_rs("nombre")))
f2.Delete
end if
end if
end if
mySQL="DELETE FROM catDocumentacion_arch where id_catDocumentacion =" & cod & " "
set ob_rs2=Ob_Connb.execute(mySQL)
end if
For Each File in Upload.Files
nombre=limpia_url(File.FileName)
File.SaveAs  Server.MapPath("..\..\up_docs\alu_docs\schol-\") & nombre  & File.ext 'NO ENTIENDO PQ SE RENOMBRA!!!
nombre=File.FileName
arch_extension=File.Ext
arch_peso=File.Size
if arch_extension=".pdf" or arch_extension=".doc" or arch_extension=".docx" or arch_extension=".xls" or arch_extension=".txt" then tipo="documento" else tipo="imagen" end if
mySQL="INSERT INTO catDocumentacion_arch (id_catDocumentacion,nombre,tipo,extension,peso)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & cod & ","
mySQL=mySQL & "'" & nombre & "',"
mySQL=mySQL & "'" & tipo & "',"
mySQL=mySQL & "'" & arch_extension & "',"
mySQL=mySQL & "" & arch_peso & ""
mySQL=mySQL & ");" 
set ob_rs=Ob_Connb.execute(mySQL)
Next										     '[FIN METEMOS ARCVHVOS]
'REDIRECCIONAMOS
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok")) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok") 
'ob_rs.close	
ob_conn.close%>
</body></html>
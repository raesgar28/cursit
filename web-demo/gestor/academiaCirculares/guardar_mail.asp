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
cod_mail=upload.Form("cod")
prueba=upload.form("prueba")
n_letter=upload.form("n_letter")
id_mail_grupo=upload.form("id_mail_grupo")%>
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../../conex/conex_back.asp"-->
<%asunto_mail=trim(safeSTR(upload.Form("asunto_mail")))
texto_mail=trim(safeSTR2(upload.Form("texto_mail")))
fecha_in=now
fecha_mod=now     
Dim del_(4)
del_(1)=upload.form("del_1")
del_(2)=upload.form("del_2")
del_(3)=upload.form("del_3")
del_(4)=upload.form("del_4")
if op="up" then
Sql= "SELECT asunto_mail from mail where asunto_mail='"&asunto_mail&"' and id_mail<>"&cod_mail&""     '[CHEQUEAMOS QUE NO DENTRO UP]
else
Sql= "SELECT asunto_mail from mail where asunto_mail='"&asunto_mail&"'"                              '[CHEQUEAMOS QUE NO DENTRO IN]
end if
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
if op="up" then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&id_mail_grupo&"&cod_mail="&cod_mail&"&ms=ko")) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&id_mail_grupo&"&cod_mail="&cod_mail&"&ms=ko") 
end if
if op="in" then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod_cat="&cod_cat)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod_cat="&cod_cat) 
end if
end if													'[FIN CHEQUEAMOS QUE NO DENTRO IN]
if op="in" and asunto_mail<>""then											 '[OPCION INSERTAR]
mySQL="INSERT INTO mail (id_mail_grupo,fecha_in,asunto_mail,texto_mail,estado,n_letter,prueba)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "" & id_mail_grupo & ","
mySQL=mySQL & "'" & fecha_in & "',"
mySQL=mySQL & "'" & asunto_mail & "',"
mySQL=mySQL & "'" & texto_mail & "',"
mySQL=mySQL & "'" & estado & "',"
mySQL=mySQL & "'" & n_letter & "',"
mySQL=mySQL & "'" & prueba & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connc.execute(mySQL)
set ob_rs = Ob_Connc.execute("select MAX(id_mail) from mail") 
cod_mail = ob_rs(0)
ob_rs.close
end if                                                            '[FIN OPCION INSERTAR]
if op="up" and asunto_mail<>""then                                                    '[OPCION MODIFICAR]
mySQL="UPDATE mail SET "
mySQL=mySQL & "asunto_mail = '" & asunto_mail & "',"
mySQL=mySQL & "texto_mail = '" & texto_mail & "',"
mySQL=mySQL & "estado = '" & estado & "',"
mySQL=mySQL & "fecha_mod = '" & fecha_mod & "',"
mySQL=mySQL & "n_letter = '" & n_letter & "',"
mySQL=mySQL & "prueba = '" & prueba & "'"
mySQL=mySQL & " WHERE id_mail = " & cod_mail & "" 
set ob_rs=Ob_Connc.execute(mySQL)
end if                                                           '[FIN OPCION MODIFICAR]

For Each File in Upload.Files
nombre=limpia_url(File.FileName)
File.SaveAs  Server.MapPath("..\..\up_docs\circulares\circ-\") & nombre  & File.ext 'NO ENTIENDO PQ SE RENOMBRA CON ALUPACKS!!!
nombre=File.FileName
arch_extension=File.Ext
arch_peso=File.Size
if arch_extension=".pdf" or arch_extension=".doc" or arch_extension=".docx" or arch_extension=".xls" or arch_extension=".txt" then tipo="documento" else tipo="imagen" end if
mySQL="INSERT INTO mailArchivos (id_mail,nombre,tipo,extension,peso)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & cod_mail & ","
mySQL=mySQL & "'" & nombre & "',"
mySQL=mySQL & "'" & tipo & "',"
mySQL=mySQL & "'" & arch_extension & "',"
mySQL=mySQL & "" & arch_peso & ""
mySQL=mySQL & ");" 
set ob_rs=Ob_Connc.execute(mySQL)
Next										     '[FIN METEMOS ARCVHVOS]

for i=1 to 4
if del_(i)<> "" then
Sql= "SELECT nombre from mailArchivos where id_mail_archivo="&del_(i)&""                             
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
if  ob_rs("nombre") <> "" then
Set fso = CreateObject("Scripting.FileSystemObject")
if fso.FileExists (Server.MapPath("../../up_docs/circulares/" & ob_rs("nombre"))) then
Set f2 = fso.GetFile(Server.MapPath("../../up_docs/circulares/" & ob_rs("nombre")))
f2.Delete
end if
end if
end if
mySQL="DELETE FROM mailArchivos where id_mail_archivo =" & del_(i) & " "
set ob_rs2=Ob_Connc.execute(mySQL)
end if
next
if op="up" then
estado="Mail modificado "&date
else
estado="Mail creado "&date
end if
mySQL3="UPDATE mail SET "
mySQL3=mySQL3 & "estado =  '"& estado &"'"
mySQL3=mySQL3 & " WHERE id_mail_grupo = " & id_mail_grupo & "" 
set ob_rs3=Ob_Connc.execute(mySQL3)
'REDIRECCIONAMOS
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & id_mail_grupo & "&cod_mail="&cod_mail&"&ms=ok&pos=mail")) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & id_mail_grupo & "&cod_mail="&cod_mail&"&ms=ok&pos=mail") 
'ob_rs.close	
'ob_conn.close%>
</body></html>
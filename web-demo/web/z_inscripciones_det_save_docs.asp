<!DOCTYPE html><!--[if IE 8]><html lang="es-es" class="ie8 no-js"><![endif]--><!--[if IE 9]><html lang="es-es" class="ie9 no-js"><![endif]--><!--[if !IE]><!--><html lang="es-es"><!--<![endif]--><head><meta charset="utf-8" /></head><body>
<%r="../"
rd="../"
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
nombre_lk = replace( nombre_lk, "&Aacute;", "A" ) '"
nombre_lk = replace( nombre_lk, "&Eacute;", "E" ) '"
nombre_lk = replace( nombre_lk, "&Iacute;", "I" ) '"
nombre_lk = replace( nombre_lk, "&Oacute;", "O" ) '"
nombre_lk = replace( nombre_lk, "&Uacute;", "U" ) '"
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
nombre_lk = replace( nombre_lk, "´", "" ) '"
nombre_lk = replace( nombre_lk, "á", "a" ) '"
nombre_lk = replace( nombre_lk, "é", "e" ) '"
nombre_lk = replace( nombre_lk, "í", "i" ) '"
nombre_lk = replace( nombre_lk, "ó", "o" ) '"
nombre_lk = replace( nombre_lk, "ú", "u" ) '"
nombre_lk = replace( nombre_lk, "Á", "A" ) '"
nombre_lk = replace( nombre_lk, "É", "E" ) '"
nombre_lk = replace( nombre_lk, "Í", "I" ) '"
nombre_lk = replace( nombre_lk, "Ó", "O" ) '"
nombre_lk = replace( nombre_lk, "Ú", "U" ) '"
nombre_lk = replace( nombre_lk, "ñ", "n" ) '"
nombre_lk = replace( nombre_lk, "Ñ", "N" ) '"
nombre_lk = replace( nombre_lk, "`", "" ) '"
nombre_lk = replace( nombre_lk, "à", "a" ) '"
nombre_lk = replace( nombre_lk, "è", "e" ) '"
nombre_lk = replace( nombre_lk, "ì", "i" ) '"
nombre_lk = replace( nombre_lk, "ò", "o" ) '"
nombre_lk = replace( nombre_lk, "ù", "u" ) '"
nombre_lk = replace( nombre_lk, "ü", "u" ) '"
nombre_lk = replace( nombre_lk, "Ü", "U" ) '"
nombre_lk = replace( nombre_lk, "ö", "o" ) '"
nombre_lk = replace( nombre_lk, "Ö", "O" ) '"
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
Set Upload = Server.CreateObject("Persits.Upload.1")
'Upload.CodePage = 65001
Upload.OverwriteFiles = False
Upload.SetMaxSize 2048576
Upload.Save'Contador = Upload.Save(Server.MapPath("..\..\up_docs\alu_docs\"))
op=upload.Form("op")
n=upload.Form("n")
ndos=upload.Form("ndos")
ntres=upload.Form("ntres")
ncuat=upload.Form("ncuat")
op=upload.Form("op")
cod_prog=upload.Form("cod")
cod_cat=upload.Form("cod_cat")
edi=upload.Form("edi")
del_nif=upload.Form("del_nif")
del_pass=upload.Form("del_pass")
mail_aviso=upload.Form("mail_aviso")%>
<!--#include file="../conex/conex.asp"-->
<!--#include file="../conex/conex_back.asp"-->
<%cod_prog=upload.Form("cod")
'cod_prog=upload.Form("cod_prog")
Sql= "SELECT id_item, id_curso, id_usuario,id_alumno FROM programas WHERE id_programa ="&cod_prog&" "   '[id_item,... SACAMOS ALGUNOS VALORES COMUNES NECESARIOS]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
id_item=ob_rs("id_item")
id_curso=ob_rs("id_curso")
id_usuario=ob_rs("id_usuario")
id_alumno=ob_rs("id_alumno")
end if
ob_rs.close
fecha_in=date
if op<>"factura_dat" and op<>"alumno_dat" and op<>"docs" then
if del_nif="si" then
Sql= "SELECT archivos.id_archivo, archivos.nombre FROM archivos, alumnos_archivos WHERE alumnos_archivos.id_alumno ="&id_alumno&" and archivos.id_archivo=alumnos_archivos.id_archivo and archivos.tipo='NIF'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
id_archivo=ob_rs("id_archivo")
mySQL="DELETE FROM alumnos_archivos where id_archivo =" & id_archivo & " "
set ob_rs2=Ob_Connb.execute(mySQL)
if  ob_rs("nombre") <> "" then
Set fso = CreateObject("Scripting.FileSystemObject")
if fso.FileExists (Server.MapPath("../up_docs/alu_docs/" & ob_rs("nombre"))) then
Set f2 = fso.GetFile(Server.MapPath("../up_docs/alu_docs/" & ob_rs("nombre")))
f2.Delete
end if
end if
end if
ob_rs.close
if id_archivo<>"" then
mySQL="DELETE FROM archivos where id_archivo =" & id_archivo & " "
set ob_rs2=Ob_Connb.execute(mySQL)
end if
end if
if del_pass="si" then
Sql= "SELECT archivos.id_archivo, archivos.nombre FROM archivos, alumnos_archivos WHERE alumnos_archivos.id_alumno ="&id_alumno&" and archivos.id_archivo=alumnos_archivos.id_archivo and archivos.tipo='Pasaporte'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
id_archivo=ob_rs("id_archivo")
mySQL="DELETE FROM alumnos_archivos where id_archivo =" & id_archivo & " "
set ob_rs2=Ob_Connb.execute(mySQL)
if  ob_rs("nombre") <> "" then
Set fso = CreateObject("Scripting.FileSystemObject")
if fso.FileExists (Server.MapPath("../up_docs/alu_docs/" & ob_rs("nombre"))) then
Set f2 = fso.GetFile(Server.MapPath("../up_docs/alu_docs/" & ob_rs("nombre")))
f2.Delete
end if
end if
end if
ob_rs.close
if id_archivo<>"" then
mySQL="DELETE FROM archivos where id_archivo =" & id_archivo & " "
set ob_rs2=Ob_Connb.execute(mySQL)
end if
end if
For Each File in Upload.Files'METEMOS EN ARCHIVOS_tmp
nombre=limpia_url(File.FileName)
File.SaveAs  Server.MapPath("..\up_docs\alu_docs\doc-\") & nombre  & cod_prog & File.ext 'NO ENTIENDO PQ SE RENOMBRA CON ALUPACKS!!!
nombre=File.FileName
arch_nombre=File.Name
if arch_nombre="archivo_pass"then tipo="Pasaporte" end if
if arch_nombre="archivo_nif"then tipo="NIF" end if
'nombre=File.FileName
arch_extension=File.Ext
arch_peso=File.Size
if alto=""then alto=0 end if
if ancho=""then ancho=0 end if
mySQL="INSERT INTO archivos (nombre,tipo,alto,ancho,peso,extension)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "'" & nombre & "',"
mySQL=mySQL & "'" & tipo & "',"
mySQL=mySQL & "" & alto & ","
mySQL=mySQL & "" & ancho & ","
mySQL=mySQL & "" & arch_peso & ","
mySQL=mySQL & "'" & arch_extension & "'"
mySQL=mySQL & ");" 
set ob_rs=Ob_Connb.execute(mySQL)
set ob_rs = Ob_Connb.execute("select MAX(id_archivo) from archivos") 
id_archivo = ob_rs(0)
mySQL="INSERT INTO alumnos_archivos (id_alumno,id_archivo,id_programa,fecha_in)"'METEMOS EN ALUMNOS_ARCHIVOS_tmp
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & id_alumno & ","
mySQL=mySQL & "" & id_archivo & ","
mySQL=mySQL & "" & cod_prog & ","
mySQL=mySQL & "'" & fecha_in & "'"
mySQL=mySQL & ");" 
set ob_rs=Ob_Connb.execute(mySQL)
Next
else 'NO SON ARCHIVOS
if op="factura_dat" then'ES FACTURACION
factura=upload.Form("factura")
u_f_nombre=upload.Form("u_f_nombre")
u_f_direccion=upload.Form("u_f_direccion")
u_f_nif=upload.Form("u_f_nif")
mySQL="UPDATE programas SET "
mySQL=mySQL & "factura = '" & factura & "',"
mySQL=mySQL & "u_f_nombre = '" & u_f_nombre & "',"
mySQL=mySQL & "u_f_direccion = '" & u_f_direccion & "',"
mySQL=mySQL & "u_f_nif = '" & u_f_nif & "'"
mySQL=mySQL & " WHERE id_programa = " & cod_prog & "" 
set ob_rs=Ob_Connb.execute(mySQL)
end if
if op="alumno_dat" then'ES ALUMNO
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
a_nombre=trim(safeSTR(upload.Form("a_nombre")))
a_apellidos=trim(safeSTR(upload.Form("a_apellidos")))
a_email=trim(safeSTR(upload.Form("a_email")))
a_telefono=trim(safeSTR(upload.Form("a_telefono")))
a_movil=trim(safeSTR(upload.Form("a_movil")))
a_movil_sms=trim(safeSTR(upload.Form("a_movil_sms")))
a_nif=trim(safeSTR(upload.Form("a_nif")))
a_cumple=trim(safeSTR(upload.Form("a_cumple")))

a_dia=upload.Form("a_cumple_dia")
a_mes=upload.Form("a_cumple_mes")
a_ano=upload.Form("a_cumple_ano")
a_cumple=a_dia&"/"&a_mes&"/"&a_ano


if IsDate(a_cumple) and a_cumple<>""then a_cumple=a_cumple else a_cumple="01/01/1000" end if
a_permiso_medico=upload.Form("a_permiso_medico")
a_fuma=upload.Form("a_fuma")
a_vegetariano=upload.Form("a_vegetariano")
a_curso_ant=upload.Form("a_curso_ant")
a_direccion=trim(safeSTR(upload.Form("a_direccion")))
a_ciudad=trim(safeSTR(upload.Form("a_ciudad")))
a_provincia=upload.Form("a_provincia")
a_pais=upload.Form("a_pais")
a_c_postal=trim(safeSTR(upload.Form("a_c_postal")))
a_pasaporte=trim(safeSTR(upload.Form("a_pasaporte")))
a_pas_exp=trim(safeSTR(upload.Form("a_pas_exp")))
a_pas_cad=trim(safeSTR(upload.Form("a_pas_cad")))
if IsDate(a_pas_cad) and a_pas_cad<>""then a_pas_cad=a_pas_cad else a_pas_cad="01/01/1000" end if
a_sexo=upload.Form("a_sexo")
a_observaciones_curso=upload.Form("a_observaciones_curso")
if a_email<>""then 'PERMITE PONER EN BLANCO EL MAIL
Sql= "SELECT a_email FROM alumnos WHERE id_alumno<>"&id_alumno&" and a_email ='"&a_email&"'"   
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
response.redirect("../inscripciones-dett/"&cod_prog&"/"&id_alumno)
end if
ob_rs.close	
end if	
if a_nif<>""then 'PERMITE PONER EN BLANCO EL NIF
Sql= "SELECT a_nif FROM alumnos WHERE id_alumno<>"&id_alumno&" and a_nif ='"&a_nif&"'"   
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
response.redirect("../inscripciones-dett/"&cod_prog&"/"&id_alumno)
end if
ob_rs.close	
end if	
mySQL="UPDATE alumnos SET "
'mySQL=mySQL & "a_nombre = '" & a_nombre & "',"
'mySQL=mySQL & "a_apellidos = '" & a_apellidos & "',"
mySQL=mySQL & "a_email = '" & a_email & "',"
mySQL=mySQL & "a_telefono = '" & a_telefono & "',"
mySQL=mySQL & "a_movil = '" & a_movil & "',"
mySQL=mySQL & "a_movil_sms = '" & a_movil_sms & "',"
mySQL=mySQL & "a_nif = '" & a_nif & "',"
'mySQL=mySQL & "a_cumple = '" & a_cumple & "',"
mySQL=mySQL & "a_permiso_medico = '" & a_permiso_medico & "',"
mySQL=mySQL & "a_fuma = '" & a_fuma & "',"
mySQL=mySQL & "a_vegetariano = '" & a_vegetariano & "',"
mySQL=mySQL & "a_curso_ant = '" & a_curso_ant & "',"
mySQL=mySQL & "a_direccion = '" & a_direccion & "',"
mySQL=mySQL & "a_ciudad = '" & a_ciudad & "',"
mySQL=mySQL & "a_provincia = '" & a_provincia & "',"
mySQL=mySQL & "a_pais = '" & a_pais & "',"
mySQL=mySQL & "a_c_postal = '" & a_c_postal & "',"
mySQL=mySQL & "a_pasaporte = '" & a_pasaporte & "',"
mySQL=mySQL & "a_pas_exp = '" & a_pas_exp & "',"
mySQL=mySQL & "a_pas_cad = '" & a_pas_cad & "',"
mySQL=mySQL & "a_sexo = '" & a_sexo & "'"
mySQL=mySQL & " WHERE id_alumno = " & id_alumno & "" 
set ob_rs=Ob_Connb.execute(mySQL)
if a_observaciones_curso<>""then
mySQL="UPDATE programas SET "
mySQL=mySQL & "a_observaciones_curso = '" & a_observaciones_curso & "'"
mySQL=mySQL & " WHERE id_programa = " & cod_prog & "" 
set ob_rs=Ob_Connb.execute(mySQL)
end if
end if
end if'ELSE NO SON ARCHIVOS
if op="docs" then   'SUBIDA DE ARCHIVOS (INTERCAMBIADOR)
for i=1 to 40
if upload.form("del_"&i)<>"" then
id_catDocumentacion_rel=upload.form("del_"&i)
Sql= "SELECT id_catDocumentacion FROM catDocumentacion_rel WHERE id_catDocumentacion_rel= "&id_catDocumentacion_rel&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
id_catDocumentacion=ob_rs("id_catDocumentacion")
end if
ob_rs.close
Sql= "SELECT archivo FROM alumnosDocumentacion WHERE id_catDocumentacion= "&id_catDocumentacion&" and id_alumno="&id_alumno&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
archivete=ob_rs("archivo")
end if
ob_rs.close
mySQL="DELETE FROM alumnosDocumentacion where id_catDocumentacion= "&id_catDocumentacion&" and id_alumno="&id_alumno&" "
set ob_rs=Ob_Connb.execute(mySQL)
if  archivete <> "" then
Set fso = CreateObject("Scripting.FileSystemObject")
if fso.FileExists (Server.MapPath("../up_docs/alu_docs/" & archivete)) then
Set f2 = fso.GetFile(Server.MapPath("../up_docs/alu_docs/" & archivete))
f2.Delete
end if
end if
end if
if upload.form("del_o"&i)<>"" then
id_catDocumentacion=upload.form("del_o"&i)
Sql= "SELECT archivo FROM alumnosDocumentacion WHERE id_catDocumentacion= "&id_catDocumentacion&" and id_alumno="&id_alumno&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
archivete=ob_rs("archivo")
end if
ob_rs.close
mySQL="DELETE FROM alumnosDocumentacion where id_catDocumentacion= "&id_catDocumentacion&" and id_alumno="&id_alumno&" "
set ob_rs=Ob_Connb.execute(mySQL)
if  archivete <> "" then
Set fso = CreateObject("Scripting.FileSystemObject")
if fso.FileExists (Server.MapPath("../up_docs/alu_docs/" & archivete)) then
Set f2 = fso.GetFile(Server.MapPath("../up_docs/alu_docs/" & archivete))
f2.Delete
end if
end if
end if
archivete=""
id_catDocumentacion=""
id_catDocumentacion_rel=""
next
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
'if crm="si"then deslimpia= output else deslimpia= lcase(output) end if
deslimpia= output
end function
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
nombre_img=ob_rs("nombre")
nombre_img=url_c&nombre_img
alt=ob_rs("alt")
end if
ob_rs.close
Sql= "SELECT a_nombre, a_apellidos FROM alumnos WHERE id_alumno="&id_alumno&""   
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
a_nombre=ob_rs("a_nombre")
a_apellidos=ob_rs("a_apellidos")
end if
ob_rs.close	
For Each File in Upload.Files
arch_peso=File.Size
if arch_peso<=2000000 then
nombre=limpia_url(File.FileName)
File.SaveAs  Server.MapPath("..\up_docs\alu_docs\doc-") & nombre  & File.ext 'NO ENTIENDO PQ SE RENOMBRA CON ALUPACKS!!!
nombre=File.FileName
arch_extension=File.Ext
fecha=date
for i=1 to 40
if file.name="doc_archivo"&i then id_catDocumentacion=upload.form("id_catDocumentacion"&i) end if
next
if id_catDocumentacion<>""then
Sql= "SELECT titulo_esp, email FROM catDocumentacion WHERE id_catDocumentacion ="&id_catDocumentacion&" " 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
nombreCatDocumentacion=ob_rs("titulo_esp")
doc_email=ob_rs("email")
end if
ob_rs.close
end if
if arch_extension=".pdf" or arch_extension=".doc" or arch_extension=".docx" or arch_extension=".xls" or arch_extension=".txt" then tipo="documento" else tipo="imagen" end if
mySQL="INSERT INTO alumnosDocumentacion (id_alumno,id_catDocumentacion,nombreCatDocumentacion,archivo,fecha_in,tipo)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & id_alumno & ","
mySQL=mySQL & "" & id_catDocumentacion & ","
mySQL=mySQL & "'" & nombreCatDocumentacion & "',"
mySQL=mySQL & "'" & nombre & "',"
mySQL=mySQL & "'" & fecha_in & "',"
mySQL=mySQL & "'" & tipo & "'"
mySQL=mySQL & ");" 
set ob_rs=Ob_Connb.execute(mySQL)
'MANDAR EMAIL SI HAY MAIL DE AVISO
if email<>"" then
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
if doc_email<>"" then 
Mail.AddAddress doc_email
end if
if doc_email<>"" then Mail.AddAddress u_email end if
asunto = deslimpia(a_nombre) &" "& deslimpia(a_apellidos) & " - Documentos nuevos remitidos"
Mail.Subject =  Mail.EncodeHeader(asunto, "Windows-1250")
texto="<br><br>"
texto=texto& "<font size=""23"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>Hola!</i></font><br><br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">Hay nueva documentaci&oacuten remitida</font><br><br><hr color=""#999999"" align=""center"" width=""100%""/>"
texto=texto &"<br><br>"&a_nombre&" "&a_apellidos&" ha remitido nueva documentaci&oacute;n. Puedes verla en la zona de alumnos del CRM."
Mail.Body = "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#CCCCCC""><tr><td width=""80%"" valign=""top"" bgcolor=""#FFFFFF""><img src="""&nombre_img&""" alt="""&alt&"""  width=""127"" height=""69"" hspace=""8"" vspace=""12"" /><br /></td><td width=""20%"" align=""right"" bgcolor=""#FFFFFF""><font size=""1.5"" face=""Arial, Helvetica, sans-serif"">"&direccion&"<br>"&cod_postal&" - "&ciudad&" <br>Tel. "&telefono&"<br>"&email&"&nbsp;&nbsp; //&nbsp; "& url &" </fo nt></td></tr></table><br><font size=""2"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"& texto &"</font><br><br><font size=""1"" face=""Arial, Helvetica, sans-serif"" color=""#999999"">"&f_texto_legal&"</font><br />"
Mail.IsHTML = True 
On Error Resume Next
Mail.Send
end if
else
error_sub=1
end if
Next
end if    'FIN SUBIDA DE ARCHIVOS (INTERCAMBIADOR)
if error_sub=1 then  response.redirect("../inscripciones-det-e/"&cod_prog&"/"&id_alumno) end if
response.redirect("../inscripciones-det-m/"&cod_prog&"/"&id_alumno)%>
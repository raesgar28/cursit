<%r="../"
rd="../../"%>
<!--#include file="../../conex/conex.asp"-->
<%Dim Ob_connc, ob_commandc
Set Ob_Connc = Server.CreateObject ("ADODB.Connection")
Set Ob_Commandc = Server.CreateObject ("ADODB.Command")
Ob_Connc.Open "Provider=Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Database Password=p; Data Source=" & Server.MapPath(rd&"../data/datos.mdb")
Ob_Commandc.ActiveConnection = Ob_Connc
Dim FSO
function safeSTR(str)
dim output'output =server.HTMLEncode(str)
output = str
output = replace( output, "¥", "&acute;" ) '"
output = replace( output, "·", "&aacute;" ) '"
output = replace( output, "È", "&eacute;" ) '"
output = replace( output, "Ì", "&iacute;" ) '"
output = replace( output, "Û", "&oacute;" ) '"
output = replace( output, "˙", "&uacute;" ) '"
output = replace( output, "¡", "&Aacute;" ) '"
output = replace( output, "…", "&Eacute;" ) '"
output = replace( output, "Õ", "&Iacute;" ) '"
output = replace( output, "”", "&Oacute;" ) '"
output = replace( output, "⁄", "&Uacute;" ) '"
output = replace( output, "Ò", "&ntilde;" ) '"
output = replace( output, "—", "&Ntilde;" ) '"
output = replace( output, "`", "&#96;" ) '"
output = replace( output, "‡", "&agrave;" ) '"
output = replace( output, "Ë", "&egrave;" ) '"
output = replace( output, "Ï", "&igrave;" ) '"
output = replace( output, "Ú", "&ograve;" ) '"
output = replace( output, "˘", "&ugrave;" ) '"
output = replace( output, "¸", "&uuml;" ) '"
output = replace( output, "‹", "&Uuml;" ) '"
output = replace( output, "ˆ", "&ouml;" ) '"
output = replace( output, "÷", "&Ouml;" ) '"
output = replace( output, "ø", "&iquest;" ) '"
output = replace( output, "&#34;", chr(34) ) '"
output = replace( output, chr(34), "&#34;" ) '"
output = replace( output, chr(39), "&#39;" )  '
output = replace( output, chr(63), "&#63;" ) '?
output = replace( output, "™", "&ordf;" ) '?
output = replace( output, "∫", "&deg;" ) '?
safeSTR= output
end function
function limpia_url(cadena_url)
nombre_lk = server.HTMLEncode(cadena_url)
nombre_lk = cadena_url
s1 = "¡¿…»Õœ”“⁄‹·‡ËÈÌÔÛÚ˙¸—Ò"
s2 = "AAEEIIOOUUaaeeiioouuNn"
if len(nombre_lk) <> 0 then
For i2 = 1 to Len(s1)
nombre_lk = replace(nombre_lk,mid(s1,i2,1),mid(s2,i2,1))
nombre_lk = replace(nombre_lk, " ∑ ","-")
nombre_lk = replace(nombre_lk, " - ","-")
nombre_lk = replace(nombre_lk, " ","-")
nombre_lk = replace(nombre_lk, "&#241;","n")
nombre_lk = replace(nombre_lk, "&#209;","n")
nombre_lk = replace( nombre_lk, chr(39), "" )  '
nombre_lk = replace( nombre_lk, "&#39;", "" ) 
nombre_lk = replace(nombre_lk, "-/-","-")
nombre_lk = replace(nombre_lk, "/","-")
nombre_lk = replace(nombre_lk, ".","-")
nombre_lk = replace( nombre_lk, "¥", "" ) '"
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
nombre_lk = replace( nombre_lk, "ø", "" ) '"
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
Sql= "SELECT * from noticias"                    
Ob_Commandc.CommandText = Sql
SET Ob_RS = Ob_Commandc.Execute ()
if not ob_rs.eof then
do while not ob_rs.eof
id_producto=ob_rs("id_producto")
fk_categoria=ob_rs("fk_categoria")
pro_nombre=ob_rs("pro_nombre")
titulete=safeSTR(pro_nombre)
pro_resumen_nor=trim(safeSTR(ob_rs("pro_resumen_nor")))
pro_descripcion=trim(safeSTR(ob_rs("pro_descripcion")))
images1=ob_rs("images1")
images1_or=images1
if images1<>""then images1="/up_files/images/noticias/"&images1  end if
if images1<>"" then campo="archivo_1" end if
height1=ob_rs("height1")
if height1<>""then height1=height1 else height1=0 end if
width1=ob_rs("width1")
if width1<>""then width1=width1 else width1=0 end if
filtype1=ob_rs("filtype1")
pro_nombre_fra=trim(safeSTR(ob_rs("pro_nombre_fra")))
fecha=ob_rs("fecha")
titulo_noticia = ob_rs("pro_nombre")
titulo_noticia = replace(titulo_noticia, "%20", "_")
titulo_noticia = replace(titulo_noticia, " ∑ ", "_")
titulo_noticia = replace(titulo_noticia, " ", "_")
titulo_noticia = replace(titulo_noticia, "_", "-")
titulo_noticia = replace(titulo_noticia, " - ", "-")				
s1 = "¡¿…»Õœ”“⁄‹·‡ËÈÌÔÛÚ˙¸—Ò"
s2 = "AAEEIIOOUUaaeeiioouuNn"
if len(titulo_noticia) <> 0 then
For z = 1 to Len(s1)
titulo_noticia = replace(titulo_noticia,mid(s1,z,1),mid(s2,z,1))
next
titulo_noticia=limpia_url(titulo_noticia)
end if
url_esp = lcase(limpia_url(titulo_noticia))
Sql22= "SELECT * from noticias where url_esp ='"&titulo_noticia&"'"                    
Ob_Command.CommandText = Sql22
SET Ob_RS22 = Ob_Command.Execute ()
if not ob_rs22.eof then
else
meta_title=pro_nombre &" | Noticias | Cursit Centro Estudios Idiomas"
meta_desc=pro_nombre &", Cursit,centro idiomas Cursit,centro de idiomas,cursos idiomas extranjero,centro estudios valencia,centro estudios espaÒa,cursos inglÈs extranjero,cursos de ingles jÛvenes,cursos de inglÈs adultos,curso inglÈs ejecutivos,curso idiomas adultos"
'COPIAMOS IMAGENES PRINCIPALES
Set fso = CreateObject("Scripting.FileSystemObject")
If fso.FileExists(Server.MapPath("..\..\..\images_upload\"&images1_or)) Then
FSO.CopyFile Server.MapPath("..\..\..\images_upload\"&images1_or), Server.MapPath("..\..\up_files\images\noticias\"&images1_or)
end if
orden=0
visible="si"
mySQL="INSERT INTO noticias (titulo_esp,texto_esp,texto_esp2,visible,destacado,orden,url_esp,meta_title,meta_desc,fecha_in)"
	mySQL=mySQL & "VALUES ("
	mySQL=mySQL & "'" & titulete & "',"
	mySQL=mySQL & "'" & pro_resumen_nor & "',"
	mySQL=mySQL & "'" & pro_descripcion & "',"
	mySQL=mySQL & "'" & visible & "',"
	mySQL=mySQL & "'" & pro_nombre_fra & "',"
	mySQL=mySQL & "" & orden & ","
	mySQL=mySQL & "'" & url_esp & "',"
	mySQL=mySQL & "'" & meta_title & "',"
	mySQL=mySQL & "'" & meta_desc & "',"
	mySQL=mySQL & "'" & fecha & "'"
	mySQL=mySQL & ");"
set ob_rs3=Ob_Conn.execute(mySQL)
set ob_rs3 = Ob_Conn.execute("select MAX(id_noticia) from noticias") 
id_noticia = ob_rs3(0)
tipo="img"
nombre="/up_files/images/noticias/"&images1_or
campo="archivo_1"
principal="si"
orden=0
Set fso = CreateObject("Scripting.FileSystemObject")
if fso.FileExists (Server.MapPath(nombre)) then
extension = fso. GetExtensionName (Server.MapPath(nombre)) 
end if
if ancho=""then ancho=0 end if
if alto=""then alto=0 end if
if peso=""then peso=0 end if
mySQL="INSERT INTO archivos (tipo,nombre,campo,extension,peso,alto,ancho,principal,titulo_esp,fecha_in,orden)"
	mySQL=mySQL & "VALUES ("
	mySQL=mySQL & "'" & tipo & "',"
	mySQL=mySQL & "'" & nombre & "',"
	mySQL=mySQL & "'" & campo & "',"
	mySQL=mySQL & "'" & extension & "',"
	mySQL=mySQL & "" & peso & ","
	mySQL=mySQL & "" & alto & ","
	mySQL=mySQL & "" & ancho & ","
	mySQL=mySQL & "'" & principal & "',"
	mySQL=mySQL & "'" & titulo_esp & "',"
	mySQL=mySQL & "'" & fecha & "',"
	mySQL=mySQL & "" & orden & ""
	mySQL=mySQL & ");"
set ob_rs3=Ob_Conn.execute(mySQL)
set ob_rs3 = Ob_Conn.execute("select MAX(id_archivo) from archivos") 
id_archivo = ob_rs3(0)
tipo_rel="img"
mySQL="INSERT INTO rel (id_noticia,tipo_rel,fecha_in,id_archivo)"
	mySQL=mySQL & "VALUES ("
	mySQL=mySQL & "" & id_noticia & ","
	mySQL=mySQL & "'" & tipo_rel & "',"
	mySQL=mySQL & "'" & fecha & "',"
	mySQL=mySQL & "" & id_archivo & ""
	mySQL=mySQL & ");"
set ob_rs3=Ob_Conn.execute(mySQL)
set ob_rs3 = Ob_Conn.execute("select MAX(id_rel) from rel") 
id_rel = ob_rs3(0)
images1=""
campo=""
height1=""
width1=""
id_new=""
end if
ob_rs22.close
ob_rs.movenext
loop
end if
ob_rs.close
Sql= "SELECT url_esp, id_noticia from noticias"                            '[COMENZAMOS REESCRITURA]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
set fso = createobject("scripting.filesystemobject")
Set act = fso.CreateTextFile(server.mappath(rd&"mapas_url/noticias.txt"), true)
do while not ob_rs.eof
url = ob_rs("url_esp")
act.WriteLine ""&limpia_url(url)&" "&ob_rs("id_noticia")&"" 
ob_rs.movenext
loop
act.Close
end if
ob_rs.close                                                   '[FIN REESCRITURA]%>
<!DOCTYPE html><!--[if IE 8]><html lang="es-es" class="ie8 no-js"><![endif]--><!--[if IE 9]><html lang="es-es" class="ie9 no-js"><![endif]--><!--[if !IE]><!--><html lang="es-es"><!--<![endif]--><head><meta charset="utf-8" /></head><body>
<!--#INCLUDE file="../lib/asp/cifra.asp"-->
<%r=request("r")
rd=request("rd")
n=request("n")
ndos=request("ndos")
ntres=request("ntres")
ncuat=request("ncuat")
op=request("op")
cod=request("cod")
edi=request("edi")%>
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../lib/asp/comun.asp"-->
<%id_pag_sup=request("id_pag_sup")                          '[REQUEST]
If IsNumeric(id_pag_sup) Then id_pag_sup=id_pag_sup else id_pag_sup=0 end if
contacto=request("contacto")
tipo=request("tipo")
if ntres<>""then tipo=ntres else tipo="gn" end if
titulo_esp=trim(safeSTR(request("titulo_esp")))
texto_esp=safeSTR2(request("texto_esp"))
texto_esp2=safeSTR2(request("texto_esp2"))
visible=request("visible")
destacado=request("destacado")
orden_general=request("orden_general")
If IsNumeric(orden_general) Then orden_general=orden_general else orden_general=0 end if
if orden_general="" then orden_general=0

url_esp=trim(safeSTR(request("url_esp")))
meta_title=trim(safeSTR(request("meta_title")))
meta_key=trim(safeSTR(request("meta_key")))
meta_desc=trim(safeSTR(request("meta_desc")))
	Dim archivo_(20),alt_(20), del_img_(20), destacado_(20), orden_img_(20)
	for i=1 to 20
	archivo_(i) = trim(request("archivo_[" & i &"]"))
	alt_(i) = trim(request("alt_[" & i & "]"))
	del_img_(i)=request("del_img_"& i)
	destacado_(i)=request("destacado_"& i)
	orden_img_(i) = trim(request("orden_img_[" & i &"]"))
	next
fecha_in=request("fecha_in")
if IsDate(fecha_in) then fecha_in=fecha_in else fecha_in=date end if

fecha_mod=request("fecha_in")    
if IsDate(fecha_mod) then fecha_mod=fecha_mod else fecha_mod=date end if                                                  '[FIN REQUEST]

if op="up" then                          ' CHEQUEAMOS URL ESP
Sql= "SELECT url_esp FROM noticias WHERE url_esp ='"&url_esp&"' and id_noticia <> "&cod&""   
else
Sql= "SELECT url_esp FROM noticias WHERE url_esp ='"&url_esp&"'"   
end if
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver) 
end if
ob_rs.close
Sql2= "SELECT url_esp FROM itemsSub WHERE url_esp ='"&url_esp&"'"   
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver) 
end if
ob_rs2.close
Sql2= "SELECT url_esp FROM items WHERE url_esp ='"&url_esp&"'"   
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver) 
end if
ob_rs2.close
Sql2= "SELECT url_esp FROM items WHERE url_esp ='"&url_esp&"'"   
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver) 
end if
ob_rs2.close
Sql2= "SELECT url_esp FROM secciones WHERE url_esp ='"&url_esp&"'"   
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver) 
end if
ob_rs2.close
Sql2= "SELECT url_esp FROM subsecciones WHERE url_esp ='"&url_esp&"'"   
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver) 
end if
ob_rs2.close
Sql2= "SELECT url_esp FROM categorias WHERE url_esp ='"&url_esp&"'"   
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver) 
end if
ob_rs2.close
Sql2= "SELECT url_esp FROM destinos WHERE url_esp ='"&url_esp&"'"   
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver) 
end if
ob_rs2.close
Sql2= "SELECT url_esp FROM ciudades WHERE url_esp ='"&url_esp&"'"   
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver) 
end if
ob_rs2.close								'[FIN CHEQUEAMOS QUE URL NO DENTRO IN]

if op="in"then															 '[OPCION INSERTAR]

mySQL="INSERT INTO noticias (titulo_esp,texto_esp,url_esp,meta_title,meta_key,meta_desc,visible,fecha_in,fecha_mod,destacado,texto_esp2)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "'" & titulo_esp & "',"
	mySQL=mySQL & "'" & texto_esp & "',"
	mySQL=mySQL & "'" & limpia_url(url_esp) & "',"
	mySQL=mySQL & "'" & meta_title & "',"
	mySQL=mySQL & "'" & meta_key & "',"
	mySQL=mySQL & "'" & meta_desc & "',"
	mySQL=mySQL & "'" & visible & "',"
	mySQL=mySQL & "'" & fecha_in & "',"
	mySQL=mySQL & "'" & fecha_in & "',"
	mySQL=mySQL & "'" & destacado & "',"
	mySQL=mySQL & "'" & texto_esp2 & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
set ob_rs = Ob_Conn.execute("select MAX(id_noticia) from noticias") 
cod = ob_rs(0)
ob_rs.close
end if                                                            '[FIN OPCION INSERTAR]
if op="up"then                                                    '[OPCION MODIFICAR]
mySQL="UPDATE noticias SET "
mySQL=mySQL & "titulo_esp = '" & titulo_esp & "',"
mySQL=mySQL & "texto_esp = '" & texto_esp & "',"
mySQL=mySQL & "url_esp = '" & limpia_url(url_esp) & "',"
mySQL=mySQL & "meta_title = '" & meta_title & "',"
mySQL=mySQL & "meta_key = '" & meta_key & "',"
mySQL=mySQL & "meta_desc = '" & meta_desc & "',"
mySQL=mySQL & "visible = '" & visible & "',"
mySQL=mySQL & "destacado = '" & destacado & "',"
mySQL=mySQL & "fecha_mod = '" & fecha_mod & "',"
mySQL=mySQL & "texto_esp2 = '" & texto_esp2 & "'"
mySQL=mySQL & " WHERE id_noticia = " & cod & "" 
set ob_rs=Ob_Conn.execute(mySQL)
end if                                                           '[FIN OPCION MODIFICAR]
for i=1 to 20									      		  '[SUBIDA DE ARCHIVOS E IMAGENES HASTA 20]
if del_img_(i)<>"" then                                           '[SI HEMOS SELECCIONADO ELIMINAR IMAGEN] 
campo="archivo_"&i
Sql= "SELECT rel.id_archivo,rel.id_rel, rel.id_noticia, archivos.id_archivo, archivos.campo from rel, archivos where rel.id_noticia="&cod&" and rel.id_archivo<>0 and archivos.id_archivo = rel.id_archivo and archivos.campo ='"&campo&"'"                    
Ob_Command.CommandText = Sql
SET Ob_RS3 = Ob_Command.Execute ()
if not ob_rs3.eof then
do while not ob_rs3.eof
id_archivo=ob_rs3("archivos.id_archivo")
id_rel=ob_rs3("id_rel")
	mySQL="DELETE FROM archivos where id_archivo =" & id_archivo & ""
	set ob_rs=Ob_Conn.execute(mySQL)
	mySQL="DELETE FROM rel where id_rel =" & id_rel & ""
	set ob_rs=Ob_Conn.execute(mySQL)
ob_rs3.movenext
loop
end if
ob_rs3.close
else                                                              '[SI NO HEMOS SELECCIONADO ELIMINAR IMAGEN] 
if archivo_(i)<>"," and archivo_(i)<>""  then                                                      '[SI EL ARCHIVO TIENE ALGO] 
campo="archivo_"&i
Sql= "SELECT rel.id_archivo,rel.id_rel, rel.id_noticia, archivos.id_archivo, archivos.campo from rel, archivos where rel.id_noticia="&cod&" and rel.id_archivo<>0 and archivos.id_archivo = rel.id_archivo and archivos.campo ='"&campo&"'"                           
Ob_Command.CommandText = Sql
SET Ob_RS3 = Ob_Command.Execute ()
if not ob_rs3.eof then
do while not ob_rs3.eof
id_archivo=ob_rs3("archivos.id_archivo")
id_rel=ob_rs3("id_rel")
	mySQL="DELETE FROM archivos where id_archivo =" & id_archivo & ""
	set ob_rs=Ob_Conn.execute(mySQL)
	mySQL="DELETE FROM rel where id_rel =" & id_rel & ""
	set ob_rs=Ob_Conn.execute(mySQL)
ob_rs3.movenext
loop
end if
ob_rs3.close
if i<>19 and i <> 20 then 'NO ES UN VIDEO ENLAZADO
if archivo_(i)<>"" and archivo_(i)<>"," then
Set fso = CreateObject("Scripting.FileSystemObject") 							'[SACAMOS DATOS]
if fso.FileExists (Server.MapPath(archivo_(i))) then
extension = fso. GetExtensionName (Server.MapPath(archivo_(i))) 
Set f2 = fso.GetFile(Server.MapPath(archivo_(i)))
	peso = FormatNumber((f2.Size / 1024),2)
	if extension="jpg" or extension="jpeg" or extension="gif" or extension="bmp" or extension="png" or extension="tiff" then '[SI SOLO ES IMAGEN]
if extension="png" then
	ancho=0
	alto=0
	tipo="img"
	else
	Set f3 = loadpicture(Server.MapPath(archivo_(i)))
	ancho = round(f3.width / 26.4583)
	alto = round(f3.height / 26.4583)
	tipo="img"
	Set f3 = Nothing
	end if
	else
	ancho=0
	alto=0
	tipo="fil"
	end if
end if
Set fso = Nothing
Set f2 = Nothing
end if
else'ES UN VIDEO ENLAZADO
	ancho=0
	alto=0
	peso=0
	tipo="vid_enl"
end if
if orden_img_(i)<>"" then orden_img_(i)=orden_img_(i) else orden_img_(i)=1 end if
mySQL="INSERT INTO archivos (tipo,nombre,alt,campo,extension,peso,alto,ancho,banner,destacado,galeria,titulo_esp,resumen_esp,fecha_in,fecha_mod,orden,principal)" '[INSERTAMOS]
	mySQL=mySQL & "VALUES ("
	mySQL=mySQL & "'" & tipo & "',"
	mySQL=mySQL & "'" & archivo_(i) & "',"
	mySQL=mySQL & "'" & alt_(i) & "',"
	mySQL=mySQL & "'" & campo & "',"
	mySQL=mySQL & "'" & extension & "',"
	mySQL=mySQL & "'" & peso & "',"
	mySQL=mySQL & "" & alto & ","
	mySQL=mySQL & "" & ancho & ","
	mySQL=mySQL & "'" & banner & "',"
	mySQL=mySQL & "'" & destacado_(i) & "',"
	mySQL=mySQL & "'" & galeria & "',"
	mySQL=mySQL & "'" & titulo_esp & "',"
	mySQL=mySQL & "'" & resumen_esp & "',"
	mySQL=mySQL & "'" & fecha_in & "',"
	mySQL=mySQL & "'" & fecha_mod & "',"
	if campo<>"archivo_1" and campo<>"archivo_2" and campo<>"archivo_17" and campo<>"archivo_18" and campo<>"archivo_19" and  campo<>"archivo_20"   then
	mySQL=mySQL & "'" & orden_img_(i) + 2 & "',"
	else
	mySQL=mySQL & "'" & orden_img_(i) & "',"
	end if
	if i=1 then 
	mySQL=mySQL & "'si'"
	else
	mySQL=mySQL & "''"
	end if
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
set ob_rs = Ob_Conn.execute("select MAX(id_archivo) from archivos") 
id_archivo = ob_rs(0)
tipo_rel=tipo
mySQL="INSERT INTO rel (id_noticia,id_archivo,tipo_rel,fecha_in,fecha_mod)" '[RELACIONAMOS IMAGEN CON WEB]
	mySQL=mySQL & "VALUES ("
	mySQL=mySQL & "" & cod & ","
	mySQL=mySQL & "" & id_archivo & ","
	mySQL=mySQL & "'" & tipo_rel & "',"
	mySQL=mySQL & "'" & fecha_in & "',"
	mySQL=mySQL & "'" & fecha_mod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
else                                                     '[NO SUBE ARCHIVO PERO CAMBIA TITULO IMAGEN]
campo="archivo_"&i
Sql= "SELECT rel.id_archivo,rel.id_rel, rel.id_noticia, archivos.id_archivo, archivos.campo, archivos.orden from rel, archivos where rel.id_noticia="&cod&" and rel.id_archivo<>0 and archivos.id_archivo = rel.id_archivo "                           
Ob_Command.CommandText = Sql
SET Ob_RS3 = Ob_Command.Execute ()
if not ob_rs3.eof then
do while not ob_rs3.eof
id_archivo=ob_rs3("rel.id_archivo")
ordena=ob_rs3("orden")
	if orden_img_(i)<>""then
	mySQL="UPDATE archivos SET "
	mySQL=mySQL & "alt = '" & alt_(i) & "',"
	if campo<>"archivo_1" and campo<>"archivo_2" and campo<>"archivo_17" and campo<>"archivo_18" and campo<>"archivo_19" and  campo<>"archivo_20"   then
	mySQL=mySQL & "orden = '" & orden_img_(i) + 2 & "', "
	else
	mySQL=mySQL & "orden = '" & orden_img_(i) & "', "
	end if
	if i=1 then 
	mySQL=mySQL & "principal = 'si'"
	else
	mySQL=mySQL & "principal = ''"
	end if
	mySQL=mySQL & " WHERE campo = 'archivo_"&(i)&"' and id_archivo = "&id_archivo&"" 
	set ob_rs=Ob_Conn.execute(mySQL)
	end if
	ob_rs3.movenext
loop
end if
ob_rs3.close
end if                                                             '[FIN ELSE U] 
end if                                                '[SI HEMOS SELECCIONADO ELIMINAR IMAGEN] 
next												   '[FIN SUBIDA DE ARCHIVOS E IMAGENES 1]	

Sql= "SELECT rel.id_archivo,rel.id_rel, rel.id_noticia, archivos.id_archivo, archivos.campo, archivos.orden from rel, archivos where rel.id_noticia="&cod&" and rel.id_archivo<>0 and archivos.id_archivo = rel.id_archivo and (archivos.campo <> 'archivo_1' and archivos.campo <> 'archivo_2' and archivos.campo <> 'archivo_17' and archivos.campo <> 'archivo_18' and archivos.campo <> 'archivo_19' and archivos.campo <> 'archivo_20') order by archivos.orden"                           
Ob_Command.CommandText = Sql
SET Ob_RS3 = Ob_Command.Execute ()
if not ob_rs3.eof then
ord=3
do while not ob_rs3.eof
id_archivo=ob_rs3("rel.id_archivo")
	mySQL="UPDATE archivos SET "
	mySQL=mySQL & "campo = 'archivo_" & ord & "',"
	mySQL=mySQL & "orden = " & ord & ""
	mySQL=mySQL & " WHERE id_archivo = "&id_archivo&" " 
	set ob_rs=Ob_Conn.execute(mySQL)
	ob_rs3.movenext
	ord=ord+1
	loop
end if
ob_rs3.close


Sql= "SELECT id_noticia, titulo_esp from noticias where id_noticia="&cod&" "                    
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
m_item=ob_rs("titulo_esp") &" | "
end if
ob_rs.close

if meta_title<>""then 
meta_title=meta_title
else
meta_title= m_item
mySQL="UPDATE noticias SET "
mySQL=mySQL & "meta_title = '" & meta_title & "'"
mySQL=mySQL & " WHERE id_noticia = " & cod & "" 
set ob_rs=Ob_Conn.execute(mySQL)
end if
if meta_key<>""then 
meta_key=meta_key
else
meta_key= limpia_meta(m_item)
meta_key=replace(meta_key,", , ",",")
meta_key=replace(meta_key,",,",",")
mySQL="UPDATE noticias SET "
mySQL=mySQL & "meta_key = '" & meta_key & "'"
mySQL=mySQL & " WHERE id_noticia = " & cod & "" 
set ob_rs=Ob_Conn.execute(mySQL)
end if

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
ob_rs.close                                                   '[FIN REESCRITURA]
'REDIRECCIONAMOS
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&edi="&edi)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&edi="&edi) 
ob_conn.close%>
</body></html>
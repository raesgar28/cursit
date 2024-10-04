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
<%titulo_esp=trim(safeSTR(request("titulo_esp")))                          '[REQUEST]
titulo_crm_esp=trim(safeSTR(request("titulo_crm_esp")))
visible=request("visible")
disponible=request("disponible")
destacado=request("destacado")
id_web=request("id_web")
pres_medida=request("pres_medida")
url_esp=trim(safeSTR(request("url_esp")))
meta_title=trim(safeSTR(request("meta_title")))
meta_key=trim(safeSTR(request("meta_key")))
meta_desc=trim(safeSTR(request("meta_desc")))
texto_esp=safeSTR2(request("texto_esp"))
normas=safeSTR2(request("normas"))
normas_ob=request("normas_ob")
cerrado=request("cerrado")
	Dim archivo_(20),alt_(20), del_img_(20), destacado_(20), orden_img_(20)
	for i=1 to 20
	archivo_(i) = trim(request("archivo_[" & i &"]"))
	alt_(i) = trim(request("alt_[" & i & "]"))
	del_img_(i)=request("del_img_"& i)
	destacado_(i)=request("destacado_"& i)
	orden_img_(i) = trim(request("orden_img_[" & i &"]"))
	next
fecha_in=now
fecha_mod=now   
pr_reserva=trim(safeSTR(request("pr_reserva")))
If IsNumeric(pr_reserva) Then
pr_reserva=replace(pr_reserva,".","")
else
pr_reserva=0
end if
pr_medico=trim(safeSTR(request("pr_medico")))
If IsNumeric(pr_medico) Then
pr_medico=replace(pr_medico,".","")
else
pr_medico=0
end if
pr_cancelacion=trim(safeSTR(request("pr_cancelacion")))
If IsNumeric(pr_cancelacion) Then
pr_cancelacion=replace(pr_cancelacion,".","")
else
pr_cancelacion=0
end if

if meta_title<>""then 
meta_title=meta_title
else
meta_title= titulo_esp 
end if
if meta_key<>""then 
meta_key=meta_key
else
meta_key= limpia_meta(titulo_esp)
end if
orden_cat=request("orden_cat")
If IsNumeric(orden_cat) Then orden_cat=orden_cat else orden_cat=0 end if

seg_cancelacion=request("seg_cancelacion")
                                                   '[FIN REQUEST]
if op="up" then
Sql= "SELECT noticias.url_esp,generales.url_esp,items.url_esp,itemsSub.url_esp,categorias.url_esp,secciones.url_esp,subsecciones.url_esp,destinos.url_esp,ciudades.url_esp from noticias,generales,items,itemsSub,categorias,secciones,subsecciones,destinos,ciudades WHERE (categorias.url_esp ='"&url_esp&"' and id_categoria <> "&cod&") or (generales.url_esp = '"&url_esp&"' or items.url_esp= '"&url_esp&"' or itemsSub.url_esp = '"&url_esp&"' or noticias.url_esp = '"&url_esp&"' or secciones.url_esp= '"&url_esp&"' or subsecciones.url_esp = '"&url_esp&"' or destinos.url_esp = '"&url_esp&"' or ciudades.url_esp = '"&url_esp&"' )"   
else
Sql= "SELECT noticias.url_esp,generales.url_esp,items.url_esp,itemsSub.url_esp,categorias.url_esp,secciones.url_esp,subsecciones.url_esp,destinos.url_esp,ciudades.url_esp from noticias,generales,items,itemsSub,categorias,secciones,subsecciones,destinos,ciudades WHERE noticias.url_esp ='"&url_esp&"' or generales.url_esp = '"&url_esp&"' or items.url_esp= '"&url_esp&"' or itemsSub.url_esp = '"&url_esp&"' or categorias.url_esp = '"&url_esp&"' or secciones.url_esp= '"&url_esp&"' or subsecciones.url_esp = '"&url_esp&"' or destinos.url_esp = '"&url_esp&"' or ciudades.url_esp = '"&url_esp&"' "
end if
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
if op="up" then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&edi="&edi)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko") 
end if
if op="in" then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&edi="&edi)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&edi="&edi) 
end if
end if
ob_rs.close														'[FIN CHEQUEAMOS QUE URL NO DENTRO IN]
if op="in"then															 '[OPCION INSERTAR]
mySQL="INSERT INTO categorias (titulo_esp,texto_esp,url_esp,meta_title,meta_key,meta_desc,visible,fecha_in,disponible,destacado,pres_medida,titulo_crm_esp,pr_reserva,pr_medico,pr_cancelacion,orden,seg_cancelacion,normas,normas_ob,cerrado)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "'" & titulo_esp & "',"
	mySQL=mySQL & "'" & texto_esp & "',"
	mySQL=mySQL & "'" & limpia_url(url_esp) & "',"
	mySQL=mySQL & "'" & meta_title & "',"
	mySQL=mySQL & "'" & meta_key & "',"
	mySQL=mySQL & "'" & meta_desc & "',"
	mySQL=mySQL & "'" & visible & "',"
	mySQL=mySQL & "'" & fecha_in & "',"
	mySQL=mySQL & "'" & disponible & "',"
	mySQL=mySQL & "'" & destacado & "',"
	mySQL=mySQL & "'" & pres_medida & "',"
	mySQL=mySQL & "'" & titulo_crm_esp & "',"
	mySQL=mySQL & "'" & pr_reserva & "',"
	mySQL=mySQL & "'" & pr_medico & "',"
	mySQL=mySQL & "'" & pr_cancelacion & "',"
	mySQL=mySQL & "" & orden_cat & ","
	mySQL=mySQL & "'" & seg_cancelacion & "',"
	mySQL=mySQL & "'" & normas & "',"
	mySQL=mySQL & "'" & normas_ob & "',"
	mySQL=mySQL & "'" & cerrado & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
set ob_rs = Ob_Conn.execute("select MAX(id_categoria) from categorias") 
cod = ob_rs(0)
ob_rs.close
if id_web<>""then                                              '[RELACIONAMOS EN REL ID_WEB <> ID_CATEGORIA]
cadena_rel = split(id_web, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO rel (id_web,id_categoria)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "'" & cadena_rel(i) & "',"
	mySQL=mySQL & "'" & cod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
next
end if                                                       '[FIN RELACIONAMOS EN REL ID_WEB <> ID_CATEGORIA]

end if                                                            '[FIN OPCION INSERTAR]
if op="up"then                                                    '[OPCION MODIFICAR]
mySQL="UPDATE categorias SET "
mySQL=mySQL & "titulo_esp = '" & titulo_esp & "',"
mySQL=mySQL & "texto_esp = '" & texto_esp & "',"
mySQL=mySQL & "url_esp = '" & limpia_url(url_esp) & "',"
mySQL=mySQL & "meta_title = '" & meta_title & "',"
mySQL=mySQL & "meta_key = '" & meta_key & "',"
mySQL=mySQL & "meta_desc = '" & meta_desc & "',"
mySQL=mySQL & "visible = '" & visible & "',"
mySQL=mySQL & "destacado = '" & destacado & "',"
mySQL=mySQL & "disponible = '" & disponible & "',"
mySQL=mySQL & "pres_medida = '" & pres_medida & "',"
mySQL=mySQL & "titulo_crm_esp = '" & titulo_crm_esp & "',"
mySQL=mySQL & "pr_reserva = '" & pr_reserva & "',"
mySQL=mySQL & "pr_medico = '" & pr_medico & "',"
mySQL=mySQL & "pr_cancelacion = '" & pr_cancelacion & "',"
mySQL=mySQL & "orden = " & orden_cat & ","
mySQL=mySQL & "seg_cancelacion = '" & seg_cancelacion & "',"
mySQL=mySQL & "normas = '" & normas & "',"
mySQL=mySQL & "normas_ob = '" & normas_ob & "',"
mySQL=mySQL & "cerrado = '" & cerrado & "'"
mySQL=mySQL & " WHERE id_categoria = " & cod & "" 
set ob_rs=Ob_Conn.execute(mySQL)
if id_web<>""then                                              '[RELACIONAMOS EN REL ID_WEB <> ID_CATEGORIA]
mySQL="DELETE FROM rel where id_categoria =" & cod & " and id_web <> 0" 'ELIMINAMOS PRIMERO
set ob_rs=Ob_conn.execute(mySQL)
cadena_rel = split(id_web, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO rel (id_web,id_categoria)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "'" & cadena_rel(i) & "',"
	mySQL=mySQL & "'" & cod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
next
end if                                                       '[FIN RELACIONAMOS EN REL ID_WEB <> ID_CATEGORIA]
end if                                                           '[FIN OPCION MODIFICAR]


for i=1 to 20									      		  '[SUBIDA DE ARCHIVOS E IMAGENES HASTA 20]
if del_img_(i)<>"" then                                           '[SI HEMOS SELECCIONADO ELIMINAR IMAGEN] 
campo="archivo_"&i
Sql= "SELECT rel.id_archivo,rel.id_rel, rel.id_categoria, archivos.id_archivo, archivos.campo from rel, archivos where rel.id_categoria="&cod&" and rel.id_archivo<>0 and archivos.id_archivo = rel.id_archivo and archivos.campo ='"&campo&"'"                    
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
Sql= "SELECT rel.id_archivo,rel.id_rel, rel.id_categoria, archivos.id_archivo, archivos.campo from rel, archivos where rel.id_categoria="&cod&" and rel.id_archivo<>0 and archivos.id_archivo = rel.id_archivo and archivos.campo ='"&campo&"'"                           
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
mySQL="INSERT INTO rel (id_categoria,id_archivo,tipo_rel,fecha_in,fecha_mod)" '[RELACIONAMOS IMAGEN CON WEB]
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
Sql= "SELECT rel.id_archivo,rel.id_rel, rel.id_categoria, archivos.id_archivo, archivos.campo, archivos.orden from rel, archivos where rel.id_categoria="&cod&" and rel.id_archivo<>0 and archivos.id_archivo = rel.id_archivo "                           
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

Sql= "SELECT rel.id_archivo,rel.id_rel, rel.id_categoria, archivos.id_archivo, archivos.campo, archivos.orden from rel, archivos where rel.id_categoria="&cod&" and rel.id_archivo<>0 and archivos.id_archivo = rel.id_archivo and (archivos.campo <> 'archivo_1' and archivos.campo <> 'archivo_2' and archivos.campo <> 'archivo_17' and archivos.campo <> 'archivo_18' and archivos.campo <> 'archivo_19' and archivos.campo <> 'archivo_20') order by archivos.orden"                           
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


Sql= "SELECT id_categoria, url_esp from categorias"                            '[COMENZAMOS REESCRITURA]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
set fso = createobject("scripting.filesystemobject")
Set act = fso.CreateTextFile(server.mappath(rd&"mapas_url/categorias.txt"), true)
do while not ob_rs.eof
url = ob_rs("url_esp")
act.WriteLine ""&limpia_url(url)&" "&ob_rs("id_categoria")&"" 
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
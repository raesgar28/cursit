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
visible=request("visible")
categorias=request("categorias")
cursos_tipo=request("cursos_tipo")
cursos_tipo_sub=request("cursos_tipo_sub")
https=request("https")
texto_esp=trim(safeSTR2(request("texto_esp")))
f_smtp=trim(safeSTR(request("f_smtp")))
f_usuario=trim(safeSTR(request("f_usuario")))
f_pass=trim(request("f_pass"))
f_email=trim(request("f_email"))
f_puerto=trim(request("f_puerto"))
f_ssl=request("f_ssl")
f_texto_legal=trim(safeSTR(request("f_texto_legal")))
email=trim(request("email"))
direccion=trim(safeSTR(request("direccion")))
cod_postal=trim(request("cod_postal"))
ciudad=trim(safeSTR(request("ciudad")))
provincia=request("provincia")
pais=trim(safeSTR(request("pais")))
telefono=trim(safeSTR(request("telefono")))
url=trim(safeSTR(request("url")))
meta_title=trim(safeSTR(request("meta_title")))
meta_key=trim(safeSTR(request("meta_key")))
meta_desc=trim(safeSTR(request("meta_desc")))
datos_complementarios=trim(safeSTR(request("datos_complementarios")))
id_division=request("id_division")
principal=request("principal")
	Dim archivo_(20),alt_(20), del_img_(20), destacado_(20), orden_img_(20)
	for i=1 to 20
	archivo_(i) = trim(request("archivo_[" & i &"]"))
	alt_(i) = trim(request("alt_[" & i & "]"))
	del_img_(i)=request("del_img_"& i)
	destacado_(i)=request("destacado_"& i)
	orden_img_(i) = trim(request("orden_img_[" & i &"]"))
	next
fecha_in=now
fecha_mod=now                                                      '[FIN REQUEST]
if op="up" then
Sql= "SELECT url, titulo_esp, id_web from webs where (url='"&url&"' or titulo_esp='"&titulo_esp&"') and id_web <> "&cod&" "     '[CHEQUEAMOS QUE URL NO DENTRO UP]
else
Sql= "SELECT url, titulo_esp from webs where url='"&url&"' or titulo_esp='"&titulo_esp&"'"   '[CHEQUEAMOS QUE URL NO I            
end if
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
if op="up" then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&edi="&edi)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&edi="&edi) 
end if
if op="in" then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&edi="&edi)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko") 
end if
end if
ob_rs.close														'[FIN CHEQUEAMOS QUE URL NO DENTRO IN]
if op="in"then															 '[OPCION INSERTAR]
Sql= "SELECT principal from webs where principal='si'" 'CHEQUEAMOS PARA PRINCIPAL
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
	if principal="si" then
	mySQL="UPDATE webs SET "
	mySQL=mySQL & "principal = 'no'"'mySQL=mySQL & " WHERE campo = 'archivo_"&(i)&"' " 
	set ob_rs=Ob_Conn.execute(mySQL)
	end if
	else
	principal="si" 
end if
ob_rs.close
mySQL="INSERT INTO webs (titulo_esp,texto_esp,url,categorias,cursos_tipo,cursos_tipo_sub,meta_title,meta_key,meta_desc,visible,fecha_in,https,f_smtp,f_usuario,f_pass,f_email,f_puerto,f_ssl,f_texto_legal,email,direccion,cod_postal,ciudad,provincia,pais,telefono,datos_complementarios,principal)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "'" & titulo_esp & "',"
	mySQL=mySQL & "'" & texto_esp & "',"
	mySQL=mySQL & "'" & url & "',"
	mySQL=mySQL & "'" & categorias & "',"
	mySQL=mySQL & "'" & cursos_tipo & "',"
	mySQL=mySQL & "'" & cursos_tipo_sub & "',"
	mySQL=mySQL & "'" & meta_title & "',"
	mySQL=mySQL & "'" & meta_key & "',"
	mySQL=mySQL & "'" & meta_desc & "',"
	mySQL=mySQL & "'" & visible & "',"
	mySQL=mySQL & "'" & fecha_in & "',"
	mySQL=mySQL & "'" & https & "',"
	mySQL=mySQL & "'" & f_smtp & "',"
	mySQL=mySQL & "'" & f_usuario & "',"
	mySQL=mySQL & "'" & f_pass & "',"
	mySQL=mySQL & "'" & f_email & "',"
	mySQL=mySQL & "'" & f_puerto & "',"
	mySQL=mySQL & "'" & f_ssl & "',"
	mySQL=mySQL & "'" & f_texto_legal & "',"
	mySQL=mySQL & "'" & email & "',"
	mySQL=mySQL & "'" & direccion & "',"
	mySQL=mySQL & "'" & cod_postal & "',"
	mySQL=mySQL & "'" & ciudad & "',"
	mySQL=mySQL & "'" & provincia & "',"
	mySQL=mySQL & "'" & pais & "',"
	mySQL=mySQL & "'" & telefono & "',"
	mySQL=mySQL & "'" & datos_complementarios & "',"
	mySQL=mySQL & "'" & principal & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
set ob_rs = Ob_Conn.execute("select MAX(id_web) from webs") 
cod = ob_rs(0)
ob_rs.close
if id_division<>""then                                              '[RELACIONAMOS EN REL ID_DIVISION <> ID_WEB]
cadena_rel = split(id_division, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO rel (id_division,id_web)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "'" & cadena_rel(i) & "',"
	mySQL=mySQL & "'" & cod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
next
end if                                                       '[FIN RELACIONAMOS EN REL ID_WEB <> ID_CATEGORIA]
end if                                                            '[FIN OPCION INSERTAR]
if op="up"then                                                    '[OPCION MODIFICAR]
Sql= "SELECT principal from webs where principal='si'" 'CHEQUEAMOS PARA PRINCIPAL
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
	if principal="si" then
	mySQL="UPDATE webs SET "
	mySQL=mySQL & "principal = 'no'"'mySQL=mySQL & " WHERE campo = 'archivo_"&(i)&"' " 
	set ob_rs=Ob_Conn.execute(mySQL)
	end if
	else
	principal="si" 
end if
'ob_rs.close
mySQL="UPDATE webs SET "
mySQL=mySQL & "titulo_esp = '" & titulo_esp & "',"
mySQL=mySQL & "texto_esp = '" & texto_esp & "',"
mySQL=mySQL & "url = '" & url & "',"
mySQL=mySQL & "categorias = '" & categorias & "',"
mySQL=mySQL & "cursos_tipo = '" & cursos_tipo & "',"
mySQL=mySQL & "cursos_tipo_sub = '" & cursos_tipo_sub & "',"
mySQL=mySQL & "meta_title = '" & meta_title & "',"
mySQL=mySQL & "meta_key = '" & meta_key & "',"
mySQL=mySQL & "meta_desc = '" & meta_desc & "',"
mySQL=mySQL & "visible = '" & visible & "',"
mySQL=mySQL & "https = '" & https & "',"
mySQL=mySQL & "f_smtp = '" & f_smtp & "',"
mySQL=mySQL & "f_usuario = '" & f_usuario & "',"
mySQL=mySQL & "f_pass = '" & f_pass & "',"
mySQL=mySQL & "f_email = '" & f_email & "',"
mySQL=mySQL & "f_puerto = '" & f_puerto & "',"
mySQL=mySQL & "f_ssl = '" & f_ssl & "',"
mySQL=mySQL & "f_texto_legal = '" & f_texto_legal & "',"
mySQL=mySQL & "email = '" & email & "',"
mySQL=mySQL & "direccion = '" & direccion & "',"
mySQL=mySQL & "cod_postal = '" & cod_postal & "',"
mySQL=mySQL & "ciudad = '" & ciudad & "',"
mySQL=mySQL & "provincia = '" & provincia & "',"
mySQL=mySQL & "pais = '" & pais & "',"
mySQL=mySQL & "telefono = '" & telefono & "',"
mySQL=mySQL & "datos_complementarios = '" & datos_complementarios & "',"
mySQL=mySQL & "principal = '" & principal & "'"
mySQL=mySQL & " WHERE id_web = " & cod & "" 
set ob_rs=Ob_Conn.execute(mySQL)
if id_division<>""then                                              '[RELACIONAMOS EN REL ID_WEB <> ID_CATEGORIA]
mySQL="DELETE FROM rel where id_web =" & cod & " and id_division <> 0" 'ELIMINAMOS PRIMERO
set ob_rs=Ob_conn.execute(mySQL)
cadena_rel = split(id_division, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO rel (id_division,id_web)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "'" & cadena_rel(i) & "',"
	mySQL=mySQL & "'" & cod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
next
end if                                                       '[FIN RELACIONAMOS EN REL ID_WEB <> ID_CATEGORIA]
end if                                                           '[FIN OPCION MODIFICAR]



if principal="si" then
mySQL="UPDATE webs SET "
mySQL=mySQL & "principal = 'no'"
mySQL=mySQL & " WHERE id_web <> " & cod & "" 
end if


for i=1 to 20									      		  '[SUBIDA DE ARCHIVOS E IMAGENES HASTA 20]
if del_img_(i)<>"" then                                           '[SI HEMOS SELECCIONADO ELIMINAR IMAGEN] 
campo="archivo_"&i
Sql= "SELECT rel.id_archivo,rel.id_rel, rel.id_web, archivos.id_archivo, archivos.campo from rel, archivos where rel.id_web="&cod&" and rel.id_archivo<>0 and archivos.id_archivo = rel.id_archivo and archivos.campo ='"&campo&"'"                    
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
if archivo_(i)<>"" and archivo_(i)<>"," then                                                      '[SI EL ARCHIVO TIENE ALGO] 
campo="archivo_"&i
Sql= "SELECT rel.id_archivo,rel.id_rel, rel.id_web, archivos.id_archivo, archivos.campo from rel, archivos where rel.id_web="&cod&" and rel.id_archivo<>0 and archivos.id_archivo = rel.id_archivo and archivos.campo ='"&campo&"'"                           
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
Set f2 = Nothing    '[INSERTAMOS]
mySQL="INSERT INTO archivos (tipo,nombre,alt,campo,extension,peso,alto,ancho,banner,destacado,galeria,titulo_esp,resumen_esp,fecha_in,fecha_mod,orden,principal)" 
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
mySQL="INSERT INTO rel (id_web,id_archivo,tipo_rel,fecha_in,fecha_mod)" '[RELACIONAMOS IMAGEN CON WEB]
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
Sql= "SELECT rel.id_archivo,rel.id_rel, rel.id_web, archivos.id_archivo, archivos.campo, archivos.orden from rel, archivos where rel.id_web="&cod&" and rel.id_archivo<>0 and archivos.id_archivo = rel.id_archivo "                           
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
end if                                                           '[FIN ELSE U] 
end if                                                       '[SI HEMOS SELECCIONADO ELIMINAR IMAGEN] 
next														  '[FIN SUBIDA DE ARCHIVOS E IMAGENES 1]	
'REDIRECCIONAMOS
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&edi="&edi)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&edi="&edi) 
ob_conn.close%>
</body></html>
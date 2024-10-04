<%Session.Timeout=45
if no_estil<>"si" then
n=request("n")
ndos=request("ndos")
ntres=request("ntres")
ncuat=request("ncuat")
op=request("op")
cod=request("cod")
cod_prog=request("cod_prog")
ms=request("ms")
msc=request("msc")
msd=request("msd")
cod_cat=request("cod_cat")
edi=request("edi")
t=request("t")
if n ="" then n = request_equerystring("n")
if ndos ="" then ndos = request_equerystring("ndos")
if ntres ="" then ntres = request_equerystring("ntres")
if ncuat ="" then ncuat = request_equerystring("ncuat")
if op ="" then op = request_equerystring("op")
if cod ="" then cod = request_equerystring("cod")
if cod_prog ="" then cod_prog = request_equerystring("cod_prog")
if ms ="" then ms = request_equerystring("ms")
if msc ="" then msc = request_equerystring("msc")
if msd="" then msd = request_equerystring("msd")
if cod_cat ="" then cod_cat = request_equerystring("cod_cat")
if edi ="" then edi = request_equerystring("edi")
if t ="" then t = request_equerystring("t")
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
'nombre_lk = replace(nombre_lk, " de ","-")
'nombre_lk = replace(nombre_lk, " para ","-")
'nombre_lk = replace(nombre_lk, " por ","-")
'nombre_lk = replace(nombre_lk, " desde ","-")
'nombre_lk = replace(nombre_lk, " la ","-")
'nombre_lk = replace(nombre_lk, " el ","-")
'nombre_lk = replace(nombre_lk, " entre ","-")
'nombre_lk = replace(nombre_lk, "-de-","-")
'nombre_lk = replace(nombre_lk, "-para-","-")
'nombre_lk = replace(nombre_lk, "-por-","-")
'nombre_lk = replace(nombre_lk, "-desde-","-")
'nombre_lk = replace(nombre_lk, "-la-","-")
'nombre_lk = replace(nombre_lk, "-el-","-")
'nombre_lk = replace(nombre_lk, "-entre-","-")
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
function limpia_meta(cadena_uli)
nombre_li = server.HTMLEncode(cadena_uli)
nombre_li = cadena_uli
if len(nombre_li) <> 0 then
nombre_li = replace(nombre_li, " · "," ")
nombre_li = replace(nombre_li, "&#241;","n")
nombre_li = replace(nombre_li, "&#209;","n")
nombre_li = replace( nombre_li, chr(39), "" )  '
nombre_li = replace( nombre_li, "&#39;", "" ) 
'nombre_lk = replace(nombre_lk, "&","y")
nombre_li = replace(nombre_li, "&amp;","y")
nombre_li = replace(nombre_li, "."," ")
nombre_li = replace(nombre_li, " para ","")
nombre_li = replace(nombre_li, " de ","")
nombre_li = replace(nombre_li, " por ","")
nombre_li = replace(nombre_li, " cms","")
nombre_li = replace(nombre_li, " x ","")
nombre_li = replace(nombre_li, " | ","")
nombre_li = lcase(nombre_li)
end if
limpia_meta=nombre_li
end function
function completa0(str)
dim output
output = str
if len(output)=1 then output="0"&output end if
completa0= output
end function


Sql= "SELECT id_division from divisiones"     '[TOTAL DIVISIONES]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_dv=ob_rs.RecordCount
end if
ob_rs.close


Sql= "SELECT id_web from webs"     '[TOTAL WEBS]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_w=ob_rs.RecordCount
end if
ob_rs.close
Sql= "SELECT id_categoria from categorias"     '[TOTAL CATEGORIAS]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_c=ob_rs.RecordCount
end if
ob_rs.close
Sql= "SELECT id_seccion from secciones"     '[TOTAL SECCIONES]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_s=ob_rs.RecordCount
end if
ob_rs.close
Sql= "SELECT cursos_tipo_sub from webs where principal='si'"     '[Subsecciones muestra]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
subseccion_on=ob_rs("cursos_tipo_sub")
end if
ob_rs.close
if subseccion_on="si"then
Sql= "SELECT id_subseccion from subsecciones"     '[TOTAL subSECCIONES]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_ss=ob_rs.RecordCount
end if
ob_rs.close
end if
if cod_cat<>"" then
Sql= "SELECT rel.id_item, id_categoria from rel, items where id_categoria ="&cod_cat&" and rel.id_item<>0 and rel.id_item=items.id_item and (eliminado IS NULL or eliminado='')group by rel.id_item, id_categoria"     '[TOTAL PROGRAMAS - ITEMS]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_pp=ob_rs.RecordCount
num_it=num_pp
end if
ob_rs.close
else
Sql= "SELECT rel.id_item, id_categoria from rel, items where id_categoria <> 0 and rel.id_item<>0 and rel.id_item=items.id_item and (eliminado IS NULL or eliminado='') group by rel.id_item, id_categoria"     '[TOTAL PROGRAMAS - ITEMS]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_pp=ob_rs.RecordCount
num_it=num_pp
end if
ob_rs.close
end if
Sql= "SELECT id_aeropuerto from aeropuertos"     '[TOTAL AEROPUERTOS]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_ar=ob_rs.RecordCount
end if
ob_rs.close
Sql= "SELECT id_noticia from noticias"     '[TOTAL NOTICIAS]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_nt=ob_rs.RecordCount
end if
ob_rs.close
Sql= "SELECT id_idioma from idiomas"     '[TOTAL IDIOMAS]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_id=ob_rs.RecordCount
end if
ob_rs.close
Sql= "SELECT id_destino from destinos"     '[TOTAL DESTINOS]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_dt=ob_rs.RecordCount
end if
ob_rs.close
Sql= "SELECT id_ciudad from ciudades"     '[TOTAL CIUDADES]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_ci=ob_rs.RecordCount
end if
ob_rs.close
Sql= "SELECT id_alo_tipo from alo_tipo"     '[TOTAL TIPOS ALOJAMIENTO]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_al=ob_rs.RecordCount
end if
ob_rs.close
Sql= "SELECT id_alo_op from alo_op"     '[TOTAL OPCIONES ALOJAMIENTO]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_oa=ob_rs.RecordCount
end if
ob_rs.close
Sql= "SELECT id_quincena from quincenas"     '[TOTAL QUINCENAS]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_qu=ob_rs.RecordCount
end if
ob_rs.close
if cod="" and cod_prog<>"" and check="" then                                             'CHECK ES POR ACCIONES
Sql= "SELECT id_item, id_itemSub from rel where id_item="&cod_prog&" and id_itemSub<>0"     '[TOTAL CURSOS * PROGRAMA]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_cc=ob_rs.RecordCount
end if
ob_rs.close
end if
if cod<>"" and cod_prog<>"" and check="" then                                             'CHECK ES POR ACCIONES
Sql= "SELECT id_item, id_itemSub from rel where id_item="&cod_prog&" and id_itemSub<>0"     '[TOTAL CURSOS * PROGRAMA]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_cc=ob_rs.RecordCount
end if
ob_rs.close
end if
if cod<>"" and cod_prog="" and check="" and ndos<>"mp" then
Sql= "SELECT id_item, id_itemSub from rel where id_item="&cod&" and id_itemSub<>0"     '[TOTAL CURSOS * PROGRAMA]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_cc=ob_rs.RecordCount
end if
ob_rs.close
end if
if ndos="pg" then
Sql= "SELECT id_general from generales"     '[TOTAL CURSOS * PROGRAMA]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_pg=ob_rs.RecordCount
end if
ob_rs.close
end if
if ndos="fl" then
Sql= "SELECT id_fluctuacion from fluctuaciones"     '[TOTAL CURSOS * PROGRAMA]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_fl=ob_rs.RecordCount
end if
ob_rs.close
end if
if cod<>"" and cod_prog="" and check=""  and ndos<>"mp" then                                             'CHECK ES POR ACCIONES
Sql= "SELECT id_item, id_alojamiento from rel where id_item="&cod&" and id_alojamiento<>0 group by id_alojamiento, id_item"     '[TOTAL ALOJAMIENTS * PROGRAMA]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_ca=ob_rs.RecordCount
end if
ob_rs.close
end if

end if'no_estil

if session("admin")<>"" and accion="" and op="" then
Sql= "SELECT * FROM admins where id_admin="&session("admin")&"  " 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
nombre_us=ob_rs("nombre")
pr_academia_ad=ob_rs("pr_academia")
pr_cursos_ad=ob_rs("pr_cursos")
pr_alumnos_ad=ob_rs("pr_alumnos")
pr_contabilidad_ad=ob_rs("pr_contabilidad")
pr_precio_real_ad=ob_rs("pr_precio_real")
pr_datos_comunes_ad=ob_rs("pr_datos_comunes")
pr_cat_sec_ad=ob_rs("pr_cat_sec")
pr_fluctuaciones_ad=ob_rs("pr_fluctuaciones")
pr_proveedores_ad=ob_rs("pr_proveedores")
pr_admin_ad=ob_rs("pr_admin")
pr_menu_ad=ob_rs("pr_menu")
pr_paginas_ad=ob_rs("pr_paginas")
pr_comunicados_ad=ob_rs("pr_comunicados")
pr_datos_gestion_ad=ob_rs("pr_datos_gestion")
pr_usuarios_crm_ad=ob_rs("pr_usuarios_crm")
pr_factura_ad=ob_rs("pr_factura")
pr_opciones_ad=ob_rs("pr_opciones")
principal=ob_rs("principal")
pr_observaciones=ob_rs("pr_observaciones")
end if
ob_rs.close

Sql= "SELECT nombre FROM adminsArchivos where id_admin="&session("admin")&"  " 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
imagen_us=ob_rs("nombre")
end if
ob_rs.close
end if%>
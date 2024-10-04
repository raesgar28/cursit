<%aPath = Split("/" & Request.ServerVariables("PATH_INFO"), "/")
pagina = aPath(UBound(aPath))
Session.Timeout = 60
id_item=request("id_item")
id_general=request("id_general")
id_categoria=request("id_categoria")
id_noticia=request("id_noticia")
id_destino=request("id_destino")
id_ciudad=request("id_ciudad")
tipo_pg=request("tipo_pg")
if lcase(pagina)="index.asp"then 
tipo_pg="hm" 
Sql= "SELECT meta_title,meta_key,meta_desc,texto_esp FROM webs WHERE principal='si'" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
meta_title=ob_rs("meta_title")
meta_key=ob_rs("meta_key")
meta_desc=ob_rs("meta_desc")
h1_title=ob_rs("texto_esp")
end if
ob_rs.close
end if
Sql= "SELECT titulo_esp, url, id_web,texto_esp,email,direccion,cod_postal,ciudad,provincia,pais,telefono,datos_complementarios FROM webs WHERE principal='si'" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
titulo_esp_web=ob_rs("titulo_esp")
url_web=ob_rs("url")
id_web=ob_rs("id_web")
texto_esp_web=ob_rs("texto_esp")
email=ob_rs("email")
direccion=ob_rs("direccion")
cod_postal=ob_rs("cod_postal")
ciudad=ob_rs("ciudad")
provincia=ob_rs("provincia")
pais=ob_rs("pais")
telefono=ob_rs("telefono")
datos_complementarios=ob_rs("datos_complementarios")
end if
ob_rs.close
if id_web<>""then
Sql= "SELECT id_web, id_division FROM rel WHERE id_web="&id_web&" and id_division<>0" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
id_division=ob_rs("id_division")
end if
ob_rs.close
end if
if id_division<>"" then
Sql= "SELECT titulo_esp FROM divisiones WHERE id_division="&id_division&"" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
titulo_esp_div=ob_rs("titulo_esp")
end if
ob_rs.close
end if
if id_item<>""then
Sql= "SELECT * FROM items WHERE id_item="&id_item&"" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
banner_res=ob_rs("resumen_esp")
titulo_esp=ob_rs("titulo_esp")
url_esp=ob_rs("url_esp")
texto_esp=ob_rs("texto_esp")
visible=ob_rs("visible")
disponible=ob_rs("disponible")
completo=ob_rs("completo")
tab_1_titulo_esp=ob_rs("tab_1_titulo_esp")
tab_1_act=ob_rs("tab_1_act")
tab_1_texto_esp=ob_rs("tab_1_texto_esp")
tab_2_titulo_esp=ob_rs("tab_2_titulo_esp")
tab_2_act=ob_rs("tab_2_act")
tab_2_texto_esp=ob_rs("tab_2_texto_esp")
tab_3_titulo_esp=ob_rs("tab_3_titulo_esp")
tab_3_act=ob_rs("tab_3_act")
tab_3_texto_esp=ob_rs("tab_3_texto_esp")
tab_4_titulo_esp=ob_rs("tab_4_titulo_esp")
tab_4_act=ob_rs("tab_4_act")
tab_4_texto_esp=ob_rs("tab_4_texto_esp")
tab_5_titulo_esp=ob_rs("tab_5_titulo_esp")
tab_5_act=ob_rs("tab_5_act")
tab_5_texto_esp=ob_rs("tab_5_texto_esp")
tab_6_titulo_esp=ob_rs("tab_6_titulo_esp")
tab_6_act=ob_rs("tab_6_act")
tab_6_texto_esp=ob_rs("tab_6_texto_esp")
meta_title=ob_rs("meta_title")
meta_key=ob_rs("meta_key")
meta_desc=ob_rs("meta_desc")
escuela_tam=ob_rs("escuela_tam")
alo_fam=ob_rs("alo_fam")
alo_res=ob_rs("alo_res")
alo_apa=ob_rs("alo_apa")
wifi=ob_rs("wifi")
tel_24=ob_rs("tel_24")
vuelo=ob_rs("vuelo")
c_inten=ob_rs("c_inten")
c_semi=ob_rs("c_semi")
c_gene=ob_rs("c_gene")
monitor=ob_rs("monitor")
privado=ob_rs("privado")
pr_actualizado=ob_rs("pr_actualizado")
anyo_actualizado=ob_rs("anyo_actualizado")
oferta=ob_rs("oferta")
campamento=ob_rs("campamento")
moneda=ob_rs("moneda")
ejecutivos=ob_rs("ejecutivos")
alo_hot=ob_rs("alo_hot")
multialumno=ob_rs("multialumno")
pre_medida=ob_rs("pre_medida")
seg_medico=ob_rs("seg_medico")
material=ob_rs("material")
uniforme=ob_rs("uniforme")
datos_familia_ob=ob_rs("datos_familia_ob")
alo_hos=ob_rs("alo_hos")
act_inc=ob_rs("act_inc")
sup_dest=ob_rs("sup_dest")
format_sem=ob_rs("format_sem")
pre_medida=ob_rs("pre_medida")
gen_mail=ob_rs("gen_mail")
edad_bot=ob_rs("edad_bot")
ed_desde=ob_rs("ed_desde")
ed_hasta=ob_rs("ed_hasta")
end if
ob_rs.close
Sql= "SELECT rel.id_archivo, rel.id_item, archivos.id_archivo, archivos.campo,archivos.nombre,archivos.alt FROM rel, archivos WHERE rel.id_item="&id_item&" and rel.id_archivo<>0 and rel.id_archivo=archivos.id_archivo and archivos.campo='archivo_2'" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
ruta_banner=ob_rs("nombre")
alt=ob_rs("alt")
alt_banner=ob_rs("alt")
ob_rs.close
end if
end if
if id_general<>"" or tipo_pg<>"" then
if id_general<>""then
Sql= "SELECT titulo_esp, texto_esp, visible,meta_title, meta_key,meta_desc, tipo,url_esp,texto_esp2, id_general,pr_team,id_formulario FROM generales WHERE id_general="&id_general&"" 
else
Sql= "SELECT titulo_esp, texto_esp, visible,meta_title, meta_key,meta_desc, tipo,url_esp,texto_esp2, id_general,pr_team,id_formulario FROM generales WHERE tipo='"&tipo_pg&"'" 
end if
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
id_general=ob_rs("id_general")
titulo_esp=ob_rs("titulo_esp")
texto_esp=ob_rs("texto_esp")
texto_esp2=ob_rs("texto_esp2")
visible=ob_rs("visible")
meta_title=ob_rs("meta_title")
meta_key=ob_rs("meta_key")
meta_desc=ob_rs("meta_desc")
tipo=ob_rs("tipo")
url_general=ob_rs("url_esp")
pr_team=ob_rs("pr_team")
id_formulario=ob_rs("id_formulario")
end if
ob_rs.close
if id_general<>"" then
Sql= "SELECT rel.id_archivo, rel.id_general, archivos.id_archivo, archivos.campo,archivos.nombre,archivos.alt FROM rel, archivos WHERE rel.id_general="&id_general&" and rel.id_archivo<>0 and rel.id_archivo=archivos.id_archivo and archivos.campo='archivo_2'" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
ruta_banner=ob_rs("nombre")
alt=ob_rs("alt")
alt_banner=ob_rs("alt")
end if
ob_rs.close
end if
end if
if id_noticia<>""then
Sql= "SELECT titulo_esp, texto_esp2, visible,meta_title, meta_key,meta_desc, url_esp, fecha_in,texto_esp FROM noticias WHERE id_noticia="&id_noticia&"" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
titulo_esp=ob_rs("titulo_esp")
texto_esp=ob_rs("texto_esp2")
resumen_esp=ob_rs("texto_esp")
visible=ob_rs("visible")
meta_title=ob_rs("meta_title")
meta_key=ob_rs("meta_key")
meta_desc=ob_rs("meta_desc")
url_general=ob_rs("url_esp")
fecha_in=ob_rs("fecha_in")
end if
ob_rs.close
Sql= "SELECT rel.id_archivo, rel.id_general, archivos.id_archivo, archivos.campo,archivos.nombre,archivos.alt FROM rel, archivos WHERE rel.id_noticia="&id_noticia&" and rel.id_archivo<>0 and rel.id_archivo=archivos.id_archivo and archivos.campo='archivo_2'" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
ruta_banner=ob_rs("nombre")
alt=ob_rs("alt")
alt_banner=ob_rs("alt")
end if
ob_rs.close
end if
if id_categoria<>"" and id_item="" then
Sql= "SELECT titulo_esp, url_esp,meta_title,meta_desc,meta_key FROM categorias WHERE id_categoria="&id_categoria&"" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
titulo_esp_cat=ob_rs("titulo_esp")
url_esp_cat=ob_rs("url_esp")
meta_title=ob_rs("meta_title")
meta_desc=ob_rs("meta_desc")
meta_key=ob_rs("meta_key")
end if
ob_rs.close
end if
if id_categoria="" and id_item<>"" then
Sql= "SELECT id_categoria FROM rel WHERE id_item="&id_item&" and id_categoria<>0" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
id_categoria=ob_rs("id_categoria")
end if
ob_rs.close
end if
if id_destino<>"" and id_item="" then
Sql= "SELECT meta_title,meta_desc,meta_key FROM destinos WHERE id_destino="&id_destino&"" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
meta_title=ob_rs("meta_title")
meta_desc=ob_rs("meta_desc")
meta_key=ob_rs("meta_key")
end if
ob_rs.close
end if
if id_ciudad<>"" and id_item="" then
Sql= "SELECT meta_title,meta_desc,meta_key,texto_esp FROM ciudades WHERE id_ciudad="&id_ciudad&"" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
meta_title=ob_rs("meta_title")
meta_desc=ob_rs("meta_desc")
meta_key=ob_rs("meta_key")
texto_esp_ciu=ob_rs("texto_esp")
end if
ob_rs.close
end if
Sql= "SELECT * FROM redes" 'REDES /////////////////////
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
rd_facebook=ob_rs("rd_facebook")
rd_twitter=ob_rs("rd_twitter")
rd_youtube=ob_rs("rd_youtube")
rd_pinterest=ob_rs("rd_pinterest")
rd_blog=ob_rs("rd_blog")
rd_linkedin=ob_rs("rd_linkedin")
rd_instagram=ob_rs("rd_instagram")
rd_tumblr=ob_rs("rd_tumblr")
rd_flickr=ob_rs("rd_flickr")
rd_reddit=ob_rs("rd_reddit")
rd_google_plus=ob_rs("rd_google_plus")
end if
ob_rs.close
if pagina="listado.asp" and meta_title="" then
meta_title="Resultado listado cursos de idiomas en el extranjero | Cursit Idiomas"
meta_key="cursos, idiomas, extranjero, idiomas extranjero, idiomas jovenes"
meta_desc="Listado de cursos de idiomas en el extranjero para jóvenes, adultos y años académicos completos."
end if
if pagina="z_validar.asp"then
meta_title="Registro de usuario | Cursit Idiomas"
meta_key="cursos, idiomas, extranjero, idiomas extranjero, idiomas jovenes"
meta_desc="Registro de usuario para cursos de idiomas en el extranjero para jóvenes, adultos y años académicos completos."
end if
if pagina="z_rec_pass.asp"then
meta_title="Recuperar contraseña | Cursit Idiomas"
meta_key="cursos, idiomas, extranjero, idiomas extranjero, idiomas jovenes"
meta_desc="Recuperar contraseña."
end if
if meta_title="" then meta_title="Cursit Idiomas" end if
if ruta_banner<>""then ruta_banner=ruta_banner else ruta_banner=r&"web/lib/img/banner_comun.jpg" end if '[FALTA] QUE SEA SELECCIONABLE DESDE CRM%>
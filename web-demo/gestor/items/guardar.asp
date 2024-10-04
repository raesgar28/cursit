<!DOCTYPE html><!--[if IE 8]><html lang="es-es" class="ie8 no-js"><![endif]--><!--[if IE 9]><html lang="es-es" class="ie9 no-js"><![endif]--><!--[if !IE]><!--><html lang="es-es"><!--<![endif]--><head><meta charset="utf-8" /></head><body>
<!--#INCLUDE file="../lib/asp/cifra.asp"-->
<%ver=request("ver")
r=request("r")
rd=request("rd")
n=request("n")
ndos=request("ndos")
ntres=request("ntres")
ncuat=request("ncuat")
op=request("op")
cod=request("cod")
cod_cat=request("cod_cat")%>
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../lib/asp/comun.asp"-->
<%titulo_esp=trim(safeSTR(request("titulo_esp")))
titulo_of_esp=trim(safeSTR(request("titulo_of_esp")))
resumen_esp=trim(safeSTR(request("resumen_esp")))
texto_esp=trim(safeSTR(request("texto_esp")))
visible=request("visible")
en_menu=request("en_menu")
disponible=request("disponible")
destacado=request("destacado")
privado=request("privado")
pre_medida=request("pre_medida")
multi=request("multi")
pr_actualizado=request("pr_actualizado")
anyo_actualizado=request("anyo_actualizado")
If IsNumeric(anyo_actualizado) Then
anyo_actualizado=replace(anyo_actualizado,".","")
anyo_actualizado=replace(anyo_actualizado,",","")
else
anyo_actualizado=0
end if
completo=request("completo")
oferta=request("oferta")
id_seccion=request("id_seccion")
'If IsNumeric(id_seccion) Then id_seccion=id_seccion else id_seccion=0 end if
id_subseccion=request("id_subseccion")
'If IsNumeric(id_subseccion) Then id_subseccion=id_subseccion else id_subseccion=0 end if
id_destino=request("id_destino")
If IsNumeric(id_destino) Then id_destino=id_destino else id_destino=0 end if
id_idioma=request("id_idioma")
'If IsNumeric(id_idioma) Then id_idioma=id_idioma else id_idioma=0 end if
id_proveedor=request("id_proveedor")
If IsNumeric(id_proveedor) Then id_proveedor=id_proveedor else id_proveedor=0 end if
id_ciudad=request("id_ciudad")
If IsNumeric(id_ciudad) or id_ciudad<> "" Then id_ciudad=id_ciudad else id_ciudad=0 end if
if id_ciudad="" then id_ciudad=0
pr_reserva=request("pr_reserva")
If IsNumeric(pr_reserva) Then pr_reserva=replace(pr_reserva,".","") else pr_reserva=0 end if
pr_reserva_ob=request("pr_reserva_ob")
pr_medico=request("pr_medico")
If IsNumeric(pr_medico) Then pr_medico=replace(pr_medico,".","") else pr_medico=0 end if
pr_medico_ob=request("pr_medico_ob")
pr_cancelacion=request("pr_cancelacion")
If IsNumeric(pr_cancelacion) Then pr_cancelacion=replace(pr_cancelacion,".","") else pr_cancelacion=0 end if
pr_cancelacion_ob=request("pr_cancelacion_ob")
tasas_aerop=request("tasas_aerop")
If IsNumeric(tasas_aerop) Then tasas_aerop=replace(tasas_aerop,".","") else tasas_aerop=0 end if
tasas_aerop_ob=request("tasas_aerop_ob")
tipoCambio=trim(safeSTR(request("tipoCambio")))
ed_desde=request("ed_desde")
If IsNumeric(ed_desde) Then ed_desde=ed_desde else ed_desde=0 end if
ed_hasta=request("ed_hasta")
If IsNumeric(ed_hasta) Then ed_hasta=ed_hasta else ed_hasta=0 end if
escuela_tam=request("escuela_tam")
if op="in"then
if id_proveedor<>0 and id_proveedor<>"" then
Sql= "SELECT id_proveedor, escuela_tam from proveedores where id_proveedor="&id_proveedor&" " 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
escuela_tam=ob_rs("escuela_tam")
end if
ob_rs.close
else
escuela_tam="m"
end if
end if
id_item_rel=request("id_item_rel")
'If IsNumeric(id_item_rel) Then id_item_rel=id_item_rel else id_item_rel=0 end if
orden=request("orden_prog")
If IsNumeric(orden) Then orden=orden else orden=0 end if
moneda=request("moneda")
alo_fam=request("alo_fam")
alo_res=request("alo_res")
alo_apa=request("alo_apa")
wifi=request("wifi")
tel_24=request("tel_24")
vuelo=request("vuelo")
alo_hos=request("alo_hos")
act_inc=request("act_inc")
c_inten=request("c_inten")
c_semi=request("c_semi")
c_gene=request("c_gene")
monitor=request("monitor")
sup_dest=request("sup_dest")
f_prog_dia=request("f_prog_dia")
f_prog_salida=request("f_prog_salida")
If IsDate(f_prog_salida) then f_prog_salida=f_prog_salida else f_prog_salida="01/01/1000" end if
f_prog_regreso=request("f_prog_regreso")
If IsDate(f_prog_regreso) then f_prog_regreso=f_prog_regreso else f_prog_regreso="01/01/1000" end if
	Dim opcion_esp_(20),opcion_ob_(20),opcion_del_(20),opcion_pre_(20),opcion_orden_(20)
	for i=1 to 20
	opcion_esp_(i)=request("opcion_esp_["&i&"]") 
	if opcion_esp_(i)<>""then opcion_esp_(i)= trim(safeSTR(opcion_esp_(i))) end if
	opcion_ob_(i)=request("opcion_ob_["&i&"]") 
	opcion_del_(i)=request("opcion_del_["&i&"]") 
	opcion_pre_(i)=request("opcion_pre_["&i&"]") 
	If IsNumeric(opcion_pre_(i)) Then opcion_pre_(i)=replace(opcion_pre_(i),".","") else opcion_pre_(i)=0 end if
	opcion_orden_(i)=request("opcion_orden_["&i&"]")
	next
	Dim archivo_(20),alt_(20), del_img_(20), destacado_(20), orden_img_(20)
	for i=1 to 20
	archivo_(i) = trim(request("archivo_[" & i &"]"))
	alt_(i) = trim(request("alt_[" & i & "]"))
	if alt_(i)<>""then alt_(i)=trim(safeSTR(alt_(i))) end if
	del_img_(i)=request("del_img_"& i)
	destacado_(i)=request("destacado_"& i)
	orden_img_(i) = trim(request("orden_img_[" & i &"]"))
	next
	Dim tab_titulo_esp_(6) ,tab_act_(6), tab_texto_esp_(6)
	for i=1 to 6
	tab_titulo_esp_(i) = trim(safeSTR(request("tab_" & i &"_titulo_esp")))
	tab_act_(i) = request("tab_" & i &"_act")
	tab_texto_esp_(i)=trim(safeSTR(request("tab_" & i &"_texto_esp")))
	next
url_esp=trim(safeSTR(request("url_esp")))
meta_title=trim(safeSTR(request("meta_title")))
meta_key=trim(safeSTR(request("meta_key")))
meta_desc=trim(safeSTR(request("meta_desc")))
campamento=request("campamento")
quincena=request("quincena")
gestion_aeropuertos=request("gestion_aeropuertos")
gestion_alojamientos=request("gestion_alojamientos")
inc_cat=request("inc_cat")
inc_sec=request("inc_sec")
inc_sub=request("inc_sub")
inc_des=request("inc_des")
ejecutivos=request("ejecutivos")
alo_hot=request("alo_hot")
datos_familia_ob=request("datos_familia_ob")
seg_medico=request("seg_medico")
material=request("material")
uniforme=request("uniforme")
show_cat=request("show_cat")
codPrivado=trim(request("codPrivado"))
format_sem=request("format_sem")
gen_mail=request("gen_mail")
edad_bot=request("edad_bot")
cerrado=request("cerrado")
normas=trim(safeSTR(request("normas")))
normas_ob=request("normas_ob")
fecha_in=now
fecha_mod=now                                     '[FIN REQUEST]
if op="up" then                          ' CHEQUEAMOS URL ESP
Sql= "SELECT url_esp FROM items WHERE url_esp ='"&url_esp&"' and id_item <> "&cod&""   
else
Sql= "SELECT url_esp FROM items WHERE url_esp ='"&url_esp&"'"   
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
Sql2= "SELECT url_esp FROM noticias WHERE url_esp ='"&url_esp&"'"   
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver) 
end if
ob_rs2.close
Sql2= "SELECT url_esp FROM generales WHERE url_esp ='"&url_esp&"'"   
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
if op="in"then										 '[OPCION INSERTAR]
mySQL="INSERT INTO items (titulo_esp,titulo_of_esp,resumen_esp,visible,disponible,destacado,privado,pre_medida,pr_actualizado,anyo_actualizado,completo,oferta,pr_reserva,pr_reserva_ob,pr_medico,pr_medico_ob,pr_cancelacion,pr_cancelacion_ob,tasas_aerop,tasas_aerop_ob,ed_desde,ed_hasta,escuela_tam,moneda,alo_fam,alo_res,alo_apa,wifi,tel_24,vuelo,c_inten,c_semi,c_gene,monitor,texto_esp,tab_1_titulo_esp,tab_1_act,tab_1_texto_esp,tab_2_titulo_esp,tab_2_act,tab_2_texto_esp,tab_3_titulo_esp,tab_3_act,tab_3_texto_esp,tab_4_titulo_esp,tab_4_act,tab_4_texto_esp,tab_5_titulo_esp,tab_5_act,tab_5_texto_esp,tab_6_titulo_esp,tab_6_act,tab_6_texto_esp,url_esp,meta_title,meta_desc,meta_key,fecha_in,fecha_mod,campamento,quincena,gestion_aeropuertos,gestion_alojamientos,f_prog_dia,f_prog_salida,f_prog_regreso,orden,inc_cat,inc_sec,inc_sub,en_menu,inc_des,ejecutivos,alo_hot,datos_familia_ob,seg_medico,material,uniforme,show_cat,codPrivado,alo_hos,act_inc,sup_dest,format_sem,gen_mail,edad_bot,tipoCambio,cerrado,normas,normas_ob)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "'" & titulo_esp & "',"
mySQL=mySQL & "'" & titulo_of_esp & "',"
mySQL=mySQL & "'" & resumen_esp & "',"
mySQL=mySQL & "'" & visible & "',"
mySQL=mySQL & "'" & disponible & "',"
mySQL=mySQL & "'" & destacado & "',"
mySQL=mySQL & "'" & privado & "',"
mySQL=mySQL & "'" & pre_medida & "',"
mySQL=mySQL & "'" & pr_actualizado & "',"
mySQL=mySQL & "'" & anyo_actualizado & "',"
mySQL=mySQL & "'" & completo & "',"
mySQL=mySQL & "'" & oferta & "',"
mySQL=mySQL & "'" & pr_reserva & "',"
mySQL=mySQL & "'" & pr_reserva_ob & "',"
mySQL=mySQL & "'" & pr_medico & "',"
mySQL=mySQL & "'" & pr_medico_ob & "',"
mySQL=mySQL & "'" & pr_cancelacion & "',"
mySQL=mySQL & "'" & pr_cancelacion_ob & "',"
mySQL=mySQL & "'" & tasas_aerop & "',"
mySQL=mySQL & "'" & tasas_aerop_ob & "',"
mySQL=mySQL & "" & ed_desde & ","
mySQL=mySQL & "" & ed_hasta & ","
mySQL=mySQL & "'" & escuela_tam & "',"
mySQL=mySQL & "'" & moneda & "',"
mySQL=mySQL & "'" & alo_fam & "',"
mySQL=mySQL & "'" & alo_res & "',"
mySQL=mySQL & "'" & alo_apa & "',"
mySQL=mySQL & "'" & wifi & "',"
mySQL=mySQL & "'" & tel_24 & "',"
mySQL=mySQL & "'" & vuelo & "',"
mySQL=mySQL & "'" & c_inten & "',"
mySQL=mySQL & "'" & c_semi & "',"
mySQL=mySQL & "'" & c_gene & "',"
mySQL=mySQL & "'" & monitor & "',"
mySQL=mySQL & "'" & texto_esp & "',"
mySQL=mySQL & "'" & tab_titulo_esp_(1) & "',"
mySQL=mySQL & "'" & tab_act_(1) & "',"
mySQL=mySQL & "'" & tab_texto_esp_(1) & "',"
mySQL=mySQL & "'" & tab_titulo_esp_(2) & "',"
mySQL=mySQL & "'" & tab_act_(2) & "',"
mySQL=mySQL & "'" & tab_texto_esp_(2) & "',"
mySQL=mySQL & "'" & tab_titulo_esp_(3) & "',"
mySQL=mySQL & "'" & tab_act_(3) & "',"
mySQL=mySQL & "'" & tab_texto_esp_(3) & "',"
mySQL=mySQL & "'" & tab_titulo_esp_(4) & "',"
mySQL=mySQL & "'" & tab_act_(4) & "',"
mySQL=mySQL & "'" & tab_texto_esp_(4) & "',"
mySQL=mySQL & "'" & tab_titulo_esp_(5) & "',"
mySQL=mySQL & "'" & tab_act_(5) & "',"
mySQL=mySQL & "'" & tab_texto_esp_(5) & "',"
mySQL=mySQL & "'" & tab_titulo_esp_(6) & "',"
mySQL=mySQL & "'" & tab_act_(6) & "',"
mySQL=mySQL & "'" & tab_texto_esp_(6) & "',"
mySQL=mySQL & "'" & limpia_url(url_esp) & "',"
mySQL=mySQL & "'" & meta_title & "',"
mySQL=mySQL & "'" & meta_desc & "',"
mySQL=mySQL & "'" & meta_key & "',"
mySQL=mySQL & "'" & fecha_in & "',"
mySQL=mySQL & "'" & fecha_mod & "',"
mySQL=mySQL & "'" & campamento & "',"
mySQL=mySQL & "'" & quincena & "',"
mySQL=mySQL & "'" & gestion_aeropuertos & "',"
mySQL=mySQL & "'" & gestion_alojamientos & "',"
mySQL=mySQL & "'" & f_prog_dia & "',"
mySQL=mySQL & "'" & f_prog_salida & "',"
mySQL=mySQL & "'" & f_prog_regreso & "',"
mySQL=mySQL & "" & orden & ","
mySQL=mySQL & "'" & inc_cat & "',"
mySQL=mySQL & "'" & inc_sec & "',"
mySQL=mySQL & "'" & inc_sub & "',"
mySQL=mySQL & "'" & en_menu & "',"
mySQL=mySQL & "'" & inc_des & "',"
mySQL=mySQL & "'" & ejecutivos & "',"
mySQL=mySQL & "'" & alo_hot & "',"
mySQL=mySQL & "'" & datos_familia_ob & "',"
mySQL=mySQL & "'" & seg_medico & "',"
mySQL=mySQL & "'" & material & "',"
mySQL=mySQL & "'" & uniforme & "',"
mySQL=mySQL & "'" & show_cat & "',"
mySQL=mySQL & "'" & codPrivado & "',"
mySQL=mySQL & "'" & alo_hos & "',"
mySQL=mySQL & "'" & act_inc & "',"
mySQL=mySQL & "'" & sup_dest & "',"
mySQL=mySQL & "'" & format_sem & "',"
mySQL=mySQL & "'" & gen_mail & "',"
mySQL=mySQL & "'" & edad_bot & "',"
mySQL=mySQL & "'" & tipoCambio & "',"
mySQL=mySQL & "'" & cerrado & "',"
mySQL=mySQL & "'" & normas & "',"
mySQL=mySQL & "'" & normas_ob & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
set ob_rs = Ob_Conn.execute("select MAX(id_item) from items") 
cod = ob_rs(0)
ob_rs.close
if cod_cat<>""then
Sql= "SELECT id_categoria, titulo_esp from categorias where id_categoria="&cod_cat&" "                    
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
m_categoria=ob_rs("titulo_esp") &" | "
end if
ob_rs.close
end if
if cod<>""then
Sql= "SELECT id_item, titulo_esp from items where id_item="&cod&" "                    
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
m_item=ob_rs("titulo_esp") &" | "
end if
ob_rs.close
Sql= "SELECT id_item, id_ciudad from rel where id_item="&cod&" and id_ciudad<>0"                    
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
id_ciudad_m=ob_rs("id_ciudad")
	if id_ciudad_m<>0 and id_ciudad_m<>"" then
	Sql2= "SELECT id_ciudad, titulo_esp from ciudades where id_ciudad="&id_ciudad_m&" "                    
	Ob_Command.CommandText = Sql2
	SET Ob_RS2 = Ob_Command.Execute ()
	if not ob_rs2.eof then
	m_ciudad=ob_rs2("titulo_esp") &" | "
	else
	m_ciudad=""
	end if
	ob_rs2.close
	end if
end if
ob_rs.close
Sql= "SELECT id_item, id_destino from rel where id_item="&cod&" and id_destino<>0"                    
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
id_destino_m=ob_rs("id_destino")
	if id_destino_m<>0 and id_destino_m<>"" then
	Sql2= "SELECT id_destino, titulo_esp from destinos where id_destino="&id_destino_m&" "                    
	Ob_Command.CommandText = Sql2
	SET Ob_RS2 = Ob_Command.Execute ()
	if not ob_rs2.eof then
	m_destino=ob_rs2("titulo_esp") &" | "
	else
	m_destino=""
	end if
	ob_rs2.close
	end if
end if
ob_rs.close
Sql= "SELECT id_item, id_seccion from rel where id_item="&cod&" and id_seccion<>0"                    
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
id_seccion_m=ob_rs("id_seccion")
	if id_seccion_m<>0 and id_seccion_m<>"" then
	Sql2= "SELECT id_seccion, titulo_esp from secciones where id_seccion="&id_seccion_m&" "                    
	Ob_Command.CommandText = Sql2
	SET Ob_RS2 = Ob_Command.Execute ()
	if not ob_rs2.eof then
	m_seccion=ob_rs2("titulo_esp") &" | "
	else
	m_seccion=""
	end if
	ob_rs2.close
	end if
end if
ob_rs.close
Sql= "SELECT id_item, id_subseccion from rel where id_item="&cod&" and id_subseccion<>0"                    
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
id_subseccion_m=ob_rs("id_subseccion")
	if id_subseccion_m<>0 and id_subseccion_m<>"" then
	Sql2= "SELECT id_seccion, titulo_esp from subsecciones where id_subseccion="&id_subseccion_m&" "                    
	Ob_Command.CommandText = Sql2
	SET Ob_RS2 = Ob_Command.Execute ()
	if not ob_rs2.eof then
	m_subseccion=ob_rs2("titulo_esp") &" | "
	else
	m_subseccion=""
	end if
	ob_rs2.close
	end if
end if
ob_rs.close
end if
Sql= "SELECT id_item, id_idioma from rel where id_item="&cod&" and id_idioma<>0"                    
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
id_idioma_m=ob_rs("id_idioma")
	if id_destino_m<>0 and id_destino_m<>"" then
	Sql2= "SELECT id_idioma, idioma from idiomas where id_idioma="&id_idioma_m&" "                    
	Ob_Command.CommandText = Sql2
	SET Ob_RS2 = Ob_Command.Execute ()
	if not ob_rs2.eof then
	m_idioma=ob_rs2("idioma")
	else
	m_didioma=""
	end if
	ob_rs2.close
	end if
end if
ob_rs.close

if meta_title<>""then 
meta_title=meta_title
else
meta_title= m_categoria & m_seccion & m_subseccion & m_item & m_destino & m_ciudad & m_idioma
mySQL="UPDATE items SET "
mySQL=mySQL & "meta_title = '" & meta_title & "'"
mySQL=mySQL & " WHERE id_item = " & cod & "" 
set ob_rs=Ob_Conn.execute(mySQL)
end if
if meta_key<>""then 
meta_key=meta_key
else
meta_key= limpia_meta(m_categoria) &", " & limpia_meta(m_seccion) &", " & limpia_meta(m_subseccion) &", " & limpia_meta(m_item) &", " & limpia_meta(m_destino) &", " & limpia_meta(m_ciudad)&", " & limpia_meta(m_idioma)
meta_key=replace(meta_key,", , ",",")
meta_key=replace(meta_key,",,",",")
mySQL="UPDATE items SET "
mySQL=mySQL & "meta_key = '" & meta_key & "'"
mySQL=mySQL & " WHERE id_item = " & cod & "" 
set ob_rs=Ob_Conn.execute(mySQL)
end if
end if                                                            '[FIN OPCION INSERTAR]
if op="up"then                                                    '[OPCION MODIFICAR]
mySQL="UPDATE items SET "
mySQL=mySQL & "titulo_esp = '" & titulo_esp & "',"
mySQL=mySQL & "titulo_of_esp = '" & titulo_of_esp & "',"
mySQL=mySQL & "resumen_esp = '" & resumen_esp & "',"
mySQL=mySQL & "visible = '" & visible & "',"
mySQL=mySQL & "disponible = '" & disponible & "',"
mySQL=mySQL & "destacado = '" & destacado & "',"
mySQL=mySQL & "privado = '" & privado & "',"
mySQL=mySQL & "pre_medida = '" & pre_medida & "',"
mySQL=mySQL & "pr_actualizado = '" & pr_actualizado & "',"
mySQL=mySQL & "anyo_actualizado = '" & anyo_actualizado & "',"
mySQL=mySQL & "completo = '" & completo & "',"
mySQL=mySQL & "oferta = '" & oferta & "',"
mySQL=mySQL & "pr_reserva = '" & pr_reserva & "',"
mySQL=mySQL & "pr_reserva_ob = '" & pr_reserva_ob & "',"
mySQL=mySQL & "pr_medico = '" & pr_medico & "',"
mySQL=mySQL & "pr_medico_ob = '" & pr_medico_ob & "',"
mySQL=mySQL & "pr_cancelacion = '" & pr_cancelacion & "',"
mySQL=mySQL & "pr_cancelacion_ob = '" & pr_cancelacion_ob & "',"
mySQL=mySQL & "tasas_aerop = '" & tasas_aerop & "',"
mySQL=mySQL & "tasas_aerop_ob = '" & tasas_aerop_ob & "',"
mySQL=mySQL & "ed_desde = " & ed_desde & ","
mySQL=mySQL & "ed_hasta = " & ed_hasta & ","
mySQL=mySQL & "escuela_tam = '" & escuela_tam & "',"
mySQL=mySQL & "moneda = '" & moneda & "',"
mySQL=mySQL & "alo_fam = '" & alo_fam & "',"
mySQL=mySQL & "alo_res = '" & alo_res & "',"
mySQL=mySQL & "alo_apa = '" & alo_apa & "',"
mySQL=mySQL & "wifi = '" & wifi & "',"
mySQL=mySQL & "tel_24 = '" & tel_24 & "',"
mySQL=mySQL & "vuelo = '" & vuelo & "',"
mySQL=mySQL & "c_inten = '" & c_inten & "',"
mySQL=mySQL & "c_semi = '" & c_semi & "',"
mySQL=mySQL & "c_gene = '" & c_gene & "',"
mySQL=mySQL & "monitor = '" & monitor & "',"
mySQL=mySQL & "texto_esp = '" & texto_esp & "',"
mySQL=mySQL & "tab_1_titulo_esp = '" & tab_titulo_esp_(1) & "',"
mySQL=mySQL & "tab_1_act = '" & tab_act_(1) & "',"
mySQL=mySQL & "tab_1_texto_esp = '" & tab_texto_esp_(1) & "',"
mySQL=mySQL & "tab_2_titulo_esp = '" & tab_titulo_esp_(2) & "',"
mySQL=mySQL & "tab_2_act = '" & tab_act_(2) & "',"
mySQL=mySQL & "tab_2_texto_esp = '" & tab_texto_esp_(2) & "',"
mySQL=mySQL & "tab_3_titulo_esp = '" & tab_titulo_esp_(3) & "',"
mySQL=mySQL & "tab_3_act = '" & tab_act_(3) & "',"
mySQL=mySQL & "tab_3_texto_esp = '" & tab_texto_esp_(3) & "',"
mySQL=mySQL & "tab_4_titulo_esp = '" & tab_titulo_esp_(4) & "',"
mySQL=mySQL & "tab_4_act = '" & tab_act_(4) & "',"
mySQL=mySQL & "tab_4_texto_esp = '" & tab_texto_esp_(4) & "',"
mySQL=mySQL & "tab_5_titulo_esp = '" & tab_titulo_esp_(5) & "',"
mySQL=mySQL & "tab_5_act = '" & tab_act_(5) & "',"
mySQL=mySQL & "tab_5_texto_esp = '" & tab_texto_esp_(5) & "',"
mySQL=mySQL & "tab_6_titulo_esp = '" & tab_titulo_esp_(6) & "',"
mySQL=mySQL & "tab_6_act = '" & tab_act_(6) & "',"
mySQL=mySQL & "tab_6_texto_esp = '" & tab_texto_esp_(6) & "',"
mySQL=mySQL & "url_esp = '" & limpia_url(url_esp) & "',"
mySQL=mySQL & "meta_title = '" & meta_title & "',"
mySQL=mySQL & "meta_desc = '" & meta_desc & "',"
mySQL=mySQL & "meta_key = '" & meta_key & "',"
mySQL=mySQL & "fecha_mod = '" & fecha_mod & "',"
mySQL=mySQL & "campamento = '" & campamento & "',"
mySQL=mySQL & "quincena = '" & quincena & "',"
mySQL=mySQL & "gestion_alojamientos = '" & gestion_alojamientos & "',"
mySQL=mySQL & "gestion_aeropuertos = '" & gestion_aeropuertos & "',"
mySQL=mySQL & "f_prog_dia = '" & f_prog_dia & "',"
mySQL=mySQL & "f_prog_salida = '" & f_prog_salida & "',"
mySQL=mySQL & "f_prog_regreso = '" & f_prog_regreso & "',"
mySQL=mySQL & "orden = " & orden & ","
mySQL=mySQL & "inc_cat = '" & inc_cat & "',"
mySQL=mySQL & "inc_sec = '" & inc_sec & "',"
mySQL=mySQL & "inc_sub = '" & inc_sub & "',"
mySQL=mySQL & "en_menu = '" & en_menu & "',"
mySQL=mySQL & "inc_des = '" & inc_des & "',"
mySQL=mySQL & "ejecutivos = '" & ejecutivos & "',"
mySQL=mySQL & "alo_hot = '" & alo_hot & "',"
mySQL=mySQL & "datos_familia_ob = '" & datos_familia_ob & "',"
mySQL=mySQL & "seg_medico = '" & seg_medico & "',"
mySQL=mySQL & "material = '" & material & "',"
mySQL=mySQL & "uniforme = '" & uniforme & "',"
mySQL=mySQL & "show_cat = '" & show_cat & "',"
mySQL=mySQL & "codPrivado = '" & codPrivado & "',"
mySQL=mySQL & "alo_hos = '" & alo_hos & "',"
mySQL=mySQL & "act_inc = '" & act_inc & "',"
mySQL=mySQL & "sup_dest = '" & sup_dest & "',"
mySQL=mySQL & "format_sem = '" & format_sem & "',"
mySQL=mySQL & "gen_mail = '" & gen_mail & "',"
mySQL=mySQL & "edad_bot = '" & edad_bot & "',"
mySQL=mySQL & "tipoCambio = '" & tipoCambio & "',"
mySQL=mySQL & "cerrado = '" & cerrado & "',"
mySQL=mySQL & "normas = '" & normas & "',"
mySQL=mySQL & "normas_ob = '" & normas_ob & "'"
mySQL=mySQL & " WHERE id_item = " & cod & "" 
set ob_rs=Ob_Conn.execute(mySQL)
if cod_cat<>""then
Sql= "SELECT id_categoria, titulo_esp from categorias where id_categoria="&cod_cat&" "                    
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
m_categoria=ob_rs("titulo_esp") &" | "
end if
ob_rs.close
end if
if cod<>""then
Sql= "SELECT id_item, titulo_esp from items where id_item="&cod&" "                    
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
m_item=ob_rs("titulo_esp") &" | "
end if
ob_rs.close
Sql= "SELECT id_item, id_ciudad from rel where id_item="&cod&" and id_ciudad<>0"                    
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
id_ciudad_m=ob_rs("id_ciudad")
	if id_ciudad_m<>0 and id_ciudad_m<>"" then
	Sql2= "SELECT id_ciudad, titulo_esp from ciudades where id_ciudad="&id_ciudad_m&" "                    
	Ob_Command.CommandText = Sql2
	SET Ob_RS2 = Ob_Command.Execute ()
	if not ob_rs2.eof then
	m_ciudad=ob_rs2("titulo_esp") &" | "
	else
	m_ciudad=""
	end if
	ob_rs2.close
	end if
end if
ob_rs.close
Sql= "SELECT id_item, id_destino from rel where id_item="&cod&" and id_destino<>0"                    
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
id_destino_m=ob_rs("id_destino")
	if id_destino_m<>0 and id_destino_m<>"" then
	Sql2= "SELECT id_destino, titulo_esp from destinos where id_destino="&id_destino_m&" "                    
	Ob_Command.CommandText = Sql2
	SET Ob_RS2 = Ob_Command.Execute ()
	if not ob_rs2.eof then
	m_destino=ob_rs2("titulo_esp") &" | "
	else
	m_destino=""
	end if
	ob_rs2.close
	end if
end if
ob_rs.close
Sql= "SELECT id_item, id_seccion from rel where id_item="&cod&" and id_seccion<>0"                    
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
id_seccion_m=ob_rs("id_seccion")
	if id_seccion_m<>0 and id_seccion_m<>"" then
	Sql2= "SELECT id_seccion, titulo_esp from secciones where id_seccion="&id_seccion_m&" "                    
	Ob_Command.CommandText = Sql2
	SET Ob_RS2 = Ob_Command.Execute ()
	if not ob_rs2.eof then
	m_seccion=ob_rs2("titulo_esp") &" | "
	else
	m_seccion=""
	end if
	ob_rs2.close
	end if
end if
ob_rs.close
Sql= "SELECT id_item, id_subseccion from rel where id_item="&cod&" and id_subseccion<>0"                    
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
id_subseccion_m=ob_rs("id_subseccion")
	if id_subseccion_m<>0 and id_subseccion_m<>"" then
	Sql2= "SELECT id_subseccion, titulo_esp from subsecciones where id_subseccion="&id_subseccion_m&" "                    
	Ob_Command.CommandText = Sql2
	SET Ob_RS2 = Ob_Command.Execute ()
	if not ob_rs2.eof then
	m_subseccion=ob_rs2("titulo_esp") &" | "
	else
	m_subseccion=""
	end if
	ob_rs2.close
	end if
end if
ob_rs.close
end if
Sql= "SELECT id_item, id_idioma from rel where id_item="&cod&" and id_idioma<>0"                    
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
id_idioma_m=ob_rs("id_idioma")
	if id_destino_m<>0 and id_destino_m<>"" then
	Sql2= "SELECT id_idioma, idioma from idiomas where id_idioma="&id_idioma_m&" "                    
	Ob_Command.CommandText = Sql2
	SET Ob_RS2 = Ob_Command.Execute ()
	if not ob_rs2.eof then
	m_idioma=ob_rs2("idioma")
	else
	m_didioma=""
	end if
	ob_rs2.close
	end if
end if
ob_rs.close
if meta_title<>""then 
meta_title=meta_title
else
meta_title= m_categoria & m_seccion & m_subseccion & m_item & m_destino & m_ciudad & m_idioma
mySQL="UPDATE items SET "
mySQL=mySQL & "meta_title = '" & meta_title & "'"
mySQL=mySQL & " WHERE id_item = " & cod & "" 
set ob_rs=Ob_Conn.execute(mySQL)
end if
if meta_key<>""then 
meta_key=meta_key
else
meta_key= limpia_meta(m_categoria) &"," & limpia_meta(m_seccion) &"," & limpia_meta(m_subseccion) &"," & limpia_meta(m_item) &"," & limpia_meta(m_destino) &", " & limpia_meta(m_ciudad)&", " & limpia_meta(m_idioma)
meta_key=replace(meta_key,", , ",",")
meta_key=replace(meta_key,",,",",")
mySQL="UPDATE items SET "
mySQL=mySQL & "meta_key = '" & meta_key & "'"
mySQL=mySQL & " WHERE id_item = " & cod & "" 
set ob_rs=Ob_Conn.execute(mySQL)
end if
end if                                                           '[FIN OPCION MODIFICAR]
mySQL="INSERT INTO rel (id_categoria,id_item,multi)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & cod_cat & ","
	mySQL=mySQL & "'" & cod & "',"
	mySQL=mySQL & "'" & multi & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
for i=1 to 20									      		  '[OPCIONES ADICIONALES HATA 20]
if opcion_del_(i)<>"" then                                 '[SI HEMOS SELECCIONADO ELIMINAR OPCION] 
opcion_orden=i
Sql= "SELECT rel.id_itemOp,rel.id_rel, rel.id_item, itemsOp.id_itemOp from rel, itemsOp where rel.id_item="&cod&" and rel.id_itemOp<>0 and itemsOp.id_itemOp = rel.id_itemOp and itemsOp.opcion_orden ="&opcion_orden&""                    
Ob_Command.CommandText = Sql
SET Ob_RS3 = Ob_Command.Execute ()
if not ob_rs3.eof then
do while not ob_rs3.eof
id_itemOp=ob_rs3("itemsOp.id_itemOp")
id_rel=ob_rs3("id_rel")
	mySQL="DELETE FROM itemsOp where id_itemOp =" & id_itemOp & ""
	set ob_rs=Ob_Conn.execute(mySQL)
	mySQL="DELETE FROM rel where id_rel =" & id_rel & ""
	set ob_rs=Ob_Conn.execute(mySQL)
ob_rs3.movenext
loop
end if
ob_rs3.close
else        

if opcion_esp_(i)<>"" then 
opcion_orden=i 
Sql= "SELECT rel.id_itemOp,rel.id_rel, rel.id_item, itemsOp.id_itemOp, itemsOp.opcion_orden from rel, itemsOp where rel.id_item="&cod&" and rel.id_itemOp<>0 and itemsOp.id_itemOp = rel.id_itemOp and itemsOp.opcion_orden ="&opcion_orden&""
Ob_Command.CommandText = Sql
SET Ob_RS3 = Ob_Command.Execute ()
if not ob_rs3.eof then
do while not ob_rs3.eof
id_itemOp=ob_rs3("itemsOp.id_itemOp")
id_rel=ob_rs3("id_rel")
	mySQL="DELETE FROM itemsOp where id_itemOp =" & id_itemOp & ""
	set ob_rs=Ob_Conn.execute(mySQL)
	mySQL="DELETE FROM rel where id_rel =" & id_rel & ""
	set ob_rs=Ob_Conn.execute(mySQL)
ob_rs3.movenext
loop
end if
ob_rs3.close
mySQL="INSERT INTO itemsOp (opcion_esp,opcion_pre,opcion_ob,opcion_orden)" '[INSERTAMOS]
	mySQL=mySQL & "VALUES ("
	mySQL=mySQL & "'" & opcion_esp_(i) & "',"
	mySQL=mySQL & "'" & opcion_pre_(i) & "',"
	mySQL=mySQL & "'" & opcion_ob_(i) & "',"
	mySQL=mySQL & "" & opcion_orden_(i) & ""
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
set ob_rs = Ob_Conn.execute("select MAX(id_itemOp) from itemsOp") 
id_itemOp = ob_rs(0)
mySQL="INSERT INTO rel (id_item,id_itemOp,fecha_in,fecha_mod)" '[RELACIONAMOS OPCION CON ITEM]
	mySQL=mySQL & "VALUES ("
	mySQL=mySQL & "" & cod & ","
	mySQL=mySQL & "" & id_itemOp & ","
	mySQL=mySQL & "'" & fecha_in & "',"
	mySQL=mySQL & "'" & fecha_mod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
else                                                     '[NO SUBE OPCION PERO CAMBIA ALGO]
	'if opcion_orden_(i)<>"" then
	'orden_op=opcion_orden_(i)
	'mySQL="UPDATE itemsOp SET "
	'mySQL=mySQL & "opcion_esp = '" & opcion_esp_(i) & "',"
	'mySQL=mySQL & "opcion_pre = '" & opcion_pre_(i) & "',"
	'mySQL=mySQL & "opcion_ob = '" & opcion_ob_(i) & "',"
	'mySQL=mySQL & "opcion_orden = " & opcion_orden_(i) & ""	
	'mySQL=mySQL & " WHERE opcion_orden = "&orden_op&""
	'set ob_rs=Ob_Conn.execute(mySQL)
	'end if
end if                                                             '[FIN ELSE U] 
end if                                                '[SI HEMOS SELECCIONADO ELIMINAR OPCION] 
next												   '[FIN OPCIONES ADICIONALES HATA 20]	
peso="0"
alto=0
ancho=0

'[REORDENAMOS DEL 1 Al ... LAS OPCIONES]
Sql= "SELECT rel.id_itemOp,rel.id_rel, rel.id_item, itemsOp.id_itemOp, itemsOp.opcion_orden from rel, itemsOp where rel.id_item="&cod&" and rel.id_itemOp<>0 and itemsOp.id_itemOp = rel.id_itemOp "
	Ob_Command.CommandText = Sql
	SET Ob_RS3 = Ob_Command.Execute ()
	if not ob_rs3.eof then
	i=1
	do while not ob_rs3.eof
	id_itemOp=ob_rs3("itemsOp.id_itemOp")
	mySQL="UPDATE itemsOp SET "
	mySQL=mySQL & "opcion_orden = " & i & ""
	mySQL=mySQL & " WHERE id_itemOp = "&id_itemOp&" "
	set ob_rs=Ob_Conn.execute(mySQL)
	i=i+1
	ob_rs3.movenext
	loop
	end if
	ob_rs3.close
for i=1 to 20									      		  '[SUBIDA DE ARCHIVOS E IMAGENES HASTA 20]
if del_img_(i)<>"" then                                           '[SI HEMOS SELECCIONADO ELIMINAR IMAGEN] 
campo="archivo_"&i
Sql= "SELECT rel.id_archivo,rel.id_rel, rel.id_item, archivos.id_archivo, archivos.campo from rel, archivos where rel.id_item="&cod&" and rel.id_archivo<>0 and archivos.id_archivo = rel.id_archivo and archivos.campo ='"&campo&"'"                    
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
Sql= "SELECT rel.id_archivo,rel.id_rel, rel.id_item, archivos.id_archivo, archivos.campo from rel, archivos where rel.id_item="&cod&" and rel.id_archivo<>0 and archivos.id_archivo = rel.id_archivo and archivos.campo ='"&campo&"'"                           
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
mySQL="INSERT INTO rel (id_item,id_archivo,tipo_rel,fecha_in,fecha_mod)" '[RELACIONAMOS IMAGEN CON WEB]
	mySQL=mySQL & "VALUES ("
	mySQL=mySQL & "" & cod & ","
	mySQL=mySQL & "" & id_archivo & ","
	mySQL=mySQL & "'" & tipo_rel & "',"
	mySQL=mySQL & "'" & fecha_in & "',"
	mySQL=mySQL & "'" & fecha_mod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
else                                                     '[NO SUBE ARCHIVO PERO CAMBIA TITULO IMAGEN y/o ORDEN ]
campo="archivo_"&i
Sql= "SELECT rel.id_archivo,rel.id_rel, rel.id_item, archivos.id_archivo, archivos.campo, archivos.orden from rel, archivos where rel.id_item="&cod&" and rel.id_archivo<>0 and archivos.id_archivo = rel.id_archivo "                           
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
next	
Sql= "SELECT rel.id_archivo,rel.id_rel, rel.id_item, archivos.id_archivo, archivos.campo, archivos.orden from rel, archivos where rel.id_item="&cod&" and rel.id_archivo<>0 and archivos.id_archivo = rel.id_archivo and (archivos.campo <> 'archivo_1' and archivos.campo <> 'archivo_2' and archivos.campo <> 'archivo_17' and archivos.campo <> 'archivo_18' and archivos.campo <> 'archivo_19' and archivos.campo <> 'archivo_20') order by archivos.orden"                           
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
														'[FIN SUBIDA DE ARCHIVOS E IMAGENES 1]	
mySQL="DELETE FROM rel where id_item =" & cod & " and id_categoria <> 0" 'ELIMINAMOS PRIMERO
set ob_rs=Ob_conn.execute(mySQL)
if cod_cat<>0then                                              '[RELACIONAMOS EN REL ID_WEB <> ID_CATEGORIA]
cadena_rel = split(cod_cat, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO rel (id_categoria,id_item,multi)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & cadena_rel(i) & ","
	mySQL=mySQL & "'" & cod & "',"
	mySQL=mySQL & "'" & multi & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
next
end if                                                       '[FIN RELACIONAMOS EN REL ID_WEB <> ID_CATEGORIA]
mySQL="DELETE FROM rel where id_item =" & cod & " and id_seccion <> 0" 'ELIMINAMOS PRIMERO
set ob_rs=Ob_conn.execute(mySQL)
if id_seccion<>""then                                              '[RELACIONAMOS EN REL ID_SECCION]
cadena_rel = split(id_seccion, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO rel (id_seccion,id_categoria,id_item,id_destino,id_ciudad,multi)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & cadena_rel(i) & ","
	mySQL=mySQL & "" & cod_cat & ","
	mySQL=mySQL & "'" & cod & "',"
	mySQL=mySQL & "" & id_destino & ","
	mySQL=mySQL & "" & id_ciudad & ","
	mySQL=mySQL & "'" & multi & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
next
end if                                                       '[FIN RELACIONAMOS EN REL ID_SECCION]
mySQL="DELETE FROM rel where id_item =" & cod & " and id_subseccion <> 0" 'ELIMINAMOS PRIMERO
set ob_rs=Ob_conn.execute(mySQL)
if id_subseccion<>"" then                                              '[RELACIONAMOS EN REL ID_SUBSECCION]
cadena_rel = split(id_subseccion, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO rel (id_subseccion,id_item,id_destino,id_categoria, id_ciudad)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & cadena_rel(i) & ","
	mySQL=mySQL & "'" & cod & "',"
	mySQL=mySQL & "" & id_destino & ","
	mySQL=mySQL & "" & cod_cat & ","
	mySQL=mySQL & "" & id_ciudad & ""
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
next
end if                                                       '[FIN RELACIONAMOS EN REL ID_SUBSECCION]
mySQL="DELETE FROM rel where id_item =" & cod & " and id_item_rel <> 0" 'ELIMINAMOS PRIMERO
set ob_rs=Ob_conn.execute(mySQL)
if id_item_rel<>"" then                                              '[RELACIONAMOS EN PROGRAMAS]
cadena_rel = split(id_item_rel, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO rel (id_item_rel,id_item)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & cadena_rel(i) & ","
	mySQL=mySQL & "'" & cod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
next
end if                                                       '[FIN RELACIONAMOS EN PROGRAMAS]
mySQL="DELETE FROM rel where id_item =" & cod & " and id_proveedor <> 0" 'ELIMINAMOS PRIMERO
set ob_rs=Ob_conn.execute(mySQL)
if id_proveedor<>0then                                              '[RELACIONAMOS EN REL ID_PROVEEDOR]
mySQL="INSERT INTO rel (id_proveedor,id_item)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & id_proveedor & ","
	mySQL=mySQL & "'" & cod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
end if                                                       '[FIN RELACIONAMOS EN REL ID_PROVEEDOR]
'mySQL="DELETE FROM rel where id_item =" & cod & " and id_destino <> 0" 'ELIMINAMOS PRIMERO
'set ob_rs=Ob_conn.execute(mySQL)
'if id_destino<>0then                                              '[RELACIONAMOS EN REL ID_DESTINO]
'mySQL="INSERT INTO rel (id_destino,id_item)" 				
'	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
'	mySQL=mySQL & "" & id_destino & ","
'	mySQL=mySQL & "'" & cod & "'"
'	mySQL=mySQL & ");"
'set ob_rs=Ob_Conn.execute(mySQL)
'end if                                                       '[FIN RELACIONAMOS EN REL ID_DESTINO]
mySQL="DELETE FROM rel where id_item =" & cod & " and id_idioma <> 0" 'ELIMINAMOS PRIMERO
set ob_rs=Ob_conn.execute(mySQL)
if id_idioma<>"" then                                              '[RELACIONAMOS EN REL ID_IDIOMA]
cadena_rel = split(id_idioma, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO rel (id_idioma,id_item)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & cadena_rel(i) & ","
	mySQL=mySQL & "'" & cod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
next
end if                                                       '[FIN RELACIONAMOS EN REL ID_IDIOMA]
'mySQL="DELETE FROM rel where id_item =" & cod & " and id_ciudad <> 0" 'ELIMINAMOS PRIMERO
'set ob_rs=Ob_conn.execute(mySQL)
'if id_ciudad<>0 then                '[RELACIONAMOS EN REL ID_CIUDAD]
'mySQL="INSERT INTO rel (id_ciudad,id_item)" 				
'	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
'	mySQL=mySQL & "" & id_ciudad & ","
'	mySQL=mySQL & "'" & cod & "'"
'	mySQL=mySQL & ");"
'set ob_rs=Ob_Conn.execute(mySQL)
'end if                                                       '[FIN RELACIONAMOS EN REL ID_CIUDAD]
Sql= "SELECT id_item, url_esp from items"                            '[COMENZAMOS REESCRITURA]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
set fso = createobject("scripting.filesystemobject")
Set act = fso.CreateTextFile(server.mappath(rd&"mapas_url/items.txt"), true)
do while not ob_rs.eof
url = ob_rs("url_esp")
act.WriteLine ""&limpia_url(url)&" "&ob_rs("id_item")&"" 
ob_rs.movenext
loop
act.Close
end if
ob_rs.close                                                   '[FIN REESCRITURA]
'REDIRECCIONAMOS
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&cod_cat=" & cod_cat&"&ver="&ver)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&cod_cat=" & cod_cat&"&ver="&ver) 
ob_conn.close%>
</body></html>
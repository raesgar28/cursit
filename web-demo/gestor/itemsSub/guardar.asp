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
cod_prog=request("cod_prog")
cod_cat=request("cod_cat")
edi=request("edi")
op=request("op")%>
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../lib/asp/comun.asp"-->
<%titulo_esp=trim(safeSTR(request("titulo_esp")))
titulo_of_esp=trim(safeSTR(request("titulo_of_esp")))
codigo_curso=trim(safeSTR(request("codigo_curso")))
txt_aviso=trim(safeSTR(request("txt_aviso")))
n_lecciones=request("n_lecciones")
If IsNumeric(n_lecciones) Then n_lecciones=n_lecciones else n_lecciones=0 end if
ed_desde=request("ed_desde")
If IsNumeric(ed_desde) Then ed_desde=ed_desde else ed_desde=0 end if
ed_hasta=request("ed_hasta")
If IsNumeric(ed_hasta) Then ed_hasta=ed_hasta else ed_hasta=0 end if
alo_fam=request("alo_fam")
alo_res=request("alo_res")
alo_apa=request("alo_apa")
vuelo=request("vuelo")
c_inten=request("c_inten")
c_semi=request("c_semi")
c_gene=request("c_gene")
wifi=request("wifi")
tel_24=request("tel_24")
monitor=request("monitor")
salidas=request("salidas")
salida_dia=request("salida_dia")
salida_mes=request("salida_mes")
salida_fecha=request("salida_fecha")
if salida_fecha<>""then salida_fecha=salida_fecha else salida_fecha="01/01/1000" end if
salida_quincena=request("salida_quincena")
'If IsNumeric(salida_quincena) and salida_quincena<>"" Then salida_quincena=salida_quincena else salida_quincena=0 end if
if salida_quincena<>"" then
'salida_quincena = Left( salida_quincena, (Len(salida_quincena)-1))
cadena_rel = salida_quincena
cadena_rel = split(salida_quincena, ",")
for i=0 to ubound(cadena_rel)
execute("salida_quincena"&i&"=cadena_rel("&i&")")
next
end if
if salida_quincena0=""then salida_quincena0=0 end if
if salida_quincena1=""then salida_quincena1=0 end if
if salida_quincena2=""then salida_quincena2=0 end if
if salida_quincena3=""then salida_quincena3=0 end if
if salida_quincena4=""then salida_quincena4=0 end if
f_inicio=request("f_inicio")
if f_inicio<>""then f_inicio=f_inicio else f_inicio="01/01/1000" end if
f_fin=request("f_fin")
if f_fin<>""then f_fin=f_fin else f_fin="01/01/1000" end if
texto_esp=trim(safeSTR(request("texto_esp")))
pr_reserva=request("pr_reserva")
If IsNumeric(pr_reserva) Then pr_reserva=replace(pr_reserva,".","") else pr_reserva=0 end if
pr_medico=request("pr_medico")
If IsNumeric(pr_medico) Then pr_medico=replace(pr_medico,".","") else pr_medico=0 end if
pr_medico_ob=request("pr_medico_ob")
pr_cancelacion=request("pr_cancelacion")
If IsNumeric(pr_cancelacion) Then pr_cancelacion=replace(pr_cancelacion,".","") else pr_cancelacion=0 end if
pr_cancelacion_ob=request("pr_cancelacion_ob")
tasas_aerop=request("tasas_aerop")
If IsNumeric(tasas_aerop) Then tasas_aerop=replace(tasas_aerop,".","") else tasas_aerop=0 end if
tasas_aerop_ob=request("tasas_aerop_ob")
pr_examen=request("pr_examen")
If IsNumeric(pr_examen) Then pr_examen=replace(pr_examen,".","") else pr_examen=0 end if
pr_examen_ob=request("pr_examen_ob")
con_examen=trim(safeSTR(request("con_examen")))
con_examen_act=request("con_examen_act")
url_esp=trim(safeSTR(request("url_esp")))
visible=request("visible")
disponible=request("disponible")
orden_curso=request("orden_curso")
If IsNumeric(orden_curso) Then orden_curso=orden_curso else orden_curso=0 end if
pr_gestion_bill=request("pr_gestion_bill")
If IsNumeric(pr_gestion_bill) and pr_gestion_bill<>"" Then pr_gestion_bill=replace(pr_gestion_bill,".","") else pr_gestion_bill=0 end if
pr_gestion_bill_ob=request("pr_gestion_bill_ob")
fecha_in=now
fecha_mod=now
n_alumnos=request("n_alumnos")
h_lecciones=request("h_lecciones")
If IsNumeric(n_alumnos) Then n_alumnos=n_alumnos else n_alumnos=0 end if
meta_title=trim(safeSTR(request("meta_title")))
meta_key=trim(safeSTR(request("meta_key")))
meta_desc=trim(safeSTR(request("meta_desc")))

if op="up" then                          ' CHEQUEAMOS URL ESP
Sql= "SELECT url_esp FROM itemsSub WHERE url_esp ='"&url_esp&"' and id_itemSub <> "&cod&""   
else
Sql= "SELECT url_esp FROM itemsSub WHERE url_esp ='"&url_esp&"'"   
end if
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat &"&cod_prog=" & cod_prog &"&edi="&edi)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat &"&cod_prog=" & cod_prog &"&edi="&edi) 
end if
ob_rs.close
Sql2= "SELECT url_esp FROM destinos WHERE url_esp ='"&url_esp&"'"   
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat &"&cod_prog=" & cod_prog &"&edi="&edi)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat &"&cod_prog=" & cod_prog &"&edi="&edi)
end if
ob_rs2.close
Sql2= "SELECT url_esp FROM items WHERE url_esp ='"&url_esp&"'"   
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat &"&cod_prog=" & cod_prog &"&edi="&edi)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat &"&cod_prog=" & cod_prog &"&edi="&edi)
end if
ob_rs2.close
Sql2= "SELECT url_esp FROM items WHERE url_esp ='"&url_esp&"'"   
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat &"&cod_prog=" & cod_prog &"&edi="&edi)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat &"&cod_prog=" & cod_prog &"&edi="&edi) 
end if
ob_rs2.close
Sql2= "SELECT url_esp FROM secciones WHERE url_esp ='"&url_esp&"'"   
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat &"&cod_prog=" & cod_prog &"&edi="&edi)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat &"&cod_prog=" & cod_prog &"&edi="&edi) 
end if
ob_rs2.close
Sql2= "SELECT url_esp FROM subsecciones WHERE url_esp ='"&url_esp&"'"   
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat &"&cod_prog=" & cod_prog &"&edi="&edi)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat &"&cod_prog=" & cod_prog &"&edi="&edi)
end if
ob_rs2.close
Sql2= "SELECT url_esp FROM categorias WHERE url_esp ='"&url_esp&"'"   
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat &"&cod_prog=" & cod_prog &"&edi="&edi)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat &"&cod_prog=" & cod_prog &"&edi="&edi) 
end if
ob_rs2.close
Sql2= "SELECT url_esp FROM ciudades WHERE url_esp ='"&url_esp&"'"   
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat &"&cod_prog=" & cod_prog &"&edi="&edi)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat &"&cod_prog=" & cod_prog &"&edi="&edi)
end if
ob_rs2.close
Sql2= "SELECT url_esp FROM noticias WHERE url_esp ='"&url_esp&"'"   
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat &"&cod_prog=" & cod_prog &"&edi="&edi)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat &"&cod_prog=" & cod_prog &"&edi="&edi) 
end if
ob_rs2.close								'[FIN CHEQUEAMOS QUE URL NO DENTRO IN]

if op="up" then
Sql= "SELECT noticias.url_esp,generales.url_esp,items.url_esp,itemsSub.url_esp,categorias.url_esp,secciones.url_esp,subsecciones.url_esp,destinos.url_esp,ciudades.url_esp from noticias,generales,items,itemsSub,categorias,secciones,subsecciones,destinos,ciudades WHERE (itemsSub.url_esp ='"&url_esp&"' and id_itemSub <> "&cod&") or (generales.url_esp = '"&url_esp&"' or items.url_esp= '"&url_esp&"' or noticias.url_esp = '"&url_esp&"' or categorias.url_esp = '"&url_esp&"' or secciones.url_esp= '"&url_esp&"' or subsecciones.url_esp = '"&url_esp&"' or destinos.url_esp = '"&url_esp&"' or ciudades.url_esp = '"&url_esp&"' )"
else
Sql= "SELECT noticias.url_esp,generales.url_esp,items.url_esp,itemsSub.url_esp,categorias.url_esp,secciones.url_esp,subsecciones.url_esp,destinos.url_esp,ciudades.url_esp from noticias,generales,items,itemsSub,categorias,secciones,subsecciones,destinos,ciudades WHERE noticias.url_esp ='"&url_esp&"' or generales.url_esp = '"&url_esp&"' or items.url_esp= '"&url_esp&"' or itemsSub.url_esp = '"&url_esp&"' or categorias.url_esp = '"&url_esp&"' or secciones.url_esp= '"&url_esp&"' or subsecciones.url_esp = '"&url_esp&"' or destinos.url_esp = '"&url_esp&"' or ciudades.url_esp = '"&url_esp&"' "
end if '[CHEQUEAMOS QUE URL NO DENTRO IN]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
if op="up" then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat &"&cod_prog=" & cod_prog &"&edi="&edi)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat &"&cod_prog=" & cod_prog &"&edi="&edi) 
end if
if op="in" then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod_cat=" & cod_cat &"&cod_prog=" & cod_prog)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod_cat=" & cod_cat &"&cod_prog=" & cod_prog &"&edi="&edi) 
end if
end if
ob_rs.close									'[FIN CHEQUEAMOS QUE URL NO DENTRO IN]

if cod_cat<>""then
Sql= "SELECT id_categoria, titulo_esp from categorias where id_categoria="&cod_cat&" "                    
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
m_categoria=ob_rs("titulo_esp") &" | "
end if
ob_rs.close
end if
if cod_prog<>""then
Sql= "SELECT id_item, titulo_esp from items where id_item="&cod_prog&" "                    
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
m_item=ob_rs("titulo_esp") &" | "
end if
ob_rs.close
Sql= "SELECT id_item, id_ciudad from rel where id_item="&cod_prog&" and id_ciudad<>0"                    
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
Sql= "SELECT id_item, id_destino from rel where id_item="&cod_prog&" and id_destino<>0"                    
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
Sql= "SELECT id_item, id_seccion from rel where id_item="&cod_prog&" and id_seccion<>0"                    
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
Sql= "SELECT id_item, id_subseccion from rel where id_item="&cod_prog&" and id_subseccion<>0"                    
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
if meta_title<>""then 
meta_title=meta_title
else
meta_title= m_categoria & m_seccion & m_subseccion & m_item & m_destino & m_ciudad & titulo_esp
end if
if meta_key<>""then 
meta_key=meta_key
else
meta_key= limpia_meta(m_categoria) &", " & limpia_meta(m_seccion) &", " & limpia_meta(m_subseccion) &", " & limpia_meta(m_item) &", " & limpia_meta(m_destino) &", " & limpia_meta(m_ciudad) &", " & limpia_meta(titulo_esp) &", "
end if
	Dim opcion_esp_(20),opcion_ob_(20),transfer_(20),opcion_del_(20),opcion_pre_(20),opcion_orden_(20)
	for i=1 to 20
	opcion_esp_(i)=request("opcion_esp_["&i&"]") 
	if opcion_esp_(i)<>""then opcion_esp_(i)= trim(safeSTR(opcion_esp_(i))) end if
	opcion_ob_(i)=request("opcion_ob_["&i&"]") 
	transfer_(i)=request("transfer_["&i&"]")
	opcion_del_(i)=request("opcion_del_["&i&"]") 
	opcion_pre_(i)=request("opcion_pre_["&i&"]") 
	If IsNumeric(opcion_pre_(i)) Then opcion_pre_(i)=replace(opcion_pre_(i),".","") else opcion_pre_(i)=0 end if
	opcion_orden_(i)=request("opcion_orden_["&i&"]")
	next
	Dim semanas_(60),precio_(60),precio_coste_(60),sem_del_(60),duracion_(60)
	for i=1 to 20
	semanas_(i)=trim(request("semanas_["&i&"]"))
	precio_(i)=trim(request("precio_["&i&"]")) 
	precio_coste_(i)=trim(request("precio_coste_["&i&"]"))
	sem_del_(i)=trim(request("sem_del_["&i&"]"))
	duracion_(i)=trim(request("duracion_["&i&"]"))
	If IsNumeric(semanas_(i)) Then semanas_(i)=semanas_(i) else semanas_(i)=0 end if
	If IsNumeric(precio_(i)) Then precio_(i)=replace(precio_(i),".","") else precio_(i)=0 end if
	If IsNumeric(precio_coste_(i)) Then precio_coste_(i)=replace(precio_coste_(i),".","") else precio_coste_(i)=0 end if
	next
	Dim tem_f_inicio_(60),tem_f_fin_(60),suplemento_(60),suplemento_r_(60),tem_del_(60)
	for i=1 to 20
	tem_f_inicio_(i)=trim(request("tem_f_inicio_["&i&"]"))
	tem_f_fin_(i)=trim(request("tem_f_fin_["&i&"]")) 
	if IsDate(tem_f_inicio_(i)) then tem_f_inicio_(i)=tem_f_inicio_(i)else tem_f_inicio_(i)="01/01/1000"
	if IsDate(tem_f_fin_(i)) then tem_f_fin_(i)=tem_f_fin_(i)else tem_f_fin_(i)="01/01/1000"
	suplemento_(i)=trim(request("suplemento_["&i&"]"))
	suplemento_r_(i)=trim(request("suplemento_r_["&i&"]"))
	tem_del_(i)=trim(request("tem_del_["&i&"]"))
	If IsNumeric(suplemento_(i)) Then suplemento_(i)=replace(suplemento_(i),".","") else suplemento_(i)=0 end if
	If IsNumeric(suplemento_r_(i)) Then suplemento_r_(i)=replace(suplemento_r_(i),".","") else suplemento_r_(i)=0 end if
	next
	Dim id_aeropuerto_(60),plazas_(60),mes_(60),id_quincena_(60),orden_aer_(60),compl_(60),aer_del_(60), f_salida_aer_(20), f_fin_aer_(20)
	for i=1 to 20
	id_aeropuerto_(i)=request("id_aeropuerto_["&i&"]")
	plazas_(i)=request("plazas_["&i&"]") 
	mes_(i)=request("mes_["&i&"]")
	id_quincena_(i)=request("id_quincena_["&i&"]")
	orden_aer_(i)=request("orden_aer_["&i&"]")
	compl_(i)=request("compl_["&i&"]")
	aer_del_(i)=request("aer_del_["&i&"]")
	f_salida_aer_(i)=request("f_salida_aer_["&i&"]")
	f_fin_aer_(i)=request("f_fin_aer_["&i&"]")
	If IsNumeric(plazas_(i)) Then plazas_(i)=plazas_(i) else plazas_(i)=0 end if
	if id_quincena_(i)<>""then
	If IsNumeric(id_quincena_(i)) Then 
	id_quincena_(i)=id_quincena_(i) 
	else id_quincena_(i)=0 
	end if
	else
	id_quincena_(i)=0
	end if
	If IsNumeric(orden_aer_(i)) Then orden_aer_(i)=orden_aer_(i) else orden_aer_(i)=0 end if
	next
if op="in"then													 '[OPCION INSERTAR]
mySQL="INSERT INTO itemsSub (titulo_esp,titulo_of_esp,codigo_curso,txt_aviso,n_lecciones,ed_desde,ed_hasta,alo_fam,alo_res,alo_apa,vuelo,c_inten,c_semi,c_gene,wifi,tel_24,monitor,salidas,salida_dia,salida_mes,salida_fecha,salida_quincena0,salida_quincena1,salida_quincena2,salida_quincena3,salida_quincena4,f_inicio,f_fin,texto_esp,pr_reserva,pr_medico,pr_medico_ob,pr_cancelacion,pr_cancelacion_ob,tasas_aerop,tasas_aerop_ob,pr_examen,pr_examen_ob,con_examen,con_examen_act,url_esp,meta_title,meta_desc,meta_key,visible,disponible,orden_curso,fecha_in,pr_gestion_bill,pr_gestion_bill_ob,n_alumnos,h_lecciones)"
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "'" & titulo_esp & "',"
mySQL=mySQL & "'" & titulo_of_esp & "',"
mySQL=mySQL & "'" & codigo_curso & "',"
mySQL=mySQL & "'" & txt_aviso & "',"
mySQL=mySQL & "" & n_lecciones & ","
mySQL=mySQL & "" & ed_desde & ","
mySQL=mySQL & "" & ed_hasta & ","
mySQL=mySQL & "'" & alo_fam & "',"
mySQL=mySQL & "'" & alo_res & "',"
mySQL=mySQL & "'" & alo_apa & "',"
mySQL=mySQL & "'" & vuelo & "',"
mySQL=mySQL & "'" & c_inten & "',"
mySQL=mySQL & "'" & c_semi & "',"
mySQL=mySQL & "'" & c_gene & "',"
mySQL=mySQL & "'" & wifi & "',"
mySQL=mySQL & "'" & tel_24 & "',"
mySQL=mySQL & "'" & monitor & "',"
mySQL=mySQL & "'" & salidas & "',"
mySQL=mySQL & "'" & salida_dia & "',"
mySQL=mySQL & "'" & salida_mes & "',"
mySQL=mySQL & "'" & salida_fecha & "',"
mySQL=mySQL & "" & salida_quincena0 & ","
mySQL=mySQL & "" & salida_quincena1 & ","
mySQL=mySQL & "" & salida_quincena2 & ","
mySQL=mySQL & "" & salida_quincena3 & ","
mySQL=mySQL & "" & salida_quincena4 & ","
mySQL=mySQL & "'" & f_inicio & "',"
mySQL=mySQL & "'" & f_fin & "',"
mySQL=mySQL & "'" & texto_esp & "',"
mySQL=mySQL & "'" & pr_reserva & "',"
mySQL=mySQL & "'" & pr_medico & "',"
mySQL=mySQL & "'" & pr_medico_ob & "',"
mySQL=mySQL & "'" & pr_cancelacion & "',"
mySQL=mySQL & "'" & pr_cancelacion_ob & "',"
mySQL=mySQL & "'" & tasas_aerop & "',"
mySQL=mySQL & "'" & tasas_aerop_ob & "',"
mySQL=mySQL & "'" & pr_examen & "',"
mySQL=mySQL & "'" & pr_examen_ob & "',"
mySQL=mySQL & "'" & con_examen & "',"
mySQL=mySQL & "'" & con_examen_act & "',"
mySQL=mySQL & "'" & limpia_url(url_esp) & "',"
mySQL=mySQL & "'" & meta_title & "',"
mySQL=mySQL & "'" & meta_desc & "',"
mySQL=mySQL & "'" & meta_key & "',"
mySQL=mySQL & "'" & visible & "',"
mySQL=mySQL & "'" & disponible & "',"
mySQL=mySQL & "" & orden_curso & ","
mySQL=mySQL & "'" & fecha_in & "',"
mySQL=mySQL & "'" & pr_gestion_bill & "',"
mySQL=mySQL & "'" & pr_gestion_bill_ob & "',"
mySQL=mySQL & "" & n_alumnos & ","
mySQL=mySQL & "'" & h_lecciones & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
set ob_rs = Ob_Conn.execute("select MAX(id_itemSub) from itemsSub") 
cod = ob_rs(0)
ob_rs.close
mySQL="INSERT INTO rel (id_item,id_itemSub)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & cod_prog & ","
	mySQL=mySQL & "'" & cod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
end if                                         				    '[FIN OPCION INSERTAR]
if op="up" then
mySQL="UPDATE itemsSub SET "
mySQL=mySQL & " titulo_esp = '" & titulo_esp & "',"
mySQL=mySQL & " titulo_of_esp = '" & titulo_of_esp & "',"
mySQL=mySQL & " codigo_curso = '" & codigo_curso & "',"
mySQL=mySQL & " txt_aviso = '" & txt_aviso & "',"
mySQL=mySQL & " n_lecciones = "&n_lecciones& ","
mySQL=mySQL & " h_lecciones = '" & h_lecciones & "',"
mySQL=mySQL & " ed_desde = "&ed_desde& ","
mySQL=mySQL & " ed_hasta = "&ed_hasta& ","
mySQL=mySQL & " alo_fam = '" & alo_fam & "',"
mySQL=mySQL & " alo_res = '" & alo_res & "',"
mySQL=mySQL & " alo_apa = '" & alo_apa & "',"
mySQL=mySQL & " vuelo = '" & vuelo & "',"
mySQL=mySQL & " c_inten = '" & c_inten & "',"
mySQL=mySQL & " c_semi = '" & c_semi & "',"
mySQL=mySQL & " c_gene = '" & c_gene & "',"
mySQL=mySQL & " wifi = '" & wifi & "',"
mySQL=mySQL & " tel_24 = '" & tel_24 & "',"
mySQL=mySQL & " monitor = '" & monitor & "',"
mySQL=mySQL & " salidas = '" & salidas & "',"
mySQL=mySQL & " salida_dia = '" & salida_dia & "',"
mySQL=mySQL & " salida_mes = '" & salida_mes & "',"
mySQL=mySQL & " salida_fecha = '" & salida_fecha & "',"
mySQL=mySQL & " salida_quincena0 = "&salida_quincena0& ","
mySQL=mySQL & " salida_quincena1 = "&salida_quincena1& ","
mySQL=mySQL & " salida_quincena2 = "&salida_quincena2& ","
mySQL=mySQL & " salida_quincena3 = "&salida_quincena3& ","
mySQL=mySQL & " salida_quincena4 = "&salida_quincena4& ","
mySQL=mySQL & " f_inicio = '" & f_inicio & "',"
mySQL=mySQL & " f_fin = '" & f_fin & "',"
mySQL=mySQL & " texto_esp = '" & texto_esp & "',"
mySQL=mySQL & " pr_reserva = '" & pr_reserva & "',"
mySQL=mySQL & " pr_medico = '" & pr_medico & "',"
mySQL=mySQL & " pr_medico_ob = '" & pr_medico_ob & "',"
mySQL=mySQL & " pr_cancelacion = '" & pr_cancelacion & "',"
mySQL=mySQL & " pr_cancelacion_ob = '" & pr_cancelacion_ob & "',"
mySQL=mySQL & " tasas_aerop = '" & tasas_aerop & "',"
mySQL=mySQL & " tasas_aerop_ob = '" & tasas_aerop_ob & "',"
mySQL=mySQL & " pr_examen = '" & pr_examen & "',"
mySQL=mySQL & " pr_examen_ob = '" & pr_examen_ob & "',"
mySQL=mySQL & " con_examen = '" & con_examen & "',"
mySQL=mySQL & " con_examen_act = '" & con_examen_act & "',"
mySQL=mySQL & " url_esp = '" & url_esp & "',"
mySQL=mySQL & " meta_title = '" & meta_title & "',"
mySQL=mySQL & " meta_desc = '" & meta_desc & "',"
mySQL=mySQL & " meta_key = '" & meta_key & "',"
mySQL=mySQL & " visible = '" & visible & "',"
mySQL=mySQL & " disponible = '" & disponible & "',"
mySQL=mySQL & " orden_curso = "&orden_curso& ","
mySQL=mySQL & " fecha_in = '" & fecha_in & "',"
mySQL=mySQL & " pr_gestion_bill = '" & pr_gestion_bill & "',"
mySQL=mySQL & " pr_gestion_bill_ob = '"& pr_gestion_bill_ob &"',"
mySQL=mySQL & " n_alumnos = '"& n_alumnos &"'"
mySQL=mySQL & " WHERE id_itemSub = " & cod & "" 
set ob_rs=Ob_Conn.execute(mySQL)
end if														 '[FIN OPCION MODIFICAR]
														'[OPCIONES ADICIONALES HATA 20]
Sql= "SELECT rel.id_itemSubOp,rel.id_rel, rel.id_itemSub, itemsSubOp.id_itemSubOp, itemsSubOp.opcion_orden from rel, itemsSubOp where rel.id_itemSub="&cod&" and rel.id_itemSubOp<>0 and itemsSubOp.id_itemSubOp = rel.id_itemSubOp"
Ob_Command.CommandText = Sql
SET Ob_RS3 = Ob_Command.Execute ()
if not ob_rs3.eof then
do while not ob_rs3.eof
id_itemSubOp=ob_rs3("itemsSubOp.id_itemSubOp")
id_rel=ob_rs3("id_rel")
	mySQL="DELETE FROM itemsSubOp where id_itemSubOp =" & id_itemSubOp & ""
	set ob_rs=Ob_Conn.execute(mySQL)
	mySQL="DELETE FROM rel where id_rel =" & id_rel & ""
	set ob_rs=Ob_Conn.execute(mySQL)
ob_rs3.movenext
loop
end if
ob_rs3.close
for i=1 to 20									      		        
if opcion_esp_(i)<>"" and opcion_del_(i)<>"si" then 
opcion_orden=i 
mySQL="INSERT INTO itemsSubOp (opcion_esp,opcion_pre,opcion_ob,transfer,opcion_orden)" '[INSERTAMOS]
	mySQL=mySQL & "VALUES ("
	mySQL=mySQL & "'" & opcion_esp_(i) & "',"
	mySQL=mySQL & "'" & opcion_pre_(i) & "',"
	mySQL=mySQL & "'" & opcion_ob_(i) & "',"
	mySQL=mySQL & "'" & transfer_(i) & "',"
	mySQL=mySQL & "" & opcion_orden_(i) & ""
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
set ob_rs = Ob_Conn.execute("select MAX(id_itemSubOp) from itemsSubOp") 
id_itemSubOp = ob_rs(0)
mySQL="INSERT INTO rel (id_itemSub,id_itemSubOp,fecha_in,fecha_mod)" '[RELACIONAMOS OPCION CON ITEM]
	mySQL=mySQL & "VALUES ("
	mySQL=mySQL & "" & cod & ","
	mySQL=mySQL & "" & id_itemSubOp & ","
	mySQL=mySQL & "'" & fecha_in & "',"
	mySQL=mySQL & "'" & fecha_mod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
end if                   
opcion_del_(i)=""                        
next												 
Sql= "SELECT rel.id_itemSub, rel.id_itemSubOp, itemsSubOp.id_itemSubOp,itemsSubOp.opcion_orden from rel, itemsSubOp where rel.id_itemSub="&cod&" and rel.id_itemSubOp=itemsSubOp.id_itemSubOp and rel.id_itemSubOp<>0 order by itemsSubOp.opcion_orden"                           
Ob_Command.CommandText = Sql
SET Ob_RS3 = Ob_Command.Execute ()
if not ob_rs3.eof then
ord=1
do while not ob_rs3.eof
id_itemSubOp=ob_rs3("rel.id_itemSubOp")
mySQL="UPDATE itemsSubOp SET "
mySQL=mySQL & "opcion_orden = " & ord & ""
mySQL=mySQL & " WHERE id_itemSubOp = "&id_itemSubOp&" " 
set ob_rs=Ob_Conn.execute(mySQL)
ob_rs3.movenext
ord=ord+1
loop
end if
ob_rs3.close
													   '[FIN OPCIONES ADICIONALES HATA 20]	
Sql= "SELECT rel.id_itemSubSemana,rel.id_rel, rel.id_itemSub, itemsSubSemanas.id_itemSubSemana, itemsSubSemanas.orden from rel, itemsSubSemanas where rel.id_itemSub="&cod&" and rel.id_itemSubSemana<>0 and itemsSubSemanas.id_itemSubSemana = rel.id_itemSubSemana"                    
Ob_Command.CommandText = Sql
SET Ob_RS3 = Ob_Command.Execute ()
if not ob_rs3.eof then
do while not ob_rs3.eof
id_itemSubSemana=ob_rs3("itemsSubSemanas.id_itemSubSemana")
id_rel=ob_rs3("id_rel")
	mySQL="DELETE FROM itemsSubSemanas where id_itemSubSemana =" & id_itemSubSemana & ""
	set ob_rs=Ob_Conn.execute(mySQL)
	mySQL="DELETE FROM rel where id_rel =" & id_rel & ""
	set ob_rs=Ob_Conn.execute(mySQL)
ob_rs3.movenext
loop
end if
ob_rs3.close

for i=1 to 20									  '[PRECIOS SEMANAS ADICIONALES HATA 20]
if semanas_(i)<> 0 and precio_(i)<> 0 and sem_del_(i)<>"si" then
mySQL="INSERT INTO itemsSubSemanas (semanas,precio,precio_coste, duracion, orden)" '[INSERTAMOS]
	mySQL=mySQL & "VALUES ("
	mySQL=mySQL & "" & semanas_(i) & ","
	mySQL=mySQL & "'" & precio_(i) & "',"
	mySQL=mySQL & "'" & precio_coste_(i) & "',"
	mySQL=mySQL & "'" & duracion_(i) & "',"
	mySQL=mySQL & "'" & i & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
set ob_rs = Ob_Conn.execute("select MAX(id_itemSubSemana) from itemsSubSemanas") 
id_itemSubSemana = ob_rs(0)
mySQL="INSERT INTO rel (id_itemSub,id_itemSubSemana,fecha_in,fecha_mod)" '[RELACIONAMOS OPCION CON ITEM]
	mySQL=mySQL & "VALUES ("
	mySQL=mySQL & "" & cod & ","
	mySQL=mySQL & "" & id_itemSubSemana & ","
	mySQL=mySQL & "'" & fecha_in & "',"
	mySQL=mySQL & "'" & fecha_mod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
end if
next
Sql= "SELECT rel.id_itemSub, rel.id_itemSubSemana, itemsSubSemanas.id_itemSubSemana,itemsSubSemanas.orden, itemsSubSemanas.semanas from rel, itemsSubSemanas where rel.id_itemSub="&cod&" and rel.id_itemSubSemana=itemsSubSemanas.id_itemSubSemana and rel.id_itemSubSemana<>0 order by itemsSubSemanas.semanas"                           
Ob_Command.CommandText = Sql
SET Ob_RS3 = Ob_Command.Execute ()
if not ob_rs3.eof then
ord=1
do while not ob_rs3.eof
id_itemSubSemana=ob_rs3("rel.id_itemSubSemana")
mySQL="UPDATE itemsSubSemanas SET "
mySQL=mySQL & "orden = " & ord & ""
mySQL=mySQL & " WHERE id_itemSubSemana = "&id_itemSubSemana&" " 
set ob_rs=Ob_Conn.execute(mySQL)
ob_rs3.movenext
ord=ord+1
loop
end if
ob_rs3.close '[FIN OPCIONES ADICIONALES HATA 20]	
												 '[TEMPORADAS POR CURSOS ADICIONALES HATA 20]
Sql= "SELECT rel.id_suplemento,rel.id_rel, rel.id_itemSub, preciosSuplementos.id_suplemento, preciosSuplementos.id_suplemento, rel.id_alojamiento, rel.id_alo_opcion from rel, preciosSuplementos where rel.id_itemSub="&cod&" and rel.id_suplemento<>0 and preciosSuplementos.id_suplemento = rel.id_suplemento and rel.id_alojamiento=0 and rel.id_alo_opcion=0 "                    
Ob_Command.CommandText = Sql
SET Ob_RS3 = Ob_Command.Execute ()
if not ob_rs3.eof then
do while not ob_rs3.eof
id_suplemento=ob_rs3("preciosSuplementos.id_suplemento")
id_rel=ob_rs3("id_rel")
	mySQL="DELETE FROM preciosSuplementos where id_suplemento =" & id_suplemento & ""
	set ob_rs=Ob_Conn.execute(mySQL)
	mySQL="DELETE FROM rel where id_rel =" & id_rel & ""
	set ob_rs=Ob_Conn.execute(mySQL)
ob_rs3.movenext
loop
end if
ob_rs3.close
for i=1 to 20	
if tem_f_inicio_(i)<> "" and tem_f_fin_(i) <>"" and tem_f_inicio_(i)<> "01/01/1000" and tem_f_fin_(i) <>"01/01/1000" and tem_del_(i)<>"si" then
mySQL="INSERT INTO preciosSuplementos (fecha_inicio,fecha_fin,precio,precio_coste, orden)" '[INSERTAMOS]
	mySQL=mySQL & "VALUES ("
	mySQL=mySQL & "'" & tem_f_inicio_(i) & "',"
	mySQL=mySQL & "'" & tem_f_fin_(i) & "',"
	mySQL=mySQL & "'" & suplemento_(i) & "',"
	mySQL=mySQL & "'" & suplemento_r_(i) & "',"
	mySQL=mySQL & "'" & i & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
set ob_rs = Ob_Conn.execute("select MAX(id_suplemento) from preciosSuplementos") 
id_suplemento = ob_rs(0)
mySQL="INSERT INTO rel (id_itemSub,id_suplemento,fecha_in,fecha_mod)" '[RELACIONAMOS OPCION CON ITEM]
	mySQL=mySQL & "VALUES ("
	mySQL=mySQL & "" & cod & ","
	mySQL=mySQL & "" & id_suplemento & ","
	mySQL=mySQL & "'" & fecha_in & "',"
	mySQL=mySQL & "'" & fecha_mod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
end if   
next
Sql= "SELECT rel.id_itemSub, rel.id_suplemento, preciosSuplementos.id_suplemento,preciosSuplementos.orden from rel, preciosSuplementos where rel.id_itemSub="&cod&" and rel.id_suplemento=preciosSuplementos.id_suplemento and rel.id_suplemento<>0 and rel.id_alojamiento=0 and rel.id_alo_opcion=0 order by preciosSuplementos.fecha_inicio"                           
Ob_Command.CommandText = Sql
SET Ob_RS3 = Ob_Command.Execute ()
if not ob_rs3.eof then
ord=1
do while not ob_rs3.eof
id_suplemento=ob_rs3("rel.id_suplemento")
mySQL="UPDATE preciosSuplementos SET "
mySQL=mySQL & "orden = " & ord & ""
mySQL=mySQL & " WHERE id_suplemento = "&id_suplemento&" " 
set ob_rs=Ob_Conn.execute(mySQL)
ob_rs3.movenext
ord=ord+1
loop
end if
ob_rs3.close												   '[FIN TEMPORADAS CURSOS]	
														 '[AEROPUERTOS / PLAZAS HATA 20]
Sql= "SELECT rel.id_itemsubAero,rel.id_rel, rel.id_itemSub, itemsSubAero.id_itemSubAero, itemsSubAero.orden_aer from rel, itemsSubAero where rel.id_itemSub="&cod&" and rel.id_itemSubAero<>0 and itemsSubAero.id_itemSubAero = rel.id_itemSubAero"                    
Ob_Command.CommandText = Sql
SET Ob_RS3 = Ob_Command.Execute ()
if not ob_rs3.eof then
do while not ob_rs3.eof
id_itemSubAero=ob_rs3("itemsSubAero.id_itemSubAero")
id_rel=ob_rs3("id_rel")
mySQL="DELETE FROM itemsSubAero where id_itemSubAero =" & id_itemSubAero & ""
set ob_rs=Ob_Conn.execute(mySQL)
mySQL="DELETE FROM rel where id_rel =" & id_rel & ""
set ob_rs=Ob_Conn.execute(mySQL)
ob_rs3.movenext
loop
end if
ob_rs3.close


Sql= "SELECT rel.id_itemsubAero,rel.id_rel, rel.id_itemSub, itemsSubAero.id_itemSubAero, itemsSubAero.orden_aer from rel, itemsSubAero where rel.id_itemSub="&cod&" and rel.id_itemSubAero=0 and itemsSubAero.id_itemSubAero = rel.id_itemSubAero and grupo='si'"                    
Ob_Command.CommandText = Sql
SET Ob_RS3 = Ob_Command.Execute ()
if not ob_rs3.eof then
do while not ob_rs3.eof
id_itemSubAero=ob_rs3("itemsSubAero.id_itemSubAero")
id_rel=ob_rs3("id_rel")
mySQL="DELETE FROM itemsSubAero where id_itemSubAero =" & id_itemSubAero & ""
set ob_rs=Ob_Conn.execute(mySQL)
mySQL="DELETE FROM rel where id_rel =" & id_rel & ""
set ob_rs=Ob_Conn.execute(mySQL)
ob_rs3.movenext
loop
end if
ob_rs3.close

for i=1 to 20	
if orden_aer_(i)<> 0 and  orden_aer_(i)<> "" and aer_del_(i)<>"si" and  plazas_(i)<>"" and  plazas_(i)<>0 then
if id_aeropuerto_(i)="" then id_aeropuerto_(i)=0 end if
if f_salida_aer_(i)=""then f_salida_aer_(i)="01/01/1000" end if
if f_fin_aer_(i)=""then f_fin_aer_(i)="01/01/1000" end if
mySQL="INSERT INTO itemsSubAero (id_aeropuerto,plazas,mes,id_quincena,orden_aer,completo,f_salida,f_fin)" '[INSERTAMOS]
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & id_aeropuerto_(i) & ","
mySQL=mySQL & "" & plazas_(i) & ","
mySQL=mySQL & "'" & mes_(i) & "',"
mySQL=mySQL & "" & id_quincena_(i) & ","
mySQL=mySQL & "'" & orden_aer_(i) & "',"
mySQL=mySQL & "'" & compl_(i) & "',"
mySQL=mySQL & "'" & f_salida_aer_(i) & "',"
mySQL=mySQL & "'" & f_fin_aer_(i) & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
set ob_rs = Ob_Conn.execute("select MAX(id_itemsubAero) from itemsSubAero") 
id_itemsubAero = ob_rs(0)
id_quincena=id_quincena_(i)
if id_aeropuerto_(i)=0 then grupo="si" end if
mySQL="INSERT INTO rel (id_itemSub,id_itemSubAero,id_quincena,fecha_in,fecha_mod, grupo)" '[RELACIONAMOS OPCION CON ITEM]
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & cod & ","
mySQL=mySQL & "" & id_itemSubAero & ","
mySQL=mySQL & "" & id_quincena & ","
mySQL=mySQL & "'" & fecha_in & "',"
mySQL=mySQL & "'" & fecha_mod & "',"
mySQL=mySQL & "'" & grupo & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
end if
next												   
Sql= "SELECT rel.id_itemSub, rel.id_itemSubAero, itemsSubAero.id_itemSubAero,itemsSubAero.orden_aer from rel, itemsSubAero where rel.id_itemSub="&cod&" and rel.id_itemSubAero=itemsSubAero.id_itemSubAero and rel.id_itemSubAero<>0 order by itemsSubAero.orden_aer"                           
Ob_Command.CommandText = Sql
SET Ob_RS3 = Ob_Command.Execute ()
if not ob_rs3.eof then
ord=1
do while not ob_rs3.eof
id_itemSubAero=ob_rs3("rel.id_itemSubAero")
mySQL="UPDATE itemsSubAero SET "
mySQL=mySQL & "orden_aer = " & ord & ""
mySQL=mySQL & " WHERE id_itemSubAero = "&id_itemSubAero&" " 
set ob_rs=Ob_Conn.execute(mySQL)
ob_rs3.movenext
ord=ord+1
loop
end if
ob_rs3.close
 '[AEROPUERTOS / PLAZAS HATA 20]
Sql= "SELECT id_itemSub, url_esp from itemsSub where url_esp<>''"                            '[COMENZAMOS REESCRITURA]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
set fso = createobject("scripting.filesystemobject")
Set act = fso.CreateTextFile(server.mappath(rd&"mapas_url/itemsSub.txt"), true)
do while not ob_rs.eof
url = ob_rs("url_esp")
act.WriteLine ""&limpia_url(url)&" "&ob_rs("id_itemSub")&"" 
ob_rs.movenext
loop
act.Close
end if
ob_rs.close                                                   '[FIN REESCRITURA]

Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&cod_prog=" & cod_prog &"&cod_cat=" & cod_cat &"&edi="&edi)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&cod_prog=" & cod_prog &"&cod_cat=" & cod_cat &"&edi="&edi) %>
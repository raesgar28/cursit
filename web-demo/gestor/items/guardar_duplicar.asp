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
edi=request("edi")%>
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../lib/asp/comun.asp"-->
<%titulo_esp=trim(safeSTR(request("titulo_esp")))                          '[REQUEST]
titulo_of_esp=trim(safeSTR(request("titulo_of_esp")))
titulo_esp=trim(safeSTR(request("titulo_esp")))
texto_esp=trim(safeSTR(request("texto_esp")))
visible=request("visible")
url_esp=trim(safeSTR(request("url_esp")))
meta_title=trim(safeSTR(request("meta_title")))
meta_key=trim(safeSTR(request("meta_key")))
meta_desc=trim(safeSTR(request("meta_desc")))
dup_img=request("dup_img")
dup_cursos=request("dup_cursos")
dup_aloja=request("dup_aloja")
fecha_in=now
fecha_mod=now                                                      '[FIN REQUEST]

Sql= "SELECT noticias.url_esp,generales.url_esp,items.url_esp,itemsSub.url_esp,categorias.url_esp,secciones.url_esp,subsecciones.url_esp,destinos.url_esp,ciudades.url_esp from noticias,generales,items,itemsSub,categorias,secciones,subsecciones,destinos,ciudades WHERE noticias.url_esp ='"&url_esp&"' or generales.url_esp = '"&url_esp&"' or items.url_esp= '"&url_esp&"' or itemsSub.url_esp = '"&url_esp&"' or categorias.url_esp = '"&url_esp&"' or secciones.url_esp= '"&url_esp&"' or subsecciones.url_esp = '"&url_esp&"' or destinos.url_esp = '"&url_esp&"' or ciudades.url_esp = '"&url_esp&"' "                           
'[CHEQUEAMOS QUE URL NO DENTRO IN]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&edi="&edi&"&cod_prog="&cod_prog&"&cod_cat="&cod_cat)) 
Response.Redirect "duplicar.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&edi="&edi&"&cod_prog="&cod_prog&"&cod_cat="&cod_cat) 
end if
ob_rs.close														'[FIN CHEQUEAMOS QUE URL NO DENTRO IN]

Sql= "SELECT id_categoria, titulo_esp from categorias where id_categoria="&cod_cat&" "                    
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
m_categoria=ob_rs("titulo_esp") &" | "
end if
ob_rs.close
Sql= "SELECT id_item, titulo_esp from items where id_item="&cod_prog&" "                    
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
m_item=titulo_esp &" | "
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


Sql= "SELECT id_item, id_idioma from rel where id_item="&cod_prog&" and id_idioma<>0"                    
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
end if
if meta_key<>""then 
meta_key=meta_key
else
meta_key= limpia_meta(m_categoria) &", " & limpia_meta(m_seccion) &", " & limpia_meta(m_subseccion) &", " & limpia_meta(m_item) &", " & limpia_meta(m_destino) &", " & limpia_meta(m_ciudad)&", " & limpia_meta(m_idioma)
meta_key=replace(meta_key,", , ",",")
meta_key=replace(meta_key,",,",",")
end if
Sql= "SELECT orden from items where id_item="&cod_prog&""     '[ORDENAMOS]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
orden=ob_rs("orden")
orden=orden+1
end if
ob_rs.close

Ob_Conn.execute "INSERT INTO items (disponible,destacado,privado,pre_medida,pr_actualizado,anyo_actualizado,completo,oferta,pr_reserva,pr_reserva_ob,pr_medico,pr_medico_ob,pr_cancelacion,pr_cancelacion_ob,tasas_aerop,tasas_aerop_ob,ed_desde,ed_hasta,escuela_tam,moneda,alo_fam,alo_res,alo_apa,wifi,tel_24,vuelo,c_inten,c_semi,c_gene,monitor,texto_esp,tab_1_titulo_esp,tab_1_act,tab_1_texto_esp,tab_2_titulo_esp,tab_2_act,tab_2_texto_esp,tab_3_titulo_esp,tab_3_act,tab_3_texto_esp,tab_4_titulo_esp,tab_4_act,tab_4_texto_esp,tab_5_titulo_esp,tab_5_act,tab_5_texto_esp,tab_6_titulo_esp,tab_6_act,tab_6_texto_esp,url_esp,meta_title,meta_desc,meta_key,fecha_mod,campamento,quincena,gestion_alojamientos,gestion_aeropuertos,f_prog_dia,f_prog_salida,f_prog_regreso,orden,inc_cat,inc_sec,inc_sub,en_menu,inc_des,ejecutivos,alo_hot,datos_familia_ob,act_inc,alo_hos,sup_dest,format_sem,gen_mail,edad_bot) SELECT disponible,destacado,privado,pre_medida,pr_actualizado,anyo_actualizado,completo,oferta,pr_reserva,pr_reserva_ob,pr_medico,pr_medico_ob,pr_cancelacion,pr_cancelacion_ob,tasas_aerop,tasas_aerop_ob,ed_desde,ed_hasta,escuela_tam,moneda,alo_fam,alo_res,alo_apa,wifi,tel_24,vuelo,c_inten,c_semi,c_gene,monitor,texto_esp,tab_1_titulo_esp,tab_1_act,tab_1_texto_esp,tab_2_titulo_esp,tab_2_act,tab_2_texto_esp,tab_3_titulo_esp,tab_3_act,tab_3_texto_esp,tab_4_titulo_esp,tab_4_act,tab_4_texto_esp,tab_5_titulo_esp,tab_5_act,tab_5_texto_esp,tab_6_titulo_esp,tab_6_act,tab_6_texto_esp,url_esp,meta_title,meta_desc,meta_key,fecha_mod,campamento,quincena,gestion_alojamientos,gestion_aeropuertos,f_prog_dia,f_prog_salida,f_prog_regreso,orden,inc_cat,inc_sec,inc_sub,en_menu,inc_des,ejecutivos,alo_hot,datos_familia_ob,act_inc,alo_hos,sup_dest,format_sem,gen_mail,edad_bot FROM items where id_item = "&cod_prog&" "
set ob_rs = Ob_Conn.execute("select MAX(id_item) from items") 
cod = ob_rs(0)%>
<!--#include file="../comun/estilos.asp"-->
<link href="<%=r%>lib/css/loader.css" rel="stylesheet" type="text/css" />
<div class="form-body" style="position:absolute;top:20%;left:45%;z-index:999999999999">                                                  
<div class="form-actions">
<div class="row">
<div class="">
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&msd=ok&cod_cat=" & cod_cat))%>
<a href="gestion.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&msd=ok&cod_cat=" & cod_cat)%>" class="btn green" target="_parent"><i class="fa fa-undo" aria-hidden="true"></i> ir al programa duplicado</a>
</div>
</div>
</div>
</div>
<div class="se-pre-con"></div>
<%mySQL="UPDATE items SET "
mySQL=mySQL & "titulo_esp= '" & titulo_esp & "',"
mySQL=mySQL & "titulo_of_esp= '" & titulo_of_esp & "',"
mySQL=mySQL & "visible= '" & visible & "',"
mySQL=mySQL & "url_esp= '" & url_esp & "',"
mySQL=mySQL & "meta_title= '" & meta_title & "',"
mySQL=mySQL & "meta_key= '" & meta_key & "',"
mySQL=mySQL & "meta_desc= '" & meta_desc & "',"
mySQL=mySQL & "fecha_in= '" & fecha_in & "',"
if texto_esp <>"" then mySQL=mySQL & "texto_esp= '" & texto_esp & "'," end if
mySQL=mySQL & "orden= " & orden & ""
mySQL=mySQL & " WHERE id_item = " & cod & ";"
set ob_rs=Ob_Conn.execute(mySQL)
mySQL="INSERT INTO rel (id_categoria,id_item)" 		    ' ASOCIAMOS CATEGORIA		
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & cod_cat & ","
	mySQL=mySQL & "'" & cod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
Sql= "SELECT id_destino,id_item from rel where id_item="&cod_prog&" and id_destino<>0"     ' ASOCIAMOS DESTINO
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
'do while not ob_rs.eof
id_destino=ob_rs("id_destino")
'	if id_destino<>0 then
'	mySQL="INSERT INTO rel (id_destino,id_item)" 		   
'	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
'	mySQL=mySQL & "" & id_destino & ","
'	mySQL=mySQL & "'" & cod & "'"
'	mySQL=mySQL & ");"
'	set ob_rs2=Ob_Conn.execute(mySQL)
'	end if
'ob_rs.movenext
'loop
end if
ob_rs.close
Sql= "SELECT id_ciudad,id_item from rel where id_item="&cod_prog&""     ' ASOCIAMOS CIUDAD
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
'do while not ob_rs.eof
id_ciudad=ob_rs("id_ciudad")
'	if id_ciudad<>0 then
'	mySQL="INSERT INTO rel (id_ciudad,id_item)" 		   
'	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
'	mySQL=mySQL & "" & id_ciudad & ","
'	mySQL=mySQL & "'" & cod & "'"
'	mySQL=mySQL & ");"
'	set ob_rs2=Ob_Conn.execute(mySQL)
'	end if
'ob_rs.movenext
'loop
end if
ob_rs.close

Sql= "SELECT id_seccion,id_item from rel where id_item="&cod_prog&""     ' ASOCIAMOS SECCION
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
id_seccion=ob_rs("id_seccion")
	if id_seccion<>0 then
	mySQL="INSERT INTO rel (id_seccion,id_item,id_categoria,id_destino,id_ciudad)" 		   
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & id_seccion & ","
	mySQL=mySQL & "'" & cod & "',"
	mySQL=mySQL & "'" & cod_cat & "',"
	mySQL=mySQL & "" & id_destino & ","
	mySQL=mySQL & "" & id_ciudad & ""
	mySQL=mySQL & ");"
	set ob_rs2=Ob_Conn.execute(mySQL)
	end if
ob_rs.movenext
loop
end if
ob_rs.close
Sql= "SELECT id_subseccion,id_item from rel where id_item="&cod_prog&""     ' ASOCIAMOS SUBSECCION
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
id_subseccion=ob_rs("id_subseccion")
	if id_subseccion<>0 then
	mySQL="INSERT INTO rel (id_subseccion,id_item,id_destino,id_categoria,id_ciudad)" 		   
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & id_subseccion & ","
	mySQL=mySQL & "'" & cod & "',"
	mySQL=mySQL & "" & id_destino & ","
	mySQL=mySQL & "" & cod_cat & ","
	mySQL=mySQL & "" & id_ciudad & ""
	mySQL=mySQL & ");"
	set ob_rs2=Ob_Conn.execute(mySQL)
	end if
ob_rs.movenext
loop
end if
ob_rs.close
Sql= "SELECT id_proveedor,id_item from rel where id_item="&cod_prog&""     ' ASOCIAMOS PROVEEDOR
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
id_proveedor=ob_rs("id_proveedor")
	if id_proveedor<>0 then
	mySQL="INSERT INTO rel (id_proveedor,id_item)" 		   
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & id_proveedor & ","
	mySQL=mySQL & "'" & cod & "'"
	mySQL=mySQL & ");"
	set ob_rs2=Ob_Conn.execute(mySQL)
	end if
ob_rs.movenext
loop
end if
ob_rs.close

Sql= "SELECT id_idioma,id_item from rel where id_item="&cod_prog&""     ' ASOCIAMOS IDIOMA
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
id_idioma=ob_rs("id_idioma")
	if id_idioma<>0 then
	mySQL="INSERT INTO rel (id_idioma,id_item)" 		   
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & id_idioma & ","
	mySQL=mySQL & "'" & cod & "'"
	mySQL=mySQL & ");"
	set ob_rs2=Ob_Conn.execute(mySQL)
	end if
ob_rs.movenext
loop
end if
ob_rs.close

Sql= "SELECT rel.id_itemOp,rel.id_item, itemsOp.id_itemOp from rel, itemsOp where rel.id_item="&cod_prog&" and rel.id_itemOp<>0 and rel.id_itemOp=itemsOp.id_itemOp"     ' ASOCIAMOS OPCIONES
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
id_itemOp=ob_rs("rel.id_itemOp")
	Ob_Conn.execute "INSERT INTO itemsOp (opcion_esp,opcion_pre,opcion_ob,opcion_orden) SELECT opcion_esp,opcion_pre,opcion_ob,opcion_orden FROM itemsOp where id_itemOp = "&id_itemOp&" "
	set ob_rs2 = Ob_Conn.execute("select MAX(id_itemOp) from itemsOp") 
	cod_itemOp = ob_rs2(0)
	mySQL="INSERT INTO rel (id_itemOp,id_item)" 		   
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & cod_itemOp & ","
	mySQL=mySQL & "'" & cod & "'"
	mySQL=mySQL & ");"
	set ob_rs1=Ob_Conn.execute(mySQL)
id_item_op=""
ob_rs.movenext
loop
end if
ob_rs.close
if dup_aloja="si"then
	Sql4= "SELECT id_item,id_alojamiento FROM rel where id_item="&cod_prog&" and id_alojamiento<>0 group by id_alojamiento, id_item"     ' ASOCIAMOS ALO CONCEPTOS
	Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
	Ob_RS4.Open Sql4, ob_conn,adOpenStatic, adCmdText
	if not ob_rs4.eof then
	do while not ob_rs4.eof
	id_alojamiento=ob_rs4("id_alojamiento")
	Ob_Conn.execute "INSERT INTO alo_conceptos (titulo_esp,titulo_of_esp,texto_esp,visible,orden,tasas,tipo_alo) SELECT titulo_esp,titulo_of_esp,texto_esp,visible,orden,tasas,tipo_alo FROM alo_conceptos where id_alojamiento = "&id_alojamiento&" "
	set ob_rs2 = Ob_Conn.execute("select MAX(id_alojamiento) from alo_conceptos") 
	cod_id_alojamiento = ob_rs2(0)
	set ob_rs3 = Ob_Conn.execute("select tipo_alo, fecha_in, fecha_mod from alo_conceptos where id_alojamiento="&cod_id_alojamiento&" ") 

	tipo_alo = ob_rs3("tipo_alo")

	mySQL="INSERT INTO rel (id_item,id_alojamiento,id_alo_tipo)" 		   
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & cod & ","
	mySQL=mySQL & "'" & cod_id_alojamiento & "',"
	mySQL=mySQL & "" & tipo_alo & ""
	mySQL=mySQL & ");"
	set ob_rs1=Ob_Conn.execute(mySQL)
	
	
			Sql5= "SELECT id_item,id_alojamiento, id_alo_opcion,id_alo_op,id_alo_tipo FROM rel where id_item="&cod_prog&" and id_alojamiento="&id_alojamiento&" and id_alo_opcion<>0 "     ' ASOCIAMOS ALO OPCIONES
			Set Ob_RS5 = Server.CreateObject("ADODB.Recordset")
			Ob_RS5.Open Sql5, ob_conn,adOpenStatic, adCmdText
			if not ob_rs5.eof then
			do while not ob_rs5.eof
			id_alo_opcion=ob_rs5("id_alo_opcion")
			id_alo_op=ob_rs5("id_alo_op")
			id_alo_tipo=ob_rs5("id_alo_tipo")
			Ob_Conn.execute "INSERT INTO alo_opciones (titulo_esp,titulo_of_esp,texto_esp,orden,tasas,precio,precio_coste,op_alo) SELECT titulo_esp,titulo_of_esp,texto_esp,orden,tasas,precio,precio_coste,op_alo FROM alo_opciones where id_alo_opcion = "&id_alo_opcion&" "
			set ob_rs2 = Ob_Conn.execute("select MAX(id_alo_opcion) from alo_opciones") 
			cod_id_alo_opcion = ob_rs2(0)
			
			mySQL="INSERT INTO rel (id_item,id_alojamiento,id_alo_opcion,id_alo_op,fecha_in,id_alo_tipo,fecha_mod)" 
			mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
			mySQL=mySQL & "" & cod & ","
			mySQL=mySQL & "" & cod_id_alojamiento & ","
			mySQL=mySQL & "" & cod_id_alo_opcion & ","
			mySQL=mySQL & "" & id_alo_op & ","
			mySQL=mySQL & "'" & date & "',"
			mySQL=mySQL & "" & id_alo_tipo & ","
			mySQL=mySQL & "'" & date & "'"
			mySQL=mySQL & ");"
			set ob_rs1=Ob_Conn.execute(mySQL)
			ob_rs5.movenext
			loop
			end if
			ob_rs5.close
			
			Sql5= "SELECT id_item,id_suplemento FROM rel where id_item="&cod_prog&" and id_suplemento<>0 and id_alojamiento<>0 and id_alojamiento="&id_alojamiento&" "     ' ALO SUPLEMENTOS
			Set Ob_RS5 = Server.CreateObject("ADODB.Recordset")
			Ob_RS5.Open Sql5, ob_conn,adOpenStatic, adCmdText
			if not ob_rs5.eof then
			do while not ob_rs5.eof
			id_suplemento=ob_rs5("id_suplemento")
			Ob_Conn.execute "INSERT INTO preciosSuplementos (fecha_inicio,fecha_fin,precio,precio_coste,orden) SELECT fecha_inicio,fecha_fin,precio,precio_coste,orden FROM preciosSuplementos where id_suplemento = "&id_suplemento&" "
			set ob_rs2 = Ob_Conn.execute("select MAX(id_suplemento) from preciosSuplementos") 
			cod_id_suplemento = ob_rs2(0)
			mySQL="INSERT INTO rel (id_item,id_suplemento,id_alojamiento)" 		   
			mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
			mySQL=mySQL & "" & cod & ","
			mySQL=mySQL & "'" & cod_id_suplemento & "',"
			mySQL=mySQL & "'" & cod_id_alojamiento & "'"
			mySQL=mySQL & ");"
			set ob_rs1=Ob_Conn.execute(mySQL)
			ob_rs5.movenext
			loop
			end if
			ob_rs5.close
	ob_rs4.movenext
	loop
	end if
	ob_rs4.close
end if

if dup_cursos="si" then
Sql= "SELECT id_itemSub,id_item from rel where id_item="&cod_prog&" and id_itemSub<>0 "     ' ASOCIAMOS CURSOS
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
id_itemSub=ob_rs("id_itemSub")
	Ob_Conn.execute "INSERT INTO itemsSub (titulo_esp,titulo_of_esp,codigo_curso,txt_aviso,n_lecciones,ed_desde,ed_hasta,alo_fam,alo_res,alo_apa,vuelo,c_inten,c_semi,c_gene,wifi,tel_24,monitor,salidas,salida_dia,salida_mes,salida_fecha,salida_quincena0,salida_quincena1,salida_quincena2,salida_quincena3,f_inicio,f_fin,texto_esp,pr_reserva,pr_medico,pr_medico_ob,pr_cancelacion,pr_cancelacion_ob,tasas_aerop,tasas_aerop_ob,pr_examen,pr_examen_ob,con_examen,con_examen_act,visible,disponible,orden_curso,fecha_in,pr_gestion_bill,pr_gestion_bill_ob, n_alumnos,meta_title,meta_desc,meta_key) SELECT titulo_esp,titulo_of_esp,codigo_curso,txt_aviso,n_lecciones,ed_desde,ed_hasta,alo_fam,alo_res,alo_apa,vuelo,c_inten,c_semi,c_gene,wifi,tel_24,monitor,salidas,salida_dia,salida_mes,salida_fecha,salida_quincena0,salida_quincena1,salida_quincena2,salida_quincena3,f_inicio,f_fin,texto_esp,pr_reserva,pr_medico,pr_medico_ob,pr_cancelacion,pr_cancelacion_ob,tasas_aerop,tasas_aerop_ob,pr_examen,pr_examen_ob,con_examen,con_examen_act,visible,disponible,orden_curso,fecha_in,pr_gestion_bill,pr_gestion_bill_ob, n_alumnos,meta_title,meta_desc,meta_key FROM itemsSub where id_itemSub = "&id_itemSub&" "
	set ob_rs2 = Ob_Conn.execute("select MAX(id_itemSub) from itemsSub") 
	cod_itemSub = ob_rs2(0)
	mySQL="INSERT INTO rel (id_itemSub,id_item)" 		   
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & cod_itemSub & ","
	mySQL=mySQL & "'" & cod & "'"
	mySQL=mySQL & ");"
	set ob_rs1=Ob_Conn.execute(mySQL)
	mySQL="UPDATE itemsSub SET "
	mySQL=mySQL & "url_esp= " & cod_itemSub & ""
	mySQL=mySQL & " WHERE id_itemSub = " & cod_itemSub & ";"
	set ob_rs1=Ob_Conn.execute(mySQL)
	
	
	
	Sql4= "SELECT id_itemSub,id_itemSubAero, grupo FROM rel where id_itemSub="&id_itemSub&" and id_itemSubAero<>0 and (grupo IS NULL or grupo<>'si')"     ' ASOCIAMOS AEROPUERTOS
	Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
	Ob_RS4.Open Sql4, ob_conn,adOpenStatic, adCmdText
	if not ob_rs4.eof then
	do while not ob_rs4.eof
	id_itemsubAero=ob_rs4("id_itemsubAero")
	Ob_Conn.execute "INSERT INTO itemsSubAero (id_aeropuerto,plazas,mes,id_quincena,orden_aer,completo, f_salida, f_fin) SELECT id_aeropuerto,plazas,mes,id_quincena,orden_aer,completo, f_salida, f_fin FROM itemsSubAero where id_itemsubAero = "&id_itemsubAero&" "
	set ob_rs2 = Ob_Conn.execute("select MAX(id_itemsubAero) from itemsSubAero") 
	cod_id_itemsubAero = ob_rs2(0)
	mySQL="INSERT INTO rel (id_itemSub,id_itemsubAero)" 		   
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & cod_itemSub & ","
	mySQL=mySQL & "'" & cod_id_itemsubAero & "'"
	mySQL=mySQL & ");"
	set ob_rs1=Ob_Conn.execute(mySQL)
	ob_rs4.movenext
	loop
	end if
	ob_rs4.close
	
	
	
	Sql4= "SELECT id_itemSub,id_itemSubAero, grupo FROM rel where id_itemSub="&id_itemSub&" and id_itemSubAero=0 and grupo='si'"     ' ASOCIAMOS AEROPUERTOS
	Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
	Ob_RS4.Open Sql4, ob_conn,adOpenStatic, adCmdText
	if not ob_rs4.eof then
	do while not ob_rs4.eof
	id_itemsubAero=ob_rs4("id_itemsubAero")
	Ob_Conn.execute "INSERT INTO itemsSubAero (id_aeropuerto,plazas,mes,id_quincena,orden_aer,completo,f_salida,f_fin) SELECT id_aeropuerto,plazas,mes,id_quincena,orden_aer,completo,f_salida,f_fin FROM itemsSubAero where id_itemsubAero = "&id_itemsubAero&" "
	set ob_rs2 = Ob_Conn.execute("select MAX(id_itemsubAero) from itemsSubAero") 
	cod_id_itemsubAero = ob_rs2(0)
	mySQL="INSERT INTO rel (id_itemSub,id_itemsubAero,grupo)" 		   
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & cod_itemSub & ","
	mySQL=mySQL & "'" & cod_id_itemsubAero & "',"
	mySQL=mySQL & "'si'"
	mySQL=mySQL & ");"
	set ob_rs1=Ob_Conn.execute(mySQL)
	ob_rs4.movenext
	loop
	end if
	ob_rs4.close
	
	
	
	Sql4= "SELECT id_itemSub,id_itemSubSemana FROM rel where id_itemSub="&id_itemSub&" and id_itemsubSemana<>0"     ' ASOCIAMOS SEMANS
	Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
	Ob_RS4.Open Sql4, ob_conn,adOpenStatic, adCmdText
	if not ob_rs4.eof then
	do while not ob_rs4.eof
	id_itemsubSemana=ob_rs4("id_itemsubSemana")
	Ob_Conn.execute "INSERT INTO itemsSubSemanas (semanas,precio,precio_coste,orden) SELECT semanas,precio,precio_coste,orden FROM itemsSubSemanas where id_itemsubSemana = "&id_itemsubSemana&" "
	set ob_rs2 = Ob_Conn.execute("select MAX(id_itemsubSemana) from itemsSubSemanas") 
	cod_id_itemsubSemana = ob_rs2(0)
	mySQL="INSERT INTO rel (id_itemSub,id_itemsubSemana)" 		   
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & cod_itemSub & ","
	mySQL=mySQL & "'" & cod_id_itemsubSemana & "'"
	mySQL=mySQL & ");"
	set ob_rs1=Ob_Conn.execute(mySQL)
	ob_rs4.movenext
	loop
	end if
	ob_rs4.close
	Sql4= "SELECT id_itemSub,id_suplemento, id_alojamiento FROM rel where id_itemSub="&id_itemSub&" and id_suplemento<>0 and id_alojamiento=0"     ' ASOCIAMOS TEMPORADAS
	Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
	Ob_RS4.Open Sql4, ob_conn,adOpenStatic, adCmdText
	if not ob_rs4.eof then
	do while not ob_rs4.eof
	id_suplemento=ob_rs4("id_suplemento")
	Ob_Conn.execute "INSERT INTO preciosSuplementos (fecha_inicio,fecha_fin,precio,precio_coste,orden) SELECT fecha_inicio,fecha_fin,precio,precio_coste,orden FROM preciosSuplementos where id_suplemento = "&id_suplemento&" "
	set ob_rs2 = Ob_Conn.execute("select MAX(id_suplemento) from preciosSuplementos") 
	cod_id_suplemento = ob_rs2(0)
	mySQL="INSERT INTO rel (id_itemSub,id_suplemento)" 		   
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & cod_itemSub & ","
	mySQL=mySQL & "'" & cod_id_suplemento & "'"
	mySQL=mySQL & ");"
	set ob_rs1=Ob_Conn.execute(mySQL)
	ob_rs4.movenext
	loop
	end if
	ob_rs4.close
	Sql4= "SELECT id_itemSub,id_itemSubOp FROM rel where id_itemSub="&id_itemSub&" and id_itemSubOp<>0"     ' ASOCIAMOS OPCIONES
	Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
	Ob_RS4.Open Sql4, ob_conn,adOpenStatic, adCmdText
	if not ob_rs4.eof then
	do while not ob_rs4.eof
	id_itemSubOp=ob_rs4("id_itemSubOp")
	Ob_Conn.execute "INSERT INTO itemsSubOp (opcion_esp,opcion_pre,opcion_ob,transfer,opcion_orden) SELECT opcion_esp,opcion_pre,opcion_ob,transfer,opcion_orden FROM itemsSubOp where id_itemSubOp = "&id_itemSubOp&" "
	set ob_rs2 = Ob_Conn.execute("select MAX(id_itemSubOp) from itemsSubOp") 
	cod_id_itemSubOp = ob_rs2(0)
	mySQL="INSERT INTO rel (id_itemSub,id_itemSubOp)" 		   
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & cod_itemSub & ","
	mySQL=mySQL & "'" & cod_id_itemSubOp & "'"
	mySQL=mySQL & ");"
	set ob_rs1=Ob_Conn.execute(mySQL)
	ob_rs4.movenext
	loop
	end if
	ob_rs4.close
ob_rs.movenext
loop
end if
ob_rs.close
end if

if dup_img="si" then
			Sql5= "SELECT id_item,id_archivo FROM rel where id_item="&cod_prog&" and id_archivo<>0 "     ' ARCHIVOS
			Set Ob_RS5 = Server.CreateObject("ADODB.Recordset")
			Ob_RS5.Open Sql5, ob_conn,adOpenStatic, adCmdText
			if not ob_rs5.eof then
			do while not ob_rs5.eof
			id_archivo=ob_rs5("id_archivo")
			Ob_Conn.execute "INSERT INTO archivos (tipo,nombre,alt,campo,extension,peso,alto,ancho,banner,destacado,principal,galeria,titulo_esp,resumen_esp,fecha_in,fecha_mod,orden) SELECT tipo,nombre,alt,campo,extension,peso,alto,ancho,banner,destacado,principal,galeria,titulo_esp,resumen_esp,fecha_in,fecha_mod,orden FROM archivos where id_archivo = "&id_archivo&" "
			set ob_rs2 = Ob_Conn.execute("select MAX(id_archivo) from archivos") 
			cod_id_archivo = ob_rs2(0)
			mySQL="INSERT INTO rel (id_item,id_archivo,fecha_in,fecha_mod)" 		   
			mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
			mySQL=mySQL & "" & cod & ","
			mySQL=mySQL & "'" & cod_id_archivo & "',"
			mySQL=mySQL & "'" & fecha_in & "',"
			mySQL=mySQL & "'" & fecha_mod & "'"
			mySQL=mySQL & ");"
			set ob_rs1=Ob_Conn.execute(mySQL)
			ob_rs5.movenext
			loop
			end if
			ob_rs5.close
end if

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
ob_rs.close                                                  
Sql= "SELECT id_itemSub, url_esp from itemsSub where url_esp<>''"    
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

url = "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&msd=ok&cod_cat=" & cod_cat)
Response.Write("<script language='javascript'>self.parent.location='"&url&"';</scr"+"ipt>")%>
</body></html>
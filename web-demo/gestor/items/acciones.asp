<!DOCTYPE html><!--[if IE 8]><html lang="es-es" class="ie8 no-js"><![endif]--><!--[if IE 9]><html lang="es-es" class="ie9 no-js"><![endif]--><!--[if !IE]><!--><html lang="es-es"><!--<![endif]--><head><meta charset="utf-8" /></head><body>
<!--#INCLUDE file="../lib/asp/cifra.asp"-->
<%r=request("r")
rd=request("rd")
n=request("n")
ndos=request("ndos")
ntres=request("ntres")
ncuat=request("ncuat")
op=request("op")
cod=request("check")
check=request("check")
accion=request("accion")
cod_cat=request("cod_cat")
ver=request("ver")
if r ="" then r = request_equerystring("r")
if rd ="" then rd = request_equerystring("rd")
if n ="" then n = request_equerystring("n")
if ndos ="" then ndos = request_equerystring("ndos")
if ntres ="" then ntres = request_equerystring("ntres")
if ncuat ="" then ncuat = request_equerystring("ncuat")
if op ="" then op = request_equerystring("op")
if cod ="" then cod = request_equerystring("check")
if check ="" then check = request_equerystring("check")
if accion ="" then accion = request_equerystring("accion")
if cod_cat ="" then cod_cat = request_equerystring("cod_cat")
if ver ="" then ver = request_equerystring("ver")
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&op="&op&"&check="&check&"&accion="&accion&"&ver="&ver))
check=check&", 0"  'EL CERO LO PONGO PARA QUE FUNCIONE EL SPLIT
pks = split(check,",")%>
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../lib/asp/comun.asp"-->
<%Dim orden(5000000)
For i=0 to ubound(pks)-1
if accion="reor" then                            '////////////   SI ELEGIMOS REORDENAR
orden(i)=trim(request("orden"&int(pks(i))))
mySQL3="UPDATE items SET "
mySQL3=mySQL3 & "orden =  " & orden(i) & " "
mySQL3=mySQL3 & " WHERE id_item = " & pks(i) & "" 
set ob_rs=Ob_Conn.execute(mySQL3)
end if
if accion="rec" then
mySQL3="UPDATE items SET "
mySQL3=mySQL3 & "eliminado =  '' "
mySQL3=mySQL3 & " WHERE id_item = " & pks(i) & "" 
set ob_rs=Ob_Conn.execute(mySQL3)
mySQL3="UPDATE rel SET "
mySQL3=mySQL3 & "eli =  '' "
mySQL3=mySQL3 & " WHERE id_item = " & pks(i) & " AND id_destino<>0 " 
set ob_rs=Ob_Conn.execute(mySQL3)
end if
if accion="del"then                            '////////////   SI ELEGIMOS ELIMINAR
mySQL3="UPDATE items SET "
mySQL3=mySQL3 & "eliminado =  'si' "
mySQL3=mySQL3 & " WHERE id_item = " & pks(i) & "" 
set ob_rs=Ob_Conn.execute(mySQL3)
mySQL3="UPDATE rel SET "
mySQL3=mySQL3 & "eli =  'si' "
mySQL3=mySQL3 & " WHERE id_item = " & pks(i) & " AND id_destino<>0" 
set ob_rs=Ob_Conn.execute(mySQL3)
end if                                      '////////////   FIN SI ELEGIMOS ELIMINAR 
if accion="del_def"then 
mySQL="DELETE FROM items where id_item =" & pks(i) & " "
set ob_rs=Ob_Conn.execute(mySQL)
Sql= "SELECT id_item, id_archivo, id_rel from rel where id_item=" & pks(i) & " and id_archivo<>0"                           
Ob_Command.CommandText = Sql
SET Ob_RS3 = Ob_Command.Execute ()
if not ob_rs3.eof then
do while not ob_rs3.eof
			id_archivo=ob_rs3("id_archivo")
			id_rel=ob_rs3("id_rel")
			Sql2= "SELECT id_archivo,campo from archivos where id_archivo="&id_archivo&" "                           
			Ob_Command.CommandText = Sql2
			SET Ob_RS2 = Ob_Command.Execute ()
			if not ob_rs2.eof then
			if ob_rs2("campo")="archivo_"&(i)then
			mySQL="DELETE FROM archivos where id_archivo =" & id_archivo & ""
			set ob_rs=Ob_Conn.execute(mySQL)
			mySQL="DELETE FROM rel where id_rel =" & id_rel & ""
			set ob_rs=Ob_Conn.execute(mySQL)
			end if
			end if
			ob_rs2.close
ob_rs3.movenext
loop
end if
ob_rs3.close
Sql= "SELECT id_item, id_itemOp, id_rel from rel where id_item=" & pks(i) & " and id_itemOp<>0"       '///////////// ELIMINAMOS RELACION CON ITEMOP                       
Ob_Command.CommandText = Sql
SET Ob_RS3 = Ob_Command.Execute ()
if not ob_rs3.eof then
do while not ob_rs3.eof
				id_itemOp=ob_rs3("id_itemOp")
				id_rel=ob_rs3("id_rel")
				Sql2= "SELECT id_itemOp from itemsOp where id_itemOp="&id_itemOp&" "                           
				Ob_Command.CommandText = Sql2
				SET Ob_RS2 = Ob_Command.Execute ()
				if not ob_rs2.eof then
				mySQL="DELETE FROM itemsOp where id_itemOp =" & id_itemOp & ""
				set ob_rs=Ob_Conn.execute(mySQL)
				mySQL="DELETE FROM rel where id_rel =" & id_rel & ""
				set ob_rs=Ob_Conn.execute(mySQL)
				end if
				ob_rs2.close
ob_rs3.movenext
loop
end if
ob_rs3.close
Sql0= "SELECT id_item, id_itemSub, id_rel from rel where id_item=" & pks(i) & " and id_itemSub<>0"       '///////////// ELIMINAMOS RELACION CON ITEM SUB                       
Ob_Command.CommandText = Sql0
SET Ob_RS0 = Ob_Command.Execute ()
if not ob_rs0.eof then
do while not ob_rs0.eof
id_itemSub=ob_rs0("id_itemSub")
id_rel_tot=ob_rs0("id_rel")
if id_itemSub<>""then
				mySQL="DELETE FROM itemsSub where id_itemSub =" & id_itemSub & " "
				set ob_rs=Ob_Conn.execute(mySQL)
				Sql= "SELECT id_itemSub, id_itemOp, id_rel from rel where id_itemSub=" & id_itemSub & " and id_itemOp<>0"       '///////////// ELIMINAMOS RELACION CON ITEMOP                       
				Ob_Command.CommandText = Sql
				SET Ob_RS3 = Ob_Command.Execute ()
				if not ob_rs3.eof then
				do while not ob_rs3.eof
				id_itemOp=ob_rs3("id_itemOp")
				id_rel=ob_rs3("id_rel")
					Sql2= "SELECT id_itemOp from itemsOp where id_itemOp="&id_itemOp&" "                           
					Ob_Command.CommandText = Sql2
					SET Ob_RS2 = Ob_Command.Execute ()
					if not ob_rs2.eof then
					mySQL="DELETE FROM itemsOp where id_itemOp =" & id_itemOp & ""
					set ob_rs=Ob_Conn.execute(mySQL)
					mySQL="DELETE FROM rel where id_rel =" & id_rel & ""
					set ob_rs=Ob_Conn.execute(mySQL)
					end if
					ob_rs2.close
				ob_rs3.movenext
				loop
				end if
				ob_rs3.close
Sql= "SELECT id_itemSub, id_itemSubOp, id_rel from rel where id_itemSub=" & id_itemSub & " and id_itemSubOp<>0"       '///////////// ELIMINAMOS OPCIONES                       
Ob_Command.CommandText = Sql
SET Ob_RS3 = Ob_Command.Execute ()
if not ob_rs3.eof then
do while not ob_rs3.eof
				id_itemSubOp=ob_rs3("id_itemSubOp")
				id_rel=ob_rs3("id_rel")
				Sql2= "SELECT id_itemSubOp from itemsSubOp where id_itemSubOp="&id_itemSubOp&" "                           
				Ob_Command.CommandText = Sql2
				SET Ob_RS2 = Ob_Command.Execute ()
				if not ob_rs2.eof then
				mySQL="DELETE FROM itemsSubOp where id_itemSubOp =" & id_itemSubOp & ""
				set ob_rs=Ob_Conn.execute(mySQL)
				mySQL="DELETE FROM rel where id_rel =" & id_rel & ""
				set ob_rs=Ob_Conn.execute(mySQL)
				end if
				ob_rs2.close
ob_rs3.movenext
loop
end if
ob_rs3.close
Sql= "SELECT id_itemSub, id_suplemento, id_rel from rel where id_itemSub=" & id_itemSub & " and id_suplemento<>0"       '///////////// ELIMINAMOS SUPLEMENTOS                       
Ob_Command.CommandText = Sql
SET Ob_RS3 = Ob_Command.Execute ()
if not ob_rs3.eof then
do while not ob_rs3.eof
				id_suplemento=ob_rs3("id_suplemento")
				id_rel=ob_rs3("id_rel")
				Sql2= "SELECT id_suplemento from preciosSuplementos where id_suplemento="&id_suplemento&" "                           
				Ob_Command.CommandText = Sql2
				SET Ob_RS2 = Ob_Command.Execute ()
				if not ob_rs2.eof then
				mySQL="DELETE FROM preciosSuplementos where id_suplemento =" & id_suplemento & ""
				set ob_rs=Ob_Conn.execute(mySQL)
				mySQL="DELETE FROM rel where id_rel =" & id_rel & ""
				set ob_rs=Ob_Conn.execute(mySQL)
				end if
				ob_rs2.close
ob_rs3.movenext
loop
end if
ob_rs3.close
Sql= "SELECT id_itemSub, id_itemSubAero, id_rel from rel where id_itemSub=" & id_itemSub & " and id_itemSubAero<>0"       '///////////// ELIMINAMOS AEROPUERTOS                       
Ob_Command.CommandText = Sql
SET Ob_RS3 = Ob_Command.Execute ()
if not ob_rs3.eof then
do while not ob_rs3.eof
			id_itemSubAero=ob_rs3("id_itemSubAero")
			id_rel=ob_rs3("id_rel")
			Sql2= "SELECT id_itemSubAero from itemsSubAero where id_itemSubAero="&id_itemSubAero&" "                           
			Ob_Command.CommandText = Sql2
			SET Ob_RS2 = Ob_Command.Execute ()
			if not ob_rs2.eof then
			mySQL="DELETE FROM itemsSubAero where id_itemSubAero =" & id_itemSubAero & ""
			set ob_rs=Ob_Conn.execute(mySQL)
			mySQL="DELETE FROM rel where id_rel =" & id_rel & ""
			set ob_rs=Ob_Conn.execute(mySQL)
			end if
			ob_rs2.close
ob_rs3.movenext
loop
end if
ob_rs3.close
Sql= "SELECT id_itemSub, id_itemSubSemana, id_rel from rel where id_itemSub=" & id_itemSub & " and id_itemSubSemana<>0"       '///////////// ELIMINAMOS SEMANAS                      
Ob_Command.CommandText = Sql
SET Ob_RS3 = Ob_Command.Execute ()
if not ob_rs3.eof then
do while not ob_rs3.eof
				id_itemSubSemana=ob_rs3("id_itemSubSemana")
				id_rel=ob_rs3("id_rel")
				Sql2= "SELECT id_itemSubSemana from itemsSubSemanas where id_itemSubSemana="&id_itemSubSemana&" "                           
				Ob_Command.CommandText = Sql2
				SET Ob_RS2 = Ob_Command.Execute ()
				if not ob_rs2.eof then
				mySQL="DELETE FROM itemsSubSemanas where id_itemSubSemana =" & id_itemSubSemana & ""
				set ob_rs=Ob_Conn.execute(mySQL)
				mySQL="DELETE FROM rel where id_rel =" & id_rel & ""
				set ob_rs=Ob_Conn.execute(mySQL)
				end if
				ob_rs2.close
ob_rs3.movenext
loop
end if
ob_rs3.close
Sql= "SELECT id_itemSub, id_quincena, id_rel from rel where id_itemSub=" & id_itemSub & " and id_quincena<>0"       '///////////// ELIMINAMOS QUINCENAS                      
Ob_Command.CommandText = Sql
SET Ob_RS3 = Ob_Command.Execute ()
if not ob_rs3.eof then
do while not ob_rs3.eof
				id_quincena=ob_rs3("id_quincena")
				id_rel=ob_rs3("id_rel")
				Sql2= "SELECT id_quincena from quincenas where id_quincena="&id_quincena&" "                           
				Ob_Command.CommandText = Sql2
				SET Ob_RS2 = Ob_Command.Execute ()
				if not ob_rs2.eof then
				mySQL="DELETE FROM rel where id_rel =" & id_rel & ""
				set ob_rs=Ob_Conn.execute(mySQL)
				end if
				ob_rs2.close
ob_rs3.movenext
loop
end if
ob_rs3.close
mySQL="DELETE FROM rel where id_itemSub =" & id_itemSub & " "
set ob_rs=Ob_Conn.execute(mySQL)
end if
ob_rs0.movenext
loop
end if
ob_rs0.close
Sql00= "SELECT id_item, id_alojamiento, id_rel from rel where id_item=" & pks(i) & " and id_alojamiento<>0"       '///////////// ELIMINAMOS RELACION CON ALOJAMIENTO                       
Ob_Command.CommandText = Sql00
SET Ob_RS00 = Ob_Command.Execute ()
if not ob_rs00.eof then
do while not ob_rs00.eof
				id_alojamiento=ob_rs00("id_alojamiento")
				id_rel_tot=ob_rs00("id_rel")
				if id_alojamiento<>""then
				mySQL="DELETE FROM alo_conceptos where id_alojamiento =" & id_alojamiento & " "
				set ob_rs7=Ob_Conn.execute(mySQL)
				Sql1= "SELECT id_alojamiento, id_alo_opcion from rel where id_alojamiento=" & id_alojamiento & " and id_alo_opcion<>0"      
				Ob_Command.CommandText = Sql1
				SET Ob_RS1 = Ob_Command.Execute ()
				if not ob_rs1.eof then
				do while not ob_rs1.eof
				mySQL="DELETE FROM alo_opciones where id_alo_opcion =" & ob_rs1("id_alo_opcion") & " "
				set ob_rs7=Ob_Conn.execute(mySQL)
				ob_rs1.movenext
				loop
				end if
				'mySQL="DELETE FROM rel where id_alo_opcion <>0 and id_item=" & pks(i) & " "
				'set ob_rs=Ob_Conn.execute(mySQL)
				ob_rs1.close
				Sql1= "SELECT id_alojamiento, id_suplemento from rel where id_alojamiento=" & id_alojamiento & " and id_suplemento<>0"   
				Ob_Command.CommandText = Sql1
				SET Ob_RS1 = Ob_Command.Execute ()
				if not ob_rs1.eof then
				do while not ob_rs1.eof
				id_suplemento=ob_rs1("id_suplemento")
				mySQL="DELETE FROM preciosSuplementos where id_suplemento = "&id_suplemento&"  "
				set ob_rs7=Ob_Conn.execute(mySQL)
				ob_rs1.movenext
				loop
				end if
				ob_rs1.close
				end if
ob_rs00.movenext
loop
end if
ob_rs00.close
mySQL="DELETE FROM rel where id_item=" & pks(i) & " and id_suplemento<>0 "
set ob_rs=Ob_Conn.execute(mySQL)
                                  ' //////////////  PRIMERO ELIMINAMOS SI SOLO SE RELACIONA CON ARCHIVO
mySQL="DELETE FROM rel where id_item =" & pks(i) & " "
set ob_rs=Ob_Conn.execute(mySQL)
'SEGUNDO PONEMOS A 0 SI ALGUN OTRO CAMPO NO ESTA A 0
mySQL3="UPDATE rel SET "
mySQL3=mySQL3 & "id_item =  0 "
mySQL3=mySQL3 & " WHERE id_item = " & pks(i) & "" 
set ob_rs=Ob_Conn.execute(mySQL3)
end if '                                               ////////////////// FIN SI ELIMINAMOS DEF
if accion="vis"then                            '////////////   SI ELEGIMOS VISIBILIAD
mySQL3="UPDATE items SET "
mySQL3=mySQL3 & "visible =  'si' "
mySQL3=mySQL3 & " WHERE id_item = " & pks(i) & "" 
set ob_rs=Ob_Conn.execute(mySQL3)
end if                                   '////////////   FIN SI ELEGIMOS VISIBILIAD
if accion="vis_no"then                            '////////////   SI ELEGIMOS NO VISIBILIAD
mySQL3="UPDATE items SET "
mySQL3=mySQL3 & "visible =  'no' "
mySQL3=mySQL3 & " WHERE id_item = " & pks(i) & "" 
set ob_rs=Ob_Conn.execute(mySQL3)
end if                                   '////////////   FIN SI ELEGIMOS NO VISIBILIAD
if accion="dis"then                            '////////////   SI ELEGIMOS DISPONIBLE
mySQL3="UPDATE items SET "
mySQL3=mySQL3 & "disponible =  'si' "
mySQL3=mySQL3 & " WHERE id_item = " & pks(i) & "" 
set ob_rs=Ob_Conn.execute(mySQL3)
end if                                   '////////////   FIN SI ELEGIMOS DISPONIBLE
if accion="dis_no"then                            '////////////   SI ELEGIMOS NO DISPONIBLE
mySQL3="UPDATE items SET "
mySQL3=mySQL3 & "disponible =  'no' "
mySQL3=mySQL3 & " WHERE id_item = " & pks(i) & "" 
set ob_rs=Ob_Conn.execute(mySQL3)
end if                                   '////////////   FIN SI ELEGIMOS NO DISPONIBLE
if accion="des"then                            '////////////   SI ELEGIMOS DESTACADO
mySQL3="UPDATE items SET "
mySQL3=mySQL3 & "destacado =  'si' "
mySQL3=mySQL3 & " WHERE id_item = " & pks(i) & "" 
set ob_rs=Ob_Conn.execute(mySQL3)
end if                                   '////////////   FIN SI ELEGIMOS DESTACADO
if accion="des_no"then                            '////////////   SI ELEGIMOS NO DESTACADO
mySQL3="UPDATE items SET "
mySQL3=mySQL3 & "destacado =  'no' "
mySQL3=mySQL3 & " WHERE id_item = " & pks(i) & "" 
set ob_rs=Ob_Conn.execute(mySQL3)
end if                                   '////////////   FIN SI ELEGIMOS NO DESTACADO




if accion="metas"then                            '////////////   SI ELEGIMOS METAS AUTOMATICAS




Sql= "SELECT id_categoria, titulo_esp from categorias where id_categoria="&cod_cat&" "                    
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
m_categoria=lcase(ob_rs("titulo_esp")) &" | "
end if
ob_rs.close
Sql= "SELECT id_item, titulo_esp from items where id_item="&pks(i)&" "    
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
m_item=ob_rs("titulo_esp")
end if
ob_rs.close
Sql= "SELECT id_item, id_ciudad from rel where id_item="&pks(i)&" and id_ciudad<>0 and id_categoria="&cod_cat&""     
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



Sql= "SELECT id_item, id_destino from rel where id_item="&pks(i)&" and id_destino<>0 and id_categoria="&cod_cat&""    
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
Sql= "SELECT id_item, id_seccion from rel where id_item="&pks(i)&" and id_seccion<>0 and id_categoria="&cod_cat&""      
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
Sql= "SELECT id_item, id_idioma from rel where id_item="&pks(i)&" and id_idioma<>0"   
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
id_idioma_m=ob_rs("id_idioma")
	if id_destino_m<>0 and id_destino_m<>"" then
	Sql2= "SELECT id_idioma, idioma from idiomas where id_idioma="&id_idioma_m&" "                    
	Ob_Command.CommandText = Sql2
	SET Ob_RS2 = Ob_Command.Execute ()
	if not ob_rs2.eof then
	m_idioma=lcase(ob_rs2("idioma"))
	else
	m_didioma=""
	end if
	ob_rs2.close
	end if
end if
ob_rs.close


meta_title= "Curso de "& m_idioma &" para "& m_categoria &" "& m_seccion &" "& m_destino & m_ciudad & m_item
meta_key= "cursos "&limpia_meta(m_categoria) &", " & limpia_meta(m_seccion) &", " & limpia_meta(m_item) &", cursos " & limpia_meta(m_destino) &", cursos " & limpia_meta(m_ciudad)&", cursos " & limpia_meta(m_idioma) &", aprende " & limpia_meta(m_idioma)&", estudiar "& limpia_meta(m_idioma)
meta_key=replace(meta_key,", , ",",")
meta_key=replace(meta_key,",,",",")
meta_desc= "Cursos de "& m_idioma &" en " & m_ciudad &" - "& m_destino &", para "& m_categoria & ". Aprende "& m_idioma &" con el curso "& m_item &" en " & m_ciudad &" y viaja a "& m_destino &" con Cursit Idiomas."
meta_desc=replace(meta_desc, " | ","")
mySQL="UPDATE items SET "
mySQL=mySQL & "meta_title = '" & meta_title & "',"
mySQL=mySQL & "meta_desc = '" & meta_desc & "',"
mySQL=mySQL & "meta_key = '" & meta_key & "'"
mySQL=mySQL & " WHERE id_item = " & pks(i) & "" 
set ob_rs=Ob_Conn.execute(mySQL)

m_destino=""
id_destino_m=""
m_ciudad=""
id_ciudad_m=""
id_seccion_m=""
m_seccion=""
m_idioma=""
m_categoria=""
meta_key=""
meta_title=""
meta_desc=""

end if
Next

if accion="metas_v" or accion="metas_t" then
Sql= "SELECT id_categoria, titulo_esp from categorias where id_categoria="&cod_cat&" "                    
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
m_categoria=lcase(ob_rs("titulo_esp")) &" | "
end if
ob_rs.close
if accion="metas_t" then
Sql_it= "SELECT rel.id_item, items.id_item, titulo_esp FROM items, rel WHERE id_categoria ="&cod_cat&" and rel.id_item=items.id_item AND id_seccion=0"    
end if
if accion="metas_v" then
Sql_it= "SELECT rel.id_item, items.id_item, titulo_esp FROM items, rel WHERE id_categoria ="&cod_cat&" and rel.id_item=items.id_item AND id_seccion=0 AND ((meta_title='' OR meta_desc='' OR meta_key='') OR (meta_title IS NULL OR meta_desc IS NULL OR meta_key IS NULL)) order by items.id_item"    
end if
Ob_Command.CommandText = Sql_it
SET Ob_RS_it = Ob_Command.Execute ()
if not ob_rs_it.eof then
do while not ob_rs_it.eof
m_item=ob_rs_it("titulo_esp")
Sql= "SELECT id_item, id_ciudad from rel where id_item="&ob_rs_it("items.id_item")&" and id_ciudad<>0 and id_categoria="&cod_cat&""     
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
Sql= "SELECT id_item, id_destino from rel where id_item="&ob_rs_it("items.id_item")&" and id_destino<>0 and id_categoria="&cod_cat&""    
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
Sql= "SELECT id_item, id_seccion from rel where id_item="&ob_rs_it("items.id_item")&" and id_seccion<>0 and id_categoria="&cod_cat&""      
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

Sql= "SELECT id_item, id_idioma from rel where id_item="&ob_rs_it("items.id_item")&" and id_idioma<>0"   
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
id_idioma_m=ob_rs("id_idioma")
	if id_destino_m<>0 and id_destino_m<>"" then
	Sql2= "SELECT id_idioma, idioma from idiomas where id_idioma="&id_idioma_m&" "                    
	Ob_Command.CommandText = Sql2
	SET Ob_RS2 = Ob_Command.Execute ()
	if not ob_rs2.eof then
	m_idioma=lcase(ob_rs2("idioma"))
	else
	m_didioma=""
	end if
	ob_rs2.close
	end if
end if
ob_rs.close
meta_title= "Curso de "& m_idioma &" para "& m_categoria &" "& m_seccion &" "& m_destino & m_ciudad & m_item
meta_key= "cursos "&limpia_meta(m_categoria) &", " & limpia_meta(m_seccion) &", " & limpia_meta(m_item) &", cursos " & limpia_meta(m_destino) &", cursos " & limpia_meta(m_ciudad)&", cursos " & limpia_meta(m_idioma) &", aprende " & limpia_meta(m_idioma)&", estudiar "& limpia_meta(m_idioma)
meta_key=replace(meta_key,", , ",",")
meta_key=replace(meta_key,",,",",")
meta_desc= "Cursos de "& m_idioma &" en " & m_ciudad &" - "& m_destino &", para "& m_categoria & ". Aprende "& m_idioma &" con el curso "& m_item &" en " & m_ciudad &" y viaja a "& m_destino &" con Cursit Idiomas."
meta_desc=replace(meta_desc, " | ","")
if accion="metas_v" then
mySQL="UPDATE items SET "
mySQL=mySQL & "meta_title = '" & meta_title & "',"
mySQL=mySQL & "meta_desc = '" & meta_desc & "',"
mySQL=mySQL & "meta_key = '" & meta_key & "'"
mySQL=mySQL & " WHERE id_item = " & ob_rs_it("items.id_item") & "" 
set ob_rs2=Ob_Conn.execute(mySQL)
end if
if accion="metas_t" then
mySQL="UPDATE items SET "
mySQL=mySQL & "meta_title = '" & meta_title & "',"
mySQL=mySQL & "meta_desc = '" & meta_desc & "',"
mySQL=mySQL & "meta_key = '" & meta_key & "'"
mySQL=mySQL & " WHERE id_item = " & ob_rs_it("items.id_item") & "" 
set ob_rs2=Ob_Conn.execute(mySQL)
end if
ob_rs_it.movenext
loop
end if
ob_rs_it.close
end if
ob_conn.close







'[REDIRECCIONAMOS]
if accion="del"then
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_del&cod_cat="&cod_cat&"&ver="&ver 
end if
if accion="vis"then 
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_vis&cod_cat="&cod_cat&"&ver="&ver 
end if
if accion="vis_no"then 
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_vis&cod_cat="&cod_cat&"&ver="&ver  
end if
if accion="des"then 
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_des&cod_cat="&cod_cat&"&ver="&ver  
end if
if accion="des_no"then 
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_des&cod_cat="&cod_cat&"&ver="&ver 
end if
if accion="dis"then 
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_dis&cod_cat="&cod_cat&"&ver="&ver  
end if
if accion="dis_no"then 
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_dis&cod_cat="&cod_cat&"&ver="&ver 
end if
if accion="reor"then 
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_reor&cod_cat="&cod_cat&"&ver="&ver 
end if
if accion="rec"then 
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_rec&cod_cat="&cod_cat&"&ver=" 
end if
if accion="metas" or accion="metas_t" or accion="metas_v" then 
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_metas&cod_cat="&cod_cat&"&ver="&ver 
end if
if accion="del_def"then
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_del&cod_cat="&cod_cat&"&ver="&ver 
end if
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len(Encryption_String)) 
redirecciona = "enc=" & EnCrypt(Encryption_String) 
Response.Redirect "listado.jpk2?" & redirecciona%>
</body></html>
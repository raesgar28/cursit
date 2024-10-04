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
op=request("op")
fecha_in=date
fecha_mod=date%>
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../lib/asp/comun.asp"-->
<%' ALOJAMIENTOS //////////////////////////////////////////////////////////////////////////////
Dim alo_con_titulo_esp_(60),texto_esp_alo_(60),orden_alo_con_(60),id_tipo_alo_con_(60),tasas_alo_con_(60),alo_del_(60),alo_op_titulo_esp_(60),precio_alo_op_(60),precio_alo_op_r_(60),tasas_alo_op_(60),orden_alo_op_(60),texto_esp_alo_op_(60),alo_del_op_(60),f_inicio_alo_(60),f_fin_alo_(60),suplemento_alo_(60),suplemento_r_alo_(60),alo_tem_del_(60), id_op_alo_con_(60)
Sql= "SELECT rel.id_alojamiento,rel.id_rel, rel.id_item, alo_conceptos.id_alojamiento, alo_conceptos.orden,rel.id_alo_opcion,rel.id_suplemento from rel, alo_conceptos where rel.id_item="&cod&" and rel.id_alojamiento<>0 and alo_conceptos.id_alojamiento = rel.id_alojamiento and rel.id_alo_opcion=0 and rel.id_suplemento=0 "      ' and alo_conceptos.orden ="&i&"              
	Ob_Command.CommandText = Sql
	SET Ob_RS3 = Ob_Command.Execute ()
	if not ob_rs3.eof then
	do while not ob_rs3.eof
	id_alojamiento=ob_rs3("alo_conceptos.id_alojamiento")
	id_rel=ob_rs3("id_rel")
		mySQL="DELETE FROM alo_conceptos where id_alojamiento =" & id_alojamiento & ""
		set ob_rs=Ob_Conn.execute(mySQL)
		mySQL="DELETE FROM rel where id_rel =" & id_rel & ""
		set ob_rs=Ob_Conn.execute(mySQL)
		Sql2= "SELECT id_alo_opcion, id_alojamiento, id_item, id_rel from rel where rel.id_item="&cod&" and rel.id_alojamiento="&id_alojamiento&" and id_alo_opcion<>0" 
		Ob_Command.CommandText = Sql2
		SET Ob_RS2 = Ob_Command.Execute ()
		if not ob_rs2.eof then
		do while not ob_rs2.eof
		id_alo_opcion=ob_rs2("id_alo_opcion")
		id_rel=ob_rs2("id_rel")
			mySQL="DELETE FROM alo_opciones where id_alo_opcion =" & id_alo_opcion & ""
			set ob_rs=Ob_Conn.execute(mySQL)
			mySQL="DELETE FROM rel where id_rel =" & id_rel & ""
			set ob_rs=Ob_Conn.execute(mySQL)
		ob_rs2.movenext
		loop
		end if
		ob_rs2.close	
		Sql2= "SELECT id_suplemento, id_alojamiento, id_item, id_rel from rel where rel.id_item="&cod&" and rel.id_alojamiento="&id_alojamiento&" and id_suplemento<>0" 
		Ob_Command.CommandText = Sql2
		SET Ob_RS2 = Ob_Command.Execute ()
		if not ob_rs2.eof then
		do while not ob_rs2.eof
		id_suplemento=ob_rs2("id_suplemento")
		id_rel=ob_rs2("id_rel")
			mySQL="DELETE FROM preciosSuplementos where id_suplemento =" & id_suplemento & ""
			set ob_rs=Ob_Conn.execute(mySQL)
			mySQL="DELETE FROM rel where id_rel =" & id_rel & ""
			set ob_rs=Ob_Conn.execute(mySQL)
		ob_rs2.movenext
		loop
		end if
		ob_rs2.close	
	ob_rs3.movenext
	loop
	end if
	ob_rs3.close
	for i=1 to 60
	alo_con_titulo_esp_(i)=trim(request("alo_con_titulo_esp_["&i&"]"))
	if alo_con_titulo_esp_(i) <> "" then alo_con_titulo_esp_(i)=safeSTR(alo_con_titulo_esp_(i)) end if
	texto_esp_alo_(i)=trim(request("texto_esp_alo_["&i&"]"))
	if texto_esp_alo_(i) <> "" then texto_esp_alo_(i)=safeSTR(texto_esp_alo_(i)) end if
	orden_alo_con_(i)=trim(request("orden_alo_con_["&i&"]"))
	id_tipo_alo_con_(i)=trim(request("id_tipo_alo_con_["&i&"]"))
	tasas_alo_con_(i)=trim(request("tasas_alo_con_["&i&"]"))
	alo_del_(i)=trim(request("alo_del_["&i&"]"))
	If IsNumeric(orden_alo_con_(i)) Then orden_alo_con_(i)=orden_alo_con_(i) else orden_alo_con_(i)=0 end if
	If IsNumeric(id_tipo_alo_con_(i)) Then id_tipo_alo_con_(i)=id_tipo_alo_con_(i) else id_tipo_alo_con_(i)=0 end if
	If IsNumeric(tasas_alo_con_(i)) Then tasas_alo_con_(i)=replace(tasas_alo_con_(i),".","") else tasas_alo_con_(i)=0 end if
if orden_alo_con_(i)<> 0 and alo_del_(i)<>"si" and alo_con_titulo_esp_(i)<>"" then
		mySQL="INSERT INTO alo_conceptos (titulo_esp,texto_esp, orden,tipo_alo,tasas)" '[INSERTAMOS]
			mySQL=mySQL & "VALUES ("
			mySQL=mySQL & "'" & alo_con_titulo_esp_(i) & "',"
			mySQL=mySQL & "'" & texto_esp_alo_(i) & "',"
			mySQL=mySQL & "" & orden_alo_con_(i) & ","
			mySQL=mySQL & "" & id_tipo_alo_con_(i) & ","
			mySQL=mySQL & "'" & tasas_alo_con_(i) & "'"
			mySQL=mySQL & ");"
		set ob_rs=Ob_Conn.execute(mySQL)
		set ob_rs = Ob_Conn.execute("select MAX(id_alojamiento) from alo_conceptos") 
		id_alojamiento = ob_rs(0)
		mySQL="INSERT INTO rel (id_item,id_alojamiento,id_alo_tipo,fecha_in,fecha_mod)" '[RELACIONAMOS OPCION CON ITEM]
			mySQL=mySQL & "VALUES ("
			mySQL=mySQL & "" & cod & ","
			mySQL=mySQL & "" & id_alojamiento & ","
			mySQL=mySQL & "" & id_tipo_alo_con_(i) & ","
			mySQL=mySQL & "'" & fecha_in & "',"
			mySQL=mySQL & "'" & fecha_mod & "'"
			mySQL=mySQL & ");"
		set ob_rs=Ob_Conn.execute(mySQL)
					for a=1 to 60
					alo_op_titulo_esp_(a)=trim(request("alo_op_titulo_esp_["&i&","&a&"]"))
					if alo_op_titulo_esp_(i) <> "" then alo_op_titulo_esp_(i)=safeSTR(alo_op_titulo_esp_(i)) end if
					precio_alo_op_(a)=trim(request("precio_alo_op_["&i&","&a&"]"))
					precio_alo_op_r_(a)=trim(request("precio_alo_op_r_["&i&","&a&"]"))
					tasas_alo_op_(a)=trim(request("tasas_alo_op_["&i&","&a&"]"))
					orden_alo_op_(a)=trim(request("orden_alo_op_["&i&","&a&"]"))
					texto_esp_alo_op_(a)=trim(request("texto_esp_alo_op_["&i&","&a&"]"))
					if texto_esp_alo_op_(i) <> "" then texto_esp_alo_op_(i)=safeSTR(texto_esp_alo_op_(i)) end if
					orden_alo_op_(a)=trim(request("orden_alo_op_["&i&","&a&"]"))				
					If IsNumeric(precio_alo_op_(a)) Then precio_alo_op_(a)=replace(precio_alo_op_(a),".","") else precio_alo_op_(a)=0 end if
					If IsNumeric(precio_alo_op_r_(a)) Then precio_alo_op_r_(a)=replace(precio_alo_op_r_(a),".","") else precio_alo_op_r_(a)=0 end if
					If IsNumeric(tasas_alo_op_(a)) Then tasas_alo_op_(a)=replace(tasas_alo_op_(a),".","") else tasas_alo_op_(a)=0 end if
					If IsNumeric(orden_alo_op_(a)) Then orden_alo_op_(a)=orden_alo_op_(a) else orden_alo_op_(a)=0 end if
					alo_del_op_(a)=trim(request("alo_del_op_["&i&","&a&"]"))
					f_inicio_alo_(a)=trim(request("f_inicio_alo_["&i&","&a&"]"))
					f_fin_alo_(a)=trim(request("f_fin_alo_["&i&","&a&"]"))
					suplemento_alo_(a)=trim(request("suplemento_alo_["&i&","&a&"]"))
					suplemento_r_alo_(a)=trim(request("suplemento_r_alo_["&i&","&a&"]"))
					If IsNumeric(suplemento_alo_(a)) Then suplemento_alo_(a)=replace(suplemento_alo_(a),".","") else suplemento_alo_(a)=0 end if
					If IsNumeric(suplemento_r_alo_(a)) Then suplemento_r_alo_(a)=replace(suplemento_r_alo_(a),".","") else suplemento_r_alo_(a)=0 end if
					alo_tem_del_(a)=trim(request("alo_tem_del_["&i&","&a&"]"))
					id_op_alo_con_(a)=request("id_op_alo_con_["&i&","&a&"]")
					id_alo_op_b=id_op_alo_con_(a)
					if id_op_alo_con_(a)<> 0 and alo_del_op_(a)<>"si" and precio_alo_op_(a)<> 0 then	
					mySQL="INSERT INTO alo_opciones (titulo_esp,op_alo,texto_esp,orden,tasas,precio,precio_coste)" '[INSERTAMOS]
						mySQL=mySQL & "VALUES ("
						mySQL=mySQL & "'" & alo_op_titulo_esp_(a) & "',"
						mySQL=mySQL & "'" & id_op_alo_con_(a) & "',"					
						mySQL=mySQL & "'" & safeSTR(Replace(texto_esp_alo_op_(a),vbCrLf, "<br />")) & "',"
						mySQL=mySQL & "'" & orden_alo_op_(a) & "',"
						mySQL=mySQL & "'" & tasas_alo_op_(a) & "',"
						mySQL=mySQL & "'" & precio_alo_op_(a) & "',"
						mySQL=mySQL & "'" & precio_alo_op_r_(a) & "'"
						mySQL=mySQL & ");"
					set ob_rs=Ob_Conn.execute(mySQL)
					set ob_rs = Ob_Conn.execute("select MAX(id_alo_opcion) from alo_opciones") 
					id_alo_opcion = ob_rs(0)
					mySQL="INSERT INTO rel (id_item,id_alojamiento,id_alo_op,id_alo_opcion,fecha_in,id_alo_tipo,fecha_mod)" '[RELACIONAMOS OPCION CON ITEM]
						mySQL=mySQL & "VALUES ("
						mySQL=mySQL & "" & cod & ","
						mySQL=mySQL & "" & id_alojamiento & ","
						mySQL=mySQL & "" & id_alo_op_b & ","
						mySQL=mySQL & "" & id_alo_opcion & ","
						mySQL=mySQL & "'" & fecha_in & "',"
						mySQL=mySQL & "" & id_tipo_alo_con_(i) & ","
						mySQL=mySQL & "'" & fecha_mod & "'"
						mySQL=mySQL & ");"
					set ob_rs=Ob_Conn.execute(mySQL)
					end if
					if f_inicio_alo_(a)<> "" and f_fin_alo_(a)<> "" and f_inicio_alo_(a)<> "01/01/1000" and f_fin_alo_(a)<> "01/01/1000" and suplemento_alo_(a)<>"" and alo_tem_del_(a)<>"si" and IsDate( f_inicio_alo_(a)) and IsDate( f_fin_alo_(a))then		
					mySQL="INSERT INTO preciosSuplementos (fecha_inicio,fecha_fin, precio,precio_coste)" '[INSERTAMOS]
						mySQL=mySQL & "VALUES ("
						mySQL=mySQL & "'" & f_inicio_alo_(a) & "',"
						mySQL=mySQL & "'" & f_fin_alo_(a) & "',"
						mySQL=mySQL & "'" & suplemento_alo_(a) & "',"
						mySQL=mySQL & "'" & suplemento_r_alo_(a) & "'"
						mySQL=mySQL & ");"
					set ob_rs=Ob_Conn.execute(mySQL)
					set ob_rs = Ob_Conn.execute("select MAX(id_suplemento) from preciosSuplementos") 
					id_suplemento = ob_rs(0)
					if f_inicio_alo_(a)<> "" and f_fin_alo_(a)<> "" and f_inicio_alo_(a)<> "01/01/1000" and f_fin_alo_(a)<> "01/01/1000" and alo_tem_del_(a)<>"si" and IsDate( f_inicio_alo_(a)) and IsDate( f_fin_alo_(a))then
					mySQL="INSERT INTO rel (id_item,id_alojamiento,id_suplemento,fecha_in,fecha_mod)" '[RELACIONAMOS OPCION CON ITEM]
						mySQL=mySQL & "VALUES ("
						mySQL=mySQL & "" & cod & ","
						mySQL=mySQL & "" & id_alojamiento & ","
						mySQL=mySQL & "" & id_suplemento & ","
						mySQL=mySQL & "'" & fecha_in & "',"
						mySQL=mySQL & "'" & fecha_mod & "'"
						mySQL=mySQL & ");"
					set ob_rs=Ob_Conn.execute(mySQL)
					end if
					end if
					next
					
					Sql= "SELECT rel.id_item, rel.id_alojamiento, rel.id_alo_opcion, rel.id_suplemento, alo_opciones.id_alo_opcion,alo_conceptos.id_alojamiento,alo_opciones.orden from rel, alo_opciones,alo_conceptos where rel.id_item="&cod&" and rel.id_alojamiento="&id_alojamiento&" and rel.id_alojamiento=alo_conceptos.id_alojamiento and rel.id_alo_opcion=alo_opciones.id_alo_opcion and rel.id_suplemento=0 order by alo_opciones.orden"                           
					Ob_Command.CommandText = Sql
					SET Ob_RS3 = Ob_Command.Execute ()
					if not ob_rs3.eof then
					ord=1
					do while not ob_rs3.eof
					id_alo_opcion=ob_rs3("rel.id_alo_opcion")
						mySQL="UPDATE alo_opciones SET "
						mySQL=mySQL & "orden = " & ord & ""
						mySQL=mySQL & " WHERE id_alo_opcion = "&id_alo_opcion&" " 
						set ob_rs=Ob_Conn.execute(mySQL)
						ob_rs3.movenext
						ord=ord+1
						loop
					end if
					ob_rs3.close
end if					
next
'REORDENAMOS
Sql= "SELECT rel.id_alojamiento, alo_conceptos.id_alojamiento, alo_conceptos.orden,rel.id_suplemento,rel.id_alo_opcion,rel.id_item from rel, alo_conceptos where rel.id_item="&cod&" and rel.id_alojamiento<>0 and rel.id_alo_opcion=0 and rel.id_suplemento=0 and alo_conceptos.id_alojamiento = rel.id_alojamiento order by alo_conceptos.orden"                           
Ob_Command.CommandText = Sql
SET Ob_RS3 = Ob_Command.Execute ()
if not ob_rs3.eof then
ord=1
do while not ob_rs3.eof
id_alojamiento=ob_rs3("rel.id_alojamiento")
	mySQL="UPDATE alo_conceptos SET "
	mySQL=mySQL & "orden = " & ord & ""
	mySQL=mySQL & " WHERE id_alojamiento = "&id_alojamiento&" " 
	set ob_rs=Ob_Conn.execute(mySQL)
	ob_rs3.movenext
	ord=ord+1
	loop
end if
ob_rs3.close
' ALOJAMIENTOS ////////////////////////////////////////////////////////////////////////////// FIN ALOJAMIENTOS
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&cod_prog=" & cod_prog &"&cod_cat=" & cod_cat &"&edi="&edi)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&cod_prog=" & cod_prog &"&cod_cat=" & cod_cat &"&edi="&edi) %>
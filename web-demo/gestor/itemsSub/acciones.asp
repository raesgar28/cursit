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
cod_prog=request("cod_prog")
edi=request("edi")
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
if cod_prog ="" then cod_prog = request_equerystring("cod_prog")
if edi ="" then edi = request_equerystring("edi")
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&op="&op&"&check="&check&"&accion="&accion&"&edi="&edi ))
check=check&", 0"  'EL CERO LO PONGO PARA QUE FUNCIONE EL SPLIT
pks = split(check,",")%>
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../lib/asp/comun.asp"-->
<%For i=0 to ubound(pks)-1

if accion="del"then                            '////////////   SI ELEGIMOS ELIMINAR
mySQL="DELETE FROM itemsSub where id_itemSub =" & pks(i) & " "
set ob_rs=Ob_Conn.execute(mySQL)

Sql= "SELECT id_itemSub, id_itemOp, id_rel from rel where id_itemSub=" & pks(i) & " and id_itemOp<>0"       '///////////// ELIMINAMOS RELACION CON ITEMOP                       
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

Sql= "SELECT id_itemSub, id_alo_tipo, id_rel from rel where id_itemSub=" & pks(i) & " and id_alo_tipo<>0"       '///////////// ELIMINAMOS RELACION CON ITEMOP                       
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
	mySQL="DELETE FROM rel where id_rel =" & id_rel & ""
	set ob_rs=Ob_Conn.execute(mySQL)
	end if
	ob_rs2.close
ob_rs3.movenext
loop
end if
ob_rs3.close

Sql= "SELECT id_itemSub, id_itemSubOp, id_rel from rel where id_itemSub=" & pks(i) & " and id_itemSubOp<>0"       '///////////// ELIMINAMOS OPCIONES                       
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

Sql= "SELECT id_itemSub, id_suplemento, id_rel from rel where id_itemSub=" & pks(i) & " and id_suplemento<>0"       '///////////// ELIMINAMOS SUPLEMENTOS                       
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

Sql= "SELECT id_itemSub, id_itemSubAero, id_rel from rel where id_itemSub=" & pks(i) & " and id_itemSubAero<>0"       '///////////// ELIMINAMOS AEROPUERTOS                       
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

Sql= "SELECT id_itemSub, id_itemSubSemana, id_rel from rel where id_itemSub=" & pks(i) & " and id_itemSubSemana<>0"       '///////////// ELIMINAMOS SEMANAS                      
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

Sql= "SELECT id_itemSub, id_quincena, id_rel from rel where id_itemSub=" & pks(i) & " and id_quincena<>0"       '///////////// ELIMINAMOS QUINCENAS                      
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
                                  ' //////////////  PRIMERO ELIMINAMOS SI SOLO SE RELACIONA CON ARCHIVO
mySQL="DELETE FROM rel where id_itemSub =" & pks(i) & " "
set ob_rs=Ob_Conn.execute(mySQL)
end if                                      '////////////   FIN SI ELEGIMOS ELIMINAR


if accion="vis"then                            '////////////   SI ELEGIMOS VISIBILIAD
mySQL3="UPDATE itemsSub SET "
mySQL3=mySQL3 & "visible =  'si' "
mySQL3=mySQL3 & " WHERE id_itemSub = " & pks(i) & "" 
set ob_rs=Ob_Conn.execute(mySQL3)
end if                                   '////////////   FIN SI ELEGIMOS VISIBILIAD
if accion="vis_no"then                            '////////////   SI ELEGIMOS NO VISIBILIAD
mySQL3="UPDATE itemsSub SET "
mySQL3=mySQL3 & "visible =  'no' "
mySQL3=mySQL3 & " WHERE id_itemSub = " & pks(i) & "" 
set ob_rs=Ob_Conn.execute(mySQL3)
end if                                   '////////////   FIN SI ELEGIMOS NO VISIBILIAD
if accion="dis"then                            '////////////   SI ELEGIMOS DISPONIBLE
mySQL3="UPDATE itemsSub SET "
mySQL3=mySQL3 & "disponible =  'si' "
mySQL3=mySQL3 & " WHERE id_itemSub = " & pks(i) & "" 
set ob_rs=Ob_Conn.execute(mySQL3)
end if                                   '////////////   FIN SI ELEGIMOS DISPONIBLE
if accion="dis_no"then                            '////////////   SI ELEGIMOS NO DISPONIBLE
mySQL3="UPDATE itemsSub SET "
mySQL3=mySQL3 & "disponible =  'no' "
mySQL3=mySQL3 & " WHERE id_itemSub = " & pks(i) & "" 
set ob_rs=Ob_Conn.execute(mySQL3)
end if                                   '////////////   FIN SI ELEGIMOS NO DISPONIBLE
Next
ob_conn.close
'[REDIRECCIONAMOS]
if accion="del"then
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_del&cod_cat="&cod_cat&"&cod_prog="&cod_prog&"&edi="&edi 
end if
if accion="vis"then 
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_vis&cod_cat="&cod_cat&"&cod_prog="&cod_prog&"&edi="&edi 
end if
if accion="vis_no"then 
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_vis&cod_cat="&cod_cat&"&cod_prog="&cod_prog &"&edi="&edi 
end if
if accion="dis"then 
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_dis&cod_cat="&cod_cat&"&cod_prog="&cod_prog &"&edi="&edi 
end if
if accion="dis_no"then 
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_dis&cod_cat="&cod_cat&"&cod_prog="&cod_prog&"&edi="&edi 
end if
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len(Encryption_String)) 
redirecciona = "enc=" & EnCrypt(Encryption_String) 
Response.Redirect "listado.jpk2?" & redirecciona%>
</body></html>
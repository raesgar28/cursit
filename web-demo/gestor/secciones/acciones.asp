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
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&op="&op&"&check="&check&"&accion="&accion))
check=check&", 0"  'EL CERO LO PONGO PARA QUE FUNCIONE EL SPLIT
pks = split(check,",")%>
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../lib/asp/comun.asp"-->
<%For i=0 to ubound(pks)-1
if accion="del"then                            '////////////   SI ELEGIMOS ELIMINAR
mySQL="DELETE FROM secciones where id_seccion =" & pks(i) & " "
set ob_rs=Ob_Conn.execute(mySQL)
Sql= "SELECT * from rel where id_seccion=" & pks(i) & " and id_archivo<>0"                           
Ob_Command.CommandText = Sql
SET Ob_RS3 = Ob_Command.Execute ()
if not ob_rs3.eof then
do while not ob_rs3.eof
id_archivo=ob_rs3("id_archivo")
id_rel=ob_rs3("id_rel")
	Sql2= "SELECT * from archivos where id_archivo="&id_archivo&" "                           
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
                                  ' //////////////  PRIMERO ELIMINAMOS SI SOLO SE RELACIONA CON ARCHIVO
mySQL="DELETE FROM rel where id_seccion =" & pks(i) & " and (id_destino=0 and id_ciudad=0 and id_seccion=0 and id_subSeccion=0 and id_item=0 and id_itemSub=0 and id_itemOp=0 and id_idioma=0 and id_alo_tipo=0 and id_alojamiento=0 and id_alo_opcion=0 and id_suplemento=0 and id_aeropuerto=0 and id_general=0) "
set ob_rs=Ob_Conn.execute(mySQL)
'SEGUNDO PONEMOS A 0 SI ALGUN OTRO CAMPO NO ESTA A 0
mySQL3="UPDATE rel SET "
mySQL3=mySQL3 & "id_seccion =  0 "
mySQL3=mySQL3 & " WHERE id_seccion = " & pks(i) & "" 
set ob_rs=Ob_Conn.execute(mySQL3)
end if                                      '////////////   FIN SI ELEGIMOS ELIMINAR
if accion="vis"then                            '////////////   SI ELEGIMOS VISIBILIAD
mySQL3="UPDATE secciones SET "
mySQL3=mySQL3 & "visible =  'si' "
mySQL3=mySQL3 & " WHERE id_seccion = " & pks(i) & "" 
set ob_rs=Ob_Conn.execute(mySQL3)
end if                                   '////////////   FIN SI ELEGIMOS VISIBILIAD
if accion="vis_no"then                            '////////////   SI ELEGIMOS NO VISIBILIAD
mySQL3="UPDATE secciones SET "
mySQL3=mySQL3 & "visible =  'no' "
mySQL3=mySQL3 & " WHERE id_seccion = " & pks(i) & "" 
set ob_rs=Ob_Conn.execute(mySQL3)
end if                                   '////////////   FIN SI ELEGIMOS NO VISIBILIAD
if accion="dis"then                            '////////////   SI ELEGIMOS DISPONIBLE
mySQL3="UPDATE secciones SET "
mySQL3=mySQL3 & "disponible =  'si' "
mySQL3=mySQL3 & " WHERE id_seccion = " & pks(i) & "" 
set ob_rs=Ob_Conn.execute(mySQL3)
end if                                   '////////////   FIN SI ELEGIMOS DISPONIBLE
if accion="dis_no"then                            '////////////   SI ELEGIMOS NO DISPONIBLE
mySQL3="UPDATE secciones SET "
mySQL3=mySQL3 & "disponible =  'no' "
mySQL3=mySQL3 & " WHERE id_seccion = " & pks(i) & "" 
set ob_rs=Ob_Conn.execute(mySQL3)
end if                                   '////////////   FIN SI ELEGIMOS NO DISPONIBLE
if accion="des"then                            '////////////   SI ELEGIMOS DESTACADO
mySQL3="UPDATE secciones SET "
mySQL3=mySQL3 & "destacado =  'si' "
mySQL3=mySQL3 & " WHERE id_seccion = " & pks(i) & "" 
set ob_rs=Ob_Conn.execute(mySQL3)
end if                                   '////////////   FIN SI ELEGIMOS DESTACADO
if accion="des_no"then                            '////////////   SI ELEGIMOS NO DESTACADO
mySQL3="UPDATE secciones SET "
mySQL3=mySQL3 & "destacado =  'no' "
mySQL3=mySQL3 & " WHERE id_seccion = " & pks(i) & "" 
set ob_rs=Ob_Conn.execute(mySQL3)
end if                                   '////////////   FIN SI ELEGIMOS NO DESTACADO
Next
ob_conn.close
'[REDIRECCIONAMOS]
if accion="del"then
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_del" 
end if
if accion="vis"then 
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_vis" 
end if
if accion="vis_no"then 
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_vis" 
end if
if accion="des"then 
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_des" 
end if
if accion="des_no"then 
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_des" 
end if
if accion="dis"then 
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_dis" 
end if
if accion="dis_no"then 
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_dis" 
end if
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len(Encryption_String)) 
redirecciona = "enc=" & EnCrypt(Encryption_String) 
Response.Redirect "listado.jpk2?" & redirecciona%>
</body></html>
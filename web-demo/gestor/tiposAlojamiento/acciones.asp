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
mySQL="DELETE FROM alo_tipo where id_alo_tipo =" & pks(i) & " "
set ob_rs=Ob_Conn.execute(mySQL)
                                  ' //////////////  PRIMERO ELIMINAMOS SI SOLO SE RELACIONA CON ARCHIVO
mySQL="DELETE FROM rel where id_alo_tipo =" & pks(i) & " and (id_destino=0 and id_ciudad=0 and id_seccion=0 and id_subSeccion=0 and id_item=0  and id_idioma=0  and id_suplemento=0 and id_aeropuerto=0 and id_general=0 and id_alojamiento=0)"
set ob_rs=Ob_Conn.execute(mySQL)
'SEGUNDO PONEMOS A 0 SI ALGUN OTRO CAMPO NO ESTA A 0
mySQL3="UPDATE rel SET "
mySQL3=mySQL3 & "id_alo_tipo =  0 "
mySQL3=mySQL3 & " WHERE id_alo_tipo = " & pks(i) & "" 
set ob_rs=Ob_Conn.execute(mySQL3)
end if                                      '////////////   FIN SI ELEGIMOS ELIMINAR
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
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len(Encryption_String)) 
redirecciona = "enc=" & EnCrypt(Encryption_String) 
Response.Redirect "listado.jpk2?" & redirecciona%>
</body></html>
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
<!--#include file="../../conex/conex_back.asp"-->
<%For i=0 to ubound(pks)-1
if accion="del"then                            '////////////   SI ELEGIMOS ELIMINAR
mySQL="DELETE FROM admins where id_admin =" & pks(i) & " and (principal='' or principal IS null)"
set ob_rs=Ob_Connb.execute(mySQL)
end if                                 ' //////////////  PRIMERO ELIMINAMOS SI SOLO SE RELACIONA CON ARCHIVO
                                     '////////////   FIN SI ELEGIMOS ELIMINAR
if accion="hab"then                            '////////////   SI ELEGIMOS DISPONIBLE
mySQL3="UPDATE admins SET "
mySQL3=mySQL3 & "habilitado =  'si' "
mySQL3=mySQL3 & " WHERE id_admin = " & pks(i) & "" 
set ob_rs=Ob_Connb.execute(mySQL3)
end if                                   '////////////   FIN SI ELEGIMOS DISPONIBLE
if accion="hab_no"then                            '////////////   SI ELEGIMOS NO DISPONIBLE
mySQL3="UPDATE admins SET "
mySQL3=mySQL3 & "habilitado =  'no' "
mySQL3=mySQL3 & " WHERE id_admin = " & pks(i) & "" 
set ob_rs=Ob_Connb.execute(mySQL3)
end if                                   '////////////   FIN SI ELEGIMOS NO DISPONIBLE
Next
ob_conn.close
'[REDIRECCIONAMOS]
if accion="del"then
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_del" 
end if
if accion="hab"then 
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_dis" 
end if
if accion="hab_no"then 
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_dis" 
end if
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len(Encryption_String)) 
redirecciona = "enc=" & EnCrypt(Encryption_String) 
Response.Redirect "listado.jpk2?" & redirecciona%>
</body></html>
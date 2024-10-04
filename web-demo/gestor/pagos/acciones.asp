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
ver=request("ver")
cod_cat=request("cod_cat")
cod=request("cod")
proc=request("proc")
cod_prog=request("cod_prog")
t=request("t")
any_act=request("any_act")
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
if verp ="" then ver = request_equerystring("vepr")
if cod_cat ="" then cod_cat = request_equerystring("cod_cat")
if cod ="" then cod_cat = request_equerystring("cod")
if proc ="" then proc = request_equerystring("proc")
if cod_prog ="" then cod_prog = request_equerystring("cod_prog")
if t ="" then t = request_equerystring("t")
if anyo_act ="" then anyo_act = request_equerystring("anyo_act")
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&op="&op&"&check="&check&"&accion="&accion&"&verp="&verp&"&cod_cat="&cod_cat))
check=check&", 0"  'EL CERO LO PONGO PARA QUE FUNCIONE EL SPLIT
pks = split(check,",")%>
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../lib/asp/comun.asp"-->
<!--#include file="../../conex/conex_back.asp"-->
<!--#include file="../../web/comun/limpia.asp"-->
<%For i=0 to ubound(pks)-1
if accion="arch" then                          
mySQL="UPDATE programas SET "
mySQL=mySQL & "archivado =  'si' "
mySQL=mySQL & " WHERE id_programa = " & pks(i) & "" 
set ob_rs=Ob_Connb.execute(mySQL)
ms="arch"
end if    

if accion="desarch" then                          
mySQL="UPDATE programas SET "
mySQL=mySQL & "archivado =  '' "
mySQL=mySQL & " WHERE id_programa = " & pks(i) & "" 
set ob_rs=Ob_Connb.execute(mySQL)
ms="desarch"
end if  
                             
Next
ob_conn.close
'[REDIRECCIONAMOS]
Encryption_String = "?r="&r&"&rd=../../&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms="&ms&"&verp="&verp&"&cod_cat="&cod_cat&"&t="&t&"&anyo_act="&anyo_act 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len(Encryption_String)) 
redirecciona = "enc=" & EnCrypt(Encryption_String) 
Response.Redirect "listado.jpk2?" & redirecciona%>
</body></html>